; Disassembly of file: app.o
; Tue Mar 24 09:59:24 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






rand:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        mov     eax, dword [ran]                        ; 0003 _ A1, 00000000(d)
        imul    eax, eax, 214013                        ; 0008 _ 69. C0, 000343FD
        add     eax, 2531011                            ; 000E _ 05, 00269EC3
        mov     dword [ran], eax                        ; 0013 _ A3, 00000000(d)
        mov     eax, dword [ran]                        ; 0018 _ A1, 00000000(d)
        sar     eax, 16                                 ; 001D _ C1. F8, 10
        and     eax, 7FFFH                              ; 0020 _ 25, 00007FFF
        pop     ebp                                     ; 0025 _ 5D
        ret                                             ; 0026 _ C3
; rand End of function

intToStr:; Function begin
        push    ebp                                     ; 0027 _ 55
        mov     ebp, esp                                ; 0028 _ 89. E5
        sub     esp, 16                                 ; 002A _ 83. EC, 10
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-3H], 0                        ; 002D _ 66: C7. 45, FD, 0000
        mov     byte [ebp-1H], 0                        ; 0033 _ C6. 45, FF, 00
        mov     byte [ebp-3H], 48                       ; 0037 _ C6. 45, FD, 30
        mov     byte [ebp-1H], 0                        ; 003B _ C6. 45, FF, 00
        mov     ecx, dword [ebp+8H]                     ; 003F _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 0042 _ BA, 66666667
        mov     eax, ecx                                ; 0047 _ 89. C8
        imul    edx                                     ; 0049 _ F7. EA
        sar     edx, 2                                  ; 004B _ C1. FA, 02
        mov     eax, ecx                                ; 004E _ 89. C8
        sar     eax, 31                                 ; 0050 _ C1. F8, 1F
        sub     edx, eax                                ; 0053 _ 29. C2
        mov     eax, edx                                ; 0055 _ 89. D0
        shl     eax, 2                                  ; 0057 _ C1. E0, 02
        add     eax, edx                                ; 005A _ 01. D0
        add     eax, eax                                ; 005C _ 01. C0
        sub     ecx, eax                                ; 005E _ 29. C1
        mov     edx, ecx                                ; 0060 _ 89. CA
        mov     eax, edx                                ; 0062 _ 89. D0
        add     eax, 48                                 ; 0064 _ 83. C0, 30
        mov     byte [ebp-2H], al                       ; 0067 _ 88. 45, FE
        mov     ecx, dword [ebp+8H]                     ; 006A _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 006D _ BA, 66666667
        mov     eax, ecx                                ; 0072 _ 89. C8
        imul    edx                                     ; 0074 _ F7. EA
        sar     edx, 2                                  ; 0076 _ C1. FA, 02
        mov     eax, ecx                                ; 0079 _ 89. C8
        sar     eax, 31                                 ; 007B _ C1. F8, 1F
        sub     edx, eax                                ; 007E _ 29. C2
        mov     eax, edx                                ; 0080 _ 89. D0
        add     eax, 48                                 ; 0082 _ 83. C0, 30
        mov     byte [ebp-3H], al                       ; 0085 _ 88. 45, FD
        lea     eax, [ebp-3H]                           ; 0088 _ 8D. 45, FD
        leave                                           ; 008B _ C9
        ret                                             ; 008C _ C3
; intToStr End of function

main:   ; Function begin
        push    ebp                                     ; 008D _ 55
        mov     ebp, esp                                ; 008E _ 89. E5
        push    esi                                     ; 0090 _ 56
        push    ebx                                     ; 0091 _ 53
        and     esp, 0FFFFFFF0H                         ; 0092 _ 83. E4, F0
        sub     esp, 23680                              ; 0095 _ 81. EC, 00005C80
        mov     dword [esp+10H], ?_006                  ; 009B _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 00A3 _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 164                     ; 00AB _ C7. 44 24, 08, 000000A4
        mov     dword [esp+4H], 144                     ; 00B3 _ C7. 44 24, 04, 00000090
        lea     eax, [esp+28H]                          ; 00BB _ 8D. 44 24, 28
        mov     dword [esp], eax                        ; 00BF _ 89. 04 24
        call    api_openwin                             ; 00C2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+5C74H], eax                  ; 00C7 _ 89. 84 24, 00005C74
        mov     dword [esp+5C7CH], 0                    ; 00CE _ C7. 84 24, 00005C7C, 00000000
        jmp     ?_004                                   ; 00D9 _ E9, 000000F1

?_001:  mov     dword [esp+5C78H], 0                    ; 00DE _ C7. 84 24, 00005C78, 00000000
        jmp     ?_003                                   ; 00E9 _ E9, 000000CB

?_002:  mov     eax, dword [esp+5C78H]                  ; 00EE _ 8B. 84 24, 00005C78
        add     eax, eax                                ; 00F5 _ 01. C0
        mov     dword [esp+5C70H], eax                  ; 00F7 _ 89. 84 24, 00005C70
        mov     eax, dword [esp+5C7CH]                  ; 00FE _ 8B. 84 24, 00005C7C
        add     eax, eax                                ; 0105 _ 01. C0
        mov     dword [esp+5C6CH], eax                  ; 0107 _ 89. 84 24, 00005C6C
        mov     dword [esp+5C68H], 0                    ; 010E _ C7. 84 24, 00005C68, 00000000
        mov     eax, dword [esp+5C78H]                  ; 0119 _ 8B. 84 24, 00005C78
        lea     ecx, [eax+8H]                           ; 0120 _ 8D. 48, 08
        mov     eax, dword [esp+5C7CH]                  ; 0123 _ 8B. 84 24, 00005C7C
        lea     edx, [eax+1CH]                          ; 012A _ 8D. 50, 1C
        mov     eax, edx                                ; 012D _ 89. D0
        shl     eax, 3                                  ; 012F _ C1. E0, 03
        add     eax, edx                                ; 0132 _ 01. D0
        shl     eax, 4                                  ; 0134 _ C1. E0, 04
        lea     ebx, [ecx+eax]                          ; 0137 _ 8D. 1C 01
        mov     ecx, dword [esp+5C70H]                  ; 013A _ 8B. 8C 24, 00005C70
        mov     edx, 799063683                          ; 0141 _ BA, 2FA0BE83
        mov     eax, ecx                                ; 0146 _ 89. C8
        imul    edx                                     ; 0148 _ F7. EA
        sar     edx, 3                                  ; 014A _ C1. FA, 03
        mov     eax, ecx                                ; 014D _ 89. C8
        sar     eax, 31                                 ; 014F _ C1. F8, 1F
        sub     edx, eax                                ; 0152 _ 29. C2
        mov     eax, edx                                ; 0154 _ 89. D0
        mov     esi, eax                                ; 0156 _ 89. C6
        mov     ecx, dword [esp+5C6CH]                  ; 0158 _ 8B. 8C 24, 00005C6C
        mov     edx, 799063683                          ; 015F _ BA, 2FA0BE83
        mov     eax, ecx                                ; 0164 _ 89. C8
        imul    edx                                     ; 0166 _ F7. EA
        sar     edx, 3                                  ; 0168 _ C1. FA, 03
        mov     eax, ecx                                ; 016B _ 89. C8
        sar     eax, 31                                 ; 016D _ C1. F8, 1F
        sub     edx, eax                                ; 0170 _ 29. C2
        mov     eax, edx                                ; 0172 _ 89. D0
        mov     edx, eax                                ; 0174 _ 89. C2
        mov     eax, edx                                ; 0176 _ 89. D0
        add     eax, eax                                ; 0178 _ 01. C0
        add     eax, edx                                ; 017A _ 01. D0
        add     eax, eax                                ; 017C _ 01. C0
        add     esi, eax                                ; 017E _ 01. C6
        mov     ecx, dword [esp+5C68H]                  ; 0180 _ 8B. 8C 24, 00005C68
        mov     edx, 799063683                          ; 0187 _ BA, 2FA0BE83
        mov     eax, ecx                                ; 018C _ 89. C8
        imul    edx                                     ; 018E _ F7. EA
        sar     edx, 3                                  ; 0190 _ C1. FA, 03
        mov     eax, ecx                                ; 0193 _ 89. C8
        sar     eax, 31                                 ; 0195 _ C1. F8, 1F
        sub     edx, eax                                ; 0198 _ 29. C2
        mov     eax, edx                                ; 019A _ 89. D0
        mov     edx, eax                                ; 019C _ 89. C2
        mov     eax, edx                                ; 019E _ 89. D0
        shl     eax, 3                                  ; 01A0 _ C1. E0, 03
        add     eax, edx                                ; 01A3 _ 01. D0
        shl     eax, 2                                  ; 01A5 _ C1. E0, 02
        add     eax, esi                                ; 01A8 _ 01. F0
        add     eax, 16                                 ; 01AA _ 83. C0, 10
        mov     byte [esp+ebx+28H], al                  ; 01AD _ 88. 44 1C, 28
        add     dword [esp+5C78H], 1                    ; 01B1 _ 83. 84 24, 00005C78, 01
?_003:  cmp     dword [esp+5C78H], 127                  ; 01B9 _ 83. BC 24, 00005C78, 7F
        jle     ?_002                                   ; 01C1 _ 0F 8E, FFFFFF27
        add     dword [esp+5C7CH], 1                    ; 01C7 _ 83. 84 24, 00005C7C, 01
?_004:  cmp     dword [esp+5C7CH], 127                  ; 01CF _ 83. BC 24, 00005C7C, 7F
        jle     ?_001                                   ; 01D7 _ 0F 8E, FFFFFF01
        mov     dword [esp+10H], 156                    ; 01DD _ C7. 44 24, 10, 0000009C
        mov     dword [esp+0CH], 136                    ; 01E5 _ C7. 44 24, 0C, 00000088
        mov     dword [esp+8H], 28                      ; 01ED _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 01F5 _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+5C74H]                  ; 01FD _ 8B. 84 24, 00005C74
        mov     dword [esp], eax                        ; 0204 _ 89. 04 24
        call    api_refreshwin                          ; 0207 _ E8, FFFFFFFC(rel)
        nop                                             ; 020C _ 90
?_005:  mov     dword [esp], 1                          ; 020D _ C7. 04 24, 00000001
        call    api_getkey                              ; 0214 _ E8, FFFFFFFC(rel)
        cmp     eax, 28                                 ; 0219 _ 83. F8, 1C
        jnz     ?_005                                   ; 021C _ 75, EF
        mov     eax, dword [esp+5C74H]                  ; 021E _ 8B. 84 24, 00005C74
        mov     dword [esp], eax                        ; 0225 _ 89. 04 24
        call    api_closewin                            ; 0228 _ E8, FFFFFFFC(rel)
        nop                                             ; 022D _ 90
        lea     esp, [ebp-8H]                           ; 022E _ 8D. 65, F8
        pop     ebx                                     ; 0231 _ 5B
        pop     esi                                     ; 0232 _ 5E
        pop     ebp                                     ; 0233 _ 5D
        ret                                             ; 0234 _ C3
; main End of function



ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 





?_006:                                                  ; byte
        db 63H, 6FH, 6CH, 6FH, 72H, 32H, 00H            ; 0000 _ color2.


