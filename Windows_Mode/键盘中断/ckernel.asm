; Disassembly of file: ckernel.o
; Wed Feb 12 21:20:47 2020
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
        mov     dword [esp+10H], ?_032                  ; 0088 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 16                     ; 0090 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 0                       ; 0098 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 00A0 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 00A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 00A7 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00AA _ 89. 04 24
        call    paint_string                            ; 00AD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 2                       ; 00B2 _ C7. 44 24, 04, 00000002
        mov     dword [esp], mouse_cursor_buf           ; 00BA _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 00C1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+18H], mouse_cursor_buf       ; 00C6 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 16                     ; 00CE _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 00D6 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 100                    ; 00DE _ C7. 44 24, 0C, 00000064
        mov     dword [esp+8H], 100                     ; 00E6 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-10H]                    ; 00EE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 00F1 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 00F5 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00F8 _ 89. 04 24
        call    paint_block                             ; 00FB _ E8, FFFFFFFC(rel)
?_001:  call    io_hlt                                  ; 0100 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0105 _ EB, F9
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0107 _ 55
        mov     ebp, esp                                ; 0108 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 010A _ A1, 00000000(d)
        mov     edx, eax                                ; 010F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0111 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0114 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0116 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0119 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 011F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0122 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0128 _ 5D
        ret                                             ; 0129 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 012A _ 55
        mov     ebp, esp                                ; 012B _ 89. E5
        sub     esp, 24                                 ; 012D _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1442          ; 0130 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0138 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0140 _ C7. 04 24, 00000000
        call    set_palette                             ; 0147 _ E8, FFFFFFFC(rel)
        nop                                             ; 014C _ 90
        leave                                           ; 014D _ C9
        ret                                             ; 014E _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 014F _ 55
        mov     ebp, esp                                ; 0150 _ 89. E5
        sub     esp, 40                                 ; 0152 _ 83. EC, 28
        call    io_load_eflags                          ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 015A _ 89. 45, F4
        call    io_cli                                  ; 015D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0162 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0165 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0169 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0170 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0175 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0178 _ 89. 45, F0
        jmp     ?_003                                   ; 017B _ EB, 62

?_002:  mov     eax, dword [ebp+10H]                    ; 017D _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0180 _ 0F B6. 00
        shr     al, 2                                   ; 0183 _ C0. E8, 02
        movzx   eax, al                                 ; 0186 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0189 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 018D _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0194 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0199 _ 8B. 45, 10
        add     eax, 1                                  ; 019C _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 019F _ 0F B6. 00
        shr     al, 2                                   ; 01A2 _ C0. E8, 02
        movzx   eax, al                                 ; 01A5 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01A8 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01AC _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01B8 _ 8B. 45, 10
        add     eax, 2                                  ; 01BB _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 01BE _ 0F B6. 00
        shr     al, 2                                   ; 01C1 _ C0. E8, 02
        movzx   eax, al                                 ; 01C4 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01C7 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01CB _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01D2 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 01D7 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 01DB _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 01DF _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 01E2 _ 3B. 45, 0C
        jle     ?_002                                   ; 01E5 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 01E7 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 01EA _ 89. 04 24
        call    io_store_eflags                         ; 01ED _ E8, FFFFFFFC(rel)
        nop                                             ; 01F2 _ 90
        leave                                           ; 01F3 _ C9
        ret                                             ; 01F4 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 01F5 _ 55
        mov     ebp, esp                                ; 01F6 _ 89. E5
        sub     esp, 20                                 ; 01F8 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 01FB _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 01FE _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0201 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0204 _ 89. 45, FC
        jmp     ?_007                                   ; 0207 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0209 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 020C _ 89. 45, F8
        jmp     ?_006                                   ; 020F _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0211 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0214 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0218 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 021A _ 8B. 45, F8
        add     eax, edx                                ; 021D _ 01. D0
        mov     edx, eax                                ; 021F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0221 _ 8B. 45, 08
        add     edx, eax                                ; 0224 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0226 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 022A _ 88. 02
        add     dword [ebp-8H], 1                       ; 022C _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0230 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0233 _ 3B. 45, 1C
        jle     ?_005                                   ; 0236 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0238 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 023C _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 023F _ 3B. 45, 20
        jle     ?_004                                   ; 0242 _ 7E, C5
        leave                                           ; 0244 _ C9
        ret                                             ; 0245 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0246 _ 55
        mov     ebp, esp                                ; 0247 _ 89. E5
        push    ebx                                     ; 0249 _ 53
        sub     esp, 28                                 ; 024A _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 024D _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0250 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0253 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0256 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0259 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 025D _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0261 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0269 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0271 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0279 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 027C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0280 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    paint_rectangle                         ; 0286 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 028B _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 028E _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0291 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0294 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0297 _ 8B. 45, 10
        sub     eax, 28                                 ; 029A _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 029D _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02A1 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02A5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02A9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 02B1 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 02B9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02BC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02C0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02C3 _ 89. 04 24
        call    paint_rectangle                         ; 02C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02CB _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 02CE _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 02D1 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 02D4 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 02D7 _ 8B. 45, 10
        sub     eax, 27                                 ; 02DA _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 02DD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02E1 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02E5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02E9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 02F1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 02F9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0300 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0303 _ 89. 04 24
        call    paint_rectangle                         ; 0306 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 030B _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 030E _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0311 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0314 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0317 _ 8B. 45, 10
        sub     eax, 26                                 ; 031A _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 031D _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0321 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0325 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0329 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0331 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0339 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 033C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0340 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0343 _ 89. 04 24
        call    paint_rectangle                         ; 0346 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 034B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 034E _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0351 _ 8B. 45, 10
        sub     eax, 24                                 ; 0354 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0357 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 035B _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0363 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0367 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 036F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0377 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 037A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 037E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0381 _ 89. 04 24
        call    paint_rectangle                         ; 0384 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0389 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 038C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 038F _ 8B. 45, 10
        sub     eax, 24                                 ; 0392 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0395 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0399 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 03A1 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 03A5 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 03AD _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03B5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03BF _ 89. 04 24
        call    paint_rectangle                         ; 03C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03C7 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03CA _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03CD _ 8B. 45, 10
        sub     eax, 4                                  ; 03D0 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 03D3 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 03D7 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 03DF _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 03E3 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 03EB _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03F3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03FD _ 89. 04 24
        call    paint_rectangle                         ; 0400 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0405 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0408 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 040B _ 8B. 45, 10
        sub     eax, 23                                 ; 040E _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0411 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0415 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 041D _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0421 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0429 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0431 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0434 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0438 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 043B _ 89. 04 24
        call    paint_rectangle                         ; 043E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0443 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0446 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0449 _ 8B. 45, 10
        sub     eax, 3                                  ; 044C _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 044F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0453 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 045B _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 045F _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0467 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 046F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0472 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0476 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0479 _ 89. 04 24
        call    paint_rectangle                         ; 047C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0481 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0484 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0487 _ 8B. 45, 10
        sub     eax, 24                                 ; 048A _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 048D _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0491 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0499 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 049D _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 04A5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 04AD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04B0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04B7 _ 89. 04 24
        call    paint_rectangle                         ; 04BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04BF _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04C2 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04C5 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04C8 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04CB _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04CE _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04D1 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04D4 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 04D7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04DB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04DF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04E3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 04E7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04EF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04F2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04F6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04F9 _ 89. 04 24
        call    paint_rectangle                         ; 04FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0501 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0504 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0507 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 050A _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 050D _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0510 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0513 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0516 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0519 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 051D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0521 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0525 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0529 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0531 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0534 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0538 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 053B _ 89. 04 24
        call    paint_rectangle                         ; 053E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0543 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0546 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0549 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 054C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 054F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0552 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0555 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0558 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 055B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 055F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0563 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0567 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 056B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0573 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0576 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 057A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 057D _ 89. 04 24
        call    paint_rectangle                         ; 0580 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0585 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0588 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 058B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 058E _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0591 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0594 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0597 _ 8B. 45, 0C
        sub     eax, 3                                  ; 059A _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 059D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05A1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05A5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05A9 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 05AD _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 05B5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05BF _ 89. 04 24
        call    paint_rectangle                         ; 05C2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 05C7 _ 83. C4, 1C
        pop     ebx                                     ; 05CA _ 5B
        pop     ebp                                     ; 05CB _ 5D
        ret                                             ; 05CC _ C3
; init_desktop End of function

paint_font:; Function begin
        push    ebp                                     ; 05CD _ 55
        mov     ebp, esp                                ; 05CE _ 89. E5
        sub     esp, 20                                 ; 05D0 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 05D3 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 05D6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05D9 _ C7. 45, FC, 00000000
        jmp     ?_017                                   ; 05E0 _ E9, 0000016E

?_008:  mov     edx, dword [ebp-4H]                     ; 05E5 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 05E8 _ 8B. 45, 18
        add     eax, edx                                ; 05EB _ 01. D0
        movzx   eax, byte [eax]                         ; 05ED _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05F0 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 05F3 _ 0F B6. 45, FB
        test    al, al                                  ; 05F7 _ 84. C0
        jns     ?_009                                   ; 05F9 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 05FB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 05FE _ 8B. 55, 14
        add     eax, edx                                ; 0601 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0603 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0607 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0609 _ 8B. 45, 10
        add     eax, edx                                ; 060C _ 01. D0
        mov     edx, eax                                ; 060E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0610 _ 8B. 45, 08
        add     edx, eax                                ; 0613 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0615 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0619 _ 88. 02
?_009:  movzx   eax, byte [ebp-5H]                      ; 061B _ 0F B6. 45, FB
        and     eax, 40H                                ; 061F _ 83. E0, 40
        test    eax, eax                                ; 0622 _ 85. C0
        jz      ?_010                                   ; 0624 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0626 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0629 _ 8B. 55, 14
        add     eax, edx                                ; 062C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 062E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0632 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0634 _ 8B. 45, 10
        add     eax, edx                                ; 0637 _ 01. D0
        lea     edx, [eax+1H]                           ; 0639 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 063C _ 8B. 45, 08
        add     edx, eax                                ; 063F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0641 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0645 _ 88. 02
?_010:  movzx   eax, byte [ebp-5H]                      ; 0647 _ 0F B6. 45, FB
        and     eax, 20H                                ; 064B _ 83. E0, 20
        test    eax, eax                                ; 064E _ 85. C0
        jz      ?_011                                   ; 0650 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0652 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0655 _ 8B. 55, 14
        add     eax, edx                                ; 0658 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 065A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 065E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0660 _ 8B. 45, 10
        add     eax, edx                                ; 0663 _ 01. D0
        lea     edx, [eax+2H]                           ; 0665 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0668 _ 8B. 45, 08
        add     edx, eax                                ; 066B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 066D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0671 _ 88. 02
?_011:  movzx   eax, byte [ebp-5H]                      ; 0673 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0677 _ 83. E0, 10
        test    eax, eax                                ; 067A _ 85. C0
        jz      ?_012                                   ; 067C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 067E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0681 _ 8B. 55, 14
        add     eax, edx                                ; 0684 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0686 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 068A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 068C _ 8B. 45, 10
        add     eax, edx                                ; 068F _ 01. D0
        lea     edx, [eax+3H]                           ; 0691 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0694 _ 8B. 45, 08
        add     edx, eax                                ; 0697 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0699 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 069D _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 069F _ 0F B6. 45, FB
        and     eax, 08H                                ; 06A3 _ 83. E0, 08
        test    eax, eax                                ; 06A6 _ 85. C0
        jz      ?_013                                   ; 06A8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06AA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06AD _ 8B. 55, 14
        add     eax, edx                                ; 06B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06B8 _ 8B. 45, 10
        add     eax, edx                                ; 06BB _ 01. D0
        lea     edx, [eax+4H]                           ; 06BD _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06C0 _ 8B. 45, 08
        add     edx, eax                                ; 06C3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06C5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06C9 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 06CB _ 0F B6. 45, FB
        and     eax, 04H                                ; 06CF _ 83. E0, 04
        test    eax, eax                                ; 06D2 _ 85. C0
        jz      ?_014                                   ; 06D4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06D6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06D9 _ 8B. 55, 14
        add     eax, edx                                ; 06DC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06DE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06E2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06E4 _ 8B. 45, 10
        add     eax, edx                                ; 06E7 _ 01. D0
        lea     edx, [eax+5H]                           ; 06E9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06EC _ 8B. 45, 08
        add     edx, eax                                ; 06EF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06F1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06F5 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 06F7 _ 0F B6. 45, FB
        and     eax, 02H                                ; 06FB _ 83. E0, 02
        test    eax, eax                                ; 06FE _ 85. C0
        jz      ?_015                                   ; 0700 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0702 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0705 _ 8B. 55, 14
        add     eax, edx                                ; 0708 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 070A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 070E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0710 _ 8B. 45, 10
        add     eax, edx                                ; 0713 _ 01. D0
        lea     edx, [eax+6H]                           ; 0715 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0718 _ 8B. 45, 08
        add     edx, eax                                ; 071B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 071D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0721 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0723 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0727 _ 83. E0, 01
        test    eax, eax                                ; 072A _ 85. C0
        jz      ?_016                                   ; 072C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 072E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0731 _ 8B. 55, 14
        add     eax, edx                                ; 0734 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0736 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 073A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 073C _ 8B. 45, 10
        add     eax, edx                                ; 073F _ 01. D0
        lea     edx, [eax+7H]                           ; 0741 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0744 _ 8B. 45, 08
        add     edx, eax                                ; 0747 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0749 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 074D _ 88. 02
?_016:  add     dword [ebp-4H], 1                       ; 074F _ 83. 45, FC, 01
?_017:  cmp     dword [ebp-4H], 15                      ; 0753 _ 83. 7D, FC, 0F
        jle     ?_008                                   ; 0757 _ 0F 8E, FFFFFE88
        leave                                           ; 075D _ C9
        ret                                             ; 075E _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 075F _ 55
        mov     ebp, esp                                ; 0760 _ 89. E5
        sub     esp, 28                                 ; 0762 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 0765 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 0768 _ 88. 45, FC
        jmp     ?_019                                   ; 076B _ EB, 46

?_018:  movsx   eax, byte [ebp-4H]                      ; 076D _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0771 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 0774 _ 0F B6. 12
        movsx   edx, dl                                 ; 0777 _ 0F BE. D2
        shl     edx, 4                                  ; 077A _ C1. E2, 04
        add     edx, systemFont                         ; 077D _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 0783 _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 0787 _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 078B _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 078E _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0792 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0795 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0799 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 079C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07A0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07A3 _ 89. 04 24
        call    paint_font                              ; 07A6 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 07AB _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 07AF _ 83. 45, 18, 01
?_019:  mov     eax, dword [ebp+18H]                    ; 07B3 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 07B6 _ 0F B6. 00
        test    al, al                                  ; 07B9 _ 84. C0
        jnz     ?_018                                   ; 07BB _ 75, B0
        leave                                           ; 07BD _ C9
        ret                                             ; 07BE _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 07BF _ 55
        mov     ebp, esp                                ; 07C0 _ 89. E5
        sub     esp, 20                                 ; 07C2 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 07C5 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 07C8 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 07CB _ C7. 45, F8, 00000000
        jmp     ?_026                                   ; 07D2 _ E9, 0000009C

?_020:  mov     dword [ebp-4H], 0                       ; 07D7 _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 07DE _ E9, 00000082

?_021:  mov     eax, dword [ebp-8H]                     ; 07E3 _ 8B. 45, F8
        shl     eax, 4                                  ; 07E6 _ C1. E0, 04
        mov     edx, eax                                ; 07E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07EB _ 8B. 45, FC
        add     eax, edx                                ; 07EE _ 01. D0
        add     eax, cursor.1505                        ; 07F0 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 07F5 _ 0F B6. 00
        cmp     al, 42                                  ; 07F8 _ 3C, 2A
        jnz     ?_022                                   ; 07FA _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 07FC _ 8B. 45, F8
        shl     eax, 4                                  ; 07FF _ C1. E0, 04
        mov     edx, eax                                ; 0802 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0804 _ 8B. 45, FC
        add     eax, edx                                ; 0807 _ 01. D0
        mov     edx, eax                                ; 0809 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 080B _ 8B. 45, 08
        add     eax, edx                                ; 080E _ 01. D0
        mov     byte [eax], 0                           ; 0810 _ C6. 00, 00
        jmp     ?_024                                   ; 0813 _ EB, 4C

?_022:  mov     eax, dword [ebp-8H]                     ; 0815 _ 8B. 45, F8
        shl     eax, 4                                  ; 0818 _ C1. E0, 04
        mov     edx, eax                                ; 081B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 081D _ 8B. 45, FC
        add     eax, edx                                ; 0820 _ 01. D0
        add     eax, cursor.1505                        ; 0822 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0827 _ 0F B6. 00
        cmp     al, 79                                  ; 082A _ 3C, 4F
        jnz     ?_023                                   ; 082C _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 082E _ 8B. 45, F8
        shl     eax, 4                                  ; 0831 _ C1. E0, 04
        mov     edx, eax                                ; 0834 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0836 _ 8B. 45, FC
        add     eax, edx                                ; 0839 _ 01. D0
        mov     edx, eax                                ; 083B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 083D _ 8B. 45, 08
        add     eax, edx                                ; 0840 _ 01. D0
        mov     byte [eax], 7                           ; 0842 _ C6. 00, 07
        jmp     ?_024                                   ; 0845 _ EB, 1A

?_023:  mov     eax, dword [ebp-8H]                     ; 0847 _ 8B. 45, F8
        shl     eax, 4                                  ; 084A _ C1. E0, 04
        mov     edx, eax                                ; 084D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 084F _ 8B. 45, FC
        add     eax, edx                                ; 0852 _ 01. D0
        mov     edx, eax                                ; 0854 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0856 _ 8B. 45, 08
        add     edx, eax                                ; 0859 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 085B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 085F _ 88. 02
?_024:  add     dword [ebp-4H], 1                       ; 0861 _ 83. 45, FC, 01
?_025:  cmp     dword [ebp-4H], 15                      ; 0865 _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0869 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 086F _ 83. 45, F8, 01
?_026:  cmp     dword [ebp-8H], 15                      ; 0873 _ 83. 7D, F8, 0F
        jle     ?_020                                   ; 0877 _ 0F 8E, FFFFFF5A
        leave                                           ; 087D _ C9
        ret                                             ; 087E _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 087F _ 55
        mov     ebp, esp                                ; 0880 _ 89. E5
        sub     esp, 16                                 ; 0882 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0885 _ C7. 45, F8, 00000000
        jmp     ?_030                                   ; 088C _ EB, 50

?_027:  mov     dword [ebp-4H], 0                       ; 088E _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0895 _ EB, 3B

?_028:  mov     eax, dword [ebp-8H]                     ; 0897 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 089A _ 8B. 55, 14
        add     eax, edx                                ; 089D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 089F _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 08A3 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 08A6 _ 8B. 4D, 10
        add     edx, ecx                                ; 08A9 _ 01. CA
        add     eax, edx                                ; 08AB _ 01. D0
        mov     edx, eax                                ; 08AD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08AF _ 8B. 45, 08
        add     edx, eax                                ; 08B2 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 08B4 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 08B7 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 08BB _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 08BD _ 8B. 45, FC
        add     eax, ecx                                ; 08C0 _ 01. C8
        mov     ecx, eax                                ; 08C2 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 08C4 _ 8B. 45, 20
        add     eax, ecx                                ; 08C7 _ 01. C8
        movzx   eax, byte [eax]                         ; 08C9 _ 0F B6. 00
        mov     byte [edx], al                          ; 08CC _ 88. 02
        add     dword [ebp-4H], 1                       ; 08CE _ 83. 45, FC, 01
?_029:  mov     eax, dword [ebp-4H]                     ; 08D2 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 08D5 _ 3B. 45, 18
        jl      ?_028                                   ; 08D8 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 08DA _ 83. 45, F8, 01
?_030:  mov     eax, dword [ebp-8H]                     ; 08DE _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 08E1 _ 3B. 45, 1C
        jl      ?_027                                   ; 08E4 _ 7C, A8
        leave                                           ; 08E6 _ C9
        ret                                             ; 08E7 _ C3
; paint_block End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 08E8 _ 55
        mov     ebp, esp                                ; 08E9 _ 89. E5
        sub     esp, 56                                 ; 08EB _ 83. EC, 38
        mov     eax, dword [screen_info]                ; 08EE _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 08F3 _ 89. 45, EC
        movzx   eax, word [screen_info+4H]              ; 08F6 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 08FD _ 98
        mov     dword [ebp-10H], eax                    ; 08FE _ 89. 45, F0
        movzx   eax, word [screen_info+6H]              ; 0901 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0908 _ 98
        mov     dword [ebp-0CH], eax                    ; 0909 _ 89. 45, F4
        mov     dword [esp+18H], 15                     ; 090C _ C7. 44 24, 18, 0000000F
        mov     dword [esp+14H], 255                    ; 0914 _ C7. 44 24, 14, 000000FF
        mov     dword [esp+10H], 0                      ; 091C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0924 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 092C _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0934 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0937 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 093B _ 8B. 45, EC
        mov     dword [esp], eax                        ; 093E _ 89. 04 24
        call    paint_rectangle                         ; 0941 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0946 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_033                  ; 094E _ C7. 44 24, 10, 0000000B(d)
        mov     dword [esp+0CH], 0                      ; 0956 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 095E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0966 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0969 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 096D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0970 _ 89. 04 24
        call    paint_string                            ; 0973 _ E8, FFFFFFFC(rel)
?_031:  call    io_hlt                                  ; 0978 _ E8, FFFFFFFC(rel)
        jmp     ?_031                                   ; 097D _ EB, F9
; intHandlerFromC End of function



?_032:                                                  ; byte
        db 48H, 65H, 6CH, 6CH, 6FH, 57H, 6FH, 72H       ; 0000 _ HelloWor
        db 6CH, 64H, 00H                                ; 0008 _ ld.

?_033:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4BH, 65H, 79H       ; 000B _ PS/2 Key
        db 62H, 6FH, 61H, 72H, 64H, 00H                 ; 0013 _ board.



table_rgb.1442:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1505:                                            ; byte
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



screen_info:                                            ; qword
        resq    4                                       ; 0000

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020


