; Disassembly of file: ckernel.o
; Tue Feb 11 21:53:06 2020
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

init_screeninfo:; Function begin
        push    ebp                                     ; 0055 _ 55
        mov     ebp, esp                                ; 0056 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0058 _ A1, 00000000(d)
        mov     edx, eax                                ; 005D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 005F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0062 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0064 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0067 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 006D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0070 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0076 _ 5D
        ret                                             ; 0077 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0078 _ 55
        mov     ebp, esp                                ; 0079 _ 89. E5
        sub     esp, 24                                 ; 007B _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1415          ; 007E _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0086 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 008E _ C7. 04 24, 00000000
        call    set_palette                             ; 0095 _ E8, FFFFFFFC(rel)
        nop                                             ; 009A _ 90
        leave                                           ; 009B _ C9
        ret                                             ; 009C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 009D _ 55
        mov     ebp, esp                                ; 009E _ 89. E5
        sub     esp, 40                                 ; 00A0 _ 83. EC, 28
        call    io_load_eflags                          ; 00A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 00A8 _ 89. 45, F4
        call    io_cli                                  ; 00AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 00B0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 00B3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 00B7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 00BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 00C3 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 00C6 _ 89. 45, F0
        jmp     ?_003                                   ; 00C9 _ EB, 62

?_002:  mov     eax, dword [ebp+10H]                    ; 00CB _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 00CE _ 0F B6. 00
        shr     al, 2                                   ; 00D1 _ C0. E8, 02
        movzx   eax, al                                 ; 00D4 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00D7 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00DB _ C7. 04 24, 000003C9
        call    io_out8                                 ; 00E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 00E7 _ 8B. 45, 10
        add     eax, 1                                  ; 00EA _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 00ED _ 0F B6. 00
        shr     al, 2                                   ; 00F0 _ C0. E8, 02
        movzx   eax, al                                 ; 00F3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 00F6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 00FA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0101 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0106 _ 8B. 45, 10
        add     eax, 2                                  ; 0109 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 010C _ 0F B6. 00
        shr     al, 2                                   ; 010F _ C0. E8, 02
        movzx   eax, al                                 ; 0112 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0115 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0119 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0120 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0125 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0129 _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 012D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0130 _ 3B. 45, 0C
        jle     ?_002                                   ; 0133 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0135 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0138 _ 89. 04 24
        call    io_store_eflags                         ; 013B _ E8, FFFFFFFC(rel)
        nop                                             ; 0140 _ 90
        leave                                           ; 0141 _ C9
        ret                                             ; 0142 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0143 _ 55
        mov     ebp, esp                                ; 0144 _ 89. E5
        sub     esp, 20                                 ; 0146 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0149 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 014C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 014F _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0152 _ 89. 45, FC
        jmp     ?_007                                   ; 0155 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0157 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 015A _ 89. 45, F8
        jmp     ?_006                                   ; 015D _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 015F _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0162 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0166 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0168 _ 8B. 45, F8
        add     eax, edx                                ; 016B _ 01. D0
        mov     edx, eax                                ; 016D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 016F _ 8B. 45, 08
        add     edx, eax                                ; 0172 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0174 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0178 _ 88. 02
        add     dword [ebp-8H], 1                       ; 017A _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 017E _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0181 _ 3B. 45, 1C
        jle     ?_005                                   ; 0184 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0186 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 018A _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 018D _ 3B. 45, 20
        jle     ?_004                                   ; 0190 _ 7E, C5
        leave                                           ; 0192 _ C9
        ret                                             ; 0193 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0194 _ 55
        mov     ebp, esp                                ; 0195 _ 89. E5
        push    ebx                                     ; 0197 _ 53
        sub     esp, 28                                 ; 0198 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 019B _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 019E _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 01A1 _ 8B. 45, 0C
        sub     eax, 1                                  ; 01A4 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 01A7 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 01AB _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 01AF _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 01B7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 01BF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 01C7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 01CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 01CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 01D1 _ 89. 04 24
        call    paint_rectangle                         ; 01D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01D9 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 01DC _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 01DF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 01E2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 01E5 _ 8B. 45, 10
        sub     eax, 28                                 ; 01E8 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 01EB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 01EF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 01F3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 01FF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0207 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 020A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 020E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0211 _ 89. 04 24
        call    paint_rectangle                         ; 0214 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0219 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 021C _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 021F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0222 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0225 _ 8B. 45, 10
        sub     eax, 27                                 ; 0228 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 022B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 022F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0233 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0237 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 023F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0247 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 024A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 024E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0251 _ 89. 04 24
        call    paint_rectangle                         ; 0254 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0259 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 025C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 025F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0262 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0265 _ 8B. 45, 10
        sub     eax, 26                                 ; 0268 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 026B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 026F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0273 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0277 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 027F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0287 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 028A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 028E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0291 _ 89. 04 24
        call    paint_rectangle                         ; 0294 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0299 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 029C _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 029F _ 8B. 45, 10
        sub     eax, 24                                 ; 02A2 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 02A5 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 02A9 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 02B1 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 02B5 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 02BD _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 02C5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02C8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02CC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02CF _ 89. 04 24
        call    paint_rectangle                         ; 02D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02D7 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 02DA _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 02DD _ 8B. 45, 10
        sub     eax, 24                                 ; 02E0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 02E3 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 02E7 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 02EF _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 02F3 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 02FB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0303 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0306 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 030A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 030D _ 89. 04 24
        call    paint_rectangle                         ; 0310 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0315 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0318 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 031B _ 8B. 45, 10
        sub     eax, 4                                  ; 031E _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0321 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0325 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 032D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0331 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0339 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0341 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0344 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0348 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 034B _ 89. 04 24
        call    paint_rectangle                         ; 034E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0353 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0356 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0359 _ 8B. 45, 10
        sub     eax, 23                                 ; 035C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 035F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0363 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 036B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 036F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0377 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 037F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0382 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0386 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0389 _ 89. 04 24
        call    paint_rectangle                         ; 038C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0391 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0394 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0397 _ 8B. 45, 10
        sub     eax, 3                                  ; 039A _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 039D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 03A1 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 03A9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 03AD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 03B5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 03BD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03C0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03C4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03C7 _ 89. 04 24
        call    paint_rectangle                         ; 03CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03CF _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 03D2 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 03D5 _ 8B. 45, 10
        sub     eax, 24                                 ; 03D8 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 03DB _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 03DF _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 03E7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 03EB _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 03F3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 03FB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03FE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0402 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0405 _ 89. 04 24
        call    paint_rectangle                         ; 0408 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 040D _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0410 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0413 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0416 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0419 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 041C _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 041F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0422 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0425 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0429 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 042D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0431 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0435 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 043D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0440 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0444 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0447 _ 89. 04 24
        call    paint_rectangle                         ; 044A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 044F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0452 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0455 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0458 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 045B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 045E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0461 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0464 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0467 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 046B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 046F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0473 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0477 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 047F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0482 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0486 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    paint_rectangle                         ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0491 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0494 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0497 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 049A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 049D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 04A0 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 04A3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04A6 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 04A9 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04AD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04B1 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04B5 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 04B9 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04CB _ 89. 04 24
        call    paint_rectangle                         ; 04CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04D3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 04D6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 04D9 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 04DC _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 04DF _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04E2 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04E5 _ 8B. 45, 0C
        sub     eax, 3                                  ; 04E8 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 04EB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04EF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04F3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04F7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 04FB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0503 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0506 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 050A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 050D _ 89. 04 24
        call    paint_rectangle                         ; 0510 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0515 _ 83. C4, 1C
        pop     ebx                                     ; 0518 _ 5B
        pop     ebp                                     ; 0519 _ 5D
        ret                                             ; 051A _ C3
; init_desktop End of function



table_rgb.1415:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........



screen_info:                                            ; qword
        resq    1                                       ; 0000


