; Disassembly of file: ckernel.o
; Sun Feb 16 20:38:39 2020
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
        jmp     ?_004                                   ; 021B _ EB, 4A

?_002:  mov     dword [esp], keyinfo                    ; 021D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0224 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0229 _ 85. C0
        jz      ?_003                                   ; 022B _ 74, 16
        call    io_sti                                  ; 022D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0232 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0239 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 023E _ 89. 45, F0
        jmp     ?_004                                   ; 0241 _ EB, 24

?_003:  mov     dword [esp], mouseinfo                  ; 0243 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 024A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 024F _ 85. C0
        jz      ?_004                                   ; 0251 _ 74, 14
        mov     eax, dword [ebp-18H]                    ; 0253 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0256 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 025A _ 8B. 45, EC
        mov     dword [esp], eax                        ; 025D _ 89. 04 24
        call    show_mouse_info                         ; 0260 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0265 _ EB, 8A

?_004:  jmp     ?_001                                   ; 0267 _ EB, 88
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0269 _ 55
        mov     ebp, esp                                ; 026A _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 026C _ A1, 00000000(d)
        mov     edx, eax                                ; 0271 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0273 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0276 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0278 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 027B _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0281 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0284 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 028A _ 5D
        ret                                             ; 028B _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 028C _ 55
        mov     ebp, esp                                ; 028D _ 89. E5
        sub     esp, 24                                 ; 028F _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1579          ; 0292 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 029A _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 02A2 _ C7. 04 24, 00000000
        call    set_palette                             ; 02A9 _ E8, FFFFFFFC(rel)
        nop                                             ; 02AE _ 90
        leave                                           ; 02AF _ C9
        ret                                             ; 02B0 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 02B1 _ 55
        mov     ebp, esp                                ; 02B2 _ 89. E5
        sub     esp, 40                                 ; 02B4 _ 83. EC, 28
        call    io_load_eflags                          ; 02B7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02BC _ 89. 45, F4
        call    io_cli                                  ; 02BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02C4 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 02C7 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 02CB _ C7. 04 24, 000003C8
        call    io_out8                                 ; 02D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02D7 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 02DA _ 89. 45, F0
        jmp     ?_006                                   ; 02DD _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 02DF _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02E2 _ 0F B6. 00
        shr     al, 2                                   ; 02E5 _ C0. E8, 02
        movzx   eax, al                                 ; 02E8 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 02EB _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 02EF _ C7. 04 24, 000003C9
        call    io_out8                                 ; 02F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02FB _ 8B. 45, 10
        add     eax, 1                                  ; 02FE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0301 _ 0F B6. 00
        shr     al, 2                                   ; 0304 _ C0. E8, 02
        movzx   eax, al                                 ; 0307 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 030A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 030E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0315 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 031A _ 8B. 45, 10
        add     eax, 2                                  ; 031D _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0320 _ 0F B6. 00
        shr     al, 2                                   ; 0323 _ C0. E8, 02
        movzx   eax, al                                 ; 0326 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0329 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 032D _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0334 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0339 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 033D _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 0341 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0344 _ 3B. 45, 0C
        jle     ?_005                                   ; 0347 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0349 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 034C _ 89. 04 24
        call    io_store_eflags                         ; 034F _ E8, FFFFFFFC(rel)
        nop                                             ; 0354 _ 90
        leave                                           ; 0355 _ C9
        ret                                             ; 0356 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0357 _ 55
        mov     ebp, esp                                ; 0358 _ 89. E5
        sub     esp, 20                                 ; 035A _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 035D _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0360 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0363 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0366 _ 89. 45, FC
        jmp     ?_010                                   ; 0369 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 036B _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 036E _ 89. 45, F8
        jmp     ?_009                                   ; 0371 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0373 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0376 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 037A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 037C _ 8B. 45, F8
        add     eax, edx                                ; 037F _ 01. D0
        mov     edx, eax                                ; 0381 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0383 _ 8B. 45, 08
        add     edx, eax                                ; 0386 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0388 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 038C _ 88. 02
        add     dword [ebp-8H], 1                       ; 038E _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0392 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0395 _ 3B. 45, 1C
        jle     ?_008                                   ; 0398 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 039A _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 039E _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 03A1 _ 3B. 45, 20
        jle     ?_007                                   ; 03A4 _ 7E, C5
        leave                                           ; 03A6 _ C9
        ret                                             ; 03A7 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 03A8 _ 55
        mov     ebp, esp                                ; 03A9 _ 89. E5
        push    ebx                                     ; 03AB _ 53
        sub     esp, 28                                 ; 03AC _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 03AF _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 03B2 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 03B5 _ 8B. 45, 0C
        sub     eax, 1                                  ; 03B8 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 03BB _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 03BF _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 03C3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 03CB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 03D3 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03DB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03DE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03E2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03E5 _ 89. 04 24
        call    paint_rectangle                         ; 03E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03ED _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 03F0 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 03F3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03F6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03F9 _ 8B. 45, 10
        sub     eax, 28                                 ; 03FC _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 03FF _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0403 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0407 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 040B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0413 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 041B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 041E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0422 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0425 _ 89. 04 24
        call    paint_rectangle                         ; 0428 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 042D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0430 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0433 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0436 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0439 _ 8B. 45, 10
        sub     eax, 27                                 ; 043C _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 043F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0443 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0447 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 044B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0453 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 045B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 045E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0462 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0465 _ 89. 04 24
        call    paint_rectangle                         ; 0468 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 046D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0470 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0473 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0476 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0479 _ 8B. 45, 10
        sub     eax, 26                                 ; 047C _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 047F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0483 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0487 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 048B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0493 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 049B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 049E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04A5 _ 89. 04 24
        call    paint_rectangle                         ; 04A8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04AD _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B0 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04B3 _ 8B. 45, 10
        sub     eax, 24                                 ; 04B6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04B9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04BD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04C5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04C9 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 04D1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04D9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04DC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04E3 _ 89. 04 24
        call    paint_rectangle                         ; 04E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04EB _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04EE _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04F1 _ 8B. 45, 10
        sub     eax, 24                                 ; 04F4 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04F7 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 04FB _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0503 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0507 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 050F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0517 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 051A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 051E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0521 _ 89. 04 24
        call    paint_rectangle                         ; 0524 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0529 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 052C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 052F _ 8B. 45, 10
        sub     eax, 4                                  ; 0532 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0535 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0539 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0541 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0545 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 054D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0555 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0558 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 055C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 055F _ 89. 04 24
        call    paint_rectangle                         ; 0562 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0567 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 056A _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 056D _ 8B. 45, 10
        sub     eax, 23                                 ; 0570 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0573 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0577 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 057F _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0583 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 058B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0593 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0596 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 059A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 059D _ 89. 04 24
        call    paint_rectangle                         ; 05A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05A5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05A8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05AB _ 8B. 45, 10
        sub     eax, 3                                  ; 05AE _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 05B1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 05B5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 05BD _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 05C1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 05C9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05D1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05DB _ 89. 04 24
        call    paint_rectangle                         ; 05DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05E3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05E6 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05E9 _ 8B. 45, 10
        sub     eax, 24                                 ; 05EC _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 05EF _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 05F3 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 05FB _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 05FF _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0607 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 060F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0612 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0616 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0619 _ 89. 04 24
        call    paint_rectangle                         ; 061C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0621 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0624 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0627 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 062A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 062D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0630 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0633 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0636 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0639 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 063D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0641 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0645 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0649 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0651 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0654 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0658 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 065B _ 89. 04 24
        call    paint_rectangle                         ; 065E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0663 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0666 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0669 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 066C _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 066F _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0672 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0675 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0678 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 067B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 067F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0683 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0687 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 068B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0693 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0696 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 069A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 069D _ 89. 04 24
        call    paint_rectangle                         ; 06A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06A5 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06A8 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06AB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 06AE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 06B1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 06B4 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 06B7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 06BA _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 06BD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06C1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06C5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06C9 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06CD _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06D5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06DF _ 89. 04 24
        call    paint_rectangle                         ; 06E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06E7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06EA _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06ED _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 06F0 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 06F3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06F6 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 06F9 _ 8B. 45, 0C
        sub     eax, 3                                  ; 06FC _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 06FF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0703 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0707 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 070B _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 070F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0717 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 071A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 071E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0721 _ 89. 04 24
        call    paint_rectangle                         ; 0724 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0729 _ 83. C4, 1C
        pop     ebx                                     ; 072C _ 5B
        pop     ebp                                     ; 072D _ 5D
        ret                                             ; 072E _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 072F _ 55
        mov     ebp, esp                                ; 0730 _ 89. E5
        sub     esp, 16                                 ; 0732 _ 83. EC, 10
        movzx   eax, word [?_127]                       ; 0735 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 073C _ 98
        mov     dword [ebp-8H], eax                     ; 073D _ 89. 45, F8
        movzx   eax, word [?_128]                       ; 0740 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0747 _ 98
        mov     dword [ebp-4H], eax                     ; 0748 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 074B _ 8B. 45, F8
        sub     eax, 16                                 ; 074E _ 83. E8, 10
        mov     edx, eax                                ; 0751 _ 89. C2
        shr     edx, 31                                 ; 0753 _ C1. EA, 1F
        add     eax, edx                                ; 0756 _ 01. D0
        sar     eax, 1                                  ; 0758 _ D1. F8
        mov     dword [mouse_x], eax                    ; 075A _ A3, 00000124(d)
        mov     eax, dword [ebp-4H]                     ; 075F _ 8B. 45, FC
        sub     eax, 44                                 ; 0762 _ 83. E8, 2C
        mov     edx, eax                                ; 0765 _ 89. C2
        shr     edx, 31                                 ; 0767 _ C1. EA, 1F
        add     eax, edx                                ; 076A _ 01. D0
        sar     eax, 1                                  ; 076C _ D1. F8
        mov     dword [mouse_y], eax                    ; 076E _ A3, 00000128(d)
        leave                                           ; 0773 _ C9
        ret                                             ; 0774 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0775 _ 55
        mov     ebp, esp                                ; 0776 _ 89. E5
        sub     esp, 20                                 ; 0778 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 077B _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 077E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0781 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 0788 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 078D _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0790 _ 8B. 45, 18
        add     eax, edx                                ; 0793 _ 01. D0
        movzx   eax, byte [eax]                         ; 0795 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0798 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 079B _ 0F B6. 45, FB
        test    al, al                                  ; 079F _ 84. C0
        jns     ?_012                                   ; 07A1 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07A3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07A6 _ 8B. 55, 14
        add     eax, edx                                ; 07A9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07AB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07AF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07B1 _ 8B. 45, 10
        add     eax, edx                                ; 07B4 _ 01. D0
        mov     edx, eax                                ; 07B6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07B8 _ 8B. 45, 08
        add     edx, eax                                ; 07BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07C1 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 07C3 _ 0F B6. 45, FB
        and     eax, 40H                                ; 07C7 _ 83. E0, 40
        test    eax, eax                                ; 07CA _ 85. C0
        jz      ?_013                                   ; 07CC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07CE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07D1 _ 8B. 55, 14
        add     eax, edx                                ; 07D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07DC _ 8B. 45, 10
        add     eax, edx                                ; 07DF _ 01. D0
        lea     edx, [eax+1H]                           ; 07E1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 07E4 _ 8B. 45, 08
        add     edx, eax                                ; 07E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07ED _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 07EF _ 0F B6. 45, FB
        and     eax, 20H                                ; 07F3 _ 83. E0, 20
        test    eax, eax                                ; 07F6 _ 85. C0
        jz      ?_014                                   ; 07F8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07FA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07FD _ 8B. 55, 14
        add     eax, edx                                ; 0800 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0802 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0806 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0808 _ 8B. 45, 10
        add     eax, edx                                ; 080B _ 01. D0
        lea     edx, [eax+2H]                           ; 080D _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0810 _ 8B. 45, 08
        add     edx, eax                                ; 0813 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0815 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0819 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 081B _ 0F B6. 45, FB
        and     eax, 10H                                ; 081F _ 83. E0, 10
        test    eax, eax                                ; 0822 _ 85. C0
        jz      ?_015                                   ; 0824 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0826 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0829 _ 8B. 55, 14
        add     eax, edx                                ; 082C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 082E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0832 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0834 _ 8B. 45, 10
        add     eax, edx                                ; 0837 _ 01. D0
        lea     edx, [eax+3H]                           ; 0839 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 083C _ 8B. 45, 08
        add     edx, eax                                ; 083F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0841 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0845 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0847 _ 0F B6. 45, FB
        and     eax, 08H                                ; 084B _ 83. E0, 08
        test    eax, eax                                ; 084E _ 85. C0
        jz      ?_016                                   ; 0850 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0852 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0855 _ 8B. 55, 14
        add     eax, edx                                ; 0858 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 085A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 085E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0860 _ 8B. 45, 10
        add     eax, edx                                ; 0863 _ 01. D0
        lea     edx, [eax+4H]                           ; 0865 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0868 _ 8B. 45, 08
        add     edx, eax                                ; 086B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 086D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0871 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 0873 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0877 _ 83. E0, 04
        test    eax, eax                                ; 087A _ 85. C0
        jz      ?_017                                   ; 087C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 087E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0881 _ 8B. 55, 14
        add     eax, edx                                ; 0884 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0886 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 088A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 088C _ 8B. 45, 10
        add     eax, edx                                ; 088F _ 01. D0
        lea     edx, [eax+5H]                           ; 0891 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0894 _ 8B. 45, 08
        add     edx, eax                                ; 0897 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0899 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 089D _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 089F _ 0F B6. 45, FB
        and     eax, 02H                                ; 08A3 _ 83. E0, 02
        test    eax, eax                                ; 08A6 _ 85. C0
        jz      ?_018                                   ; 08A8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08AA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08AD _ 8B. 55, 14
        add     eax, edx                                ; 08B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08B8 _ 8B. 45, 10
        add     eax, edx                                ; 08BB _ 01. D0
        lea     edx, [eax+6H]                           ; 08BD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08C0 _ 8B. 45, 08
        add     edx, eax                                ; 08C3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08C5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08C9 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 08CB _ 0F B6. 45, FB
        and     eax, 01H                                ; 08CF _ 83. E0, 01
        test    eax, eax                                ; 08D2 _ 85. C0
        jz      ?_019                                   ; 08D4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08D6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08D9 _ 8B. 55, 14
        add     eax, edx                                ; 08DC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08DE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08E4 _ 8B. 45, 10
        add     eax, edx                                ; 08E7 _ 01. D0
        lea     edx, [eax+7H]                           ; 08E9 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 08EC _ 8B. 45, 08
        add     edx, eax                                ; 08EF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08F5 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 08F7 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 08FB _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 08FF _ 0F 8E, FFFFFE88
        leave                                           ; 0905 _ C9
        ret                                             ; 0906 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0907 _ 55
        mov     ebp, esp                                ; 0908 _ 89. E5
        sub     esp, 28                                 ; 090A _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 090D _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 0910 _ 88. 45, FC
        jmp     ?_022                                   ; 0913 _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 0915 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0919 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 091C _ 0F B6. 12
        movsx   edx, dl                                 ; 091F _ 0F BE. D2
        shl     edx, 4                                  ; 0922 _ C1. E2, 04
        add     edx, systemFont                         ; 0925 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 092B _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 092F _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 0933 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0936 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 093A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 093D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0941 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0944 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0948 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 094B _ 89. 04 24
        call    paint_font                              ; 094E _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0953 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0957 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 095B _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 095E _ 0F B6. 00
        test    al, al                                  ; 0961 _ 84. C0
        jnz     ?_021                                   ; 0963 _ 75, B0
        leave                                           ; 0965 _ C9
        ret                                             ; 0966 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0967 _ 55
        mov     ebp, esp                                ; 0968 _ 89. E5
        sub     esp, 20                                 ; 096A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 096D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0970 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0973 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 097A _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 097F _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0986 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 098B _ 8B. 45, F8
        shl     eax, 4                                  ; 098E _ C1. E0, 04
        mov     edx, eax                                ; 0991 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0993 _ 8B. 45, FC
        add     eax, edx                                ; 0996 _ 01. D0
        add     eax, cursor.1646                        ; 0998 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 099D _ 0F B6. 00
        cmp     al, 42                                  ; 09A0 _ 3C, 2A
        jnz     ?_025                                   ; 09A2 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09A4 _ 8B. 45, F8
        shl     eax, 4                                  ; 09A7 _ C1. E0, 04
        mov     edx, eax                                ; 09AA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09AC _ 8B. 45, FC
        add     eax, edx                                ; 09AF _ 01. D0
        mov     edx, eax                                ; 09B1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09B3 _ 8B. 45, 08
        add     eax, edx                                ; 09B6 _ 01. D0
        mov     byte [eax], 0                           ; 09B8 _ C6. 00, 00
        jmp     ?_027                                   ; 09BB _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 09BD _ 8B. 45, F8
        shl     eax, 4                                  ; 09C0 _ C1. E0, 04
        mov     edx, eax                                ; 09C3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09C5 _ 8B. 45, FC
        add     eax, edx                                ; 09C8 _ 01. D0
        add     eax, cursor.1646                        ; 09CA _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 09CF _ 0F B6. 00
        cmp     al, 79                                  ; 09D2 _ 3C, 4F
        jnz     ?_026                                   ; 09D4 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09D6 _ 8B. 45, F8
        shl     eax, 4                                  ; 09D9 _ C1. E0, 04
        mov     edx, eax                                ; 09DC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09DE _ 8B. 45, FC
        add     eax, edx                                ; 09E1 _ 01. D0
        mov     edx, eax                                ; 09E3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09E5 _ 8B. 45, 08
        add     eax, edx                                ; 09E8 _ 01. D0
        mov     byte [eax], 7                           ; 09EA _ C6. 00, 07
        jmp     ?_027                                   ; 09ED _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 09EF _ 8B. 45, F8
        shl     eax, 4                                  ; 09F2 _ C1. E0, 04
        mov     edx, eax                                ; 09F5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F7 _ 8B. 45, FC
        add     eax, edx                                ; 09FA _ 01. D0
        mov     edx, eax                                ; 09FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09FE _ 8B. 45, 08
        add     edx, eax                                ; 0A01 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A03 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A07 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0A09 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0A0D _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0A11 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0A17 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0A1B _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0A1F _ 0F 8E, FFFFFF5A
        leave                                           ; 0A25 _ C9
        ret                                             ; 0A26 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0A27 _ 55
        mov     ebp, esp                                ; 0A28 _ 89. E5
        sub     esp, 16                                 ; 0A2A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A2D _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A34 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0A36 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0A3D _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0A3F _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0A42 _ 8B. 55, 14
        add     eax, edx                                ; 0A45 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A47 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0A4B _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0A4E _ 8B. 4D, 10
        add     edx, ecx                                ; 0A51 _ 01. CA
        add     eax, edx                                ; 0A53 _ 01. D0
        mov     edx, eax                                ; 0A55 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A57 _ 8B. 45, 08
        add     edx, eax                                ; 0A5A _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0A5C _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0A5F _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0A63 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0A65 _ 8B. 45, FC
        add     eax, ecx                                ; 0A68 _ 01. C8
        mov     ecx, eax                                ; 0A6A _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0A6C _ 8B. 45, 20
        add     eax, ecx                                ; 0A6F _ 01. C8
        movzx   eax, byte [eax]                         ; 0A71 _ 0F B6. 00
        mov     byte [edx], al                          ; 0A74 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0A76 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0A7A _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0A7D _ 3B. 45, 18
        jl      ?_031                                   ; 0A80 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0A82 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0A86 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0A89 _ 3B. 45, 1C
        jl      ?_030                                   ; 0A8C _ 7C, A8
        leave                                           ; 0A8E _ C9
        ret                                             ; 0A8F _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0A90 _ 55
        mov     ebp, esp                                ; 0A91 _ 89. E5
        sub     esp, 24                                 ; 0A93 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0A96 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0A9E _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0AA6 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0AAD _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0AB2 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0ABA _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0AC2 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0AC9 _ E8, FFFFFFFC(rel)
        leave                                           ; 0ACE _ C9
        ret                                             ; 0ACF _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0AD0 _ 55
        mov     ebp, esp                                ; 0AD1 _ 89. E5
        sub     esp, 28                                 ; 0AD3 _ 83. EC, 1C
        mov     eax, dword [ebp+8H]                     ; 0AD6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AD9 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0ADC _ A1, 00000124(d)
        add     eax, edx                                ; 0AE1 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0AE3 _ A3, 00000124(d)
        mov     eax, dword [ebp+8H]                     ; 0AE8 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0AEB _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0AEE _ A1, 00000128(d)
        add     eax, edx                                ; 0AF3 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0AF5 _ A3, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0AFA _ A1, 00000124(d)
        test    eax, eax                                ; 0AFF _ 85. C0
        jns     ?_034                                   ; 0B01 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0B03 _ C7. 05, 00000124(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0B0D _ A1, 00000128(d)
        test    eax, eax                                ; 0B12 _ 85. C0
        jns     ?_035                                   ; 0B14 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0B16 _ C7. 05, 00000128(d), 00000000
?_035:  movzx   eax, word [?_127]                       ; 0B20 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B27 _ 98
        lea     edx, [eax-10H]                          ; 0B28 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0B2B _ A1, 00000124(d)
        cmp     edx, eax                                ; 0B30 _ 39. C2
        jge     ?_036                                   ; 0B32 _ 7D, 10
        movzx   eax, word [?_127]                       ; 0B34 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B3B _ 98
        sub     eax, 16                                 ; 0B3C _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0B3F _ A3, 00000124(d)
?_036:  movzx   eax, word [?_127]                       ; 0B44 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B4B _ 98
        lea     edx, [eax-10H]                          ; 0B4C _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0B4F _ A1, 00000128(d)
        cmp     edx, eax                                ; 0B54 _ 39. C2
        jge     ?_037                                   ; 0B56 _ 7D, 10
        movzx   eax, word [?_127]                       ; 0B58 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B5F _ 98
        sub     eax, 16                                 ; 0B60 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0B63 _ A3, 00000128(d)
?_037:  movzx   eax, word [?_127]                       ; 0B68 _ 0F B7. 05, 00000004(d)
        movsx   edx, ax                                 ; 0B6F _ 0F BF. D0
        mov     eax, dword [back_buf]                   ; 0B72 _ A1, 00000120(d)
        mov     dword [esp+18H], 15                     ; 0B77 _ C7. 44 24, 18, 0000000F
        mov     dword [esp+14H], 79                     ; 0B7F _ C7. 44 24, 14, 0000004F
        mov     dword [esp+10H], 0                      ; 0B87 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0B8F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0B97 _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], edx                     ; 0B9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BA3 _ 89. 04 24
        call    paint_rectangle                         ; 0BA6 _ E8, FFFFFFFC(rel)
        movzx   eax, word [?_127]                       ; 0BAB _ 0F B7. 05, 00000004(d)
        movsx   edx, ax                                 ; 0BB2 _ 0F BF. D0
        mov     eax, dword [back_buf]                   ; 0BB5 _ A1, 00000120(d)
        mov     dword [esp+14H], 7                      ; 0BBA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_118                  ; 0BC2 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 0BCA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0BD2 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0BDA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BDE _ 89. 04 24
        call    paint_string                            ; 0BE1 _ E8, FFFFFFFC(rel)
        leave                                           ; 0BE6 _ C9
        ret                                             ; 0BE7 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0BE8 _ 55
        mov     ebp, esp                                ; 0BE9 _ 89. E5
        sub     esp, 40                                 ; 0BEB _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0BEE _ C6. 45, F7, 00
        call    io_sti                                  ; 0BF2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0BF7 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0BFE _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0C03 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C06 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0C0A _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0C0E _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0C15 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0C1A _ 85. C0
        jz      ?_038                                   ; 0C1C _ 74, 31
        mov     dword [esp], mouse_send_info            ; 0C1E _ C7. 04 24, 00000000(d)
        call    compute_mouse_position                  ; 0C25 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0C2A _ 8B. 15, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0C30 _ A1, 00000124(d)
        mov     dword [esp+0CH], edx                    ; 0C35 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0C39 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0C3D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C40 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C44 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C47 _ 89. 04 24
        call    sheet_slide                             ; 0C4A _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0C4F _ C9
        ret                                             ; 0C50 _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C51 _ 55
        mov     ebp, esp                                ; 0C52 _ 89. E5
        sub     esp, 24                                 ; 0C54 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0C57 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0C5E _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0C63 _ 83. E0, 02
        test    eax, eax                                ; 0C66 _ 85. C0
        jnz     ?_040                                   ; 0C68 _ 75, 02
        jmp     ?_041                                   ; 0C6A _ EB, 02

?_040:  jmp     ?_039                                   ; 0C6C _ EB, E9

?_041:  leave                                           ; 0C6E _ C9
        ret                                             ; 0C6F _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C70 _ 55
        mov     ebp, esp                                ; 0C71 _ 89. E5
        sub     esp, 24                                 ; 0C73 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C76 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0C7B _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0C83 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C8A _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C8F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0C94 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0C9C _ C7. 04 24, 00000060
        call    io_out8                                 ; 0CA3 _ E8, FFFFFFFC(rel)
        leave                                           ; 0CA8 _ C9
        ret                                             ; 0CA9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CAA _ 55
        mov     ebp, esp                                ; 0CAB _ 89. E5
        sub     esp, 24                                 ; 0CAD _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0CB0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0CB5 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0CBD _ C7. 04 24, 00000064
        call    io_out8                                 ; 0CC4 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0CC9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0CCE _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0CD6 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0CDD _ E8, FFFFFFFC(rel)
        leave                                           ; 0CE2 _ C9
        ret                                             ; 0CE3 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0CE4 _ 55
        mov     ebp, esp                                ; 0CE5 _ 89. E5
        sub     esp, 4                                  ; 0CE7 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CEA _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CED _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CF0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CF3 _ 0F B6. 40, 03
        test    al, al                                  ; 0CF7 _ 84. C0
        jnz     ?_043                                   ; 0CF9 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0CFB _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0CFF _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0D01 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D04 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0D08 _ B8, 00000000
        jmp     ?_050                                   ; 0D0D _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0D12 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D15 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0D19 _ 3C, 01
        jnz     ?_045                                   ; 0D1B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0D1D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D21 _ 25, 000000C8
        cmp     eax, 8                                  ; 0D26 _ 83. F8, 08
        jnz     ?_044                                   ; 0D29 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0D2B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D2E _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0D32 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D34 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D37 _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0D3B _ B8, 00000000
        jmp     ?_050                                   ; 0D40 _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0D45 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D48 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0D4C _ 3C, 02
        jnz     ?_046                                   ; 0D4E _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0D50 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D53 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0D57 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D5A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D5D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D61 _ B8, 00000000
        jmp     ?_050                                   ; 0D66 _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0D6B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D6E _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0D72 _ 3C, 03
        jne     ?_049                                   ; 0D74 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0D7A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D7D _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0D81 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0D84 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D87 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D8E _ 0F B6. 00
        movzx   eax, al                                 ; 0D91 _ 0F B6. C0
        and     eax, 07H                                ; 0D94 _ 83. E0, 07
        mov     edx, eax                                ; 0D97 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D99 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0D9C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D9F _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0DA2 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0DA6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DA9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DAC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DAF _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0DB2 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0DB6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DB9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DBC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DBF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DC2 _ 0F B6. 00
        movzx   eax, al                                 ; 0DC5 _ 0F B6. C0
        and     eax, 10H                                ; 0DC8 _ 83. E0, 10
        test    eax, eax                                ; 0DCB _ 85. C0
        jz      ?_047                                   ; 0DCD _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DCF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DD2 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0DD5 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DDA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DDC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DDF _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0DE2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DE5 _ 0F B6. 00
        movzx   eax, al                                 ; 0DE8 _ 0F B6. C0
        and     eax, 20H                                ; 0DEB _ 83. E0, 20
        test    eax, eax                                ; 0DEE _ 85. C0
        jz      ?_048                                   ; 0DF0 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DF2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DF5 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0DF8 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DFD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DFF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E02 _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0E05 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E08 _ 8B. 40, 08
        neg     eax                                     ; 0E0B _ F7. D8
        mov     edx, eax                                ; 0E0D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E0F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E12 _ 89. 50, 08
        mov     eax, 1                                  ; 0E15 _ B8, 00000001
        jmp     ?_050                                   ; 0E1A _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0E1C _ B8, FFFFFFFF
?_050:  leave                                           ; 0E21 _ C9
        ret                                             ; 0E22 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0E23 _ 55
        mov     ebp, esp                                ; 0E24 _ 89. E5
        sub     esp, 40                                 ; 0E26 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0E29 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0E31 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0E38 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0E3D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0E45 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0E4C _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0E51 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0E58 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0E5D _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E60 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0E64 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0E68 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0E6F _ E8, FFFFFFFC(rel)
        leave                                           ; 0E74 _ C9
        ret                                             ; 0E75 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0E76 _ 55
        mov     ebp, esp                                ; 0E77 _ 89. E5
        sub     esp, 40                                 ; 0E79 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0E7C _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0E84 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0E8B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0E90 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0E98 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0E9F _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0EA4 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0EAB _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0EB0 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0EB3 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0EB7 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0EBB _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0EC2 _ E8, FFFFFFFC(rel)
        leave                                           ; 0EC7 _ C9
        ret                                             ; 0EC8 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0EC9 _ 55
        mov     ebp, esp                                ; 0ECA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0ECC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0ECF _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0ED2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0ED7 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0EDE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0EE1 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0EE8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0EEB _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0EEE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0EF1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0EF4 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0EF7 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0EFA _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0EFD _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0F04 _ 5D
        ret                                             ; 0F05 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0F06 _ 55
        mov     ebp, esp                                ; 0F07 _ 89. E5
        sub     esp, 20                                 ; 0F09 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0F0C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0F0F _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0F12 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F15 _ 8B. 40, 10
        test    eax, eax                                ; 0F18 _ 85. C0
        jnz     ?_051                                   ; 0F1A _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0F1C _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0F1F _ 8B. 40, 14
        or      eax, 01H                                ; 0F22 _ 83. C8, 01
        mov     edx, eax                                ; 0F25 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F27 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0F2A _ 89. 50, 14
        mov     eax, 4294967295                         ; 0F2D _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0F32 _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 0F34 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F37 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0F3A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F3D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0F40 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0F42 _ 8B. 45, FC
        add     edx, eax                                ; 0F45 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F47 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F4B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0F4D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F50 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0F53 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F56 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F59 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F5C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0F5F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F62 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F65 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F68 _ 39. C2
        jnz     ?_052                                   ; 0F6A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0F6C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0F6F _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0F76 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F79 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0F7C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0F7F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F82 _ 89. 50, 10
        mov     eax, 0                                  ; 0F85 _ B8, 00000000
?_053:  leave                                           ; 0F8A _ C9
        ret                                             ; 0F8B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0F8C _ 55
        mov     ebp, esp                                ; 0F8D _ 89. E5
        sub     esp, 16                                 ; 0F8F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0F92 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0F95 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F98 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F9B _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F9E _ 39. C2
        jnz     ?_054                                   ; 0FA0 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0FA2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0FA5 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0FAC _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0FB1 _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 0FB3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FB6 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0FB9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0FBC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0FBF _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0FC1 _ 8B. 45, F8
        add     eax, edx                                ; 0FC4 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FC6 _ 0F B6. 00
        movzx   eax, al                                 ; 0FC9 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0FCC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0FCF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FD2 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0FD5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FD8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FDB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0FDE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0FE1 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0FE4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FE7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0FEA _ 39. C2
        jnz     ?_055                                   ; 0FEC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0FEE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0FF1 _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 0FF8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0FFB _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0FFE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1001 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1004 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1007 _ 8B. 45, FC
?_056:  leave                                           ; 100A _ C9
        ret                                             ; 100B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 100C _ 55
        mov     ebp, esp                                ; 100D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 100F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1012 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1015 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1018 _ 8B. 40, 10
        sub     edx, eax                                ; 101B _ 29. C2
        mov     eax, edx                                ; 101D _ 89. D0
        pop     ebp                                     ; 101F _ 5D
        ret                                             ; 1020 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1021 _ 55
        mov     ebp, esp                                ; 1022 _ 89. E5
        sub     esp, 4                                  ; 1024 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1027 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 102A _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 102D _ 80. 7D, FC, 09
        jle     ?_057                                   ; 1031 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1033 _ 0F B6. 45, FC
        add     eax, 55                                 ; 1037 _ 83. C0, 37
        jmp     ?_058                                   ; 103A _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 103C _ 0F B6. 45, FC
        add     eax, 48                                 ; 1040 _ 83. C0, 30
?_058:  leave                                           ; 1043 _ C9
        ret                                             ; 1044 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1045 _ 55
        mov     ebp, esp                                ; 1046 _ 89. E5
        sub     esp, 24                                 ; 1048 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 104B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 104E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1051 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1058 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 105C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 105F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1062 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1066 _ 89. 04 24
        call    charToHexVal                            ; 1069 _ E8, FFFFFFFC(rel)
        mov     byte [?_126], al                        ; 106E _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 1073 _ 0F B6. 45, EC
        shr     al, 4                                   ; 1077 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 107A _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 107D _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1081 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1084 _ 89. 04 24
        call    charToHexVal                            ; 1087 _ E8, FFFFFFFC(rel)
        mov     byte [?_125], al                        ; 108C _ A2, 00000142(d)
        mov     eax, keyval                             ; 1091 _ B8, 00000140(d)
        leave                                           ; 1096 _ C9
        ret                                             ; 1097 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1098 _ 55
        mov     ebp, esp                                ; 1099 _ 89. E5
        sub     esp, 16                                 ; 109B _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 109E _ C6. 05, 00000220(d), 30
        mov     byte [?_129], 88                        ; 10A5 _ C6. 05, 00000221(d), 58
        mov     byte [?_130], 0                         ; 10AC _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 10B3 _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 10BA _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 10BC _ 8B. 45, F4
        add     eax, str.1386                           ; 10BF _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 10C4 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 10C7 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 10CB _ 83. 7D, F4, 09
        jle     ?_059                                   ; 10CF _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 10D1 _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 10D8 _ EB, 40

?_061:  mov     eax, dword [ebp+8H]                     ; 10DA _ 8B. 45, 08
        and     eax, 0FH                                ; 10DD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 10E0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 10E3 _ 8B. 45, 08
        shr     eax, 4                                  ; 10E6 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 10E9 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 10EC _ 83. 7D, FC, 09
        jle     ?_062                                   ; 10F0 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 10F2 _ 8B. 45, FC
        add     eax, 55                                 ; 10F5 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 10F8 _ 8B. 55, F8
        add     edx, str.1386                           ; 10FB _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1101 _ 88. 02
        jmp     ?_063                                   ; 1103 _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 1105 _ 8B. 45, FC
        add     eax, 48                                 ; 1108 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 110B _ 8B. 55, F8
        add     edx, str.1386                           ; 110E _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1114 _ 88. 02
?_063:  sub     dword [ebp-8H], 1                       ; 1116 _ 83. 6D, F8, 01
?_064:  cmp     dword [ebp-8H], 1                       ; 111A _ 83. 7D, F8, 01
        jle     ?_065                                   ; 111E _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1120 _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 1124 _ 75, B4
?_065:  mov     eax, str.1386                           ; 1126 _ B8, 00000220(d)
        leave                                           ; 112B _ C9
        ret                                             ; 112C _ C3
; intToHexStr End of function

show_memory_info:; Function begin
        push    ebp                                     ; 112D _ 55
        mov     ebp, esp                                ; 112E _ 89. E5
        sub     esp, 88                                 ; 1130 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1133 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 113A _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1141 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1148 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 114D _ 89. 45, D4
        movzx   eax, word [screen_info+4H]              ; 1150 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 1157 _ 98
        mov     dword [ebp-28H], eax                    ; 1158 _ 89. 45, D8
        movzx   eax, word [screen_info+6H]              ; 115B _ 0F B7. 05, 00000006(d)
        cwde                                            ; 1162 _ 98
        mov     dword [ebp-24H], eax                    ; 1163 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 1166 _ 8B. 45, DC
        mov     dword [esp+8H], eax                     ; 1169 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 116D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1170 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1174 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1177 _ 89. 04 24
        call    init_desktop                            ; 117A _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 117F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_119                  ; 1187 _ C7. 44 24, 10, 0000000B(d)
        mov     eax, dword [ebp-34H]                    ; 118F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1192 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1196 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1199 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 119D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11A0 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 11A4 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 11A7 _ 89. 04 24
        call    paint_string                            ; 11AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 11AF _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 11B2 _ 89. 04 24
        call    intToHexStr                             ; 11B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 11BA _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 11BD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 11C5 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 11C8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11CC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11CF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11D3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11D6 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11DA _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11DD _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 11E1 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 11E4 _ 89. 04 24
        call    paint_string                            ; 11E7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11EC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11F0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_120                  ; 11F8 _ C7. 44 24, 10, 00000015(d)
        mov     eax, dword [ebp-34H]                    ; 1200 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1203 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1207 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 120A _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 120E _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1211 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1215 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1218 _ 89. 04 24
        call    paint_string                            ; 121B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1220 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1223 _ 8B. 00
        mov     dword [esp], eax                        ; 1225 _ 89. 04 24
        call    intToHexStr                             ; 1228 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 122D _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1230 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1238 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 123B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 123F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1242 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1246 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1249 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 124D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1250 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1254 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1257 _ 89. 04 24
        call    paint_string                            ; 125A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 125F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1263 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_121                  ; 126B _ C7. 44 24, 10, 00000021(d)
        mov     eax, dword [ebp-34H]                    ; 1273 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1276 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 127A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 127D _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1281 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1284 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1288 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 128B _ 89. 04 24
        call    paint_string                            ; 128E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1293 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1296 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1299 _ 89. 04 24
        call    intToHexStr                             ; 129C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 12A1 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 12A4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 12AC _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 12AF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12B3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12BA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12BD _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12C1 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12C4 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12C8 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12CB _ 89. 04 24
        call    paint_string                            ; 12CE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12D3 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_122                  ; 12DF _ C7. 44 24, 10, 0000002D(d)
        mov     eax, dword [ebp-34H]                    ; 12E7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12EE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12F1 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12F5 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12F8 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12FC _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12FF _ 89. 04 24
        call    paint_string                            ; 1302 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1307 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 130A _ 8B. 40, 08
        mov     dword [esp], eax                        ; 130D _ 89. 04 24
        call    intToHexStr                             ; 1310 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1315 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1318 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1320 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1323 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1327 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 132A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 132E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1331 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1335 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1338 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 133C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 133F _ 89. 04 24
        call    paint_string                            ; 1342 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1347 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 134B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_123                  ; 1353 _ C7. 44 24, 10, 00000039(d)
        mov     eax, dword [ebp-34H]                    ; 135B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 135E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1362 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1365 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1369 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 136C _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1370 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1373 _ 89. 04 24
        call    paint_string                            ; 1376 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 137B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 137E _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1381 _ 89. 04 24
        call    intToHexStr                             ; 1384 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1389 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 138C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1394 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1397 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 139B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 139E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13A2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13A5 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 13A9 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 13AC _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 13B0 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 13B3 _ 89. 04 24
        call    paint_string                            ; 13B6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13BB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 13BF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_124                  ; 13C7 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 13CF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13D6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13D9 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 13DD _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 13E0 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 13E4 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 13E7 _ 89. 04 24
        call    paint_string                            ; 13EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 13EF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 13F2 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 13F5 _ 89. 04 24
        call    intToHexStr                             ; 13F8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 13FD _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1400 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1408 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 140B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 140F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1412 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1416 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1419 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 141D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1420 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1424 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1427 _ 89. 04 24
        call    paint_string                            ; 142A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 142F _ 83. 45, CC, 10
        leave                                           ; 1433 _ C9
        ret                                             ; 1434 _ C3
; show_memory_info End of function

memman_init:; Function begin
        push    ebp                                     ; 1435 _ 55
        mov     ebp, esp                                ; 1436 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1438 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 143B _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1441 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1444 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 144B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 144E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1455 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1458 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 145F _ 5D
        ret                                             ; 1460 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1461 _ 55
        mov     ebp, esp                                ; 1462 _ 89. E5
        sub     esp, 16                                 ; 1464 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1467 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 146E _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1475 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 1477 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 147A _ 8B. 55, F8
        add     edx, 2                                  ; 147D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1480 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1484 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1487 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 148B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 148E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1490 _ 3B. 45, F8
        ja      ?_066                                   ; 1493 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1495 _ 8B. 45, FC
        leave                                           ; 1498 _ C9
        ret                                             ; 1499 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 149A _ 55
        mov     ebp, esp                                ; 149B _ 89. E5
        sub     esp, 16                                 ; 149D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 14A0 _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 14A7 _ E9, 00000085

?_068:  mov     eax, dword [ebp+8H]                     ; 14AC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14AF _ 8B. 55, F8
        add     edx, 2                                  ; 14B2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14B5 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 14B9 _ 3B. 45, 0C
        jc      ?_070                                   ; 14BC _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 14BE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14C1 _ 8B. 55, F8
        add     edx, 2                                  ; 14C4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 14C7 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 14CA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14CD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14D0 _ 8B. 55, F8
        add     edx, 2                                  ; 14D3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 14D6 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 14D9 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 14DC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 14DF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14E2 _ 8B. 55, F8
        add     edx, 2                                  ; 14E5 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 14E8 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14EE _ 8B. 55, F8
        add     edx, 2                                  ; 14F1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14F4 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 14F8 _ 2B. 45, 0C
        mov     edx, eax                                ; 14FB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 14FD _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1500 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1503 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1506 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 150A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 150D _ 8B. 55, F8
        add     edx, 2                                  ; 1510 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1513 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1517 _ 85. C0
        jnz     ?_069                                   ; 1519 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 151B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 151E _ 8B. 00
        lea     edx, [eax-1H]                           ; 1520 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1523 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1526 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 1528 _ 8B. 45, FC
        jmp     ?_072                                   ; 152B _ EB, 17

?_070:  add     dword [ebp-8H], 1                       ; 152D _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 1531 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1534 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1536 _ 3B. 45, F8
        ja      ?_068                                   ; 1539 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 153F _ B8, 00000000
?_072:  leave                                           ; 1544 _ C9
        ret                                             ; 1545 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1546 _ 55
        mov     ebp, esp                                ; 1547 _ 89. E5
        push    ebx                                     ; 1549 _ 53
        sub     esp, 16                                 ; 154A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 154D _ C7. 45, F4, 00000000
        jmp     ?_075                                   ; 1554 _ EB, 17

?_073:  mov     eax, dword [ebp+8H]                     ; 1556 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1559 _ 8B. 55, F4
        add     edx, 2                                  ; 155C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 155F _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1562 _ 3B. 45, 0C
        jbe     ?_074                                   ; 1565 _ 76, 02
        jmp     ?_076                                   ; 1567 _ EB, 0E

?_074:  add     dword [ebp-0CH], 1                      ; 1569 _ 83. 45, F4, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 156D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1570 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1572 _ 3B. 45, F4
        jg      ?_073                                   ; 1575 _ 7F, DF
?_076:  cmp     dword [ebp-0CH], 0                      ; 1577 _ 83. 7D, F4, 00
        jle     ?_078                                   ; 157B _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1581 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1584 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1587 _ 8B. 45, 08
        add     edx, 2                                  ; 158A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 158D _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1590 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1593 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1596 _ 8B. 45, 08
        add     ecx, 2                                  ; 1599 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 159C _ 8B. 44 C8, 04
        add     eax, edx                                ; 15A0 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 15A2 _ 3B. 45, 0C
        jne     ?_078                                   ; 15A5 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 15AB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15AE _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 15B1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15B4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15B7 _ 8B. 45, 08
        add     edx, 2                                  ; 15BA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 15BD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 15C1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 15C4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15C7 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 15CA _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 15CD _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 15D1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15D4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 15D6 _ 3B. 45, F4
        jle     ?_077                                   ; 15D9 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 15DB _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 15DE _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 15E1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15E4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15E7 _ 8B. 55, F4
        add     edx, 2                                  ; 15EA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15ED _ 8B. 04 D0
        cmp     ecx, eax                                ; 15F0 _ 39. C1
        jnz     ?_077                                   ; 15F2 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 15F4 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15F7 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 15FA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15FD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1600 _ 8B. 45, 08
        add     edx, 2                                  ; 1603 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1606 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 160A _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 160D _ 8B. 4D, F4
        add     ecx, 2                                  ; 1610 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1613 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1617 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 161A _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 161D _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1620 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1624 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1627 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1629 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 162C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 162F _ 89. 10
?_077:  mov     eax, 0                                  ; 1631 _ B8, 00000000
        jmp     ?_084                                   ; 1636 _ E9, 0000011C

?_078:  mov     eax, dword [ebp+8H]                     ; 163B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 163E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1640 _ 3B. 45, F4
        jle     ?_079                                   ; 1643 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1645 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1648 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 164B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 164E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1651 _ 8B. 55, F4
        add     edx, 2                                  ; 1654 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1657 _ 8B. 04 D0
        cmp     ecx, eax                                ; 165A _ 39. C1
        jnz     ?_079                                   ; 165C _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 165E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1661 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1664 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1667 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 166A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 166D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1670 _ 8B. 55, F4
        add     edx, 2                                  ; 1673 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1676 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 167A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 167D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1680 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1683 _ 8B. 55, F4
        add     edx, 2                                  ; 1686 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1689 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 168D _ B8, 00000000
        jmp     ?_084                                   ; 1692 _ E9, 000000C0

?_079:  mov     eax, dword [ebp+8H]                     ; 1697 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 169A _ 8B. 00
        cmp     eax, 4095                               ; 169C _ 3D, 00000FFF
        jg      ?_083                                   ; 16A1 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 16A7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16AA _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 16AC _ 89. 45, F8
        jmp     ?_081                                   ; 16AF _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 16B1 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16B4 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 16B7 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 16BA _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 16BD _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 16C0 _ 8B. 45, 08
        add     edx, 2                                  ; 16C3 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 16C6 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 16C9 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 16CB _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 16CE _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 16D1 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 16D5 _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 16D9 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 16DC _ 3B. 45, F4
        jg      ?_080                                   ; 16DF _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 16E1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16E4 _ 8B. 00
        lea     edx, [eax+1H]                           ; 16E6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 16E9 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16EC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 16EE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16F1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16F4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16F7 _ 8B. 00
        cmp     edx, eax                                ; 16F9 _ 39. C2
        jge     ?_082                                   ; 16FB _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 16FD _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1700 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1702 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1705 _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 1708 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 170B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 170E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1711 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1714 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1717 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 171A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 171D _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1720 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1723 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1727 _ B8, 00000000
        jmp     ?_084                                   ; 172C _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 172E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1731 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1734 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1737 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 173A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 173D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1740 _ 8B. 40, 08
        mov     edx, eax                                ; 1743 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1745 _ 8B. 45, 10
        add     eax, edx                                ; 1748 _ 01. D0
        mov     edx, eax                                ; 174A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 174C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 174F _ 89. 50, 08
        mov     eax, 4294967295                         ; 1752 _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 1757 _ 83. C4, 10
        pop     ebx                                     ; 175A _ 5B
        pop     ebp                                     ; 175B _ 5D
        ret                                             ; 175C _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 175D _ 55
        mov     ebp, esp                                ; 175E _ 89. E5
        sub     esp, 24                                 ; 1760 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1763 _ 8B. 45, 0C
        add     eax, 4095                               ; 1766 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 176B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1770 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1773 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1776 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 177D _ 89. 04 24
        call    memman_alloc                            ; 1780 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1785 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1788 _ 8B. 45, FC
        leave                                           ; 178B _ C9
        ret                                             ; 178C _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 178D _ 55
        mov     ebp, esp                                ; 178E _ 89. E5
        sub     esp, 28                                 ; 1790 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1793 _ 8B. 45, 10
        add     eax, 4095                               ; 1796 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 179B _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 17A0 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 17A3 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 17A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17B4 _ 89. 04 24
        call    memman_free                             ; 17B7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 17BC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 17BF _ 8B. 45, FC
        leave                                           ; 17C2 _ C9
        ret                                             ; 17C3 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 17C4 _ 55
        mov     ebp, esp                                ; 17C5 _ 89. E5
        sub     esp, 40                                 ; 17C7 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 17CA _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 17D2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D5 _ 89. 04 24
        call    memman_alloc_4k                         ; 17D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17DD _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 17E0 _ 83. 7D, F4, 00
        jnz     ?_085                                   ; 17E4 _ 75, 07
        mov     eax, 0                                  ; 17E6 _ B8, 00000000
        jmp     ?_088                                   ; 17EB _ EB, 54

?_085:  mov     eax, dword [ebp-0CH]                    ; 17ED _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 17F0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 17F3 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 17F5 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 17F8 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 17FB _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 17FE _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1801 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1804 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1807 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 180A _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1811 _ C7. 45, F0, 00000000
        jmp     ?_087                                   ; 1818 _ EB, 1B

?_086:  mov     eax, dword [ebp-0CH]                    ; 181A _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 181D _ 8B. 55, F0
        add     edx, 33                                 ; 1820 _ 83. C2, 21
        shl     edx, 5                                  ; 1823 _ C1. E2, 05
        add     eax, edx                                ; 1826 _ 01. D0
        add     eax, 12                                 ; 1828 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 182B _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1831 _ 83. 45, F0, 01
?_087:  cmp     dword [ebp-10H], 255                    ; 1835 _ 81. 7D, F0, 000000FF
        jle     ?_086                                   ; 183C _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 183E _ 8B. 45, F4
?_088:  leave                                           ; 1841 _ C9
        ret                                             ; 1842 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1843 _ 55
        mov     ebp, esp                                ; 1844 _ 89. E5
        sub     esp, 16                                 ; 1846 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1849 _ C7. 45, F8, 00000000
        jmp     ?_091                                   ; 1850 _ EB, 57

?_089:  mov     eax, dword [ebp+8H]                     ; 1852 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1855 _ 8B. 55, F8
        add     edx, 33                                 ; 1858 _ 83. C2, 21
        shl     edx, 5                                  ; 185B _ C1. E2, 05
        add     eax, edx                                ; 185E _ 01. D0
        add     eax, 12                                 ; 1860 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1863 _ 8B. 00
        test    eax, eax                                ; 1865 _ 85. C0
        jnz     ?_090                                   ; 1867 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1869 _ 8B. 45, F8
        shl     eax, 5                                  ; 186C _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 186F _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1875 _ 8B. 45, 08
        add     eax, edx                                ; 1878 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 187A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 187D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1880 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1883 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1886 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1889 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 188C _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 188F _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1896 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1899 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 18A0 _ 8B. 45, FC
        jmp     ?_092                                   ; 18A3 _ EB, 12

?_090:  add     dword [ebp-8H], 1                       ; 18A5 _ 83. 45, F8, 01
?_091:  cmp     dword [ebp-8H], 255                     ; 18A9 _ 81. 7D, F8, 000000FF
        jle     ?_089                                   ; 18B0 _ 7E, A0
        mov     eax, 0                                  ; 18B2 _ B8, 00000000
?_092:  leave                                           ; 18B7 _ C9
        ret                                             ; 18B8 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 18B9 _ 55
        mov     ebp, esp                                ; 18BA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 18BC _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 18BF _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 18C2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 18C4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 18C7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 18CA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18CD _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 18D0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 18D3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 18D6 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 18D9 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 18DC _ 89. 50, 14
        pop     ebp                                     ; 18DF _ 5D
        ret                                             ; 18E0 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 18E1 _ 55
        mov     ebp, esp                                ; 18E2 _ 89. E5
        sub     esp, 40                                 ; 18E4 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 18E7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 18EA _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 18ED _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 18F0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 18F3 _ 8B. 40, 0C
        add     eax, 1                                  ; 18F6 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 18F9 _ 3B. 45, 10
        jge     ?_093                                   ; 18FC _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 18FE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1901 _ 8B. 40, 0C
        add     eax, 1                                  ; 1904 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1907 _ 89. 45, 10
?_093:  cmp     dword [ebp+10H], -1                     ; 190A _ 83. 7D, 10, FF
        jge     ?_094                                   ; 190E _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1910 _ C7. 45, 10, FFFFFFFF
?_094:  mov     eax, dword [ebp+0CH]                    ; 1917 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 191A _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 191D _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1920 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1923 _ 3B. 45, 10
        jle     ?_102                                   ; 1926 _ 0F 8E, 000000C6
        cmp     dword [ebp+10H], 0                      ; 192C _ 83. 7D, 10, 00
        js      ?_097                                   ; 1930 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1932 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1935 _ 89. 45, F0
        jmp     ?_096                                   ; 1938 _ EB, 31

?_095:  mov     eax, dword [ebp-10H]                    ; 193A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 193D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1940 _ 8B. 45, 08
        add     edx, 4                                  ; 1943 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1946 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1949 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 194C _ 8B. 4D, F0
        add     ecx, 4                                  ; 194F _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1952 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1955 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1958 _ 8B. 55, F0
        add     edx, 4                                  ; 195B _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 195E _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1961 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1964 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1967 _ 83. 6D, F0, 01
?_096:  mov     eax, dword [ebp-10H]                    ; 196B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 196E _ 3B. 45, 10
        jg      ?_095                                   ; 1971 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1973 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1976 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1979 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 197C _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 197F _ 89. 14 88
        jmp     ?_101                                   ; 1982 _ EB, 5E

?_097:  mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1987 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 198A _ 3B. 45, F4
        jle     ?_100                                   ; 198D _ 7E, 44
        mov     eax, dword [ebp-0CH]                    ; 198F _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1992 _ 89. 45, F0
        jmp     ?_099                                   ; 1995 _ EB, 31

?_098:  mov     eax, dword [ebp-10H]                    ; 1997 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 199A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 199D _ 8B. 45, 08
        add     edx, 4                                  ; 19A0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 19A3 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 19A6 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 19A9 _ 8B. 4D, F0
        add     ecx, 4                                  ; 19AC _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 19AF _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 19B2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 19B5 _ 8B. 55, F0
        add     edx, 4                                  ; 19B8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 19BB _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 19BE _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 19C1 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 19C4 _ 83. 45, F0, 01
?_099:  mov     eax, dword [ebp+8H]                     ; 19C8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19CB _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 19CE _ 3B. 45, F0
        jg      ?_098                                   ; 19D1 _ 7F, C4
?_100:  mov     eax, dword [ebp+8H]                     ; 19D3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19D6 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 19D9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19DC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 19DF _ 89. 50, 0C
?_101:  mov     eax, dword [ebp+8H]                     ; 19E2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 19E5 _ 89. 04 24
        call    sheet_refresh                           ; 19E8 _ E8, FFFFFFFC(rel)
        jmp     ?_109                                   ; 19ED _ E9, 000000D7

?_102:  mov     eax, dword [ebp-0CH]                    ; 19F2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 19F5 _ 3B. 45, 10
        jge     ?_109                                   ; 19F8 _ 0F 8D, 000000CB
        cmp     dword [ebp-0CH], 0                      ; 19FE _ 83. 7D, F4, 00
        js      ?_105                                   ; 1A02 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1A04 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1A07 _ 89. 45, F0
        jmp     ?_104                                   ; 1A0A _ EB, 31

?_103:  mov     eax, dword [ebp-10H]                    ; 1A0C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1A0F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A12 _ 8B. 45, 08
        add     edx, 4                                  ; 1A15 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A18 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A1B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1A1E _ 8B. 4D, F0
        add     ecx, 4                                  ; 1A21 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A24 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A27 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A2A _ 8B. 55, F0
        add     edx, 4                                  ; 1A2D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A30 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1A33 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1A36 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1A39 _ 83. 45, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1A3D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A40 _ 3B. 45, 10
        jl      ?_103                                   ; 1A43 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1A45 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A48 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A4B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A4E _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1A51 _ 89. 14 88
        jmp     ?_108                                   ; 1A54 _ EB, 68

?_105:  mov     eax, dword [ebp+8H]                     ; 1A56 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A59 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1A5C _ 89. 45, F0
        jmp     ?_107                                   ; 1A5F _ EB, 37

?_106:  mov     eax, dword [ebp-10H]                    ; 1A61 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A64 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A67 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A6A _ 8B. 55, F0
        add     edx, 4                                  ; 1A6D _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A70 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A73 _ 8B. 45, 08
        add     ecx, 4                                  ; 1A76 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A79 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1A7C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1A7F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A82 _ 8B. 45, 08
        add     edx, 4                                  ; 1A85 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A88 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1A8B _ 8B. 55, F0
        add     edx, 1                                  ; 1A8E _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1A91 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1A94 _ 83. 6D, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1A98 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A9B _ 3B. 45, 10
        jge     ?_106                                   ; 1A9E _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1AA0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1AA3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1AA6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1AA9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1AAC _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AAF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AB2 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1AB5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AB8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1ABB _ 89. 50, 0C
?_108:  mov     eax, dword [ebp+8H]                     ; 1ABE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1AC1 _ 89. 04 24
        call    sheet_refresh                           ; 1AC4 _ E8, FFFFFFFC(rel)
?_109:  leave                                           ; 1AC9 _ C9
        ret                                             ; 1ACA _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1ACB _ 55
        mov     ebp, esp                                ; 1ACC _ 89. E5
        sub     esp, 48                                 ; 1ACE _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1AD1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AD4 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1AD6 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1AD9 _ C7. 45, E0, 00000000
        jmp     ?_116                                   ; 1AE0 _ E9, 000000B8

?_110:  mov     eax, dword [ebp+8H]                     ; 1AE5 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1AE8 _ 8B. 55, E0
        add     edx, 4                                  ; 1AEB _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1AEE _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1AF1 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1AF4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1AF7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1AF9 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1AFC _ C7. 45, E8, 00000000
        jmp     ?_115                                   ; 1B03 _ E9, 00000082

?_111:  mov     eax, dword [ebp-10H]                    ; 1B08 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1B0B _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1B0E _ 8B. 45, E8
        add     eax, edx                                ; 1B11 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1B13 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1B16 _ C7. 45, E4, 00000000
        jmp     ?_114                                   ; 1B1D _ EB, 5C

?_112:  mov     eax, dword [ebp-10H]                    ; 1B1F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1B22 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1B25 _ 8B. 45, E4
        add     eax, edx                                ; 1B28 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1B2A _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 1B2D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1B30 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1B33 _ 0F AF. 45, E8
        mov     edx, eax                                ; 1B37 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1B39 _ 8B. 45, E4
        add     eax, edx                                ; 1B3C _ 01. D0
        mov     edx, eax                                ; 1B3E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1B40 _ 8B. 45, F4
        add     eax, edx                                ; 1B43 _ 01. D0
        movzx   eax, byte [eax]                         ; 1B45 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1B48 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1B4B _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1B4F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1B52 _ 8B. 40, 14
        cmp     edx, eax                                ; 1B55 _ 39. C2
        jz      ?_113                                   ; 1B57 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1B59 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1B5C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1B5F _ 0F AF. 45, F8
        mov     edx, eax                                ; 1B63 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1B65 _ 8B. 45, FC
        add     eax, edx                                ; 1B68 _ 01. D0
        mov     edx, eax                                ; 1B6A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1B6C _ 8B. 45, EC
        add     edx, eax                                ; 1B6F _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1B71 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1B75 _ 88. 02
?_113:  add     dword [ebp-1CH], 1                      ; 1B77 _ 83. 45, E4, 01
?_114:  mov     eax, dword [ebp-10H]                    ; 1B7B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1B7E _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 1B81 _ 3B. 45, E4
        jg      ?_112                                   ; 1B84 _ 7F, 99
        add     dword [ebp-18H], 1                      ; 1B86 _ 83. 45, E8, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 1B8A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1B8D _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 1B90 _ 3B. 45, E8
        jg      ?_111                                   ; 1B93 _ 0F 8F, FFFFFF6F
        add     dword [ebp-20H], 1                      ; 1B99 _ 83. 45, E0, 01
?_116:  mov     eax, dword [ebp+8H]                     ; 1B9D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BA0 _ 8B. 40, 0C
        cmp     eax, dword [ebp-20H]                    ; 1BA3 _ 3B. 45, E0
        jge     ?_110                                   ; 1BA6 _ 0F 8D, FFFFFF39
        mov     eax, 0                                  ; 1BAC _ B8, 00000000
        leave                                           ; 1BB1 _ C9
        ret                                             ; 1BB2 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1BB3 _ 55
        mov     ebp, esp                                ; 1BB4 _ 89. E5
        sub     esp, 4                                  ; 1BB6 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1BB9 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1BBC _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1BBF _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BC2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1BC5 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1BC8 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BCB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1BCE _ 8B. 40, 18
        test    eax, eax                                ; 1BD1 _ 85. C0
        js      ?_117                                   ; 1BD3 _ 78, 0B
        mov     eax, dword [ebp+8H]                     ; 1BD5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1BD8 _ 89. 04 24
        call    sheet_refresh                           ; 1BDB _ E8, FFFFFFFC(rel)
?_117:  leave                                           ; 1BE0 _ C9
        ret                                             ; 1BE1 _ C3
; sheet_slide End of function



?_118:                                                  ; byte
        db 6DH, 6FH, 75H, 73H, 65H, 20H, 6DH, 6FH       ; 0000 _ mouse mo
        db 76H, 65H, 00H                                ; 0008 _ ve.

?_119:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 000B _ page is:
        db 20H, 00H                                     ; 0013 _  .

?_120:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0015 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 001D _ L: .

?_121:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0029 _ H: .

?_122:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 002D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0035 _ w: .

?_123:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0039 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0041 _ gh: .

?_124:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0046 _ type: .



table_rgb.1579:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1646:                                            ; byte
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

?_125:  db 00H                                          ; 0142 _ .

?_126:  db 00H, 00H                                     ; 0143 _ ..



screen_info:                                            ; qword
        resb    4                                       ; 0000

?_127:  resw    1                                       ; 0004

?_128:  resw    13                                      ; 0006

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

?_129:  resb    9                                       ; 0221

?_130:  resb    1                                       ; 022A


