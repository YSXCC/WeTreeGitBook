; Disassembly of file: ckernel.o
; Tue Feb 11 17:59:19 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 40                                 ; 0003 _ 83. EC, 28
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
?_001:  call    io_hlt                                  ; 004E _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0053 _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0055 _ 55
        mov     ebp, esp                                ; 0056 _ 89. E5
        sub     esp, 24                                 ; 0058 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1412          ; 005B _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0063 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 006B _ C7. 04 24, 00000000
        call    set_palette                             ; 0072 _ E8, FFFFFFFC(rel)
        nop                                             ; 0077 _ 90
        leave                                           ; 0078 _ C9
        ret                                             ; 0079 _ C3
; init_palette End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 007A _ 55
        mov     ebp, esp                                ; 007B _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 007D _ A1, 00000000(d)
        mov     edx, eax                                ; 0082 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0084 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0087 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0089 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 008C _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0092 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0095 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 009B _ 5D
        ret                                             ; 009C _ C3
; init_screeninfo End of function

set_palette:; Function begin
        push    ebp                                     ; 009D _ 55
        mov     ebp, esp                                ; 009E _ 89. E5
        sub     esp, 40                                 ; 00A0 _ 83. EC, 28
        call    io_load_eflags                          ; 00A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 00A8 _ 89. 45, F4
        call    io_cli                                  ; 00AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 00B0 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 00B3 _ 89. 45, F0
        jmp     ?_003                                   ; 00B6 _ EB, 62

?_002:  mov     eax, dword [ebp+10H]                    ; 00B8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 00BB _ 0F B6. 00
        shr     al, 2                                   ; 00BE _ C0. E8, 02
        movzx   eax, al                                 ; 00C1 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00C4 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00C8 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 00D4 _ 8B. 45, 10
        add     eax, 1                                  ; 00D7 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 00DA _ 0F B6. 00
        shr     al, 2                                   ; 00DD _ C0. E8, 02
        movzx   eax, al                                 ; 00E0 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00E3 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00E7 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00EE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 00F3 _ 8B. 45, 10
        add     eax, 2                                  ; 00F6 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 00F9 _ 0F B6. 00
        shr     al, 2                                   ; 00FC _ C0. E8, 02
        movzx   eax, al                                 ; 00FF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0102 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0106 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 010D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0112 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0116 _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 011A _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 011D _ 3B. 45, 0C
        jle     ?_002                                   ; 0120 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0122 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0125 _ 89. 04 24
        call    io_store_eflags                         ; 0128 _ E8, FFFFFFFC(rel)
        nop                                             ; 012D _ 90
        leave                                           ; 012E _ C9
        ret                                             ; 012F _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0130 _ 55
        mov     ebp, esp                                ; 0131 _ 89. E5
        sub     esp, 20                                 ; 0133 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0136 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0139 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 013C _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 013F _ 89. 45, FC
        jmp     ?_007                                   ; 0142 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0144 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0147 _ 89. 45, F8
        jmp     ?_006                                   ; 014A _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 014C _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 014F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0153 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0155 _ 8B. 45, F8
        add     eax, edx                                ; 0158 _ 01. D0
        mov     edx, eax                                ; 015A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 015C _ 8B. 45, 08
        add     edx, eax                                ; 015F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0161 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0165 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0167 _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 016B _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 016E _ 3B. 45, 1C
        jle     ?_005                                   ; 0171 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0173 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 0177 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 017A _ 3B. 45, 20
        jle     ?_004                                   ; 017D _ 7E, C5
        leave                                           ; 017F _ C9
        ret                                             ; 0180 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0181 _ 55
        mov     ebp, esp                                ; 0182 _ 89. E5
        push    ebx                                     ; 0184 _ 53
        sub     esp, 28                                 ; 0185 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0188 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 018B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 018E _ 8B. 45, 0C
        sub     eax, 1                                  ; 0191 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0194 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0198 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 019C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 01A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 01AC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 01B4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 01B7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 01BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 01BE _ 89. 04 24
        call    paint_rectangle                         ; 01C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01C6 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 01C9 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 01CC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 01CF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 01D2 _ 8B. 45, 10
        sub     eax, 28                                 ; 01D5 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 01D8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 01DC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 01E0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 01E4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 01EC _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 01F4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 01F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 01FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 01FE _ 89. 04 24
        call    paint_rectangle                         ; 0201 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0206 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0209 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 020C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 020F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0212 _ 8B. 45, 10
        sub     eax, 27                                 ; 0215 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0218 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 021C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0220 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0224 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 022C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0234 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0237 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 023B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 023E _ 89. 04 24
        call    paint_rectangle                         ; 0241 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0246 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0249 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 024C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 024F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0252 _ 8B. 45, 10
        sub     eax, 26                                 ; 0255 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0258 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 025C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0260 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0264 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 026C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0274 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0277 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 027B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 027E _ 89. 04 24
        call    paint_rectangle                         ; 0281 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0286 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0289 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 028C _ 8B. 45, 10
        sub     eax, 24                                 ; 028F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0292 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0296 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 029E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 02A2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 02AA _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 02B2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02B5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02BC _ 89. 04 24
        call    paint_rectangle                         ; 02BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02C4 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 02C7 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 02CA _ 8B. 45, 10
        sub     eax, 24                                 ; 02CD _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 02D0 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 02D4 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 02DC _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 02E0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 02E8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 02F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02FA _ 89. 04 24
        call    paint_rectangle                         ; 02FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0302 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0305 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0308 _ 8B. 45, 10
        sub     eax, 4                                  ; 030B _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 030E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0312 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 031A _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 031E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0326 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 032E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0331 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0335 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0338 _ 89. 04 24
        call    paint_rectangle                         ; 033B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0340 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0343 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0346 _ 8B. 45, 10
        sub     eax, 23                                 ; 0349 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 034C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0350 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0358 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 035C _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0364 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 036C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 036F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0373 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0376 _ 89. 04 24
        call    paint_rectangle                         ; 0379 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 037E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0381 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0384 _ 8B. 45, 10
        sub     eax, 3                                  ; 0387 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 038A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 038E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0396 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 039A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 03A2 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 03AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03B4 _ 89. 04 24
        call    paint_rectangle                         ; 03B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03BC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 03BF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 03C2 _ 8B. 45, 10
        sub     eax, 24                                 ; 03C5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 03C8 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 03CC _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 03D4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 03D8 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 03E0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 03E8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03EB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03EF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03F2 _ 89. 04 24
        call    paint_rectangle                         ; 03F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03FA _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 03FD _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0400 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0403 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0406 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0409 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 040C _ 8B. 45, 0C
        sub     eax, 47                                 ; 040F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0412 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0416 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 041A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 041E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0422 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 042A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 042D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0431 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0434 _ 89. 04 24
        call    paint_rectangle                         ; 0437 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 043C _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 043F _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0442 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0445 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0448 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 044B _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 044E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0451 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0454 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0458 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 045C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0460 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0464 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 046C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 046F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0473 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0476 _ 89. 04 24
        call    paint_rectangle                         ; 0479 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 047E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0481 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0484 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0487 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 048A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 048D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0490 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0493 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0496 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 049A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 049E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04A2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 04A6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04B8 _ 89. 04 24
        call    paint_rectangle                         ; 04BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04C0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 04C3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 04C6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 04C9 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 04CC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04CF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04D2 _ 8B. 45, 0C
        sub     eax, 3                                  ; 04D5 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 04D8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04DC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04E4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 04E8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04FA _ 89. 04 24
        call    paint_rectangle                         ; 04FD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0502 _ 83. C4, 1C
        pop     ebx                                     ; 0505 _ 5B
        pop     ebp                                     ; 0506 _ 5D
        ret                                             ; 0507 _ C3
; init_desktop End of function



table_rgb.1412:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........



screen_info:                                            ; qword
        resq    1                                       ; 0000


