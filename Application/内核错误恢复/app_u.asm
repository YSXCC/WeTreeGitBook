; Disassembly of file: app.o
; Sat Mar 21 09:32:31 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global main: function


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 16                                 ; 0003 _ 83. EC, 10
        mov     dword [ebp-4H], 256                     ; 0006 _ C7. 45, FC, 00000100
        mov     eax, dword [ebp-4H]                     ; 000D _ 8B. 45, FC
        mov     byte [eax], 97                          ; 0010 _ C6. 00, 61
        mov     eax, dword [ebp-4H]                     ; 0013 _ 8B. 45, FC
        add     eax, 1                                  ; 0016 _ 83. C0, 01
        mov     byte [eax], 112                         ; 0019 _ C6. 00, 70
        mov     eax, dword [ebp-4H]                     ; 001C _ 8B. 45, FC
        add     eax, 2                                  ; 001F _ 83. C0, 02
        mov     byte [eax], 112                         ; 0022 _ C6. 00, 70
        mov     eax, dword [ebp-4H]                     ; 0025 _ 8B. 45, FC
        add     eax, 3                                  ; 0028 _ 83. C0, 03
        mov     byte [eax], 0                           ; 002B _ C6. 00, 00
        nop                                             ; 002E _ 90
        leave                                           ; 002F _ C9
        ret                                             ; 0030 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


