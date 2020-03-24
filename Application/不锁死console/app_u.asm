; Disassembly of file: app.o
; Tue Mar 24 14:28:56 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global rand: function
global intToStr: function
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
        and     esp, 0FFFFFFF0H                         ; 0090 _ 83. E4, F0
        sub     esp, 16048                              ; 0093 _ 81. EC, 00003EB0
        mov     dword [esp+10H], ?_004                  ; 0099 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 00A1 _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 100                     ; 00A9 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], 150                     ; 00B1 _ C7. 44 24, 04, 00000096
        lea     eax, [esp+28H]                          ; 00B9 _ 8D. 44 24, 28
        mov     dword [esp], eax                        ; 00BD _ 89. 04 24
        call    api_openwin                             ; 00C0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EA8H], eax                  ; 00C5 _ 89. 84 24, 00003EA8
        mov     dword [esp+14H], 0                      ; 00CC _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 93                     ; 00D4 _ C7. 44 24, 10, 0000005D
        mov     dword [esp+0CH], 143                    ; 00DC _ C7. 44 24, 0C, 0000008F
        mov     dword [esp+8H], 26                      ; 00E4 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 00EC _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA8H]                  ; 00F4 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    api_boxfilwin                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+3EACH], 0                    ; 0103 _ C7. 84 24, 00003EAC, 00000000
        mov     dword [esp+3EACH], 0                    ; 010E _ C7. 84 24, 00003EAC, 00000000
        jmp     ?_002                                   ; 0119 _ E9, 00000090

?_001:  mov     edx, dword [esp+3EACH]                  ; 011E _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 0125 _ 89. D0
        shl     eax, 3                                  ; 0127 _ C1. E0, 03
        add     eax, edx                                ; 012A _ 01. D0
        add     eax, 26                                 ; 012C _ 83. C0, 1A
        mov     dword [esp+14H], 4                      ; 012F _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], eax                    ; 0137 _ 89. 44 24, 10
        mov     dword [esp+0CH], 77                     ; 013B _ C7. 44 24, 0C, 0000004D
        mov     dword [esp+8H], 26                      ; 0143 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 8                       ; 014B _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+3EA8H]                  ; 0153 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 015A _ 89. 04 24
        call    api_linewin                             ; 015D _ E8, FFFFFFFC(rel)
        mov     edx, dword [esp+3EACH]                  ; 0162 _ 8B. 94 24, 00003EAC
        mov     eax, edx                                ; 0169 _ 89. D0
        shl     eax, 3                                  ; 016B _ C1. E0, 03
        add     eax, edx                                ; 016E _ 01. D0
        add     eax, 88                                 ; 0170 _ 83. C0, 58
        mov     dword [esp+14H], 4                      ; 0173 _ C7. 44 24, 14, 00000004
        mov     dword [esp+10H], 89                     ; 017B _ C7. 44 24, 10, 00000059
        mov     dword [esp+0CH], eax                    ; 0183 _ 89. 44 24, 0C
        mov     dword [esp+8H], 26                      ; 0187 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 88                      ; 018F _ C7. 44 24, 04, 00000058
        mov     eax, dword [esp+3EA8H]                  ; 0197 _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 019E _ 89. 04 24
        call    api_linewin                             ; 01A1 _ E8, FFFFFFFC(rel)
        add     dword [esp+3EACH], 1                    ; 01A6 _ 83. 84 24, 00003EAC, 01
?_002:  cmp     dword [esp+3EACH], 7                    ; 01AE _ 83. BC 24, 00003EAC, 07
        jle     ?_001                                   ; 01B6 _ 0F 8E, FFFFFF62
        mov     dword [esp+10H], 90                     ; 01BC _ C7. 44 24, 10, 0000005A
        mov     dword [esp+0CH], 154                    ; 01C4 _ C7. 44 24, 0C, 0000009A
        mov     dword [esp+8H], 26                      ; 01CC _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 6                       ; 01D4 _ C7. 44 24, 04, 00000006
        mov     eax, dword [esp+3EA8H]                  ; 01DC _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 01E3 _ 89. 04 24
        call    api_refreshwin                          ; 01E6 _ E8, FFFFFFFC(rel)
        nop                                             ; 01EB _ 90
?_003:  mov     dword [esp], 1                          ; 01EC _ C7. 04 24, 00000001
        call    api_getkey                              ; 01F3 _ E8, FFFFFFFC(rel)
        cmp     eax, 28                                 ; 01F8 _ 83. F8, 1C
        jnz     ?_003                                   ; 01FB _ 75, EF
        mov     eax, dword [esp+3EA8H]                  ; 01FD _ 8B. 84 24, 00003EA8
        mov     dword [esp], eax                        ; 0204 _ 89. 04 24
        call    api_closewin                            ; 0207 _ E8, FFFFFFFC(rel)
        nop                                             ; 020C _ 90
        leave                                           ; 020D _ C9
        ret                                             ; 020E _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_004:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


