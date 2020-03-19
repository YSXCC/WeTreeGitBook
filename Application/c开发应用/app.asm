; Disassembly of file: app.o
; Thu Mar 19 21:13:31 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        and     esp, 0FFFFFFF0H                         ; 0003 _ 83. E4, F0
        sub     esp, 16                                 ; 0006 _ 83. EC, 10
        mov     dword [esp], 67                         ; 0009 _ C7. 04 24, 00000043
        call    api_putchar                             ; 0010 _ E8, FFFFFFFC(rel)
        nop                                             ; 0015 _ 90
        leave                                           ; 0016 _ C9
        ret                                             ; 0017 _ C3
; main End of function






