; Disassembly of file: ckernel.o
; Mon Feb 17 15:50:19 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 0018 _ 89. 45, DC
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-20H], eax                    ; 0023 _ 89. 45, E0
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-1CH], eax                    ; 002E _ 89. 45, E4
        call    init_mouse_position                     ; 0031 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0036 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 003B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0040 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0045 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 004A _ 89. 45, E8
        call    get_memory_address                      ; 004D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0052 _ 89. 45, EC
        call    io_sti                                  ; 0055 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 005A _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 005D _ 89. 44 24, 08
        mov     eax, dword [ebp-20H]                    ; 0061 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0064 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0068 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 006B _ 89. 04 24
        call    init_desktop                            ; 006E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 2                       ; 0073 _ C7. 44 24, 04, 00000002
        mov     dword [esp], mouse_cursor_buf           ; 007B _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0082 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0087 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 008D _ A1, 00000000(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0092 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 16                     ; 009A _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 00A2 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 00AA _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 00AE _ 89. 44 24, 08
        mov     eax, dword [ebp-20H]                    ; 00B2 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 00B5 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 00B9 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    paint_block                             ; 00BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 00C4 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 00C7 _ 89. 04 24
        call    intToHexStr                             ; 00CA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 00CF _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 00D2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 00DA _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 00DD _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 00E1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 00E9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 00F1 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 00F4 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 00F8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    paint_string                            ; 00FE _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0103 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 0108 _ C7. 45, F4, 00000000
        mov     dword [ebp-28H], 0                      ; 010F _ C7. 45, D8, 00000000
?_001:  call    io_cli                                  ; 0116 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0122 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0127 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0129 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0130 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0135 _ 01. D8
        test    eax, eax                                ; 0137 _ 85. C0
        jnz     ?_002                                   ; 0139 _ 75, 07
        call    io_stihlt                               ; 013B _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 0140 _ EB, 7F

?_002:  mov     dword [esp], keyinfo                    ; 0142 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0149 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 014E _ 85. C0
        jz      ?_003                                   ; 0150 _ 74, 55
        call    io_sti                                  ; 0152 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0157 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 015E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0163 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 0166 _ 83. 7D, F4, 1C
        jnz     ?_004                                   ; 016A _ 75, 55
        mov     edx, dword [ebp-28H]                    ; 016C _ 8B. 55, D8
        mov     eax, edx                                ; 016F _ 89. D0
        shl     eax, 2                                  ; 0171 _ C1. E0, 02
        add     eax, edx                                ; 0174 _ 01. D0
        shl     eax, 2                                  ; 0176 _ C1. E0, 02
        mov     edx, eax                                ; 0179 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 017B _ 8B. 45, EC
        add     edx, eax                                ; 017E _ 01. C2
        mov     eax, dword [ebp-28H]                    ; 0180 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 0183 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0187 _ 89. 14 24
        call    show_memory_info                        ; 018A _ E8, FFFFFFFC(rel)
        add     dword [ebp-28H], 1                      ; 018F _ 83. 45, D8, 01
        mov     eax, dword [ebp-28H]                    ; 0193 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 0196 _ 3B. 45, E8
        jle     ?_004                                   ; 0199 _ 7E, 26
        mov     dword [ebp-28H], 0                      ; 019B _ C7. 45, D8, 00000000
        jmp     ?_001                                   ; 01A2 _ E9, FFFFFF6F

?_003:  mov     dword [esp], mouseinfo                  ; 01A7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01AE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 01B3 _ 85. C0
        jz      ?_004                                   ; 01B5 _ 74, 0A
        call    show_mouse_info                         ; 01B7 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 01BC _ E9, FFFFFF55

?_004:  jmp     ?_001                                   ; 01C1 _ E9, FFFFFF50
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 01C6 _ 55
        mov     ebp, esp                                ; 01C7 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 01C9 _ A1, 00000000(d)
        mov     edx, eax                                ; 01CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 01D0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 01D3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 01D5 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 01D8 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 01DE _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 01E1 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 01E7 _ 5D
        ret                                             ; 01E8 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 01E9 _ 55
        mov     ebp, esp                                ; 01EA _ 89. E5
        sub     esp, 24                                 ; 01EC _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1497          ; 01EF _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 01F7 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 01FF _ C7. 04 24, 00000000
        call    set_palette                             ; 0206 _ E8, FFFFFFFC(rel)
        nop                                             ; 020B _ 90
        leave                                           ; 020C _ C9
        ret                                             ; 020D _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 020E _ 55
        mov     ebp, esp                                ; 020F _ 89. E5
        sub     esp, 40                                 ; 0211 _ 83. EC, 28
        call    io_load_eflags                          ; 0214 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0219 _ 89. 45, F4
        call    io_cli                                  ; 021C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0221 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0224 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0228 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 022F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0234 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0237 _ 89. 45, F0
        jmp     ?_006                                   ; 023A _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 023C _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 023F _ 0F B6. 00
        shr     al, 2                                   ; 0242 _ C0. E8, 02
        movzx   eax, al                                 ; 0245 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0248 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 024C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0253 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0258 _ 8B. 45, 10
        add     eax, 1                                  ; 025B _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 025E _ 0F B6. 00
        shr     al, 2                                   ; 0261 _ C0. E8, 02
        movzx   eax, al                                 ; 0264 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0267 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 026B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0272 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0277 _ 8B. 45, 10
        add     eax, 2                                  ; 027A _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 027D _ 0F B6. 00
        shr     al, 2                                   ; 0280 _ C0. E8, 02
        movzx   eax, al                                 ; 0283 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0286 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 028A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0291 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0296 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 029A _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 029E _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 02A1 _ 3B. 45, 0C
        jle     ?_005                                   ; 02A4 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 02A6 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 02A9 _ 89. 04 24
        call    io_store_eflags                         ; 02AC _ E8, FFFFFFFC(rel)
        nop                                             ; 02B1 _ 90
        leave                                           ; 02B2 _ C9
        ret                                             ; 02B3 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 02B4 _ 55
        mov     ebp, esp                                ; 02B5 _ 89. E5
        sub     esp, 20                                 ; 02B7 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 02BA _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 02BD _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 02C0 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 02C3 _ 89. 45, FC
        jmp     ?_010                                   ; 02C6 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 02C8 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 02CB _ 89. 45, F8
        jmp     ?_009                                   ; 02CE _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 02D0 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 02D3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 02D7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 02D9 _ 8B. 45, F8
        add     eax, edx                                ; 02DC _ 01. D0
        mov     edx, eax                                ; 02DE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 02E0 _ 8B. 45, 08
        add     edx, eax                                ; 02E3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 02E5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 02E9 _ 88. 02
        add     dword [ebp-8H], 1                       ; 02EB _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 02EF _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 02F2 _ 3B. 45, 1C
        jle     ?_008                                   ; 02F5 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 02F7 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 02FB _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 02FE _ 3B. 45, 20
        jle     ?_007                                   ; 0301 _ 7E, C5
        leave                                           ; 0303 _ C9
        ret                                             ; 0304 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0305 _ 55
        mov     ebp, esp                                ; 0306 _ 89. E5
        push    ebx                                     ; 0308 _ 53
        sub     esp, 28                                 ; 0309 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 030C _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 030F _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0312 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0315 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0318 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 031C _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0320 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0328 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0330 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0338 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 033B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 033F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0342 _ 89. 04 24
        call    paint_rectangle                         ; 0345 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 034A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 034D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0350 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0353 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0356 _ 8B. 45, 10
        sub     eax, 28                                 ; 0359 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 035C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0360 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0364 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0368 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0370 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0378 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 037B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 037F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0382 _ 89. 04 24
        call    paint_rectangle                         ; 0385 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 038A _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 038D _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0390 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0393 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0396 _ 8B. 45, 10
        sub     eax, 27                                 ; 0399 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 039C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03A0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03A4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 03B0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03B8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03BB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03BF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03C2 _ 89. 04 24
        call    paint_rectangle                         ; 03C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03CA _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03CD _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03D0 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03D3 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03D6 _ 8B. 45, 10
        sub     eax, 26                                 ; 03D9 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 03DC _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03E0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03E4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03E8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 03F0 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 03F8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0402 _ 89. 04 24
        call    paint_rectangle                         ; 0405 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 040A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 040D _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0410 _ 8B. 45, 10
        sub     eax, 24                                 ; 0413 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0416 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 041A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0422 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0426 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 042E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0436 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0439 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 043D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0440 _ 89. 04 24
        call    paint_rectangle                         ; 0443 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0448 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 044B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 044E _ 8B. 45, 10
        sub     eax, 24                                 ; 0451 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0454 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0458 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0460 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0464 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 046C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0474 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0477 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 047B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 047E _ 89. 04 24
        call    paint_rectangle                         ; 0481 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0486 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0489 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 048C _ 8B. 45, 10
        sub     eax, 4                                  ; 048F _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0492 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0496 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 049E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04A2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 04AA _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04B2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04B5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04BC _ 89. 04 24
        call    paint_rectangle                         ; 04BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04C4 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 04C7 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 04CA _ 8B. 45, 10
        sub     eax, 23                                 ; 04CD _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 04D0 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04D4 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04DC _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 04E0 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 04E8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04FA _ 89. 04 24
        call    paint_rectangle                         ; 04FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0502 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0505 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0508 _ 8B. 45, 10
        sub     eax, 3                                  ; 050B _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 050E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0512 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 051A _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 051E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0526 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 052E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0531 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0535 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0538 _ 89. 04 24
        call    paint_rectangle                         ; 053B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0540 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0543 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0546 _ 8B. 45, 10
        sub     eax, 24                                 ; 0549 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 054C _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0550 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0558 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 055C _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0564 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 056C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 056F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0573 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0576 _ 89. 04 24
        call    paint_rectangle                         ; 0579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 057E _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0581 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0584 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0587 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 058A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 058D _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0590 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0593 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0596 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 059A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 059E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05A2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 05A6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 05AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05B8 _ 89. 04 24
        call    paint_rectangle                         ; 05BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05C0 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 05C3 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 05C6 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 05C9 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 05CC _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 05CF _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 05D2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05D5 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 05D8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05DC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05E4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 05E8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 05F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05FA _ 89. 04 24
        call    paint_rectangle                         ; 05FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0602 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0605 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0608 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 060B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 060E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0611 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0614 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0617 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 061A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 061E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0622 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0626 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 062A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0632 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0635 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0639 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 063C _ 89. 04 24
        call    paint_rectangle                         ; 063F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0644 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0647 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 064A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 064D _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0650 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0653 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0656 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0659 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 065C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0660 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0664 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0668 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 066C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0674 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0677 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 067B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 067E _ 89. 04 24
        call    paint_rectangle                         ; 0681 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0686 _ 83. C4, 1C
        pop     ebx                                     ; 0689 _ 5B
        pop     ebp                                     ; 068A _ 5D
        ret                                             ; 068B _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 068C _ 55
        mov     ebp, esp                                ; 068D _ 89. E5
        sub     esp, 16                                 ; 068F _ 83. EC, 10
        movzx   eax, word [?_074]                       ; 0692 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0699 _ 98
        mov     dword [ebp-8H], eax                     ; 069A _ 89. 45, F8
        movzx   eax, word [?_075]                       ; 069D _ 0F B7. 05, 00000006(d)
        cwde                                            ; 06A4 _ 98
        mov     dword [ebp-4H], eax                     ; 06A5 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 06A8 _ 8B. 45, F8
        sub     eax, 16                                 ; 06AB _ 83. E8, 10
        mov     edx, eax                                ; 06AE _ 89. C2
        shr     edx, 31                                 ; 06B0 _ C1. EA, 1F
        add     eax, edx                                ; 06B3 _ 01. D0
        sar     eax, 1                                  ; 06B5 _ D1. F8
        mov     dword [mouse_x], eax                    ; 06B7 _ A3, 00000120(d)
        mov     eax, dword [ebp-4H]                     ; 06BC _ 8B. 45, FC
        sub     eax, 44                                 ; 06BF _ 83. E8, 2C
        mov     edx, eax                                ; 06C2 _ 89. C2
        shr     edx, 31                                 ; 06C4 _ C1. EA, 1F
        add     eax, edx                                ; 06C7 _ 01. D0
        sar     eax, 1                                  ; 06C9 _ D1. F8
        mov     dword [mouse_y], eax                    ; 06CB _ A3, 00000124(d)
        leave                                           ; 06D0 _ C9
        ret                                             ; 06D1 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 06D2 _ 55
        mov     ebp, esp                                ; 06D3 _ 89. E5
        sub     esp, 20                                 ; 06D5 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 06D8 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 06DB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 06DE _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 06E5 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 06EA _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 06ED _ 8B. 45, 18
        add     eax, edx                                ; 06F0 _ 01. D0
        movzx   eax, byte [eax]                         ; 06F2 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 06F5 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 06F8 _ 0F B6. 45, FB
        test    al, al                                  ; 06FC _ 84. C0
        jns     ?_012                                   ; 06FE _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0700 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0703 _ 8B. 55, 14
        add     eax, edx                                ; 0706 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0708 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 070C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 070E _ 8B. 45, 10
        add     eax, edx                                ; 0711 _ 01. D0
        mov     edx, eax                                ; 0713 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0715 _ 8B. 45, 08
        add     edx, eax                                ; 0718 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 071A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 071E _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 0720 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0724 _ 83. E0, 40
        test    eax, eax                                ; 0727 _ 85. C0
        jz      ?_013                                   ; 0729 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 072B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 072E _ 8B. 55, 14
        add     eax, edx                                ; 0731 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0733 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0737 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0739 _ 8B. 45, 10
        add     eax, edx                                ; 073C _ 01. D0
        lea     edx, [eax+1H]                           ; 073E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0741 _ 8B. 45, 08
        add     edx, eax                                ; 0744 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0746 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 074A _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 074C _ 0F B6. 45, FB
        and     eax, 20H                                ; 0750 _ 83. E0, 20
        test    eax, eax                                ; 0753 _ 85. C0
        jz      ?_014                                   ; 0755 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0757 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 075A _ 8B. 55, 14
        add     eax, edx                                ; 075D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 075F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0763 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0765 _ 8B. 45, 10
        add     eax, edx                                ; 0768 _ 01. D0
        lea     edx, [eax+2H]                           ; 076A _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 076D _ 8B. 45, 08
        add     edx, eax                                ; 0770 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0772 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0776 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 0778 _ 0F B6. 45, FB
        and     eax, 10H                                ; 077C _ 83. E0, 10
        test    eax, eax                                ; 077F _ 85. C0
        jz      ?_015                                   ; 0781 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0783 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0786 _ 8B. 55, 14
        add     eax, edx                                ; 0789 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 078B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 078F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0791 _ 8B. 45, 10
        add     eax, edx                                ; 0794 _ 01. D0
        lea     edx, [eax+3H]                           ; 0796 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0799 _ 8B. 45, 08
        add     edx, eax                                ; 079C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 079E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07A2 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 07A4 _ 0F B6. 45, FB
        and     eax, 08H                                ; 07A8 _ 83. E0, 08
        test    eax, eax                                ; 07AB _ 85. C0
        jz      ?_016                                   ; 07AD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07AF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07B2 _ 8B. 55, 14
        add     eax, edx                                ; 07B5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07B7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07BB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07BD _ 8B. 45, 10
        add     eax, edx                                ; 07C0 _ 01. D0
        lea     edx, [eax+4H]                           ; 07C2 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 07C5 _ 8B. 45, 08
        add     edx, eax                                ; 07C8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07CA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07CE _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 07D0 _ 0F B6. 45, FB
        and     eax, 04H                                ; 07D4 _ 83. E0, 04
        test    eax, eax                                ; 07D7 _ 85. C0
        jz      ?_017                                   ; 07D9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07DB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07DE _ 8B. 55, 14
        add     eax, edx                                ; 07E1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07E3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07E7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07E9 _ 8B. 45, 10
        add     eax, edx                                ; 07EC _ 01. D0
        lea     edx, [eax+5H]                           ; 07EE _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 07F1 _ 8B. 45, 08
        add     edx, eax                                ; 07F4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07F6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07FA _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 07FC _ 0F B6. 45, FB
        and     eax, 02H                                ; 0800 _ 83. E0, 02
        test    eax, eax                                ; 0803 _ 85. C0
        jz      ?_018                                   ; 0805 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0807 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 080A _ 8B. 55, 14
        add     eax, edx                                ; 080D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 080F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0813 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0815 _ 8B. 45, 10
        add     eax, edx                                ; 0818 _ 01. D0
        lea     edx, [eax+6H]                           ; 081A _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 081D _ 8B. 45, 08
        add     edx, eax                                ; 0820 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0822 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0826 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0828 _ 0F B6. 45, FB
        and     eax, 01H                                ; 082C _ 83. E0, 01
        test    eax, eax                                ; 082F _ 85. C0
        jz      ?_019                                   ; 0831 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0833 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0836 _ 8B. 55, 14
        add     eax, edx                                ; 0839 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 083B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 083F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0841 _ 8B. 45, 10
        add     eax, edx                                ; 0844 _ 01. D0
        lea     edx, [eax+7H]                           ; 0846 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0849 _ 8B. 45, 08
        add     edx, eax                                ; 084C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 084E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0852 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 0854 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 0858 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 085C _ 0F 8E, FFFFFE88
        leave                                           ; 0862 _ C9
        ret                                             ; 0863 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0864 _ 55
        mov     ebp, esp                                ; 0865 _ 89. E5
        sub     esp, 28                                 ; 0867 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 086A _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 086D _ 88. 45, FC
        jmp     ?_022                                   ; 0870 _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 0872 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0876 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 0879 _ 0F B6. 12
        movsx   edx, dl                                 ; 087C _ 0F BE. D2
        shl     edx, 4                                  ; 087F _ C1. E2, 04
        add     edx, systemFont                         ; 0882 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 0888 _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 088C _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 0890 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0893 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0897 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 089A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 089E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08A8 _ 89. 04 24
        call    paint_font                              ; 08AB _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 08B0 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 08B4 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 08B8 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 08BB _ 0F B6. 00
        test    al, al                                  ; 08BE _ 84. C0
        jnz     ?_021                                   ; 08C0 _ 75, B0
        leave                                           ; 08C2 _ C9
        ret                                             ; 08C3 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 08C4 _ 55
        mov     ebp, esp                                ; 08C5 _ 89. E5
        sub     esp, 20                                 ; 08C7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 08CA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 08CD _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 08D0 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 08D7 _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 08DC _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 08E3 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 08E8 _ 8B. 45, F8
        shl     eax, 4                                  ; 08EB _ C1. E0, 04
        mov     edx, eax                                ; 08EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08F0 _ 8B. 45, FC
        add     eax, edx                                ; 08F3 _ 01. D0
        add     eax, cursor.1564                        ; 08F5 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 08FA _ 0F B6. 00
        cmp     al, 42                                  ; 08FD _ 3C, 2A
        jnz     ?_025                                   ; 08FF _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0901 _ 8B. 45, F8
        shl     eax, 4                                  ; 0904 _ C1. E0, 04
        mov     edx, eax                                ; 0907 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0909 _ 8B. 45, FC
        add     eax, edx                                ; 090C _ 01. D0
        mov     edx, eax                                ; 090E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0910 _ 8B. 45, 08
        add     eax, edx                                ; 0913 _ 01. D0
        mov     byte [eax], 0                           ; 0915 _ C6. 00, 00
        jmp     ?_027                                   ; 0918 _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 091A _ 8B. 45, F8
        shl     eax, 4                                  ; 091D _ C1. E0, 04
        mov     edx, eax                                ; 0920 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0922 _ 8B. 45, FC
        add     eax, edx                                ; 0925 _ 01. D0
        add     eax, cursor.1564                        ; 0927 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 092C _ 0F B6. 00
        cmp     al, 79                                  ; 092F _ 3C, 4F
        jnz     ?_026                                   ; 0931 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0933 _ 8B. 45, F8
        shl     eax, 4                                  ; 0936 _ C1. E0, 04
        mov     edx, eax                                ; 0939 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 093B _ 8B. 45, FC
        add     eax, edx                                ; 093E _ 01. D0
        mov     edx, eax                                ; 0940 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0942 _ 8B. 45, 08
        add     eax, edx                                ; 0945 _ 01. D0
        mov     byte [eax], 7                           ; 0947 _ C6. 00, 07
        jmp     ?_027                                   ; 094A _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 094C _ 8B. 45, F8
        shl     eax, 4                                  ; 094F _ C1. E0, 04
        mov     edx, eax                                ; 0952 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0954 _ 8B. 45, FC
        add     eax, edx                                ; 0957 _ 01. D0
        mov     edx, eax                                ; 0959 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 095B _ 8B. 45, 08
        add     edx, eax                                ; 095E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0960 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0964 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0966 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 096A _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 096E _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0974 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0978 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 097C _ 0F 8E, FFFFFF5A
        leave                                           ; 0982 _ C9
        ret                                             ; 0983 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0984 _ 55
        mov     ebp, esp                                ; 0985 _ 89. E5
        sub     esp, 16                                 ; 0987 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 098A _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0991 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0993 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 099A _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 099C _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 099F _ 8B. 55, 14
        add     eax, edx                                ; 09A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09A4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 09A8 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 09AB _ 8B. 4D, 10
        add     edx, ecx                                ; 09AE _ 01. CA
        add     eax, edx                                ; 09B0 _ 01. D0
        mov     edx, eax                                ; 09B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09B4 _ 8B. 45, 08
        add     edx, eax                                ; 09B7 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 09B9 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 09BC _ 0F AF. 45, 18
        mov     ecx, eax                                ; 09C0 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 09C2 _ 8B. 45, FC
        add     eax, ecx                                ; 09C5 _ 01. C8
        mov     ecx, eax                                ; 09C7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 09C9 _ 8B. 45, 20
        add     eax, ecx                                ; 09CC _ 01. C8
        movzx   eax, byte [eax]                         ; 09CE _ 0F B6. 00
        mov     byte [edx], al                          ; 09D1 _ 88. 02
        add     dword [ebp-4H], 1                       ; 09D3 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 09D7 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 09DA _ 3B. 45, 18
        jl      ?_031                                   ; 09DD _ 7C, BD
        add     dword [ebp-8H], 1                       ; 09DF _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 09E3 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 09E6 _ 3B. 45, 1C
        jl      ?_030                                   ; 09E9 _ 7C, A8
        leave                                           ; 09EB _ C9
        ret                                             ; 09EC _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 09ED _ 55
        mov     ebp, esp                                ; 09EE _ 89. E5
        sub     esp, 24                                 ; 09F0 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 09F3 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 09FB _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0A03 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0A0A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0A0F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0A17 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0A1F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0A26 _ E8, FFFFFFFC(rel)
        leave                                           ; 0A2B _ C9
        ret                                             ; 0A2C _ C3
; init_fifo_buf End of function

eraser_mouse:; Function begin
        push    ebp                                     ; 0A2D _ 55
        mov     ebp, esp                                ; 0A2E _ 89. E5
        push    ebx                                     ; 0A30 _ 53
        sub     esp, 44                                 ; 0A31 _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0A34 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0A39 _ 89. 45, F4
        movzx   eax, word [?_074]                       ; 0A3C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0A43 _ 98
        mov     dword [ebp-8H], eax                     ; 0A44 _ 89. 45, F8
        mov     eax, dword [mouse_y]                    ; 0A47 _ A1, 00000124(d)
        lea     ebx, [eax+0FH]                          ; 0A4C _ 8D. 58, 0F
        mov     eax, dword [mouse_x]                    ; 0A4F _ A1, 00000120(d)
        lea     ecx, [eax+0FH]                          ; 0A54 _ 8D. 48, 0F
        mov     edx, dword [mouse_y]                    ; 0A57 _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0A5D _ A1, 00000120(d)
        mov     dword [esp+18H], ebx                    ; 0A62 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A66 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A6A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A6E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A72 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-8H]                     ; 0A7A _ 8B. 45, F8
        mov     dword [esp+4H], eax                     ; 0A7D _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0A81 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0A84 _ 89. 04 24
        call    paint_rectangle                         ; 0A87 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 0A8C _ 83. C4, 2C
        pop     ebx                                     ; 0A8F _ 5B
        pop     ebp                                     ; 0A90 _ 5D
        ret                                             ; 0A91 _ C3
; eraser_mouse End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0A92 _ 55
        mov     ebp, esp                                ; 0A93 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A95 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A98 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0A9B _ A1, 00000120(d)
        add     eax, edx                                ; 0AA0 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0AA2 _ A3, 00000120(d)
        mov     eax, dword [ebp+8H]                     ; 0AA7 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0AAA _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0AAD _ A1, 00000124(d)
        add     eax, edx                                ; 0AB2 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0AB4 _ A3, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0AB9 _ A1, 00000120(d)
        test    eax, eax                                ; 0ABE _ 85. C0
        jns     ?_034                                   ; 0AC0 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0AC2 _ C7. 05, 00000120(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0ACC _ A1, 00000124(d)
        test    eax, eax                                ; 0AD1 _ 85. C0
        jns     ?_035                                   ; 0AD3 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0AD5 _ C7. 05, 00000124(d), 00000000
?_035:  movzx   eax, word [?_074]                       ; 0ADF _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0AE6 _ 98
        lea     edx, [eax-10H]                          ; 0AE7 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0AEA _ A1, 00000120(d)
        cmp     edx, eax                                ; 0AEF _ 39. C2
        jge     ?_036                                   ; 0AF1 _ 7D, 10
        movzx   eax, word [?_074]                       ; 0AF3 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0AFA _ 98
        sub     eax, 16                                 ; 0AFB _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0AFE _ A3, 00000120(d)
?_036:  movzx   eax, word [?_074]                       ; 0B03 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B0A _ 98
        lea     edx, [eax-10H]                          ; 0B0B _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0B0E _ A1, 00000124(d)
        cmp     edx, eax                                ; 0B13 _ 39. C2
        jge     ?_037                                   ; 0B15 _ 7D, 10
        movzx   eax, word [?_074]                       ; 0B17 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B1E _ 98
        sub     eax, 16                                 ; 0B1F _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0B22 _ A3, 00000124(d)
?_037:  pop     ebp                                     ; 0B27 _ 5D
        ret                                             ; 0B28 _ C3
; compute_mouse_position End of function

draw_mouse:; Function begin
        push    ebp                                     ; 0B29 _ 55
        mov     ebp, esp                                ; 0B2A _ 89. E5
        sub     esp, 44                                 ; 0B2C _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0B2F _ A1, 00000000(d)
        mov     dword [ebp-8H], eax                     ; 0B34 _ 89. 45, F8
        movzx   eax, word [?_074]                       ; 0B37 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B3E _ 98
        mov     dword [ebp-4H], eax                     ; 0B3F _ 89. 45, FC
        mov     edx, dword [mouse_y]                    ; 0B42 _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0B48 _ A1, 00000120(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0B4D _ C7. 44 24, 18, 00000020(d)
        mov     dword [esp+14H], 16                     ; 0B55 _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 0B5D _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 0B65 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0B69 _ 89. 44 24, 08
        mov     eax, dword [ebp-4H]                     ; 0B6D _ 8B. 45, FC
        mov     dword [esp+4H], eax                     ; 0B70 _ 89. 44 24, 04
        mov     eax, dword [ebp-8H]                     ; 0B74 _ 8B. 45, F8
        mov     dword [esp], eax                        ; 0B77 _ 89. 04 24
        call    paint_block                             ; 0B7A _ E8, FFFFFFFC(rel)
        leave                                           ; 0B7F _ C9
        ret                                             ; 0B80 _ C3
; draw_mouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0B81 _ 55
        mov     ebp, esp                                ; 0B82 _ 89. E5
        sub     esp, 40                                 ; 0B84 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0B87 _ C6. 45, F7, 00
        call    io_sti                                  ; 0B8B _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0B90 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0B97 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0B9C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0B9F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0BA3 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0BA7 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0BAE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0BB3 _ 85. C0
        jz      ?_038                                   ; 0BB5 _ 74, 16
        call    eraser_mouse                            ; 0BB7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouse_send_info            ; 0BBC _ C7. 04 24, 00000000(d)
        call    compute_mouse_position                  ; 0BC3 _ E8, FFFFFFFC(rel)
        call    draw_mouse                              ; 0BC8 _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0BCD _ C9
        ret                                             ; 0BCE _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0BCF _ 55
        mov     ebp, esp                                ; 0BD0 _ 89. E5
        sub     esp, 24                                 ; 0BD2 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0BD5 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0BDC _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0BE1 _ 83. E0, 02
        test    eax, eax                                ; 0BE4 _ 85. C0
        jnz     ?_040                                   ; 0BE6 _ 75, 02
        jmp     ?_041                                   ; 0BE8 _ EB, 02

?_040:  jmp     ?_039                                   ; 0BEA _ EB, E9

?_041:  leave                                           ; 0BEC _ C9
        ret                                             ; 0BED _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0BEE _ 55
        mov     ebp, esp                                ; 0BEF _ 89. E5
        sub     esp, 24                                 ; 0BF1 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0BF4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0BF9 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0C01 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C08 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C0D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0C12 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0C1A _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C21 _ E8, FFFFFFFC(rel)
        leave                                           ; 0C26 _ C9
        ret                                             ; 0C27 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C28 _ 55
        mov     ebp, esp                                ; 0C29 _ 89. E5
        sub     esp, 24                                 ; 0C2B _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C2E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0C33 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0C3B _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C42 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C47 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0C4C _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0C54 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C5B _ E8, FFFFFFFC(rel)
        leave                                           ; 0C60 _ C9
        ret                                             ; 0C61 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0C62 _ 55
        mov     ebp, esp                                ; 0C63 _ 89. E5
        sub     esp, 4                                  ; 0C65 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C68 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C6B _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C6E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C71 _ 0F B6. 40, 03
        test    al, al                                  ; 0C75 _ 84. C0
        jnz     ?_043                                   ; 0C77 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C79 _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0C7D _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C7F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C82 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0C86 _ B8, 00000000
        jmp     ?_050                                   ; 0C8B _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0C90 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C93 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C97 _ 3C, 01
        jnz     ?_045                                   ; 0C99 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0C9B _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0C9F _ 25, 000000C8
        cmp     eax, 8                                  ; 0CA4 _ 83. F8, 08
        jnz     ?_044                                   ; 0CA7 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0CA9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CAC _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0CB0 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0CB2 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0CB5 _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0CB9 _ B8, 00000000
        jmp     ?_050                                   ; 0CBE _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0CC3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CC6 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0CCA _ 3C, 02
        jnz     ?_046                                   ; 0CCC _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0CCE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CD1 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0CD5 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0CD8 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0CDB _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0CDF _ B8, 00000000
        jmp     ?_050                                   ; 0CE4 _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0CE9 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CEC _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0CF0 _ 3C, 03
        jne     ?_049                                   ; 0CF2 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0CF8 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CFB _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0CFF _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0D02 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D05 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0D09 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D0C _ 0F B6. 00
        movzx   eax, al                                 ; 0D0F _ 0F B6. C0
        and     eax, 07H                                ; 0D12 _ 83. E0, 07
        mov     edx, eax                                ; 0D15 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D17 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0D1A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D1D _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0D20 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0D24 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D27 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D2A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D2D _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0D30 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0D34 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D37 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D3A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0D3D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D40 _ 0F B6. 00
        movzx   eax, al                                 ; 0D43 _ 0F B6. C0
        and     eax, 10H                                ; 0D46 _ 83. E0, 10
        test    eax, eax                                ; 0D49 _ 85. C0
        jz      ?_047                                   ; 0D4B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D4D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D50 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0D53 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D58 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D5A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D5D _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0D60 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D63 _ 0F B6. 00
        movzx   eax, al                                 ; 0D66 _ 0F B6. C0
        and     eax, 20H                                ; 0D69 _ 83. E0, 20
        test    eax, eax                                ; 0D6C _ 85. C0
        jz      ?_048                                   ; 0D6E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D70 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D73 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D76 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D7B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D7D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D80 _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0D83 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D86 _ 8B. 40, 08
        neg     eax                                     ; 0D89 _ F7. D8
        mov     edx, eax                                ; 0D8B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D8D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D90 _ 89. 50, 08
        mov     eax, 1                                  ; 0D93 _ B8, 00000001
        jmp     ?_050                                   ; 0D98 _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0D9A _ B8, FFFFFFFF
?_050:  leave                                           ; 0D9F _ C9
        ret                                             ; 0DA0 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0DA1 _ 55
        mov     ebp, esp                                ; 0DA2 _ 89. E5
        sub     esp, 40                                 ; 0DA4 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0DA7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0DAF _ C7. 04 24, 00000020
        call    io_out8                                 ; 0DB6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0DBB _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0DC3 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0DCA _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0DCF _ C7. 04 24, 00000060
        call    io_in8                                  ; 0DD6 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0DDB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0DDE _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0DE2 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0DE6 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0DED _ E8, FFFFFFFC(rel)
        leave                                           ; 0DF2 _ C9
        ret                                             ; 0DF3 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0DF4 _ 55
        mov     ebp, esp                                ; 0DF5 _ 89. E5
        sub     esp, 40                                 ; 0DF7 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0DFA _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0E02 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0E09 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0E0E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0E16 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0E1D _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0E22 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0E29 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0E2E _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E31 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0E35 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0E39 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0E40 _ E8, FFFFFFFC(rel)
        leave                                           ; 0E45 _ C9
        ret                                             ; 0E46 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0E47 _ 55
        mov     ebp, esp                                ; 0E48 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E4A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0E4D _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0E50 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0E52 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0E55 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E5C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E5F _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E66 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E69 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0E6C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E6F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E72 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0E75 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E78 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0E7B _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0E82 _ 5D
        ret                                             ; 0E83 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0E84 _ 55
        mov     ebp, esp                                ; 0E85 _ 89. E5
        sub     esp, 20                                 ; 0E87 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0E8A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0E8D _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0E90 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E93 _ 8B. 40, 10
        test    eax, eax                                ; 0E96 _ 85. C0
        jnz     ?_051                                   ; 0E98 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0E9A _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0E9D _ 8B. 40, 14
        or      eax, 01H                                ; 0EA0 _ 83. C8, 01
        mov     edx, eax                                ; 0EA3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EA5 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0EA8 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0EAB _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0EB0 _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 0EB2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0EB5 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0EB8 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0EBB _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0EBE _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0EC0 _ 8B. 45, FC
        add     edx, eax                                ; 0EC3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EC5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EC9 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0ECB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0ECE _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0ED1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0ED7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EDA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0EDD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EE0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0EE3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0EE6 _ 39. C2
        jnz     ?_052                                   ; 0EE8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0EEA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0EED _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0EF4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0EF7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0EFA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0EFD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F00 _ 89. 50, 10
        mov     eax, 0                                  ; 0F03 _ B8, 00000000
?_053:  leave                                           ; 0F08 _ C9
        ret                                             ; 0F09 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0F0A _ 55
        mov     ebp, esp                                ; 0F0B _ 89. E5
        sub     esp, 16                                 ; 0F0D _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0F10 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0F13 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F16 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F19 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F1C _ 39. C2
        jnz     ?_054                                   ; 0F1E _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0F20 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0F23 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0F2A _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0F2F _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 0F31 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F34 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0F37 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0F3A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0F3D _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0F3F _ 8B. 45, F8
        add     eax, edx                                ; 0F42 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F44 _ 0F B6. 00
        movzx   eax, al                                 ; 0F47 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0F4A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F4D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F50 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0F53 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F56 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F59 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F5C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0F5F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F62 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F65 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F68 _ 39. C2
        jnz     ?_055                                   ; 0F6A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0F6C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F6F _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 0F76 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F79 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0F7C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F7F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F82 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0F85 _ 8B. 45, FC
?_056:  leave                                           ; 0F88 _ C9
        ret                                             ; 0F89 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0F8A _ 55
        mov     ebp, esp                                ; 0F8B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F8D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0F90 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F93 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F96 _ 8B. 40, 10
        sub     edx, eax                                ; 0F99 _ 29. C2
        mov     eax, edx                                ; 0F9B _ 89. D0
        pop     ebp                                     ; 0F9D _ 5D
        ret                                             ; 0F9E _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0F9F _ 55
        mov     ebp, esp                                ; 0FA0 _ 89. E5
        sub     esp, 4                                  ; 0FA2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0FA5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0FA8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0FAB _ 80. 7D, FC, 09
        jle     ?_057                                   ; 0FAF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0FB1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0FB5 _ 83. C0, 37
        jmp     ?_058                                   ; 0FB8 _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 0FBA _ 0F B6. 45, FC
        add     eax, 48                                 ; 0FBE _ 83. C0, 30
?_058:  leave                                           ; 0FC1 _ C9
        ret                                             ; 0FC2 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0FC3 _ 55
        mov     ebp, esp                                ; 0FC4 _ 89. E5
        sub     esp, 24                                 ; 0FC6 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0FC9 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0FCC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FCF _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0FD6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0FDA _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0FDD _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0FE0 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0FE4 _ 89. 04 24
        call    charToHexVal                            ; 0FE7 _ E8, FFFFFFFC(rel)
        mov     byte [?_073], al                        ; 0FEC _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 0FF1 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0FF5 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0FF8 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0FFB _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0FFF _ 0F BE. C0
        mov     dword [esp], eax                        ; 1002 _ 89. 04 24
        call    charToHexVal                            ; 1005 _ E8, FFFFFFFC(rel)
        mov     byte [?_072], al                        ; 100A _ A2, 00000142(d)
        mov     eax, keyval                             ; 100F _ B8, 00000140(d)
        leave                                           ; 1014 _ C9
        ret                                             ; 1015 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1016 _ 55
        mov     ebp, esp                                ; 1017 _ 89. E5
        sub     esp, 16                                 ; 1019 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 101C _ C6. 05, 00000220(d), 30
        mov     byte [?_076], 88                        ; 1023 _ C6. 05, 00000221(d), 58
        mov     byte [?_077], 0                         ; 102A _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1031 _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 1038 _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 103A _ 8B. 45, F4
        add     eax, str.1386                           ; 103D _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 1042 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1045 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 1049 _ 83. 7D, F4, 09
        jle     ?_059                                   ; 104D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 104F _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 1056 _ EB, 40

?_061:  mov     eax, dword [ebp+8H]                     ; 1058 _ 8B. 45, 08
        and     eax, 0FH                                ; 105B _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 105E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1061 _ 8B. 45, 08
        shr     eax, 4                                  ; 1064 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1067 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 106A _ 83. 7D, FC, 09
        jle     ?_062                                   ; 106E _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1070 _ 8B. 45, FC
        add     eax, 55                                 ; 1073 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1076 _ 8B. 55, F8
        add     edx, str.1386                           ; 1079 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 107F _ 88. 02
        jmp     ?_063                                   ; 1081 _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 1083 _ 8B. 45, FC
        add     eax, 48                                 ; 1086 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1089 _ 8B. 55, F8
        add     edx, str.1386                           ; 108C _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1092 _ 88. 02
?_063:  sub     dword [ebp-8H], 1                       ; 1094 _ 83. 6D, F8, 01
?_064:  cmp     dword [ebp-8H], 1                       ; 1098 _ 83. 7D, F8, 01
        jle     ?_065                                   ; 109C _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 109E _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 10A2 _ 75, B4
?_065:  mov     eax, str.1386                           ; 10A4 _ B8, 00000220(d)
        leave                                           ; 10A9 _ C9
        ret                                             ; 10AA _ C3
; intToHexStr End of function

show_memory_info:; Function begin
        push    ebp                                     ; 10AB _ 55
        mov     ebp, esp                                ; 10AC _ 89. E5
        sub     esp, 88                                 ; 10AE _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 10B1 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 10B8 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 10BF _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 10C6 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 10CB _ 89. 45, D4
        movzx   eax, word [screen_info+4H]              ; 10CE _ 0F B7. 05, 00000004(d)
        cwde                                            ; 10D5 _ 98
        mov     dword [ebp-28H], eax                    ; 10D6 _ 89. 45, D8
        movzx   eax, word [screen_info+6H]              ; 10D9 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 10E0 _ 98
        mov     dword [ebp-24H], eax                    ; 10E1 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10E4 _ 8B. 45, DC
        mov     dword [esp+8H], eax                     ; 10E7 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 10EB _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 10EE _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 10F2 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 10F5 _ 89. 04 24
        call    init_desktop                            ; 10F8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 10FD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_066                  ; 1105 _ C7. 44 24, 10, 00000000(d)
        mov     eax, dword [ebp-34H]                    ; 110D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1110 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1114 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1117 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 111B _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 111E _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1122 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1125 _ 89. 04 24
        call    paint_string                            ; 1128 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 112D _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1130 _ 89. 04 24
        call    intToHexStr                             ; 1133 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1138 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 113B _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1143 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1146 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 114A _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 114D _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1151 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1154 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1158 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 115B _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 115F _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1162 _ 89. 04 24
        call    paint_string                            ; 1165 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 116A _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 116E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_067                  ; 1176 _ C7. 44 24, 10, 0000000A(d)
        mov     eax, dword [ebp-34H]                    ; 117E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1181 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1185 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1188 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 118C _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 118F _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1193 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1196 _ 89. 04 24
        call    paint_string                            ; 1199 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 119E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 11A1 _ 8B. 00
        mov     dword [esp], eax                        ; 11A3 _ 89. 04 24
        call    intToHexStr                             ; 11A6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 11AB _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 11AE _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 11B6 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 11B9 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11BD _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11C0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11C4 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11C7 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11CB _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11CE _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 11D2 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 11D5 _ 89. 04 24
        call    paint_string                            ; 11D8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11DD _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11E1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_068                  ; 11E9 _ C7. 44 24, 10, 00000016(d)
        mov     eax, dword [ebp-34H]                    ; 11F1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11F4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11F8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11FB _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11FF _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1202 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1206 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1209 _ 89. 04 24
        call    paint_string                            ; 120C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1211 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1214 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1217 _ 89. 04 24
        call    intToHexStr                             ; 121A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 121F _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1222 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 122A _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 122D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1231 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1234 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1238 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 123B _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 123F _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1242 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1246 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1249 _ 89. 04 24
        call    paint_string                            ; 124C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1251 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1255 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_069                  ; 125D _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 1265 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1268 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 126C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 126F _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1273 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1276 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 127A _ 8B. 45, D4
        mov     dword [esp], eax                        ; 127D _ 89. 04 24
        call    paint_string                            ; 1280 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1285 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1288 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 128B _ 89. 04 24
        call    intToHexStr                             ; 128E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1293 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1296 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 129E _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 12A1 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12A5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12A8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12AC _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12AF _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12B3 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12B6 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12BA _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12BD _ 89. 04 24
        call    paint_string                            ; 12C0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12C5 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12C9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_070                  ; 12D1 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 12D9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12DC _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12E0 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12E3 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12E7 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12EA _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12EE _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12F1 _ 89. 04 24
        call    paint_string                            ; 12F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 12F9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 12FC _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 12FF _ 89. 04 24
        call    intToHexStr                             ; 1302 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1307 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 130A _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1312 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1315 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1319 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 131C _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1320 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1323 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1327 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 132A _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 132E _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1331 _ 89. 04 24
        call    paint_string                            ; 1334 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1339 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 133D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_071                  ; 1345 _ C7. 44 24, 10, 0000003B(d)
        mov     eax, dword [ebp-34H]                    ; 134D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1350 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1354 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1357 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 135B _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 135E _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1362 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1365 _ 89. 04 24
        call    paint_string                            ; 1368 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 136D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1370 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1373 _ 89. 04 24
        call    intToHexStr                             ; 1376 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 137B _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 137E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1386 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1389 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 138D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1390 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1394 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1397 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 139B _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 139E _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 13A2 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 13A5 _ 89. 04 24
        call    paint_string                            ; 13A8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13AD _ 83. 45, CC, 10
        leave                                           ; 13B1 _ C9
        ret                                             ; 13B2 _ C3
; show_memory_info End of function



?_066:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0000 _ page is:
        db 20H, 00H                                     ; 0008 _  .

?_067:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 000A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0012 _ L: .

?_068:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0016 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 001E _ H: .

?_069:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0022 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 002A _ w: .

?_070:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 002E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0036 _ gh: .

?_071:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 003B _ type: .



table_rgb.1497:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1564:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0040 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0048 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0050 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0058 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0060 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0068 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0070 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0078 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0080 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0090 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 00A0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 00B0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 00D0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 00E0 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 00F0 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0100 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0110 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0120 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0130 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0140 _ 0X

?_072:  db 00H                                          ; 0142 _ .

?_073:  db 00H, 00H                                     ; 0143 _ ..



screen_info:                                            ; qword
        resb    4                                       ; 0000

?_074:  resw    1                                       ; 0004

?_075:  resw    13                                      ; 0006

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020

mouse_x: resd   1                                       ; 0120

mouse_y: resd   1                                       ; 0124

mouse_send_info:                                        ; oword
        resb    24                                      ; 0128

keyinfo:                                                ; byte
        resb    32                                      ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 0160

mouseinfo:                                              ; byte
        resb    32                                      ; 0180

mousebuf:                                               ; byte
        resb    128                                     ; 01A0

str.1386:                                               ; byte
        resb    1                                       ; 0220

?_076:  resb    9                                       ; 0221

?_077:  resb    1                                       ; 022A


