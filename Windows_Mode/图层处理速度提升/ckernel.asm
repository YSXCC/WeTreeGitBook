; Disassembly of file: ckernel.o
; Mon Feb 17 13:21:11 2020
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
        mov     dword [ebp-20H], 1048576                ; 0031 _ C7. 45, E0, 00100000
        mov     eax, dword [ebp-20H]                    ; 0038 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 003B _ 89. 04 24
        call    memman_init                             ; 003E _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     eax, dword [ebp-20H]                    ; 0053 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0056 _ 89. 04 24
        call    memman_free                             ; 0059 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 0                      ; 005E _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 0065 _ C7. 45, E8, 00000000
        mov     eax, dword [ebp-24H]                    ; 006C _ 8B. 45, DC
        mov     dword [esp+0CH], eax                    ; 006F _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 0073 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 0076 _ 89. 44 24, 08
        mov     eax, dword [ebp-2CH]                    ; 007A _ 8B. 45, D4
        mov     dword [esp+4H], eax                     ; 007D _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0081 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0084 _ 89. 04 24
        call    sheet_control_init                      ; 0087 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 008C _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 008F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0092 _ 89. 04 24
        call    sheet_alloc                             ; 0095 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 009A _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 009D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00A0 _ 89. 04 24
        call    sheet_alloc                             ; 00A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 00A8 _ 89. 45, E8
        mov     eax, dword [ebp-28H]                    ; 00AB _ 8B. 45, D8
        imul    eax, dword [ebp-24H]                    ; 00AE _ 0F AF. 45, DC
        mov     dword [esp+4H], eax                     ; 00B2 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 00B6 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00B9 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BC _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C1 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C6 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CB _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-24H]                    ; 00D3 _ 8B. 55, DC
        mov     dword [esp+0CH], edx                    ; 00D6 _ 89. 54 24, 0C
        mov     edx, dword [ebp-28H]                    ; 00DA _ 8B. 55, D8
        mov     dword [esp+8H], edx                     ; 00DD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E1 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00E5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    sheet_setbuf                            ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F0 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00F8 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0100 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 0108 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 0110 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0113 _ 89. 04 24
        call    sheet_setbuf                            ; 0116 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011B _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0120 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0125 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012A _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 012F _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0134 _ A1, 00000000(d)
        mov     edx, dword [ebp-24H]                    ; 0139 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 013C _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 0140 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 0143 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0147 _ 89. 04 24
        call    init_desktop                            ; 014A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 014F _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0157 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 015E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0163 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 016B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 0173 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0176 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 017A _ 8B. 45, EC
        mov     dword [esp], eax                        ; 017D _ 89. 04 24
        call    sheet_slide                             ; 0180 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0185 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 018B _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0190 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0194 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 0198 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 019B _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 019F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01A2 _ 89. 04 24
        call    sheet_slide                             ; 01A5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 0                       ; 01AA _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 01B2 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 01B5 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 01B9 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01BC _ 89. 04 24
        call    sheet_updown                            ; 01BF _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 1                       ; 01C4 _ C7. 44 24, 08, 00000001
        mov     eax, dword [ebp-18H]                    ; 01CC _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 01CF _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 01D3 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01D6 _ 89. 04 24
        call    sheet_updown                            ; 01D9 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 01E3 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 01EA _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 01F1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 01F6 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01FD _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0202 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0204 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 020B _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0210 _ 01. D8
        test    eax, eax                                ; 0212 _ 85. C0
        jnz     ?_002                                   ; 0214 _ 75, 07
        call    io_stihlt                               ; 0216 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 021B _ EB, 51

?_002:  mov     dword [esp], keyinfo                    ; 021D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0224 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0229 _ 85. C0
        jz      ?_003                                   ; 022B _ 74, 16
        call    io_sti                                  ; 022D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0232 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0239 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 023E _ 89. 45, F0
        jmp     ?_004                                   ; 0241 _ EB, 2B

?_003:  mov     dword [esp], mouseinfo                  ; 0243 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 024A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 024F _ 85. C0
        jz      ?_004                                   ; 0251 _ 74, 1B
        mov     eax, dword [ebp-18H]                    ; 0253 _ 8B. 45, E8
        mov     dword [esp+8H], eax                     ; 0256 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 025A _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 025D _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0261 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0264 _ 89. 04 24
        call    show_mouse_info                         ; 0267 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 026C _ EB, 83

?_004:  jmp     ?_001                                   ; 026E _ EB, 81
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0270 _ 55
        mov     ebp, esp                                ; 0271 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0273 _ A1, 00000000(d)
        mov     edx, eax                                ; 0278 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 027A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 027D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 027F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0282 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0288 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 028B _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0291 _ 5D
        ret                                             ; 0292 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0293 _ 55
        mov     ebp, esp                                ; 0294 _ 89. E5
        sub     esp, 24                                 ; 0296 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1596          ; 0299 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 02A1 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 02A9 _ C7. 04 24, 00000000
        call    set_palette                             ; 02B0 _ E8, FFFFFFFC(rel)
        nop                                             ; 02B5 _ 90
        leave                                           ; 02B6 _ C9
        ret                                             ; 02B7 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 02B8 _ 55
        mov     ebp, esp                                ; 02B9 _ 89. E5
        sub     esp, 40                                 ; 02BB _ 83. EC, 28
        call    io_load_eflags                          ; 02BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02C3 _ 89. 45, F4
        call    io_cli                                  ; 02C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02CB _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 02CE _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 02D2 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 02D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02DE _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 02E1 _ 89. 45, F0
        jmp     ?_006                                   ; 02E4 _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 02E6 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02E9 _ 0F B6. 00
        shr     al, 2                                   ; 02EC _ C0. E8, 02
        movzx   eax, al                                 ; 02EF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 02F2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 02F6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 02FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0302 _ 8B. 45, 10
        add     eax, 1                                  ; 0305 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0308 _ 0F B6. 00
        shr     al, 2                                   ; 030B _ C0. E8, 02
        movzx   eax, al                                 ; 030E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0311 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0315 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 031C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0321 _ 8B. 45, 10
        add     eax, 2                                  ; 0324 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0327 _ 0F B6. 00
        shr     al, 2                                   ; 032A _ C0. E8, 02
        movzx   eax, al                                 ; 032D _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0330 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0334 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 033B _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0340 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0344 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 0348 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 034B _ 3B. 45, 0C
        jle     ?_005                                   ; 034E _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0350 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0353 _ 89. 04 24
        call    io_store_eflags                         ; 0356 _ E8, FFFFFFFC(rel)
        nop                                             ; 035B _ 90
        leave                                           ; 035C _ C9
        ret                                             ; 035D _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 035E _ 55
        mov     ebp, esp                                ; 035F _ 89. E5
        sub     esp, 20                                 ; 0361 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0364 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0367 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 036A _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 036D _ 89. 45, FC
        jmp     ?_010                                   ; 0370 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0372 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0375 _ 89. 45, F8
        jmp     ?_009                                   ; 0378 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 037A _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 037D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0381 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0383 _ 8B. 45, F8
        add     eax, edx                                ; 0386 _ 01. D0
        mov     edx, eax                                ; 0388 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 038A _ 8B. 45, 08
        add     edx, eax                                ; 038D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 038F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0393 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0395 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0399 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 039C _ 3B. 45, 1C
        jle     ?_008                                   ; 039F _ 7E, D9
        add     dword [ebp-4H], 1                       ; 03A1 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 03A5 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 03A8 _ 3B. 45, 20
        jle     ?_007                                   ; 03AB _ 7E, C5
        leave                                           ; 03AD _ C9
        ret                                             ; 03AE _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 03AF _ 55
        mov     ebp, esp                                ; 03B0 _ 89. E5
        push    ebx                                     ; 03B2 _ 53
        sub     esp, 28                                 ; 03B3 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 03B6 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 03B9 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 03BC _ 8B. 45, 0C
        sub     eax, 1                                  ; 03BF _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 03C2 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 03C6 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 03CA _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 03D2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 03DA _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03EC _ 89. 04 24
        call    paint_rectangle                         ; 03EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03F4 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 03F7 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 03FA _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03FD _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0400 _ 8B. 45, 10
        sub     eax, 28                                 ; 0403 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0406 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 040A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 040E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0412 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 041A _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0422 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0425 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0429 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 042C _ 89. 04 24
        call    paint_rectangle                         ; 042F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0434 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0437 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 043A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 043D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0440 _ 8B. 45, 10
        sub     eax, 27                                 ; 0443 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0446 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 044A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 044E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0452 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 045A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0462 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0465 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0469 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 046C _ 89. 04 24
        call    paint_rectangle                         ; 046F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0474 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0477 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 047A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 047D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0480 _ 8B. 45, 10
        sub     eax, 26                                 ; 0483 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0486 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 048A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 048E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0492 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 049A _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 04A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04AC _ 89. 04 24
        call    paint_rectangle                         ; 04AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04B4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B7 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04BA _ 8B. 45, 10
        sub     eax, 24                                 ; 04BD _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04C0 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04C4 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04CC _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04D0 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 04D8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04E0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04EA _ 89. 04 24
        call    paint_rectangle                         ; 04ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04F2 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04F5 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04F8 _ 8B. 45, 10
        sub     eax, 24                                 ; 04FB _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04FE _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0502 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 050A _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 050E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0516 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 051E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0521 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0525 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0528 _ 89. 04 24
        call    paint_rectangle                         ; 052B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0530 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0533 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0536 _ 8B. 45, 10
        sub     eax, 4                                  ; 0539 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 053C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0540 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0548 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 054C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0554 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 055C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 055F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0563 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0566 _ 89. 04 24
        call    paint_rectangle                         ; 0569 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 056E _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0571 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0574 _ 8B. 45, 10
        sub     eax, 23                                 ; 0577 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 057A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 057E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0586 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 058A _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0592 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 059A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 059D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05A4 _ 89. 04 24
        call    paint_rectangle                         ; 05A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05AC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05AF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05B2 _ 8B. 45, 10
        sub     eax, 3                                  ; 05B5 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 05B8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 05BC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 05C4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 05C8 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 05D0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05D8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05DB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05DF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05E2 _ 89. 04 24
        call    paint_rectangle                         ; 05E5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05EA _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05ED _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05F0 _ 8B. 45, 10
        sub     eax, 24                                 ; 05F3 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 05F6 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 05FA _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0602 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0606 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 060E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0616 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0619 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 061D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0620 _ 89. 04 24
        call    paint_rectangle                         ; 0623 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0628 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 062B _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 062E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0631 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0634 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0637 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 063A _ 8B. 45, 0C
        sub     eax, 47                                 ; 063D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0640 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0644 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0648 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 064C _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0650 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0658 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 065B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 065F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0662 _ 89. 04 24
        call    paint_rectangle                         ; 0665 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 066A _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 066D _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0670 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0673 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0676 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0679 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 067C _ 8B. 45, 0C
        sub     eax, 47                                 ; 067F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0682 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0686 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 068A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 068E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0692 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 069A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 069D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06A4 _ 89. 04 24
        call    paint_rectangle                         ; 06A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06AC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06AF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06B2 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 06B5 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 06B8 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 06BB _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 06BE _ 8B. 45, 0C
        sub     eax, 47                                 ; 06C1 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 06C4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06C8 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06CC _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06D0 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06D4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06DC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06DF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06E3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06E6 _ 89. 04 24
        call    paint_rectangle                         ; 06E9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06EE _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06F1 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06F4 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 06F7 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 06FA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06FD _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0700 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0703 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0706 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 070A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 070E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0712 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0716 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 071E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0721 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0725 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0728 _ 89. 04 24
        call    paint_rectangle                         ; 072B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0730 _ 83. C4, 1C
        pop     ebx                                     ; 0733 _ 5B
        pop     ebp                                     ; 0734 _ 5D
        ret                                             ; 0735 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0736 _ 55
        mov     ebp, esp                                ; 0737 _ 89. E5
        sub     esp, 16                                 ; 0739 _ 83. EC, 10
        movzx   eax, word [?_128]                       ; 073C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0743 _ 98
        mov     dword [ebp-8H], eax                     ; 0744 _ 89. 45, F8
        movzx   eax, word [?_129]                       ; 0747 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 074E _ 98
        mov     dword [ebp-4H], eax                     ; 074F _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0752 _ 8B. 45, F8
        sub     eax, 16                                 ; 0755 _ 83. E8, 10
        mov     edx, eax                                ; 0758 _ 89. C2
        shr     edx, 31                                 ; 075A _ C1. EA, 1F
        add     eax, edx                                ; 075D _ 01. D0
        sar     eax, 1                                  ; 075F _ D1. F8
        mov     dword [mouse_x], eax                    ; 0761 _ A3, 00000124(d)
        mov     eax, dword [ebp-4H]                     ; 0766 _ 8B. 45, FC
        sub     eax, 44                                 ; 0769 _ 83. E8, 2C
        mov     edx, eax                                ; 076C _ 89. C2
        shr     edx, 31                                 ; 076E _ C1. EA, 1F
        add     eax, edx                                ; 0771 _ 01. D0
        sar     eax, 1                                  ; 0773 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0775 _ A3, 00000128(d)
        leave                                           ; 077A _ C9
        ret                                             ; 077B _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 077C _ 55
        mov     ebp, esp                                ; 077D _ 89. E5
        sub     esp, 20                                 ; 077F _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0782 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0785 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0788 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 078F _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 0794 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0797 _ 8B. 45, 18
        add     eax, edx                                ; 079A _ 01. D0
        movzx   eax, byte [eax]                         ; 079C _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 079F _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 07A2 _ 0F B6. 45, FB
        test    al, al                                  ; 07A6 _ 84. C0
        jns     ?_012                                   ; 07A8 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07AA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07AD _ 8B. 55, 14
        add     eax, edx                                ; 07B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07B8 _ 8B. 45, 10
        add     eax, edx                                ; 07BB _ 01. D0
        mov     edx, eax                                ; 07BD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07BF _ 8B. 45, 08
        add     edx, eax                                ; 07C2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07C4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07C8 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 07CA _ 0F B6. 45, FB
        and     eax, 40H                                ; 07CE _ 83. E0, 40
        test    eax, eax                                ; 07D1 _ 85. C0
        jz      ?_013                                   ; 07D3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07D5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07D8 _ 8B. 55, 14
        add     eax, edx                                ; 07DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07E3 _ 8B. 45, 10
        add     eax, edx                                ; 07E6 _ 01. D0
        lea     edx, [eax+1H]                           ; 07E8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 07EB _ 8B. 45, 08
        add     edx, eax                                ; 07EE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07F0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07F4 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 07F6 _ 0F B6. 45, FB
        and     eax, 20H                                ; 07FA _ 83. E0, 20
        test    eax, eax                                ; 07FD _ 85. C0
        jz      ?_014                                   ; 07FF _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0801 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0804 _ 8B. 55, 14
        add     eax, edx                                ; 0807 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0809 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 080D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 080F _ 8B. 45, 10
        add     eax, edx                                ; 0812 _ 01. D0
        lea     edx, [eax+2H]                           ; 0814 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0817 _ 8B. 45, 08
        add     edx, eax                                ; 081A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 081C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0820 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 0822 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0826 _ 83. E0, 10
        test    eax, eax                                ; 0829 _ 85. C0
        jz      ?_015                                   ; 082B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 082D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0830 _ 8B. 55, 14
        add     eax, edx                                ; 0833 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0835 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0839 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 083B _ 8B. 45, 10
        add     eax, edx                                ; 083E _ 01. D0
        lea     edx, [eax+3H]                           ; 0840 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0843 _ 8B. 45, 08
        add     edx, eax                                ; 0846 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0848 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 084C _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 084E _ 0F B6. 45, FB
        and     eax, 08H                                ; 0852 _ 83. E0, 08
        test    eax, eax                                ; 0855 _ 85. C0
        jz      ?_016                                   ; 0857 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0859 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 085C _ 8B. 55, 14
        add     eax, edx                                ; 085F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0861 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0865 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0867 _ 8B. 45, 10
        add     eax, edx                                ; 086A _ 01. D0
        lea     edx, [eax+4H]                           ; 086C _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 086F _ 8B. 45, 08
        add     edx, eax                                ; 0872 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0874 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0878 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 087A _ 0F B6. 45, FB
        and     eax, 04H                                ; 087E _ 83. E0, 04
        test    eax, eax                                ; 0881 _ 85. C0
        jz      ?_017                                   ; 0883 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0885 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0888 _ 8B. 55, 14
        add     eax, edx                                ; 088B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 088D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0891 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0893 _ 8B. 45, 10
        add     eax, edx                                ; 0896 _ 01. D0
        lea     edx, [eax+5H]                           ; 0898 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 089B _ 8B. 45, 08
        add     edx, eax                                ; 089E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08A0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08A4 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 08A6 _ 0F B6. 45, FB
        and     eax, 02H                                ; 08AA _ 83. E0, 02
        test    eax, eax                                ; 08AD _ 85. C0
        jz      ?_018                                   ; 08AF _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08B1 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08B4 _ 8B. 55, 14
        add     eax, edx                                ; 08B7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08BD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08BF _ 8B. 45, 10
        add     eax, edx                                ; 08C2 _ 01. D0
        lea     edx, [eax+6H]                           ; 08C4 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08C7 _ 8B. 45, 08
        add     edx, eax                                ; 08CA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08CC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08D0 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 08D2 _ 0F B6. 45, FB
        and     eax, 01H                                ; 08D6 _ 83. E0, 01
        test    eax, eax                                ; 08D9 _ 85. C0
        jz      ?_019                                   ; 08DB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08DD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08E0 _ 8B. 55, 14
        add     eax, edx                                ; 08E3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08E5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08EB _ 8B. 45, 10
        add     eax, edx                                ; 08EE _ 01. D0
        lea     edx, [eax+7H]                           ; 08F0 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 08F3 _ 8B. 45, 08
        add     edx, eax                                ; 08F6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08FC _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 08FE _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 0902 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 0906 _ 0F 8E, FFFFFE88
        leave                                           ; 090C _ C9
        ret                                             ; 090D _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 090E _ 55
        mov     ebp, esp                                ; 090F _ 89. E5
        push    ebx                                     ; 0911 _ 53
        sub     esp, 52                                 ; 0912 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0915 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0918 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 091B _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 091E _ 89. 45, F4
        jmp     ?_022                                   ; 0921 _ EB, 4B

?_021:  movsx   ecx, byte [ebp-1CH]                     ; 0923 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0927 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 092A _ 0F B6. 00
        movsx   eax, al                                 ; 092D _ 0F BE. C0
        shl     eax, 4                                  ; 0930 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0933 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0939 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 093C _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 093F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0942 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0944 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0948 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 094C _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 094F _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0953 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0956 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 095A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 095E _ 89. 04 24
        call    paint_font                              ; 0961 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0966 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 096A _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 096E _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0971 _ 0F B6. 00
        test    al, al                                  ; 0974 _ 84. C0
        jnz     ?_021                                   ; 0976 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0978 _ 8B. 45, 14
        add     eax, 16                                 ; 097B _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 097E _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0982 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0985 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0989 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 098C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0990 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0993 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0997 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 099A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 099E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09A1 _ 89. 04 24
        call    sheet_refresh                           ; 09A4 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 09A9 _ 83. C4, 34
        pop     ebx                                     ; 09AC _ 5B
        pop     ebp                                     ; 09AD _ 5D
        ret                                             ; 09AE _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09AF _ 55
        mov     ebp, esp                                ; 09B0 _ 89. E5
        sub     esp, 20                                 ; 09B2 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09B5 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09B8 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09BB _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 09C2 _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 09C7 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 09CE _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 09D3 _ 8B. 45, F8
        shl     eax, 4                                  ; 09D6 _ C1. E0, 04
        mov     edx, eax                                ; 09D9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09DB _ 8B. 45, FC
        add     eax, edx                                ; 09DE _ 01. D0
        add     eax, cursor.1664                        ; 09E0 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 09E5 _ 0F B6. 00
        cmp     al, 42                                  ; 09E8 _ 3C, 2A
        jnz     ?_025                                   ; 09EA _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09EC _ 8B. 45, F8
        shl     eax, 4                                  ; 09EF _ C1. E0, 04
        mov     edx, eax                                ; 09F2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F4 _ 8B. 45, FC
        add     eax, edx                                ; 09F7 _ 01. D0
        mov     edx, eax                                ; 09F9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09FB _ 8B. 45, 08
        add     eax, edx                                ; 09FE _ 01. D0
        mov     byte [eax], 0                           ; 0A00 _ C6. 00, 00
        jmp     ?_027                                   ; 0A03 _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 0A05 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A08 _ C1. E0, 04
        mov     edx, eax                                ; 0A0B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A0D _ 8B. 45, FC
        add     eax, edx                                ; 0A10 _ 01. D0
        add     eax, cursor.1664                        ; 0A12 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0A17 _ 0F B6. 00
        cmp     al, 79                                  ; 0A1A _ 3C, 4F
        jnz     ?_026                                   ; 0A1C _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A1E _ 8B. 45, F8
        shl     eax, 4                                  ; 0A21 _ C1. E0, 04
        mov     edx, eax                                ; 0A24 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A26 _ 8B. 45, FC
        add     eax, edx                                ; 0A29 _ 01. D0
        mov     edx, eax                                ; 0A2B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A2D _ 8B. 45, 08
        add     eax, edx                                ; 0A30 _ 01. D0
        mov     byte [eax], 7                           ; 0A32 _ C6. 00, 07
        jmp     ?_027                                   ; 0A35 _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 0A37 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A3A _ C1. E0, 04
        mov     edx, eax                                ; 0A3D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A3F _ 8B. 45, FC
        add     eax, edx                                ; 0A42 _ 01. D0
        mov     edx, eax                                ; 0A44 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A46 _ 8B. 45, 08
        add     edx, eax                                ; 0A49 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A4B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A4F _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0A51 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0A55 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0A59 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0A5F _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0A63 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0A67 _ 0F 8E, FFFFFF5A
        leave                                           ; 0A6D _ C9
        ret                                             ; 0A6E _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0A6F _ 55
        mov     ebp, esp                                ; 0A70 _ 89. E5
        sub     esp, 16                                 ; 0A72 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A75 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A7C _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0A7E _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0A85 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0A87 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0A8A _ 8B. 55, 14
        add     eax, edx                                ; 0A8D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A8F _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0A93 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0A96 _ 8B. 4D, 10
        add     edx, ecx                                ; 0A99 _ 01. CA
        add     eax, edx                                ; 0A9B _ 01. D0
        mov     edx, eax                                ; 0A9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A9F _ 8B. 45, 08
        add     edx, eax                                ; 0AA2 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0AA4 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0AA7 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0AAB _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0AAD _ 8B. 45, FC
        add     eax, ecx                                ; 0AB0 _ 01. C8
        mov     ecx, eax                                ; 0AB2 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0AB4 _ 8B. 45, 20
        add     eax, ecx                                ; 0AB7 _ 01. C8
        movzx   eax, byte [eax]                         ; 0AB9 _ 0F B6. 00
        mov     byte [edx], al                          ; 0ABC _ 88. 02
        add     dword [ebp-4H], 1                       ; 0ABE _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0AC2 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0AC5 _ 3B. 45, 18
        jl      ?_031                                   ; 0AC8 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0ACA _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0ACE _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0AD1 _ 3B. 45, 1C
        jl      ?_030                                   ; 0AD4 _ 7C, A8
        leave                                           ; 0AD6 _ C9
        ret                                             ; 0AD7 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0AD8 _ 55
        mov     ebp, esp                                ; 0AD9 _ 89. E5
        sub     esp, 24                                 ; 0ADB _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0ADE _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0AE6 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0AEE _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0AF5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0AFA _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0B02 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0B0A _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0B11 _ E8, FFFFFFFC(rel)
        leave                                           ; 0B16 _ C9
        ret                                             ; 0B17 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0B18 _ 55
        mov     ebp, esp                                ; 0B19 _ 89. E5
        sub     esp, 40                                 ; 0B1B _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0B1E _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0B21 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0B24 _ A1, 00000124(d)
        add     eax, edx                                ; 0B29 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0B2B _ A3, 00000124(d)
        mov     eax, dword [ebp+10H]                    ; 0B30 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0B33 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0B36 _ A1, 00000128(d)
        add     eax, edx                                ; 0B3B _ 01. D0
        mov     dword [mouse_y], eax                    ; 0B3D _ A3, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0B42 _ A1, 00000124(d)
        test    eax, eax                                ; 0B47 _ 85. C0
        jns     ?_034                                   ; 0B49 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0B4B _ C7. 05, 00000124(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0B55 _ A1, 00000128(d)
        test    eax, eax                                ; 0B5A _ 85. C0
        jns     ?_035                                   ; 0B5C _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0B5E _ C7. 05, 00000128(d), 00000000
?_035:  movzx   eax, word [?_128]                       ; 0B68 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B6F _ 98
        lea     edx, [eax-10H]                          ; 0B70 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0B73 _ A1, 00000124(d)
        cmp     edx, eax                                ; 0B78 _ 39. C2
        jge     ?_036                                   ; 0B7A _ 7D, 10
        movzx   eax, word [?_128]                       ; 0B7C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B83 _ 98
        sub     eax, 16                                 ; 0B84 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0B87 _ A3, 00000124(d)
?_036:  movzx   eax, word [?_128]                       ; 0B8C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B93 _ 98
        lea     edx, [eax-10H]                          ; 0B94 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0B97 _ A1, 00000128(d)
        cmp     edx, eax                                ; 0B9C _ 39. C2
        jge     ?_037                                   ; 0B9E _ 7D, 10
        movzx   eax, word [?_128]                       ; 0BA0 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BA7 _ 98
        sub     eax, 16                                 ; 0BA8 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0BAB _ A3, 00000128(d)
?_037:  mov     dword [esp+14H], 7                      ; 0BB0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_119                  ; 0BB8 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 0BC0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0BC8 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0BD0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BD3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BD7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BDA _ 89. 04 24
        call    paint_string                            ; 0BDD _ E8, FFFFFFFC(rel)
        leave                                           ; 0BE2 _ C9
        ret                                             ; 0BE3 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0BE4 _ 55
        mov     ebp, esp                                ; 0BE5 _ 89. E5
        sub     esp, 40                                 ; 0BE7 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0BEA _ C6. 45, F7, 00
        call    io_sti                                  ; 0BEE _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0BF3 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0BFA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0BFF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C02 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0C06 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0C0A _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0C11 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0C16 _ 85. C0
        jz      ?_038                                   ; 0C18 _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 0C1A _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0C22 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C25 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C29 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C2C _ 89. 04 24
        call    compute_mouse_position                  ; 0C2F _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0C34 _ 8B. 15, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0C3A _ A1, 00000124(d)
        mov     dword [esp+0CH], edx                    ; 0C3F _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0C43 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0C47 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0C4A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C4E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C51 _ 89. 04 24
        call    sheet_slide                             ; 0C54 _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0C59 _ C9
        ret                                             ; 0C5A _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 0C5B _ 55
        mov     ebp, esp                                ; 0C5C _ 89. E5
        sub     esp, 88                                 ; 0C5E _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 0C61 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0C68 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 0C6F _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 0C76 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 0C7B _ 89. 45, D4
        movzx   eax, word [?_128]                       ; 0C7E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C85 _ 98
        mov     dword [ebp-28H], eax                    ; 0C86 _ 89. 45, D8
        movzx   eax, word [?_129]                       ; 0C89 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C90 _ 98
        mov     dword [ebp-24H], eax                    ; 0C91 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 0C94 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0C97 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 0C99 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 0C9C _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 0CA0 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 0CA3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CA7 _ 89. 04 24
        call    init_desktop                            ; 0CAA _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0CAF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_120                  ; 0CB7 _ C7. 44 24, 10, 00000017(d)
        mov     eax, dword [ebp-34H]                    ; 0CBF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0CC2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0CC6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0CC9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0CCD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CD0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CD4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CD7 _ 89. 04 24
        call    paint_string                            ; 0CDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 0CDF _ 8B. 45, 14
        mov     dword [esp], eax                        ; 0CE2 _ 89. 04 24
        call    intToHexStr                             ; 0CE5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0CEA _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 0CED _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 0CF5 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 0CF8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0CFC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0CFF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0D03 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0D06 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D0A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D0D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D11 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D14 _ 89. 04 24
        call    paint_string                            ; 0D17 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0D1C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0D20 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_121                  ; 0D28 _ C7. 44 24, 10, 00000021(d)
        mov     eax, dword [ebp-34H]                    ; 0D30 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D33 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0D37 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0D3A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D3E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D41 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D45 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D48 _ 89. 04 24
        call    paint_string                            ; 0D4B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D50 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0D53 _ 8B. 00
        mov     dword [esp], eax                        ; 0D55 _ 89. 04 24
        call    intToHexStr                             ; 0D58 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0D5D _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 0D60 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 0D68 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 0D6B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0D6F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D72 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0D76 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0D79 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D7D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D80 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D84 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D87 _ 89. 04 24
        call    paint_string                            ; 0D8A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0D8F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0D93 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_122                  ; 0D9B _ C7. 44 24, 10, 0000002D(d)
        mov     eax, dword [ebp-34H]                    ; 0DA3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DA6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0DAA _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0DAD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0DB1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DBB _ 89. 04 24
        call    paint_string                            ; 0DBE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DC3 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0DC6 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 0DC9 _ 89. 04 24
        call    intToHexStr                             ; 0DCC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0DD1 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 0DD4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 0DDC _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 0DDF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0DE3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DE6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0DEA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0DED _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0DF1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DFB _ 89. 04 24
        call    paint_string                            ; 0DFE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0E03 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0E07 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_123                  ; 0E0F _ C7. 44 24, 10, 00000039(d)
        mov     eax, dword [ebp-34H]                    ; 0E17 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E1A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0E1E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0E21 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E25 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E28 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E2C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E2F _ 89. 04 24
        call    paint_string                            ; 0E32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E37 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0E3A _ 8B. 40, 08
        mov     dword [esp], eax                        ; 0E3D _ 89. 04 24
        call    intToHexStr                             ; 0E40 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0E45 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 0E48 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 0E50 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 0E53 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0E57 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E5A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E5E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E61 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E65 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E68 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E6C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E6F _ 89. 04 24
        call    paint_string                            ; 0E72 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0E77 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0E7B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_124                  ; 0E83 _ C7. 44 24, 10, 00000045(d)
        mov     eax, dword [ebp-34H]                    ; 0E8B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E8E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0E92 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0E95 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E99 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E9C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EA0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EA3 _ 89. 04 24
        call    paint_string                            ; 0EA6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EAB _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0EAE _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 0EB1 _ 89. 04 24
        call    intToHexStr                             ; 0EB4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0EB9 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 0EBC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 0EC4 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 0EC7 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0ECB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0ECE _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0ED2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0ED5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0ED9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EDC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EE0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EE3 _ 89. 04 24
        call    paint_string                            ; 0EE6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0EEB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0EEF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_125                  ; 0EF7 _ C7. 44 24, 10, 00000052(d)
        mov     eax, dword [ebp-34H]                    ; 0EFF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F02 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0F06 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0F09 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F0D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F17 _ 89. 04 24
        call    paint_string                            ; 0F1A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F1F _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 0F22 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 0F25 _ 89. 04 24
        call    intToHexStr                             ; 0F28 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0F2D _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 0F30 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 0F38 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 0F3B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0F3F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F42 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0F46 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0F49 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F4D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F50 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F54 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F57 _ 89. 04 24
        call    paint_string                            ; 0F5A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0F5F _ 83. 45, CC, 10
        leave                                           ; 0F63 _ C9
        ret                                             ; 0F64 _ C3
; show_memory_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0F65 _ 55
        mov     ebp, esp                                ; 0F66 _ 89. E5
        sub     esp, 24                                 ; 0F68 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0F6B _ C7. 04 24, 00000064
        call    io_in8                                  ; 0F72 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0F77 _ 83. E0, 02
        test    eax, eax                                ; 0F7A _ 85. C0
        jnz     ?_040                                   ; 0F7C _ 75, 02
        jmp     ?_041                                   ; 0F7E _ EB, 02

?_040:  jmp     ?_039                                   ; 0F80 _ EB, E9

?_041:  leave                                           ; 0F82 _ C9
        ret                                             ; 0F83 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0F84 _ 55
        mov     ebp, esp                                ; 0F85 _ 89. E5
        sub     esp, 24                                 ; 0F87 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0F8A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0F8F _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0F97 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0F9E _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0FA3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0FA8 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0FB0 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0FB7 _ E8, FFFFFFFC(rel)
        leave                                           ; 0FBC _ C9
        ret                                             ; 0FBD _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0FBE _ 55
        mov     ebp, esp                                ; 0FBF _ 89. E5
        sub     esp, 24                                 ; 0FC1 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0FC4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0FC9 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0FD1 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0FD8 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0FDD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0FE2 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0FEA _ C7. 04 24, 00000060
        call    io_out8                                 ; 0FF1 _ E8, FFFFFFFC(rel)
        leave                                           ; 0FF6 _ C9
        ret                                             ; 0FF7 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0FF8 _ 55
        mov     ebp, esp                                ; 0FF9 _ 89. E5
        sub     esp, 4                                  ; 0FFB _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0FFE _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1001 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1004 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1007 _ 0F B6. 40, 03
        test    al, al                                  ; 100B _ 84. C0
        jnz     ?_043                                   ; 100D _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 100F _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 1013 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1015 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1018 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 101C _ B8, 00000000
        jmp     ?_050                                   ; 1021 _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 1026 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1029 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 102D _ 3C, 01
        jnz     ?_045                                   ; 102F _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1031 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1035 _ 25, 000000C8
        cmp     eax, 8                                  ; 103A _ 83. F8, 08
        jnz     ?_044                                   ; 103D _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 103F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1042 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1046 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1048 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 104B _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 104F _ B8, 00000000
        jmp     ?_050                                   ; 1054 _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 1059 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 105C _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1060 _ 3C, 02
        jnz     ?_046                                   ; 1062 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1064 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1067 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 106B _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 106E _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1071 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1075 _ B8, 00000000
        jmp     ?_050                                   ; 107A _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 107F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1082 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1086 _ 3C, 03
        jne     ?_049                                   ; 1088 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 108E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1091 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1095 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1098 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 109B _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 109F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 10A2 _ 0F B6. 00
        movzx   eax, al                                 ; 10A5 _ 0F B6. C0
        and     eax, 07H                                ; 10A8 _ 83. E0, 07
        mov     edx, eax                                ; 10AB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10AD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 10B0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 10B3 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 10B6 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 10BA _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 10BD _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 10C0 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 10C3 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 10C6 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 10CA _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 10CD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 10D0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 10D3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 10D6 _ 0F B6. 00
        movzx   eax, al                                 ; 10D9 _ 0F B6. C0
        and     eax, 10H                                ; 10DC _ 83. E0, 10
        test    eax, eax                                ; 10DF _ 85. C0
        jz      ?_047                                   ; 10E1 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 10E3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10E6 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 10E9 _ 0D, FFFFFF00
        mov     edx, eax                                ; 10EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10F0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 10F3 _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 10F6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 10F9 _ 0F B6. 00
        movzx   eax, al                                 ; 10FC _ 0F B6. C0
        and     eax, 20H                                ; 10FF _ 83. E0, 20
        test    eax, eax                                ; 1102 _ 85. C0
        jz      ?_048                                   ; 1104 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1106 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1109 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 110C _ 0D, FFFFFF00
        mov     edx, eax                                ; 1111 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1113 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1116 _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 1119 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 111C _ 8B. 40, 08
        neg     eax                                     ; 111F _ F7. D8
        mov     edx, eax                                ; 1121 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1123 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1126 _ 89. 50, 08
        mov     eax, 1                                  ; 1129 _ B8, 00000001
        jmp     ?_050                                   ; 112E _ EB, 05

?_049:  mov     eax, 4294967295                         ; 1130 _ B8, FFFFFFFF
?_050:  leave                                           ; 1135 _ C9
        ret                                             ; 1136 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1137 _ 55
        mov     ebp, esp                                ; 1138 _ 89. E5
        sub     esp, 40                                 ; 113A _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 113D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1145 _ C7. 04 24, 00000020
        call    io_out8                                 ; 114C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1151 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1159 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1160 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1165 _ C7. 04 24, 00000060
        call    io_in8                                  ; 116C _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1171 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1174 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1178 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 117C _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1183 _ E8, FFFFFFFC(rel)
        leave                                           ; 1188 _ C9
        ret                                             ; 1189 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 118A _ 55
        mov     ebp, esp                                ; 118B _ 89. E5
        sub     esp, 40                                 ; 118D _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1190 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1198 _ C7. 04 24, 00000020
        call    io_out8                                 ; 119F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 11A4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 11AC _ C7. 04 24, 000000A0
        call    io_out8                                 ; 11B3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 11B8 _ C7. 04 24, 00000060
        call    io_in8                                  ; 11BF _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 11C4 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 11C7 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 11CB _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 11CF _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 11D6 _ E8, FFFFFFFC(rel)
        leave                                           ; 11DB _ C9
        ret                                             ; 11DC _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 11DD _ 55
        mov     ebp, esp                                ; 11DE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 11E0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 11E3 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 11E6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 11E8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 11EB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 11F2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 11F5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 11FC _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 11FF _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1202 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1205 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1208 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 120B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 120E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1211 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1218 _ 5D
        ret                                             ; 1219 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 121A _ 55
        mov     ebp, esp                                ; 121B _ 89. E5
        sub     esp, 20                                 ; 121D _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1220 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1223 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1226 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1229 _ 8B. 40, 10
        test    eax, eax                                ; 122C _ 85. C0
        jnz     ?_051                                   ; 122E _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1230 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1233 _ 8B. 40, 14
        or      eax, 01H                                ; 1236 _ 83. C8, 01
        mov     edx, eax                                ; 1239 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 123B _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 123E _ 89. 50, 14
        mov     eax, 4294967295                         ; 1241 _ B8, FFFFFFFF
        jmp     ?_053                                   ; 1246 _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 1248 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 124B _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 124E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1251 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1254 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1256 _ 8B. 45, FC
        add     edx, eax                                ; 1259 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 125B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 125F _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1261 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1264 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1267 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 126A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 126D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1270 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1273 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1276 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1279 _ 8B. 40, 0C
        cmp     edx, eax                                ; 127C _ 39. C2
        jnz     ?_052                                   ; 127E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1280 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1283 _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 128A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 128D _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1290 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1293 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1296 _ 89. 50, 10
        mov     eax, 0                                  ; 1299 _ B8, 00000000
?_053:  leave                                           ; 129E _ C9
        ret                                             ; 129F _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 12A0 _ 55
        mov     ebp, esp                                ; 12A1 _ 89. E5
        sub     esp, 16                                 ; 12A3 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 12A6 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 12A9 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 12AC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 12AF _ 8B. 40, 0C
        cmp     edx, eax                                ; 12B2 _ 39. C2
        jnz     ?_054                                   ; 12B4 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 12B6 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 12B9 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 12C0 _ B8, FFFFFFFF
        jmp     ?_056                                   ; 12C5 _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 12C7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 12CA _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 12CD _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 12D0 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 12D3 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 12D5 _ 8B. 45, F8
        add     eax, edx                                ; 12D8 _ 01. D0
        movzx   eax, byte [eax]                         ; 12DA _ 0F B6. 00
        movzx   eax, al                                 ; 12DD _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 12E0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 12E3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 12E6 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 12E9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 12EC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 12EF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 12F2 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 12F5 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 12F8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 12FB _ 8B. 40, 0C
        cmp     edx, eax                                ; 12FE _ 39. C2
        jnz     ?_055                                   ; 1300 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1302 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1305 _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 130C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 130F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1312 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1315 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1318 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 131B _ 8B. 45, FC
?_056:  leave                                           ; 131E _ C9
        ret                                             ; 131F _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1320 _ 55
        mov     ebp, esp                                ; 1321 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1323 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1326 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1329 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 132C _ 8B. 40, 10
        sub     edx, eax                                ; 132F _ 29. C2
        mov     eax, edx                                ; 1331 _ 89. D0
        pop     ebp                                     ; 1333 _ 5D
        ret                                             ; 1334 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1335 _ 55
        mov     ebp, esp                                ; 1336 _ 89. E5
        sub     esp, 4                                  ; 1338 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 133B _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 133E _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1341 _ 80. 7D, FC, 09
        jle     ?_057                                   ; 1345 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1347 _ 0F B6. 45, FC
        add     eax, 55                                 ; 134B _ 83. C0, 37
        jmp     ?_058                                   ; 134E _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 1350 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1354 _ 83. C0, 30
?_058:  leave                                           ; 1357 _ C9
        ret                                             ; 1358 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1359 _ 55
        mov     ebp, esp                                ; 135A _ 89. E5
        sub     esp, 24                                 ; 135C _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 135F _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1362 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1365 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 136C _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1370 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1373 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1376 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 137A _ 89. 04 24
        call    charToHexVal                            ; 137D _ E8, FFFFFFFC(rel)
        mov     byte [?_127], al                        ; 1382 _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 1387 _ 0F B6. 45, EC
        shr     al, 4                                   ; 138B _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 138E _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1391 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1395 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1398 _ 89. 04 24
        call    charToHexVal                            ; 139B _ E8, FFFFFFFC(rel)
        mov     byte [?_126], al                        ; 13A0 _ A2, 00000142(d)
        mov     eax, keyval                             ; 13A5 _ B8, 00000140(d)
        leave                                           ; 13AA _ C9
        ret                                             ; 13AB _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 13AC _ 55
        mov     ebp, esp                                ; 13AD _ 89. E5
        sub     esp, 16                                 ; 13AF _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 13B2 _ C6. 05, 00000220(d), 30
        mov     byte [?_130], 88                        ; 13B9 _ C6. 05, 00000221(d), 58
        mov     byte [?_131], 0                         ; 13C0 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 13C7 _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 13CE _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 13D0 _ 8B. 45, F4
        add     eax, str.1386                           ; 13D3 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 13D8 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 13DB _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 13DF _ 83. 7D, F4, 09
        jle     ?_059                                   ; 13E3 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 13E5 _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 13EC _ EB, 40

?_061:  mov     eax, dword [ebp+8H]                     ; 13EE _ 8B. 45, 08
        and     eax, 0FH                                ; 13F1 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 13F4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 13F7 _ 8B. 45, 08
        shr     eax, 4                                  ; 13FA _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 13FD _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1400 _ 83. 7D, FC, 09
        jle     ?_062                                   ; 1404 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1406 _ 8B. 45, FC
        add     eax, 55                                 ; 1409 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 140C _ 8B. 55, F8
        add     edx, str.1386                           ; 140F _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1415 _ 88. 02
        jmp     ?_063                                   ; 1417 _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 1419 _ 8B. 45, FC
        add     eax, 48                                 ; 141C _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 141F _ 8B. 55, F8
        add     edx, str.1386                           ; 1422 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1428 _ 88. 02
?_063:  sub     dword [ebp-8H], 1                       ; 142A _ 83. 6D, F8, 01
?_064:  cmp     dword [ebp-8H], 1                       ; 142E _ 83. 7D, F8, 01
        jle     ?_065                                   ; 1432 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1434 _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 1438 _ 75, B4
?_065:  mov     eax, str.1386                           ; 143A _ B8, 00000220(d)
        leave                                           ; 143F _ C9
        ret                                             ; 1440 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1441 _ 55
        mov     ebp, esp                                ; 1442 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1444 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1447 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 144D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1450 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1457 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 145A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1461 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1464 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 146B _ 5D
        ret                                             ; 146C _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 146D _ 55
        mov     ebp, esp                                ; 146E _ 89. E5
        sub     esp, 16                                 ; 1470 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1473 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 147A _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1481 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 1483 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1486 _ 8B. 55, F8
        add     edx, 2                                  ; 1489 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 148C _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1490 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1493 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 1497 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 149A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 149C _ 3B. 45, F8
        ja      ?_066                                   ; 149F _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 14A1 _ 8B. 45, FC
        leave                                           ; 14A4 _ C9
        ret                                             ; 14A5 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 14A6 _ 55
        mov     ebp, esp                                ; 14A7 _ 89. E5
        sub     esp, 16                                 ; 14A9 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 14AC _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 14B3 _ E9, 00000085

?_068:  mov     eax, dword [ebp+8H]                     ; 14B8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14BB _ 8B. 55, F8
        add     edx, 2                                  ; 14BE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14C1 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 14C5 _ 3B. 45, 0C
        jc      ?_070                                   ; 14C8 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 14CA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14CD _ 8B. 55, F8
        add     edx, 2                                  ; 14D0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 14D3 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 14D6 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14D9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14DC _ 8B. 55, F8
        add     edx, 2                                  ; 14DF _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 14E2 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 14E5 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 14E8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14EE _ 8B. 55, F8
        add     edx, 2                                  ; 14F1 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 14F4 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 14F7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14FA _ 8B. 55, F8
        add     edx, 2                                  ; 14FD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1500 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1504 _ 2B. 45, 0C
        mov     edx, eax                                ; 1507 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1509 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 150C _ 8B. 4D, F8
        add     ecx, 2                                  ; 150F _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1512 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1516 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1519 _ 8B. 55, F8
        add     edx, 2                                  ; 151C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 151F _ 8B. 44 D0, 04
        test    eax, eax                                ; 1523 _ 85. C0
        jnz     ?_069                                   ; 1525 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1527 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 152A _ 8B. 00
        lea     edx, [eax-1H]                           ; 152C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 152F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1532 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 1534 _ 8B. 45, FC
        jmp     ?_072                                   ; 1537 _ EB, 17

?_070:  add     dword [ebp-8H], 1                       ; 1539 _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 153D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1540 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1542 _ 3B. 45, F8
        ja      ?_068                                   ; 1545 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 154B _ B8, 00000000
?_072:  leave                                           ; 1550 _ C9
        ret                                             ; 1551 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1552 _ 55
        mov     ebp, esp                                ; 1553 _ 89. E5
        push    ebx                                     ; 1555 _ 53
        sub     esp, 16                                 ; 1556 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1559 _ C7. 45, F4, 00000000
        jmp     ?_075                                   ; 1560 _ EB, 17

?_073:  mov     eax, dword [ebp+8H]                     ; 1562 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1565 _ 8B. 55, F4
        add     edx, 2                                  ; 1568 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 156B _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 156E _ 3B. 45, 0C
        jbe     ?_074                                   ; 1571 _ 76, 02
        jmp     ?_076                                   ; 1573 _ EB, 0E

?_074:  add     dword [ebp-0CH], 1                      ; 1575 _ 83. 45, F4, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 1579 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 157C _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 157E _ 3B. 45, F4
        jg      ?_073                                   ; 1581 _ 7F, DF
?_076:  cmp     dword [ebp-0CH], 0                      ; 1583 _ 83. 7D, F4, 00
        jle     ?_078                                   ; 1587 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 158D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1590 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1593 _ 8B. 45, 08
        add     edx, 2                                  ; 1596 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1599 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 159C _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 159F _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 15A2 _ 8B. 45, 08
        add     ecx, 2                                  ; 15A5 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 15A8 _ 8B. 44 C8, 04
        add     eax, edx                                ; 15AC _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 15AE _ 3B. 45, 0C
        jne     ?_078                                   ; 15B1 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 15B7 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15BA _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 15BD _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15C0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15C3 _ 8B. 45, 08
        add     edx, 2                                  ; 15C6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 15C9 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 15CD _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 15D0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15D3 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 15D6 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 15D9 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 15DD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15E0 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 15E2 _ 3B. 45, F4
        jle     ?_077                                   ; 15E5 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 15E7 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 15EA _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 15ED _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15F0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15F3 _ 8B. 55, F4
        add     edx, 2                                  ; 15F6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15F9 _ 8B. 04 D0
        cmp     ecx, eax                                ; 15FC _ 39. C1
        jnz     ?_077                                   ; 15FE _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1600 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1603 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1606 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1609 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 160C _ 8B. 45, 08
        add     edx, 2                                  ; 160F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1612 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1616 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1619 _ 8B. 4D, F4
        add     ecx, 2                                  ; 161C _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 161F _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1623 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1626 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1629 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 162C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1630 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1633 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1635 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1638 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 163B _ 89. 10
?_077:  mov     eax, 0                                  ; 163D _ B8, 00000000
        jmp     ?_084                                   ; 1642 _ E9, 0000011C

?_078:  mov     eax, dword [ebp+8H]                     ; 1647 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 164A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 164C _ 3B. 45, F4
        jle     ?_079                                   ; 164F _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1651 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1654 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1657 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 165A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 165D _ 8B. 55, F4
        add     edx, 2                                  ; 1660 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1663 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1666 _ 39. C1
        jnz     ?_079                                   ; 1668 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 166A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 166D _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1670 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1673 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1676 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1679 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 167C _ 8B. 55, F4
        add     edx, 2                                  ; 167F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1682 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1686 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1689 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 168C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 168F _ 8B. 55, F4
        add     edx, 2                                  ; 1692 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1695 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1699 _ B8, 00000000
        jmp     ?_084                                   ; 169E _ E9, 000000C0

?_079:  mov     eax, dword [ebp+8H]                     ; 16A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16A6 _ 8B. 00
        cmp     eax, 4095                               ; 16A8 _ 3D, 00000FFF
        jg      ?_083                                   ; 16AD _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 16B3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16B6 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 16B8 _ 89. 45, F8
        jmp     ?_081                                   ; 16BB _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 16BD _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16C0 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 16C3 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 16C6 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 16C9 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 16CC _ 8B. 45, 08
        add     edx, 2                                  ; 16CF _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 16D2 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 16D5 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 16D7 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 16DA _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 16DD _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 16E1 _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 16E5 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 16E8 _ 3B. 45, F4
        jg      ?_080                                   ; 16EB _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 16ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16F0 _ 8B. 00
        lea     edx, [eax+1H]                           ; 16F2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 16F5 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16F8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 16FA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16FD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1700 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1703 _ 8B. 00
        cmp     edx, eax                                ; 1705 _ 39. C2
        jge     ?_082                                   ; 1707 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1709 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 170C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 170E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1711 _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 1714 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1717 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 171A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 171D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1720 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1723 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1726 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1729 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 172C _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 172F _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1733 _ B8, 00000000
        jmp     ?_084                                   ; 1738 _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 173A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 173D _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1740 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1743 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1746 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1749 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 174C _ 8B. 40, 08
        mov     edx, eax                                ; 174F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1751 _ 8B. 45, 10
        add     eax, edx                                ; 1754 _ 01. D0
        mov     edx, eax                                ; 1756 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1758 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 175B _ 89. 50, 08
        mov     eax, 4294967295                         ; 175E _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 1763 _ 83. C4, 10
        pop     ebx                                     ; 1766 _ 5B
        pop     ebp                                     ; 1767 _ 5D
        ret                                             ; 1768 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1769 _ 55
        mov     ebp, esp                                ; 176A _ 89. E5
        sub     esp, 24                                 ; 176C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 176F _ 8B. 45, 0C
        add     eax, 4095                               ; 1772 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1777 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 177C _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 177F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1782 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1786 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1789 _ 89. 04 24
        call    memman_alloc                            ; 178C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1791 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1794 _ 8B. 45, FC
        leave                                           ; 1797 _ C9
        ret                                             ; 1798 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1799 _ 55
        mov     ebp, esp                                ; 179A _ 89. E5
        sub     esp, 28                                 ; 179C _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 179F _ 8B. 45, 10
        add     eax, 4095                               ; 17A2 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 17A7 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 17AC _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 17AF _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 17B2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17C0 _ 89. 04 24
        call    memman_free                             ; 17C3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 17C8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 17CB _ 8B. 45, FC
        leave                                           ; 17CE _ C9
        ret                                             ; 17CF _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 17D0 _ 55
        mov     ebp, esp                                ; 17D1 _ 89. E5
        sub     esp, 40                                 ; 17D3 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 17D6 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 17DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17E1 _ 89. 04 24
        call    memman_alloc_4k                         ; 17E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17E9 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 17EC _ 83. 7D, F4, 00
        jnz     ?_085                                   ; 17F0 _ 75, 07
        mov     eax, 0                                  ; 17F2 _ B8, 00000000
        jmp     ?_088                                   ; 17F7 _ EB, 54

?_085:  mov     eax, dword [ebp-0CH]                    ; 17F9 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 17FC _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 17FF _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1801 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1804 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1807 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 180A _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 180D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1810 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1813 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1816 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 181D _ C7. 45, F0, 00000000
        jmp     ?_087                                   ; 1824 _ EB, 1B

?_086:  mov     eax, dword [ebp-0CH]                    ; 1826 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1829 _ 8B. 55, F0
        add     edx, 33                                 ; 182C _ 83. C2, 21
        shl     edx, 5                                  ; 182F _ C1. E2, 05
        add     eax, edx                                ; 1832 _ 01. D0
        add     eax, 12                                 ; 1834 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1837 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 183D _ 83. 45, F0, 01
?_087:  cmp     dword [ebp-10H], 255                    ; 1841 _ 81. 7D, F0, 000000FF
        jle     ?_086                                   ; 1848 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 184A _ 8B. 45, F4
?_088:  leave                                           ; 184D _ C9
        ret                                             ; 184E _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 184F _ 55
        mov     ebp, esp                                ; 1850 _ 89. E5
        sub     esp, 16                                 ; 1852 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1855 _ C7. 45, F8, 00000000
        jmp     ?_091                                   ; 185C _ EB, 57

?_089:  mov     eax, dword [ebp+8H]                     ; 185E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1861 _ 8B. 55, F8
        add     edx, 33                                 ; 1864 _ 83. C2, 21
        shl     edx, 5                                  ; 1867 _ C1. E2, 05
        add     eax, edx                                ; 186A _ 01. D0
        add     eax, 12                                 ; 186C _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 186F _ 8B. 00
        test    eax, eax                                ; 1871 _ 85. C0
        jnz     ?_090                                   ; 1873 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1875 _ 8B. 45, F8
        shl     eax, 5                                  ; 1878 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 187B _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1881 _ 8B. 45, 08
        add     eax, edx                                ; 1884 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1886 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1889 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 188C _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 188F _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1892 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1895 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1898 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 189B _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 18A2 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 18A5 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 18AC _ 8B. 45, FC
        jmp     ?_092                                   ; 18AF _ EB, 12

?_090:  add     dword [ebp-8H], 1                       ; 18B1 _ 83. 45, F8, 01
?_091:  cmp     dword [ebp-8H], 255                     ; 18B5 _ 81. 7D, F8, 000000FF
        jle     ?_089                                   ; 18BC _ 7E, A0
        mov     eax, 0                                  ; 18BE _ B8, 00000000
?_092:  leave                                           ; 18C3 _ C9
        ret                                             ; 18C4 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 18C5 _ 55
        mov     ebp, esp                                ; 18C6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 18C8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 18CB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 18CE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 18D0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 18D3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 18D6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18D9 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 18DC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 18DF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 18E2 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 18E5 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 18E8 _ 89. 50, 14
        pop     ebp                                     ; 18EB _ 5D
        ret                                             ; 18EC _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 18ED _ 55
        mov     ebp, esp                                ; 18EE _ 89. E5
        push    ebx                                     ; 18F0 _ 53
        sub     esp, 52                                 ; 18F1 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 18F4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 18F7 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 18FA _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 18FD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1900 _ 8B. 40, 0C
        add     eax, 1                                  ; 1903 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 1906 _ 3B. 45, 10
        jge     ?_093                                   ; 1909 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 190B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 190E _ 8B. 40, 0C
        add     eax, 1                                  ; 1911 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1914 _ 89. 45, 10
?_093:  cmp     dword [ebp+10H], -1                     ; 1917 _ 83. 7D, 10, FF
        jge     ?_094                                   ; 191B _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 191D _ C7. 45, 10, FFFFFFFF
?_094:  mov     eax, dword [ebp+0CH]                    ; 1924 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1927 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 192A _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 192D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1930 _ 3B. 45, 10
        jle     ?_102                                   ; 1933 _ 0F 8E, 00000100
        cmp     dword [ebp+10H], 0                      ; 1939 _ 83. 7D, 10, 00
        js      ?_097                                   ; 193D _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 193F _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1942 _ 89. 45, F0
        jmp     ?_096                                   ; 1945 _ EB, 31

?_095:  mov     eax, dword [ebp-10H]                    ; 1947 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 194A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 194D _ 8B. 45, 08
        add     edx, 4                                  ; 1950 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1953 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1956 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1959 _ 8B. 4D, F0
        add     ecx, 4                                  ; 195C _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 195F _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1962 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1965 _ 8B. 55, F0
        add     edx, 4                                  ; 1968 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 196B _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 196E _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1971 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1974 _ 83. 6D, F0, 01
?_096:  mov     eax, dword [ebp-10H]                    ; 1978 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 197B _ 3B. 45, 10
        jg      ?_095                                   ; 197E _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1980 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1983 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1986 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1989 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 198C _ 89. 14 88
        jmp     ?_101                                   ; 198F _ EB, 5E

?_097:  mov     eax, dword [ebp+8H]                     ; 1991 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1994 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 1997 _ 3B. 45, F4
        jle     ?_100                                   ; 199A _ 7E, 44
        mov     eax, dword [ebp-0CH]                    ; 199C _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 199F _ 89. 45, F0
        jmp     ?_099                                   ; 19A2 _ EB, 31

?_098:  mov     eax, dword [ebp-10H]                    ; 19A4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 19A7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 19AA _ 8B. 45, 08
        add     edx, 4                                  ; 19AD _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 19B0 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 19B3 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 19B6 _ 8B. 4D, F0
        add     ecx, 4                                  ; 19B9 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 19BC _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 19BF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 19C2 _ 8B. 55, F0
        add     edx, 4                                  ; 19C5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 19C8 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 19CB _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 19CE _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 19D1 _ 83. 45, F0, 01
?_099:  mov     eax, dword [ebp+8H]                     ; 19D5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19D8 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 19DB _ 3B. 45, F0
        jg      ?_098                                   ; 19DE _ 7F, C4
?_100:  mov     eax, dword [ebp+8H]                     ; 19E0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19E3 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 19E6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19E9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 19EC _ 89. 50, 0C
?_101:  mov     eax, dword [ebp+0CH]                    ; 19EF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 19F2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 19F5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 19F8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 19FB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 19FE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1A01 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A04 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A07 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1A0A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1A0D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A10 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A13 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1A16 _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1A19 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A1D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1A21 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1A25 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A29 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A2C _ 89. 04 24
        call    sheet_refresh_local                     ; 1A2F _ E8, FFFFFFFC(rel)
        jmp     ?_109                                   ; 1A34 _ E9, 00000111

?_102:  mov     eax, dword [ebp-0CH]                    ; 1A39 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1A3C _ 3B. 45, 10
        jge     ?_109                                   ; 1A3F _ 0F 8D, 00000105
        cmp     dword [ebp-0CH], 0                      ; 1A45 _ 83. 7D, F4, 00
        js      ?_105                                   ; 1A49 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1A4B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1A4E _ 89. 45, F0
        jmp     ?_104                                   ; 1A51 _ EB, 31

?_103:  mov     eax, dword [ebp-10H]                    ; 1A53 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1A56 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A59 _ 8B. 45, 08
        add     edx, 4                                  ; 1A5C _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A5F _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A62 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1A65 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1A68 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A6B _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A6E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A71 _ 8B. 55, F0
        add     edx, 4                                  ; 1A74 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A77 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1A7A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1A7D _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1A80 _ 83. 45, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1A84 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A87 _ 3B. 45, 10
        jl      ?_103                                   ; 1A8A _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1A8C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A8F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A92 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A95 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1A98 _ 89. 14 88
        jmp     ?_108                                   ; 1A9B _ EB, 68

?_105:  mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AA0 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1AA3 _ 89. 45, F0
        jmp     ?_107                                   ; 1AA6 _ EB, 37

?_106:  mov     eax, dword [ebp-10H]                    ; 1AA8 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1AAB _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1AAE _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1AB1 _ 8B. 55, F0
        add     edx, 4                                  ; 1AB4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1AB7 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1ABA _ 8B. 45, 08
        add     ecx, 4                                  ; 1ABD _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1AC0 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1AC3 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1AC6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AC9 _ 8B. 45, 08
        add     edx, 4                                  ; 1ACC _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1ACF _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1AD2 _ 8B. 55, F0
        add     edx, 1                                  ; 1AD5 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1AD8 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1ADB _ 83. 6D, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1ADF _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1AE2 _ 3B. 45, 10
        jge     ?_106                                   ; 1AE5 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1AE7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1AEA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1AED _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1AF0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1AF3 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AF6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AF9 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1AFC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AFF _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B02 _ 89. 50, 0C
?_108:  mov     eax, dword [ebp+0CH]                    ; 1B05 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B08 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B0B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B0E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B11 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B14 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B17 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B1A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B1D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B20 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B23 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B26 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B29 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B2C _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1B2F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1B33 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1B37 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1B3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1B3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1B42 _ 89. 04 24
        call    sheet_refresh_local                     ; 1B45 _ E8, FFFFFFFC(rel)
?_109:  add     esp, 52                                 ; 1B4A _ 83. C4, 34
        pop     ebx                                     ; 1B4D _ 5B
        pop     ebp                                     ; 1B4E _ 5D
        ret                                             ; 1B4F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1B50 _ 55
        mov     ebp, esp                                ; 1B51 _ 89. E5
        push    esi                                     ; 1B53 _ 56
        push    ebx                                     ; 1B54 _ 53
        sub     esp, 32                                 ; 1B55 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1B58 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1B5B _ 8B. 40, 18
        test    eax, eax                                ; 1B5E _ 85. C0
        js      ?_110                                   ; 1B60 _ 78, 49
        mov     eax, dword [ebp+0CH]                    ; 1B62 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B65 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1B68 _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1B6B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B6E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B71 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1B74 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1B77 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B7A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B7D _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1B80 _ 8B. 45, 14
        add     edx, eax                                ; 1B83 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1B85 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1B88 _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1B8B _ 8B. 45, 10
        add     eax, esi                                ; 1B8E _ 01. F0
        mov     dword [esp+10H], ebx                    ; 1B90 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1B94 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1B98 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1B9C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1BA0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1BA3 _ 89. 04 24
        call    sheet_refresh_local                     ; 1BA6 _ E8, FFFFFFFC(rel)
?_110:  mov     eax, 0                                  ; 1BAB _ B8, 00000000
        add     esp, 32                                 ; 1BB0 _ 83. C4, 20
        pop     ebx                                     ; 1BB3 _ 5B
        pop     esi                                     ; 1BB4 _ 5E
        pop     ebp                                     ; 1BB5 _ 5D
        ret                                             ; 1BB6 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1BB7 _ 55
        mov     ebp, esp                                ; 1BB8 _ 89. E5
        sub     esp, 56                                 ; 1BBA _ 83. EC, 38
        mov     eax, dword [ebp+0CH]                    ; 1BBD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BC0 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1BC3 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1BC6 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1BC9 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1BCC _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1BCF _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1BD2 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1BD5 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BD8 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1BDB _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1BDE _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BE1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1BE4 _ 8B. 40, 18
        test    eax, eax                                ; 1BE7 _ 85. C0
        js      ?_111                                   ; 1BE9 _ 78, 6E
        mov     eax, dword [ebp+0CH]                    ; 1BEB _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1BEE _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1BF1 _ 8B. 45, F4
        add     edx, eax                                ; 1BF4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1BF6 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1BF9 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1BFC _ 8B. 45, F0
        add     eax, ecx                                ; 1BFF _ 01. C8
        mov     dword [esp+10H], edx                    ; 1C01 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1C05 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1C09 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1C0C _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1C10 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1C13 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C17 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C1A _ 89. 04 24
        call    sheet_refresh_local                     ; 1C1D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1C22 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1C25 _ 8B. 50, 08
        mov     eax, dword [ebp+10H]                    ; 1C28 _ 8B. 45, 10
        add     edx, eax                                ; 1C2B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C2D _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1C30 _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1C33 _ 8B. 45, 10
        add     eax, ecx                                ; 1C36 _ 01. C8
        mov     dword [esp+10H], edx                    ; 1C38 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1C3C _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1C40 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1C43 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1C47 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1C4A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C4E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C51 _ 89. 04 24
        call    sheet_refresh_local                     ; 1C54 _ E8, FFFFFFFC(rel)
?_111:  leave                                           ; 1C59 _ C9
        ret                                             ; 1C5A _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 1C5B _ 55
        mov     ebp, esp                                ; 1C5C _ 89. E5
        sub     esp, 48                                 ; 1C5E _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1C61 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C64 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1C66 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1C69 _ C7. 45, E0, 00000000
        jmp     ?_118                                   ; 1C70 _ E9, 000000DC

?_112:  mov     eax, dword [ebp+8H]                     ; 1C75 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1C78 _ 8B. 55, E0
        add     edx, 4                                  ; 1C7B _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1C7E _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1C81 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1C84 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1C87 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1C89 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1C8C _ C7. 45, E8, 00000000
        jmp     ?_117                                   ; 1C93 _ E9, 000000A6

?_113:  mov     eax, dword [ebp-10H]                    ; 1C98 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1C9B _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1C9E _ 8B. 45, E8
        add     eax, edx                                ; 1CA1 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1CA3 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1CA6 _ C7. 45, E4, 00000000
        jmp     ?_116                                   ; 1CAD _ EB, 7C

?_114:  mov     eax, dword [ebp-10H]                    ; 1CAF _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1CB2 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1CB5 _ 8B. 45, E4
        add     eax, edx                                ; 1CB8 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1CBA _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1CBD _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1CC0 _ 3B. 45, FC
        jg      ?_115                                   ; 1CC3 _ 7F, 62
        mov     eax, dword [ebp-4H]                     ; 1CC5 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1CC8 _ 3B. 45, 14
        jge     ?_115                                   ; 1CCB _ 7D, 5A
        mov     eax, dword [ebp+10H]                    ; 1CCD _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1CD0 _ 3B. 45, F8
        jg      ?_115                                   ; 1CD3 _ 7F, 52
        mov     eax, dword [ebp-8H]                     ; 1CD5 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1CD8 _ 3B. 45, 18
        jge     ?_115                                   ; 1CDB _ 7D, 4A
        mov     eax, dword [ebp-10H]                    ; 1CDD _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1CE0 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1CE3 _ 0F AF. 45, E8
        mov     edx, eax                                ; 1CE7 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1CE9 _ 8B. 45, E4
        add     eax, edx                                ; 1CEC _ 01. D0
        mov     edx, eax                                ; 1CEE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1CF0 _ 8B. 45, F4
        add     eax, edx                                ; 1CF3 _ 01. D0
        movzx   eax, byte [eax]                         ; 1CF5 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1CF8 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1CFB _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1CFF _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1D02 _ 8B. 40, 14
        cmp     edx, eax                                ; 1D05 _ 39. C2
        jz      ?_115                                   ; 1D07 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1D09 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1D0C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1D0F _ 0F AF. 45, F8
        mov     edx, eax                                ; 1D13 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1D15 _ 8B. 45, FC
        add     eax, edx                                ; 1D18 _ 01. D0
        mov     edx, eax                                ; 1D1A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1D1C _ 8B. 45, EC
        add     edx, eax                                ; 1D1F _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1D21 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1D25 _ 88. 02
?_115:  add     dword [ebp-1CH], 1                      ; 1D27 _ 83. 45, E4, 01
?_116:  mov     eax, dword [ebp-10H]                    ; 1D2B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1D2E _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 1D31 _ 3B. 45, E4
        jg      ?_114                                   ; 1D34 _ 0F 8F, FFFFFF75
        add     dword [ebp-18H], 1                      ; 1D3A _ 83. 45, E8, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 1D3E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1D41 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 1D44 _ 3B. 45, E8
        jg      ?_113                                   ; 1D47 _ 0F 8F, FFFFFF4B
        add     dword [ebp-20H], 1                      ; 1D4D _ 83. 45, E0, 01
?_118:  mov     eax, dword [ebp+8H]                     ; 1D51 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1D54 _ 8B. 40, 0C
        cmp     eax, dword [ebp-20H]                    ; 1D57 _ 3B. 45, E0
        jge     ?_112                                   ; 1D5A _ 0F 8D, FFFFFF15
        leave                                           ; 1D60 _ C9
        ret                                             ; 1D61 _ C3
; sheet_refresh_local End of function



?_119:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0000 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0008 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0010 _ howing.

?_120:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0017 _ page is:
        db 20H, 00H                                     ; 001F _  .

?_121:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0029 _ L: .

?_122:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002D _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0035 _ H: .

?_123:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0039 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0041 _ w: .

?_124:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0045 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004D _ gh: .

?_125:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0052 _ type: .



table_rgb.1596:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1664:                                            ; byte
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

?_126:  db 00H                                          ; 0142 _ .

?_127:  db 00H, 00H                                     ; 0143 _ ..



screen_info:                                            ; qword
        resb    4                                       ; 0000

?_128:  resw    1                                       ; 0004

?_129:  resw    13                                      ; 0006

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020

back_buf: resd  1                                       ; 0120

mouse_x: resd   1                                       ; 0124

mouse_y: resd   1                                       ; 0128

mouse_send_info:                                        ; oword
        resb    20                                      ; 012C

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

?_130:  resb    9                                       ; 0221

?_131:  resb    1                                       ; 022A


