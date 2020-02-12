; Disassembly of file: ckernel.o
; Wed Feb 12 12:51:06 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 56                                 ; 0003 _ 83. EC, 38
        mov     dword [esp], screen_info                ; 0006 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000D _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0012 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0017 _ 89. 45, EC
        movzx   eax, word [screen_info+4H]              ; 001A _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0021 _ 98
        mov     dword [ebp-10H], eax                    ; 0022 _ 89. 45, F0
        movzx   eax, word [screen_info+6H]              ; 0025 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002C _ 98
        mov     dword [ebp-0CH], eax                    ; 002D _ 89. 45, F4
        call    init_palette                            ; 0030 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0035 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0038 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 003C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 003F _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0043 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0046 _ 89. 04 24
        call    init_desktop                            ; 0049 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 004E _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], systemFont+410H        ; 0056 _ C7. 44 24, 10, 00000410(d)
        mov     dword [esp+0CH], 0                      ; 005E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0066 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 006E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0071 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0075 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0078 _ 89. 04 24
        call    paint_font                              ; 007B _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0080 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_020                  ; 0088 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 16                     ; 0090 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 0                       ; 0098 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 00A0 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 00A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 00A7 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00AA _ 89. 04 24
        call    paint_string                            ; 00AD _ E8, FFFFFFFC(rel)
?_001:  call    io_hlt                                  ; 00B2 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 00B7 _ EB, F9
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 00B9 _ 55
        mov     ebp, esp                                ; 00BA _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 00BC _ A1, 00000000(d)
        mov     edx, eax                                ; 00C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 00C3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 00C6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 00C8 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 00CB _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 00D1 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 00D4 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 00DA _ 5D
        ret                                             ; 00DB _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 00DC _ 55
        mov     ebp, esp                                ; 00DD _ 89. E5
        sub     esp, 24                                 ; 00DF _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1430          ; 00E2 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 00EA _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 00F2 _ C7. 04 24, 00000000
        call    set_palette                             ; 00F9 _ E8, FFFFFFFC(rel)
        nop                                             ; 00FE _ 90
        leave                                           ; 00FF _ C9
        ret                                             ; 0100 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0101 _ 55
        mov     ebp, esp                                ; 0102 _ 89. E5
        sub     esp, 40                                 ; 0104 _ 83. EC, 28
        call    io_load_eflags                          ; 0107 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 010C _ 89. 45, F4
        call    io_cli                                  ; 010F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0114 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0117 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 011B _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0122 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0127 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 012A _ 89. 45, F0
        jmp     ?_003                                   ; 012D _ EB, 62

?_002:  mov     eax, dword [ebp+10H]                    ; 012F _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0132 _ 0F B6. 00
        shr     al, 2                                   ; 0135 _ C0. E8, 02
        movzx   eax, al                                 ; 0138 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 013B _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 013F _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0146 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 014B _ 8B. 45, 10
        add     eax, 1                                  ; 014E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0151 _ 0F B6. 00
        shr     al, 2                                   ; 0154 _ C0. E8, 02
        movzx   eax, al                                 ; 0157 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 015A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 015E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0165 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 016A _ 8B. 45, 10
        add     eax, 2                                  ; 016D _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0170 _ 0F B6. 00
        shr     al, 2                                   ; 0173 _ C0. E8, 02
        movzx   eax, al                                 ; 0176 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0179 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 017D _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0184 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0189 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 018D _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 0191 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0194 _ 3B. 45, 0C
        jle     ?_002                                   ; 0197 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0199 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 019C _ 89. 04 24
        call    io_store_eflags                         ; 019F _ E8, FFFFFFFC(rel)
        nop                                             ; 01A4 _ 90
        leave                                           ; 01A5 _ C9
        ret                                             ; 01A6 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 01A7 _ 55
        mov     ebp, esp                                ; 01A8 _ 89. E5
        sub     esp, 20                                 ; 01AA _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 01AD _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 01B0 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 01B3 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 01B6 _ 89. 45, FC
        jmp     ?_007                                   ; 01B9 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 01BB _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 01BE _ 89. 45, F8
        jmp     ?_006                                   ; 01C1 _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 01C3 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 01C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 01CA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 01CC _ 8B. 45, F8
        add     eax, edx                                ; 01CF _ 01. D0
        mov     edx, eax                                ; 01D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 01D3 _ 8B. 45, 08
        add     edx, eax                                ; 01D6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 01D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 01DC _ 88. 02
        add     dword [ebp-8H], 1                       ; 01DE _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 01E2 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 01E5 _ 3B. 45, 1C
        jle     ?_005                                   ; 01E8 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 01EA _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 01EE _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 01F1 _ 3B. 45, 20
        jle     ?_004                                   ; 01F4 _ 7E, C5
        leave                                           ; 01F6 _ C9
        ret                                             ; 01F7 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 01F8 _ 55
        mov     ebp, esp                                ; 01F9 _ 89. E5
        push    ebx                                     ; 01FB _ 53
        sub     esp, 28                                 ; 01FC _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 01FF _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0202 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0205 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0208 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 020B _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 020F _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0213 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 021B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0223 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 022B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 022E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0232 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0235 _ 89. 04 24
        call    paint_rectangle                         ; 0238 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 023D _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0240 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0243 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0246 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0249 _ 8B. 45, 10
        sub     eax, 28                                 ; 024C _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 024F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0253 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0257 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 025B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0263 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 026B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 026E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0272 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0275 _ 89. 04 24
        call    paint_rectangle                         ; 0278 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 027D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0280 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0283 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0286 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0289 _ 8B. 45, 10
        sub     eax, 27                                 ; 028C _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 028F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0293 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0297 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 029B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 02A3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 02AB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02AE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02B2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02B5 _ 89. 04 24
        call    paint_rectangle                         ; 02B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02BD _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 02C0 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 02C3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 02C6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 02C9 _ 8B. 45, 10
        sub     eax, 26                                 ; 02CC _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 02CF _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02D3 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02D7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 02E3 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 02EB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02EE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02F2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02F5 _ 89. 04 24
        call    paint_rectangle                         ; 02F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02FD _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0300 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0303 _ 8B. 45, 10
        sub     eax, 24                                 ; 0306 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0309 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 030D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0315 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0319 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0321 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0329 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 032C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0330 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0333 _ 89. 04 24
        call    paint_rectangle                         ; 0336 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 033B _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 033E _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0341 _ 8B. 45, 10
        sub     eax, 24                                 ; 0344 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0347 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 034B _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0353 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0357 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 035F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0367 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 036A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 036E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0371 _ 89. 04 24
        call    paint_rectangle                         ; 0374 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0379 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 037C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 037F _ 8B. 45, 10
        sub     eax, 4                                  ; 0382 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0385 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0389 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0391 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0395 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 039D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03AF _ 89. 04 24
        call    paint_rectangle                         ; 03B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03B7 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 03BA _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 03BD _ 8B. 45, 10
        sub     eax, 23                                 ; 03C0 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 03C3 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 03C7 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 03CF _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 03D3 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 03DB _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03E3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03E6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03EA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03ED _ 89. 04 24
        call    paint_rectangle                         ; 03F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03F5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 03F8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 03FB _ 8B. 45, 10
        sub     eax, 3                                  ; 03FE _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0401 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0405 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 040D _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0411 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0419 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0421 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0424 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0428 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 042B _ 89. 04 24
        call    paint_rectangle                         ; 042E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0433 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0436 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0439 _ 8B. 45, 10
        sub     eax, 24                                 ; 043C _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 043F _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0443 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 044B _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 044F _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0457 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 045F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0462 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0466 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0469 _ 89. 04 24
        call    paint_rectangle                         ; 046C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0471 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0474 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0477 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 047A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 047D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0480 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0483 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0486 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0489 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 048D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0491 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0495 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0499 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04A1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04A4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04A8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04AB _ 89. 04 24
        call    paint_rectangle                         ; 04AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04B3 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 04B6 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 04B9 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 04BC _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 04BF _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 04C2 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 04C5 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04C8 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 04CB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04CF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04D3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04D7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 04DB _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04E3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04E6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04EA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04ED _ 89. 04 24
        call    paint_rectangle                         ; 04F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04F5 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 04F8 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 04FB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04FE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0501 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0504 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0507 _ 8B. 45, 0C
        sub     eax, 47                                 ; 050A _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 050D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0511 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0515 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0519 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 051D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0525 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0528 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 052C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 052F _ 89. 04 24
        call    paint_rectangle                         ; 0532 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0537 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 053A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 053D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0540 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0543 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0546 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0549 _ 8B. 45, 0C
        sub     eax, 3                                  ; 054C _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 054F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0553 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0557 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 055B _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 055F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0567 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 056A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 056E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0571 _ 89. 04 24
        call    paint_rectangle                         ; 0574 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0579 _ 83. C4, 1C
        pop     ebx                                     ; 057C _ 5B
        pop     ebp                                     ; 057D _ 5D
        ret                                             ; 057E _ C3
; init_desktop End of function

paint_font:; Function begin
        push    ebp                                     ; 057F _ 55
        mov     ebp, esp                                ; 0580 _ 89. E5
        sub     esp, 20                                 ; 0582 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0585 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0588 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 058B _ C7. 45, FC, 00000000
        jmp     ?_017                                   ; 0592 _ E9, 0000016E

?_008:  mov     edx, dword [ebp-4H]                     ; 0597 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 059A _ 8B. 45, 18
        add     eax, edx                                ; 059D _ 01. D0
        movzx   eax, byte [eax]                         ; 059F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05A2 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 05A5 _ 0F B6. 45, FB
        test    al, al                                  ; 05A9 _ 84. C0
        jns     ?_009                                   ; 05AB _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 05AD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 05B0 _ 8B. 55, 14
        add     eax, edx                                ; 05B3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05B5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05B9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05BB _ 8B. 45, 10
        add     eax, edx                                ; 05BE _ 01. D0
        mov     edx, eax                                ; 05C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05C2 _ 8B. 45, 08
        add     edx, eax                                ; 05C5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05C7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05CB _ 88. 02
?_009:  movzx   eax, byte [ebp-5H]                      ; 05CD _ 0F B6. 45, FB
        and     eax, 40H                                ; 05D1 _ 83. E0, 40
        test    eax, eax                                ; 05D4 _ 85. C0
        jz      ?_010                                   ; 05D6 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 05D8 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 05DB _ 8B. 55, 14
        add     eax, edx                                ; 05DE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05E4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05E6 _ 8B. 45, 10
        add     eax, edx                                ; 05E9 _ 01. D0
        lea     edx, [eax+1H]                           ; 05EB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05EE _ 8B. 45, 08
        add     edx, eax                                ; 05F1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05F3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05F7 _ 88. 02
?_010:  movzx   eax, byte [ebp-5H]                      ; 05F9 _ 0F B6. 45, FB
        and     eax, 20H                                ; 05FD _ 83. E0, 20
        test    eax, eax                                ; 0600 _ 85. C0
        jz      ?_011                                   ; 0602 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0604 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0607 _ 8B. 55, 14
        add     eax, edx                                ; 060A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 060C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0610 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0612 _ 8B. 45, 10
        add     eax, edx                                ; 0615 _ 01. D0
        lea     edx, [eax+2H]                           ; 0617 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 061A _ 8B. 45, 08
        add     edx, eax                                ; 061D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 061F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0623 _ 88. 02
?_011:  movzx   eax, byte [ebp-5H]                      ; 0625 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0629 _ 83. E0, 10
        test    eax, eax                                ; 062C _ 85. C0
        jz      ?_012                                   ; 062E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0630 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0633 _ 8B. 55, 14
        add     eax, edx                                ; 0636 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0638 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 063C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 063E _ 8B. 45, 10
        add     eax, edx                                ; 0641 _ 01. D0
        lea     edx, [eax+3H]                           ; 0643 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0646 _ 8B. 45, 08
        add     edx, eax                                ; 0649 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 064B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 064F _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 0651 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0655 _ 83. E0, 08
        test    eax, eax                                ; 0658 _ 85. C0
        jz      ?_013                                   ; 065A _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 065C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 065F _ 8B. 55, 14
        add     eax, edx                                ; 0662 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0664 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0668 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066A _ 8B. 45, 10
        add     eax, edx                                ; 066D _ 01. D0
        lea     edx, [eax+4H]                           ; 066F _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0672 _ 8B. 45, 08
        add     edx, eax                                ; 0675 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0677 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 067B _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 067D _ 0F B6. 45, FB
        and     eax, 04H                                ; 0681 _ 83. E0, 04
        test    eax, eax                                ; 0684 _ 85. C0
        jz      ?_014                                   ; 0686 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0688 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 068B _ 8B. 55, 14
        add     eax, edx                                ; 068E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0690 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0694 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0696 _ 8B. 45, 10
        add     eax, edx                                ; 0699 _ 01. D0
        lea     edx, [eax+5H]                           ; 069B _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 069E _ 8B. 45, 08
        add     edx, eax                                ; 06A1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06A7 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 06A9 _ 0F B6. 45, FB
        and     eax, 02H                                ; 06AD _ 83. E0, 02
        test    eax, eax                                ; 06B0 _ 85. C0
        jz      ?_015                                   ; 06B2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06B4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06B7 _ 8B. 55, 14
        add     eax, edx                                ; 06BA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06BC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C2 _ 8B. 45, 10
        add     eax, edx                                ; 06C5 _ 01. D0
        lea     edx, [eax+6H]                           ; 06C7 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06CA _ 8B. 45, 08
        add     edx, eax                                ; 06CD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06CF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D3 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 06D5 _ 0F B6. 45, FB
        and     eax, 01H                                ; 06D9 _ 83. E0, 01
        test    eax, eax                                ; 06DC _ 85. C0
        jz      ?_016                                   ; 06DE _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06E0 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06E3 _ 8B. 55, 14
        add     eax, edx                                ; 06E6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06E8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06EC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06EE _ 8B. 45, 10
        add     eax, edx                                ; 06F1 _ 01. D0
        lea     edx, [eax+7H]                           ; 06F3 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 06F6 _ 8B. 45, 08
        add     edx, eax                                ; 06F9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06FB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06FF _ 88. 02
?_016:  add     dword [ebp-4H], 1                       ; 0701 _ 83. 45, FC, 01
?_017:  cmp     dword [ebp-4H], 15                      ; 0705 _ 83. 7D, FC, 0F
        jle     ?_008                                   ; 0709 _ 0F 8E, FFFFFE88
        leave                                           ; 070F _ C9
        ret                                             ; 0710 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0711 _ 55
        mov     ebp, esp                                ; 0712 _ 89. E5
        sub     esp, 28                                 ; 0714 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 0717 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 071A _ 88. 45, FC
        jmp     ?_019                                   ; 071D _ EB, 45

?_018:  mov     eax, dword [ebp+18H]                    ; 071F _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0722 _ 0F B6. 00
        movsx   eax, al                                 ; 0725 _ 0F BE. C0
        shl     eax, 4                                  ; 0728 _ C1. E0, 04
        add     eax, systemFont                         ; 072B _ 05, 00000000(d)
        mov     dword [esp+14H], 0                      ; 0730 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], eax                    ; 0738 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 073C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 073F _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0743 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0746 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 074A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 074D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0751 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0754 _ 89. 04 24
        call    paint_font                              ; 0757 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 075C _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0760 _ 83. 45, 18, 01
?_019:  mov     eax, dword [ebp+18H]                    ; 0764 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0767 _ 0F B6. 00
        test    al, al                                  ; 076A _ 84. C0
        jnz     ?_018                                   ; 076C _ 75, B1
        leave                                           ; 076E _ C9
        ret                                             ; 076F _ C3
; paint_string End of function



?_020:                                                  ; byte
        db 48H, 65H, 6CH, 6CH, 6FH, 57H, 6FH, 72H       ; 0000 _ HelloWor
        db 6CH, 64H, 00H                                ; 0008 _ ld.



table_rgb.1430:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........



screen_info:                                            ; qword
        resq    1                                       ; 0000


