; Disassembly of file: app.o
; Mon Mar 23 20:44:29 2020
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

main:   ; Function begin
        push    ebp                                     ; 0027 _ 55
        mov     ebp, esp                                ; 0028 _ 89. E5
        and     esp, 0FFFFFFF0H                         ; 002A _ 83. E4, F0
        sub     esp, 16048                              ; 002D _ 81. EC, 00003EB0
        mov     dword [esp+10H], ?_006                  ; 0033 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 003B _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 100                     ; 0043 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], 160                     ; 004B _ C7. 44 24, 04, 000000A0
        lea     eax, [esp+28H]                          ; 0053 _ 8D. 44 24, 28
        mov     dword [esp], eax                        ; 0057 _ 89. 04 24
        call    api_openwin                             ; 005A _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EA8H], eax                  ; 005F _ 89. 84 24, 00003EA8
        mov     dword [esp+14H], 0                      ; 0066 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 93                     ; 006E _ C7. 44 24, 10, 0000005D
        mov     dword [esp+0CH], 143                    ; 0076 _ C7. 44 24, 0C, 0000008F
        mov     dword [esp+8H], 26                      ; 007E _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 0086 _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA8H]                  ; 008E _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 0095 _ 89. 04 24
        call    api_boxfilwin                           ; 0098 _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EACH], 0                    ; 009D _ C7. 84 24, 00003EAC, 00000000
        mov     dword [esp+3EACH], 0                    ; 00A8 _ C7. 84 24, 00003EAC, 00000000
        jmp     ?_002                                   ; 00B3 _ E9, 00000096

?_001:  mov     edx, dword [esp+3EACH]                  ; 00B8 _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 00BF _ 89. D0
        shl     eax, 3                                  ; 00C1 _ C1. E0, 03
        add     eax, edx                                ; 00C4 _ 01. D0
        lea     edx, [eax+1AH]                          ; 00C6 _ 8D. 50, 1A
        mov     eax, dword [esp+3EACH]                  ; 00C9 _ 8B. 84 24, 00003EAC
        mov     dword [esp+14H], eax                    ; 00D0 _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 00D4 _ 89. 54 24, 10
        mov     dword [esp+0CH], 77                     ; 00D8 _ C7. 44 24, 0C, 0000004D
        mov     dword [esp+8H], 26                      ; 00E0 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 8                       ; 00E8 _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+3EA8H]                  ; 00F0 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 00F7 _ 89. 04 24
        call    api_linewin                             ; 00FA _ E8, FFFFFFFC(rel)
        mov     edx, dword [esp+3EACH]                  ; 00FF _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 0106 _ 89. D0
        shl     eax, 3                                  ; 0108 _ C1. E0, 03
        add     eax, edx                                ; 010B _ 01. D0
        lea     edx, [eax+58H]                          ; 010D _ 8D. 50, 58
        mov     eax, dword [esp+3EACH]                  ; 0110 _ 8B. 84 24, 00003EAC
        mov     dword [esp+14H], eax                    ; 0117 _ 89. 44 24, 14
        mov     dword [esp+10H], 89                     ; 011B _ C7. 44 24, 10, 00000059
        mov     dword [esp+0CH], edx                    ; 0123 _ 89. 54 24, 0C
        mov     dword [esp+8H], 26                      ; 0127 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 88                      ; 012F _ C7. 44 24, 04, 00000058
        mov     eax, dword [esp+3EA8H]                  ; 0137 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 013E _ 89. 04 24
        call    api_linewin                             ; 0141 _ E8, FFFFFFFC(rel)
        add     dword [esp+3EACH], 1                    ; 0146 _ 83. 84 24, 00003EAC, 01
?_002:  cmp     dword [esp+3EACH], 7                    ; 014E _ 83. BC 24, 00003EAC, 07
        jle     ?_001                                   ; 0156 _ 0F 8E, FFFFFF5C
        mov     dword [esp+10H], 90                     ; 015C _ C7. 44 24, 10, 0000005A
        mov     dword [esp+0CH], 154                    ; 0164 _ C7. 44 24, 0C, 0000009A
        mov     dword [esp+8H], 26                      ; 016C _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 0174 _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA8H]                  ; 017C _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 0183 _ 89. 04 24
        call    api_refreshwin                          ; 0186 _ E8, FFFFFFFC(rel)
?_003:  mov     dword [esp], 1                          ; 018B _ C7. 04 24, 00000001
        call    api_getkey                              ; 0192 _ E8, FFFFFFFC(rel)
        cmp     eax, 28                                 ; 0197 _ 83. F8, 1C
        jnz     ?_004                                   ; 019A _ 75, 02
        jmp     ?_005                                   ; 019C _ EB, 02

?_004:  jmp     ?_003                                   ; 019E _ EB, EB

?_005:  mov     eax, dword [esp+3EA8H]                  ; 01A0 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 01A7 _ 89. 04 24
        call    api_closewin                            ; 01AA _ E8, FFFFFFFC(rel)
        nop                                             ; 01AF _ 90
        leave                                           ; 01B0 _ C9
        ret                                             ; 01B1 _ C3
; main End of function



ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 





?_006:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


