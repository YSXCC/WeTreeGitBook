; Disassembly of file: app.o
; Tue Mar 24 16:15:28 2020
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
        sub     esp, 16048                              ; 002D _ 81. EC, 00003EB0
        mov     dword [esp+3EA8H], 291                  ; 0033 _ C7. 84 24, 00003EA8, 00000123
        mov     eax, dword [esp+3EA8H]                  ; 003E _ 8B. 84 24, 00003EA8
        mov     byte [eax], 97                          ; 0045 _ C6. 00, 61
        mov     eax, dword [esp+3EA8H]                  ; 0048 _ 8B. 84 24, 00003EA8
        add     eax, 1                                  ; 004F _ 83. C0, 01
        mov     byte [eax], 112                         ; 0052 _ C6. 00, 70
        mov     eax, dword [esp+3EA8H]                  ; 0055 _ 8B. 84 24, 00003EA8
        add     eax, 2                                  ; 005C _ 83. C0, 02
        mov     byte [eax], 112                         ; 005F _ C6. 00, 70
        mov     eax, dword [esp+3EA8H]                  ; 0062 _ 8B. 84 24, 00003EA8
        add     eax, 3                                  ; 0069 _ 83. C0, 03
        mov     byte [eax], 0                           ; 006C _ C6. 00, 00
        mov     dword [esp+10H], ?_004                  ; 006F _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 0077 _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 100                     ; 007F _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], 150                     ; 0087 _ C7. 44 24, 04, 00000096
        lea     eax, [esp+24H]                          ; 008F _ 8D. 44 24, 24
        mov     dword [esp], eax                        ; 0093 _ 89. 04 24
        call    api_openwin                             ; 0096 _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EA4H], eax                  ; 009B _ 89. 84 24, 00003EA4
        mov     dword [esp+14H], 0                      ; 00A2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 93                     ; 00AA _ C7. 44 24, 10, 0000005D
        mov     dword [esp+0CH], 143                    ; 00B2 _ C7. 44 24, 0C, 0000008F
        mov     dword [esp+8H], 26                      ; 00BA _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 00C2 _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA4H]                  ; 00CA _ 8B. 84 24, 00003EA4
        mov     dword [esp], eax                        ; 00D1 _ 89. 04 24
        call    api_boxfilwin                           ; 00D4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EACH], 0                    ; 00D9 _ C7. 84 24, 00003EAC, 00000000
        mov     dword [esp+3EACH], 0                    ; 00E4 _ C7. 84 24, 00003EAC, 00000000
        jmp     ?_002                                   ; 00EF _ E9, 00000090

?_001:  mov     edx, dword [esp+3EACH]                  ; 00F4 _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 00FB _ 89. D0
        shl     eax, 3                                  ; 00FD _ C1. E0, 03
        add     eax, edx                                ; 0100 _ 01. D0
        add     eax, 26                                 ; 0102 _ 83. C0, 1A
        mov     dword [esp+14H], 4                      ; 0105 _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], eax                    ; 010D _ 89. 44 24, 10
        mov     dword [esp+0CH], 77                     ; 0111 _ C7. 44 24, 0C, 0000004D
        mov     dword [esp+8H], 26                      ; 0119 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 8                       ; 0121 _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+3EA4H]                  ; 0129 _ 8B. 84 24, 00003EA4
        mov     dword [esp], eax                        ; 0130 _ 89. 04 24
        call    api_linewin                             ; 0133 _ E8, FFFFFFFC(rel)
        mov     edx, dword [esp+3EACH]                  ; 0138 _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 013F _ 89. D0
        shl     eax, 3                                  ; 0141 _ C1. E0, 03
        add     eax, edx                                ; 0144 _ 01. D0
        add     eax, 88                                 ; 0146 _ 83. C0, 58
        mov     dword [esp+14H], 4                      ; 0149 _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], 89                     ; 0151 _ C7. 44 24, 10, 00000059
        mov     dword [esp+0CH], eax                    ; 0159 _ 89. 44 24, 0C
        mov     dword [esp+8H], 26                      ; 015D _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 88                      ; 0165 _ C7. 44 24, 04, 00000058
        mov     eax, dword [esp+3EA4H]                  ; 016D _ 8B. 84 24, 00003EA4
        mov     dword [esp], eax                        ; 0174 _ 89. 04 24
        call    api_linewin                             ; 0177 _ E8, FFFFFFFC(rel)
        add     dword [esp+3EACH], 1                    ; 017C _ 83. 84 24, 00003EAC, 01
?_002:  cmp     dword [esp+3EACH], 7                    ; 0184 _ 83. BC 24, 00003EAC, 07
        jle     ?_001                                   ; 018C _ 0F 8E, FFFFFF62
        mov     dword [esp+10H], 90                     ; 0192 _ C7. 44 24, 10, 0000005A
        mov     dword [esp+0CH], 154                    ; 019A _ C7. 44 24, 0C, 0000009A
        mov     dword [esp+8H], 26                      ; 01A2 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 01AA _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA4H]                  ; 01B2 _ 8B. 84 24, 00003EA4
        mov     dword [esp], eax                        ; 01B9 _ 89. 04 24
        call    api_refreshwin                          ; 01BC _ E8, FFFFFFFC(rel)
        nop                                             ; 01C1 _ 90
?_003:  mov     dword [esp], 1                          ; 01C2 _ C7. 04 24, 00000001
        call    api_getkey                              ; 01C9 _ E8, FFFFFFFC(rel)
        cmp     eax, 28                                 ; 01CE _ 83. F8, 1C
        jnz     ?_003                                   ; 01D1 _ 75, EF
        mov     eax, dword [esp+3EA4H]                  ; 01D3 _ 8B. 84 24, 00003EA4
        mov     dword [esp], eax                        ; 01DA _ 89. 04 24
        call    api_closewin                            ; 01DD _ E8, FFFFFFFC(rel)
        nop                                             ; 01E2 _ 90
        leave                                           ; 01E3 _ C9
        ret                                             ; 01E4 _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_004:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


