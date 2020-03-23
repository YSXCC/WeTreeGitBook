; Disassembly of file: app.o
; Mon Mar 23 15:18:53 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        and     esp, 0FFFFFFF0H                         ; 0003 _ 83. E4, F0
        sub     esp, 7536                               ; 0006 _ 81. EC, 00001D70
        mov     dword [esp+10H], ?_001                  ; 000C _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 0014 _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 50                      ; 001C _ C7. 44 24, 08, 00000032
        mov     dword [esp+4H], 150                     ; 0024 _ C7. 44 24, 04, 00000096
        lea     eax, [esp+20H]                          ; 002C _ 8D. 44 24, 20
        mov     dword [esp], eax                        ; 0030 _ 89. 04 24
        call    api_openwin                             ; 0033 _ E8, FFFFFFFC(rel)
        mov     dword [esp+1D6CH], eax                  ; 0038 _ 89. 84 24, 00001D6C
        mov     dword [esp+14H], 3                      ; 003F _ C7. 44 24, 14, 00000003
        mov     dword [esp+10H], 43                     ; 0047 _ C7. 44 24, 10, 0000002B
        mov     dword [esp+0CH], 141                    ; 004F _ C7. 44 24, 0C, 0000008D
        mov     dword [esp+8H], 36                      ; 0057 _ C7. 44 24, 08, 00000024
        mov     dword [esp+4H], 8                       ; 005F _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+1D6CH]                  ; 0067 _ 8B. 84 24, 00001D6C
        mov     dword [esp], eax                        ; 006E _ 89. 04 24
        call    api_boxfilwin                           ; 0071 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], ?_002                  ; 0076 _ C7. 44 24, 14, 00000006(d)
        mov     dword [esp+10H], 12                     ; 007E _ C7. 44 24, 10, 0000000C
        mov     dword [esp+0CH], 0                      ; 0086 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 28                      ; 008E _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 28                      ; 0096 _ C7. 44 24, 04, 0000001C
        mov     eax, dword [esp+1D6CH]                  ; 009E _ 8B. 84 24, 00001D6C
        mov     dword [esp], eax                        ; 00A5 _ 89. 04 24
        call    api_putstrwin                           ; 00A8 _ E8, FFFFFFFC(rel)
        nop                                             ; 00AD _ 90
        leave                                           ; 00AE _ C9
        ret                                             ; 00AF _ C3
; main End of function







?_001:                                                  ; byte
        db 68H, 65H, 6CH, 6CH, 6FH, 00H                 ; 0000 _ hello.

?_002:                                                  ; byte
        db 68H, 65H, 6CH, 6CH, 6FH, 2CH, 20H, 77H       ; 0006 _ hello, w
        db 6FH, 72H, 6CH, 64H, 00H                      ; 000E _ orld.


