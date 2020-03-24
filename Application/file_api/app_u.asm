; Disassembly of file: app.o
; Tue Mar 24 16:28:15 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global rand: function
global main: function
global ran

extern api_closewin                                     ; near
extern api_getkey                                       ; near
extern api_refreshwin                                   ; near
extern api_linewin                                      ; near
extern api_boxfilwin                                    ; near
extern api_openwin                                      ; near
extern api_putchar                                      ; near
extern api_fread                                        ; near
extern api_fseek                                        ; near
extern api_fopen                                        ; near


SECTION .text   align=1 execute                         ; section number 1, code

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
        sub     esp, 16064                              ; 002D _ 81. EC, 00003EC0
        mov     dword [esp], ?_008                      ; 0033 _ C7. 04 24, 00000000(d)
        call    api_fopen                               ; 003A _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EB4H], eax                  ; 003F _ 89. 84 24, 00003EB4
        mov     dword [esp+3EBCH], 0                    ; 0046 _ C7. 84 24, 00003EBC, 00000000
        mov     dword [esp+8H], 0                       ; 0051 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 5                       ; 0059 _ C7. 44 24, 04, 00000005
        mov     eax, dword [esp+3EB4H]                  ; 0061 _ 8B. 84 24, 00003EB4
        mov     dword [esp], eax                        ; 0068 _ 89. 04 24
        call    api_fseek                               ; 006B _ E8, FFFFFFFC(rel)
        cmp     dword [esp+3EB4H], 0                    ; 0070 _ 83. BC 24, 00003EB4, 00
        jz      ?_004                                   ; 0078 _ 74, 5A
        mov     dword [esp+3EBCH], 0                    ; 007A _ C7. 84 24, 00003EBC, 00000000
        jmp     ?_003                                   ; 0085 _ EB, 43

?_001:  mov     eax, dword [esp+3EB4H]                  ; 0087 _ 8B. 84 24, 00003EB4
        mov     dword [esp+8H], eax                     ; 008E _ 89. 44 24, 08
        mov     dword [esp+4H], 1                       ; 0092 _ C7. 44 24, 04, 00000001
        lea     eax, [esp+3EAEH]                        ; 009A _ 8D. 84 24, 00003EAE
        mov     dword [esp], eax                        ; 00A1 _ 89. 04 24
        call    api_fread                               ; 00A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 00A9 _ 85. C0
        jnz     ?_002                                   ; 00AB _ 75, 02
        jmp     ?_004                                   ; 00AD _ EB, 25

?_002:  movzx   eax, byte [esp+3EAEH]                   ; 00AF _ 0F B6. 84 24, 00003EAE
        movsx   eax, al                                 ; 00B7 _ 0F BE. C0
        mov     dword [esp], eax                        ; 00BA _ 89. 04 24
        call    api_putchar                             ; 00BD _ E8, FFFFFFFC(rel)
        add     dword [esp+3EBCH], 1                    ; 00C2 _ 83. 84 24, 00003EBC, 01
?_003:  cmp     dword [esp+3EBCH], 9                    ; 00CA _ 83. BC 24, 00003EBC, 09
        jle     ?_001                                   ; 00D2 _ 7E, B3
?_004:  mov     dword [esp+10H], ?_009                  ; 00D4 _ C7. 44 24, 10, 00000008(d)
        mov     dword [esp+0CH], -1                     ; 00DC _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 100                     ; 00E4 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], 150                     ; 00EC _ C7. 44 24, 04, 00000096
        lea     eax, [esp+2EH]                          ; 00F4 _ 8D. 44 24, 2E
        mov     dword [esp], eax                        ; 00F8 _ 89. 04 24
        call    api_openwin                             ; 00FB _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EB0H], eax                  ; 0100 _ 89. 84 24, 00003EB0
        mov     dword [esp+14H], 0                      ; 0107 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 93                     ; 010F _ C7. 44 24, 10, 0000005D
        mov     dword [esp+0CH], 143                    ; 0117 _ C7. 44 24, 0C, 0000008F
        mov     dword [esp+8H], 26                      ; 011F _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 0127 _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EB0H]                  ; 012F _ 8B. 84 24, 00003EB0
        mov     dword [esp], eax                        ; 0136 _ 89. 04 24
        call    api_boxfilwin                           ; 0139 _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EB8H], 0                    ; 013E _ C7. 84 24, 00003EB8, 00000000
        mov     dword [esp+3EB8H], 0                    ; 0149 _ C7. 84 24, 00003EB8, 00000000
        jmp     ?_006                                   ; 0154 _ E9, 00000090

?_005:  mov     edx, dword [esp+3EB8H]                  ; 0159 _ 8B. 94 24, 00003EB8
        mov     eax, edx                                ; 0160 _ 89. D0
        shl     eax, 3                                  ; 0162 _ C1. E0, 03
        add     eax, edx                                ; 0165 _ 01. D0
        add     eax, 26                                 ; 0167 _ 83. C0, 1A
        mov     dword [esp+14H], 4                      ; 016A _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], eax                    ; 0172 _ 89. 44 24, 10
        mov     dword [esp+0CH], 77                     ; 0176 _ C7. 44 24, 0C, 0000004D
        mov     dword [esp+8H], 26                      ; 017E _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 8                       ; 0186 _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+3EB0H]                  ; 018E _ 8B. 84 24, 00003EB0
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    api_linewin                             ; 0198 _ E8, FFFFFFFC(rel)
        mov     edx, dword [esp+3EB8H]                  ; 019D _ 8B. 94 24, 00003EB8
        mov     eax, edx                                ; 01A4 _ 89. D0
        shl     eax, 3                                  ; 01A6 _ C1. E0, 03
        add     eax, edx                                ; 01A9 _ 01. D0
        add     eax, 88                                 ; 01AB _ 83. C0, 58
        mov     dword [esp+14H], 4                      ; 01AE _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], 89                     ; 01B6 _ C7. 44 24, 10, 00000059
        mov     dword [esp+0CH], eax                    ; 01BE _ 89. 44 24, 0C
        mov     dword [esp+8H], 26                      ; 01C2 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 88                      ; 01CA _ C7. 44 24, 04, 00000058
        mov     eax, dword [esp+3EB0H]                  ; 01D2 _ 8B. 84 24, 00003EB0
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    api_linewin                             ; 01DC _ E8, FFFFFFFC(rel)
        add     dword [esp+3EB8H], 1                    ; 01E1 _ 83. 84 24, 00003EB8, 01
?_006:  cmp     dword [esp+3EB8H], 7                    ; 01E9 _ 83. BC 24, 00003EB8, 07
        jle     ?_005                                   ; 01F1 _ 0F 8E, FFFFFF62
        mov     dword [esp+10H], 90                     ; 01F7 _ C7. 44 24, 10, 0000005A
        mov     dword [esp+0CH], 154                    ; 01FF _ C7. 44 24, 0C, 0000009A
        mov     dword [esp+8H], 26                      ; 0207 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 020F _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EB0H]                  ; 0217 _ 8B. 84 24, 00003EB0
        mov     dword [esp], eax                        ; 021E _ 89. 04 24
        call    api_refreshwin                          ; 0221 _ E8, FFFFFFFC(rel)
        nop                                             ; 0226 _ 90
?_007:  mov     dword [esp], 1                          ; 0227 _ C7. 04 24, 00000001
        call    api_getkey                              ; 022E _ E8, FFFFFFFC(rel)
        cmp     eax, 28                                 ; 0233 _ 83. F8, 1C
        jnz     ?_007                                   ; 0236 _ 75, EF
        mov     eax, dword [esp+3EB0H]                  ; 0238 _ 8B. 84 24, 00003EB0
        mov     dword [esp], eax                        ; 023F _ 89. 04 24
        call    api_closewin                            ; 0242 _ E8, FFFFFFFC(rel)
        nop                                             ; 0247 _ 90
        leave                                           ; 0248 _ C9
        ret                                             ; 0249 _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_008:                                                  ; byte
        db 69H, 6AH, 6BH, 2EH, 74H, 78H, 74H, 00H       ; 0000 _ ijk.txt.

?_009:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0008 _ star.


