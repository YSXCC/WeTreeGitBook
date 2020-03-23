; Disassembly of file: app.o
; Mon Mar 23 14:24:07 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global main: function


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
?_001:  jmp     ?_001                                   ; 0003 _ EB, FE
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


