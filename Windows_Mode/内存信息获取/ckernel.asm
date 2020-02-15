; Disassembly of file: ckernel.o
; Sat Feb 15 14:11:31 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 84                                 ; 0004 _ 83. EC, 54
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-28H], eax                    ; 0018 _ 89. 45, D8
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-24H], eax                    ; 0023 _ 89. 45, DC
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-20H], eax                    ; 002E _ 89. 45, E0
        call    init_mouse_position                     ; 0031 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0036 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 003B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0040 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0045 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 004A _ 89. 45, E4
        call    get_memory_address                      ; 004D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0052 _ 89. 45, E8
        call    io_sti                                  ; 0055 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20H]                    ; 005A _ 8B. 45, E0
        mov     dword [esp+8H], eax                     ; 005D _ 89. 44 24, 08
        mov     eax, dword [ebp-24H]                    ; 0061 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 0064 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 0068 _ 8B. 45, D8
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
        mov     eax, dword [ebp-24H]                    ; 00B2 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 00B5 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 00B9 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    paint_block                             ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 65535                  ; 00C4 _ C7. 45, EC, 0000FFFF
        mov     eax, dword [ebp-14H]                    ; 00CB _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00CE _ 89. 04 24
        call    intToHexStr                             ; 00D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 00D6 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 00D9 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 00E1 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 00E4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 00E8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 00F0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-24H]                    ; 00F8 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 00FB _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 00FF _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0102 _ 89. 04 24
        call    paint_string                            ; 0105 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 010A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 010F _ C7. 45, F4, 00000000
        mov     dword [ebp-2CH], 0                      ; 0116 _ C7. 45, D4, 00000000
?_001:  call    io_cli                                  ; 011D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0122 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0129 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 012E _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0130 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0137 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 013C _ 01. D8
        test    eax, eax                                ; 013E _ 85. C0
        jnz     ?_002                                   ; 0140 _ 75, 07
        call    io_stihlt                               ; 0142 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 0147 _ EB, 7F

?_002:  mov     dword [esp], keyinfo                    ; 0149 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0150 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0155 _ 85. C0
        jz      ?_003                                   ; 0157 _ 74, 55
        call    io_sti                                  ; 0159 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 015E _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0165 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 016A _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 016D _ 83. 7D, F4, 1C
        jnz     ?_004                                   ; 0171 _ 75, 55
        mov     edx, dword [ebp-2CH]                    ; 0173 _ 8B. 55, D4
        mov     eax, edx                                ; 0176 _ 89. D0
        shl     eax, 2                                  ; 0178 _ C1. E0, 02
        add     eax, edx                                ; 017B _ 01. D0
        shl     eax, 2                                  ; 017D _ C1. E0, 02
        mov     edx, eax                                ; 0180 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 0182 _ 8B. 45, E8
        add     edx, eax                                ; 0185 _ 01. C2
        mov     eax, dword [ebp-2CH]                    ; 0187 _ 8B. 45, D4
        mov     dword [esp+4H], eax                     ; 018A _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 018E _ 89. 14 24
        call    show_memory_info                        ; 0191 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 1                      ; 0196 _ 83. 45, D4, 01
        mov     eax, dword [ebp-2CH]                    ; 019A _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 019D _ 3B. 45, E4
        jle     ?_004                                   ; 01A0 _ 7E, 26
        mov     dword [ebp-2CH], 0                      ; 01A2 _ C7. 45, D4, 00000000
        jmp     ?_001                                   ; 01A9 _ E9, FFFFFF6F

?_003:  mov     dword [esp], mouseinfo                  ; 01AE _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01B5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 01BA _ 85. C0
        jz      ?_004                                   ; 01BC _ 74, 0A
        call    show_mouse_info                         ; 01BE _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 01C3 _ E9, FFFFFF55

?_004:  jmp     ?_001                                   ; 01C8 _ E9, FFFFFF50
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 01CD _ 55
        mov     ebp, esp                                ; 01CE _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 01D0 _ A1, 00000000(d)
        mov     edx, eax                                ; 01D5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 01D7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 01DA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 01DC _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 01DF _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 01E5 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 01E8 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 01EE _ 5D
        ret                                             ; 01EF _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 01F0 _ 55
        mov     ebp, esp                                ; 01F1 _ 89. E5
        sub     esp, 24                                 ; 01F3 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1497          ; 01F6 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 01FE _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0206 _ C7. 04 24, 00000000
        call    set_palette                             ; 020D _ E8, FFFFFFFC(rel)
        nop                                             ; 0212 _ 90
        leave                                           ; 0213 _ C9
        ret                                             ; 0214 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0215 _ 55
        mov     ebp, esp                                ; 0216 _ 89. E5
        sub     esp, 40                                 ; 0218 _ 83. EC, 28
        call    io_load_eflags                          ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0220 _ 89. 45, F4
        call    io_cli                                  ; 0223 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0228 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 022B _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 022F _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0236 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 023B _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 023E _ 89. 45, F0
        jmp     ?_006                                   ; 0241 _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 0243 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0246 _ 0F B6. 00
        shr     al, 2                                   ; 0249 _ C0. E8, 02
        movzx   eax, al                                 ; 024C _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 024F _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0253 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 025A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 025F _ 8B. 45, 10
        add     eax, 1                                  ; 0262 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0265 _ 0F B6. 00
        shr     al, 2                                   ; 0268 _ C0. E8, 02
        movzx   eax, al                                 ; 026B _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 026E _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0272 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0279 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 027E _ 8B. 45, 10
        add     eax, 2                                  ; 0281 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0284 _ 0F B6. 00
        shr     al, 2                                   ; 0287 _ C0. E8, 02
        movzx   eax, al                                 ; 028A _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 028D _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0291 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0298 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 029D _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 02A1 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 02A5 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 02A8 _ 3B. 45, 0C
        jle     ?_005                                   ; 02AB _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 02AD _ 8B. 45, F4
        mov     dword [esp], eax                        ; 02B0 _ 89. 04 24
        call    io_store_eflags                         ; 02B3 _ E8, FFFFFFFC(rel)
        nop                                             ; 02B8 _ 90
        leave                                           ; 02B9 _ C9
        ret                                             ; 02BA _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 02BB _ 55
        mov     ebp, esp                                ; 02BC _ 89. E5
        sub     esp, 20                                 ; 02BE _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 02C1 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 02C4 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 02C7 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 02CA _ 89. 45, FC
        jmp     ?_010                                   ; 02CD _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 02CF _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 02D2 _ 89. 45, F8
        jmp     ?_009                                   ; 02D5 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 02D7 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 02DA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 02DE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 02E0 _ 8B. 45, F8
        add     eax, edx                                ; 02E3 _ 01. D0
        mov     edx, eax                                ; 02E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 02E7 _ 8B. 45, 08
        add     edx, eax                                ; 02EA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 02EC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 02F0 _ 88. 02
        add     dword [ebp-8H], 1                       ; 02F2 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 02F6 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 02F9 _ 3B. 45, 1C
        jle     ?_008                                   ; 02FC _ 7E, D9
        add     dword [ebp-4H], 1                       ; 02FE _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 0302 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0305 _ 3B. 45, 20
        jle     ?_007                                   ; 0308 _ 7E, C5
        leave                                           ; 030A _ C9
        ret                                             ; 030B _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 030C _ 55
        mov     ebp, esp                                ; 030D _ 89. E5
        push    ebx                                     ; 030F _ 53
        sub     esp, 28                                 ; 0310 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0313 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0316 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0319 _ 8B. 45, 0C
        sub     eax, 1                                  ; 031C _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 031F _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0323 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0327 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 032F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0337 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 033F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0342 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0346 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0349 _ 89. 04 24
        call    paint_rectangle                         ; 034C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0351 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0354 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0357 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 035A _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 035D _ 8B. 45, 10
        sub     eax, 28                                 ; 0360 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0363 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0367 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 036B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 036F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0377 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 037F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0382 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0386 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0389 _ 89. 04 24
        call    paint_rectangle                         ; 038C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0391 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0394 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0397 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 039A _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 039D _ 8B. 45, 10
        sub     eax, 27                                 ; 03A0 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 03A3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03A7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03AB _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03AF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 03B7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03BF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    paint_rectangle                         ; 03CC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03D1 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03D4 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03D7 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03DA _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03DD _ 8B. 45, 10
        sub     eax, 26                                 ; 03E0 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 03E3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03E7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03EB _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03EF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 03F7 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 03FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0402 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0406 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0409 _ 89. 04 24
        call    paint_rectangle                         ; 040C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0411 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0414 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0417 _ 8B. 45, 10
        sub     eax, 24                                 ; 041A _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 041D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0421 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0429 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 042D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0435 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 043D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0440 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0444 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0447 _ 89. 04 24
        call    paint_rectangle                         ; 044A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 044F _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0452 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0455 _ 8B. 45, 10
        sub     eax, 24                                 ; 0458 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 045B _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 045F _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0467 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 046B _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0473 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 047B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 047E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0482 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0485 _ 89. 04 24
        call    paint_rectangle                         ; 0488 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 048D _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0490 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0493 _ 8B. 45, 10
        sub     eax, 4                                  ; 0496 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0499 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 049D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04A5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04A9 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 04B1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04B9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04BC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04C0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04C3 _ 89. 04 24
        call    paint_rectangle                         ; 04C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04CB _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 04CE _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 04D1 _ 8B. 45, 10
        sub     eax, 23                                 ; 04D4 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 04D7 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04DB _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04E3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 04E7 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 04EF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04F7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04FA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04FE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0501 _ 89. 04 24
        call    paint_rectangle                         ; 0504 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0509 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 050C _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 050F _ 8B. 45, 10
        sub     eax, 3                                  ; 0512 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0515 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0519 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0521 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0525 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 052D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0535 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0538 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 053C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 053F _ 89. 04 24
        call    paint_rectangle                         ; 0542 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0547 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 054A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 054D _ 8B. 45, 10
        sub     eax, 24                                 ; 0550 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0553 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0557 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 055F _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0563 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 056B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0573 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0576 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 057A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 057D _ 89. 04 24
        call    paint_rectangle                         ; 0580 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0585 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0588 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 058B _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 058E _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0591 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0594 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0597 _ 8B. 45, 0C
        sub     eax, 47                                 ; 059A _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 059D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05A1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05A5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05A9 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 05AD _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 05B5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05BF _ 89. 04 24
        call    paint_rectangle                         ; 05C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05C7 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 05CA _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 05CD _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 05D0 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 05D3 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 05D6 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 05D9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05DC _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 05DF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05E3 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05E7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05EB _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 05EF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 05F7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05FA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05FE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0601 _ 89. 04 24
        call    paint_rectangle                         ; 0604 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0609 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 060C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 060F _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0612 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0615 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0618 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 061B _ 8B. 45, 0C
        sub     eax, 47                                 ; 061E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0621 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0625 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0629 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 062D _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0631 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0639 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 063C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0640 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0643 _ 89. 04 24
        call    paint_rectangle                         ; 0646 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 064B _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 064E _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0651 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0654 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0657 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 065A _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 065D _ 8B. 45, 0C
        sub     eax, 3                                  ; 0660 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0663 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0667 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 066B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 066F _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0673 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 067B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 067E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0682 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0685 _ 89. 04 24
        call    paint_rectangle                         ; 0688 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 068D _ 83. C4, 1C
        pop     ebx                                     ; 0690 _ 5B
        pop     ebp                                     ; 0691 _ 5D
        ret                                             ; 0692 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0693 _ 55
        mov     ebp, esp                                ; 0694 _ 89. E5
        sub     esp, 16                                 ; 0696 _ 83. EC, 10
        movzx   eax, word [?_074]                       ; 0699 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 06A0 _ 98
        mov     dword [ebp-8H], eax                     ; 06A1 _ 89. 45, F8
        movzx   eax, word [?_075]                       ; 06A4 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 06AB _ 98
        mov     dword [ebp-4H], eax                     ; 06AC _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 06AF _ 8B. 45, F8
        sub     eax, 16                                 ; 06B2 _ 83. E8, 10
        mov     edx, eax                                ; 06B5 _ 89. C2
        shr     edx, 31                                 ; 06B7 _ C1. EA, 1F
        add     eax, edx                                ; 06BA _ 01. D0
        sar     eax, 1                                  ; 06BC _ D1. F8
        mov     dword [mouse_x], eax                    ; 06BE _ A3, 00000120(d)
        mov     eax, dword [ebp-4H]                     ; 06C3 _ 8B. 45, FC
        sub     eax, 44                                 ; 06C6 _ 83. E8, 2C
        mov     edx, eax                                ; 06C9 _ 89. C2
        shr     edx, 31                                 ; 06CB _ C1. EA, 1F
        add     eax, edx                                ; 06CE _ 01. D0
        sar     eax, 1                                  ; 06D0 _ D1. F8
        mov     dword [mouse_y], eax                    ; 06D2 _ A3, 00000124(d)
        leave                                           ; 06D7 _ C9
        ret                                             ; 06D8 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 06D9 _ 55
        mov     ebp, esp                                ; 06DA _ 89. E5
        sub     esp, 20                                 ; 06DC _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 06DF _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 06E2 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 06E5 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 06EC _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 06F1 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 06F4 _ 8B. 45, 18
        add     eax, edx                                ; 06F7 _ 01. D0
        movzx   eax, byte [eax]                         ; 06F9 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 06FC _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 06FF _ 0F B6. 45, FB
        test    al, al                                  ; 0703 _ 84. C0
        jns     ?_012                                   ; 0705 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0707 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 070A _ 8B. 55, 14
        add     eax, edx                                ; 070D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 070F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0713 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0715 _ 8B. 45, 10
        add     eax, edx                                ; 0718 _ 01. D0
        mov     edx, eax                                ; 071A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 071C _ 8B. 45, 08
        add     edx, eax                                ; 071F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0721 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0725 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 0727 _ 0F B6. 45, FB
        and     eax, 40H                                ; 072B _ 83. E0, 40
        test    eax, eax                                ; 072E _ 85. C0
        jz      ?_013                                   ; 0730 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0732 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0735 _ 8B. 55, 14
        add     eax, edx                                ; 0738 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 073A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 073E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0740 _ 8B. 45, 10
        add     eax, edx                                ; 0743 _ 01. D0
        lea     edx, [eax+1H]                           ; 0745 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0748 _ 8B. 45, 08
        add     edx, eax                                ; 074B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 074D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0751 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 0753 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0757 _ 83. E0, 20
        test    eax, eax                                ; 075A _ 85. C0
        jz      ?_014                                   ; 075C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 075E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0761 _ 8B. 55, 14
        add     eax, edx                                ; 0764 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0766 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 076A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 076C _ 8B. 45, 10
        add     eax, edx                                ; 076F _ 01. D0
        lea     edx, [eax+2H]                           ; 0771 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0774 _ 8B. 45, 08
        add     edx, eax                                ; 0777 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0779 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 077D _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 077F _ 0F B6. 45, FB
        and     eax, 10H                                ; 0783 _ 83. E0, 10
        test    eax, eax                                ; 0786 _ 85. C0
        jz      ?_015                                   ; 0788 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 078A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 078D _ 8B. 55, 14
        add     eax, edx                                ; 0790 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0792 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0796 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0798 _ 8B. 45, 10
        add     eax, edx                                ; 079B _ 01. D0
        lea     edx, [eax+3H]                           ; 079D _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 07A0 _ 8B. 45, 08
        add     edx, eax                                ; 07A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07A9 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 07AB _ 0F B6. 45, FB
        and     eax, 08H                                ; 07AF _ 83. E0, 08
        test    eax, eax                                ; 07B2 _ 85. C0
        jz      ?_016                                   ; 07B4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07B6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07B9 _ 8B. 55, 14
        add     eax, edx                                ; 07BC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07BE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07C2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07C4 _ 8B. 45, 10
        add     eax, edx                                ; 07C7 _ 01. D0
        lea     edx, [eax+4H]                           ; 07C9 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 07CC _ 8B. 45, 08
        add     edx, eax                                ; 07CF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07D1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07D5 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 07D7 _ 0F B6. 45, FB
        and     eax, 04H                                ; 07DB _ 83. E0, 04
        test    eax, eax                                ; 07DE _ 85. C0
        jz      ?_017                                   ; 07E0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07E2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07E5 _ 8B. 55, 14
        add     eax, edx                                ; 07E8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07EA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07EE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07F0 _ 8B. 45, 10
        add     eax, edx                                ; 07F3 _ 01. D0
        lea     edx, [eax+5H]                           ; 07F5 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 07F8 _ 8B. 45, 08
        add     edx, eax                                ; 07FB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07FD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0801 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 0803 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0807 _ 83. E0, 02
        test    eax, eax                                ; 080A _ 85. C0
        jz      ?_018                                   ; 080C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 080E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0811 _ 8B. 55, 14
        add     eax, edx                                ; 0814 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0816 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 081A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 081C _ 8B. 45, 10
        add     eax, edx                                ; 081F _ 01. D0
        lea     edx, [eax+6H]                           ; 0821 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0824 _ 8B. 45, 08
        add     edx, eax                                ; 0827 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0829 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 082D _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 082F _ 0F B6. 45, FB
        and     eax, 01H                                ; 0833 _ 83. E0, 01
        test    eax, eax                                ; 0836 _ 85. C0
        jz      ?_019                                   ; 0838 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 083A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 083D _ 8B. 55, 14
        add     eax, edx                                ; 0840 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0842 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0846 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0848 _ 8B. 45, 10
        add     eax, edx                                ; 084B _ 01. D0
        lea     edx, [eax+7H]                           ; 084D _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0850 _ 8B. 45, 08
        add     edx, eax                                ; 0853 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0855 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0859 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 085B _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 085F _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 0863 _ 0F 8E, FFFFFE88
        leave                                           ; 0869 _ C9
        ret                                             ; 086A _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 086B _ 55
        mov     ebp, esp                                ; 086C _ 89. E5
        sub     esp, 28                                 ; 086E _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 0871 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 0874 _ 88. 45, FC
        jmp     ?_022                                   ; 0877 _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 0879 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 087D _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 0880 _ 0F B6. 12
        movsx   edx, dl                                 ; 0883 _ 0F BE. D2
        shl     edx, 4                                  ; 0886 _ C1. E2, 04
        add     edx, systemFont                         ; 0889 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 088F _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 0893 _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 0897 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 089A _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 089E _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 08A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 08A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08AF _ 89. 04 24
        call    paint_font                              ; 08B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 08B7 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 08BB _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 08BF _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 08C2 _ 0F B6. 00
        test    al, al                                  ; 08C5 _ 84. C0
        jnz     ?_021                                   ; 08C7 _ 75, B0
        leave                                           ; 08C9 _ C9
        ret                                             ; 08CA _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 08CB _ 55
        mov     ebp, esp                                ; 08CC _ 89. E5
        sub     esp, 20                                 ; 08CE _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 08D1 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 08D4 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 08D7 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 08DE _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 08E3 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 08EA _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 08EF _ 8B. 45, F8
        shl     eax, 4                                  ; 08F2 _ C1. E0, 04
        mov     edx, eax                                ; 08F5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08F7 _ 8B. 45, FC
        add     eax, edx                                ; 08FA _ 01. D0
        add     eax, cursor.1564                        ; 08FC _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0901 _ 0F B6. 00
        cmp     al, 42                                  ; 0904 _ 3C, 2A
        jnz     ?_025                                   ; 0906 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0908 _ 8B. 45, F8
        shl     eax, 4                                  ; 090B _ C1. E0, 04
        mov     edx, eax                                ; 090E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0910 _ 8B. 45, FC
        add     eax, edx                                ; 0913 _ 01. D0
        mov     edx, eax                                ; 0915 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0917 _ 8B. 45, 08
        add     eax, edx                                ; 091A _ 01. D0
        mov     byte [eax], 0                           ; 091C _ C6. 00, 00
        jmp     ?_027                                   ; 091F _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 0921 _ 8B. 45, F8
        shl     eax, 4                                  ; 0924 _ C1. E0, 04
        mov     edx, eax                                ; 0927 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0929 _ 8B. 45, FC
        add     eax, edx                                ; 092C _ 01. D0
        add     eax, cursor.1564                        ; 092E _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0933 _ 0F B6. 00
        cmp     al, 79                                  ; 0936 _ 3C, 4F
        jnz     ?_026                                   ; 0938 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 093A _ 8B. 45, F8
        shl     eax, 4                                  ; 093D _ C1. E0, 04
        mov     edx, eax                                ; 0940 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0942 _ 8B. 45, FC
        add     eax, edx                                ; 0945 _ 01. D0
        mov     edx, eax                                ; 0947 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0949 _ 8B. 45, 08
        add     eax, edx                                ; 094C _ 01. D0
        mov     byte [eax], 7                           ; 094E _ C6. 00, 07
        jmp     ?_027                                   ; 0951 _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 0953 _ 8B. 45, F8
        shl     eax, 4                                  ; 0956 _ C1. E0, 04
        mov     edx, eax                                ; 0959 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 095B _ 8B. 45, FC
        add     eax, edx                                ; 095E _ 01. D0
        mov     edx, eax                                ; 0960 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0962 _ 8B. 45, 08
        add     edx, eax                                ; 0965 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0967 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 096B _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 096D _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0971 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0975 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 097B _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 097F _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0983 _ 0F 8E, FFFFFF5A
        leave                                           ; 0989 _ C9
        ret                                             ; 098A _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 098B _ 55
        mov     ebp, esp                                ; 098C _ 89. E5
        sub     esp, 16                                 ; 098E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0991 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0998 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 099A _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 09A1 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 09A3 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 09A6 _ 8B. 55, 14
        add     eax, edx                                ; 09A9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09AB _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 09AF _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 09B2 _ 8B. 4D, 10
        add     edx, ecx                                ; 09B5 _ 01. CA
        add     eax, edx                                ; 09B7 _ 01. D0
        mov     edx, eax                                ; 09B9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09BB _ 8B. 45, 08
        add     edx, eax                                ; 09BE _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 09C0 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 09C3 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 09C7 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 09C9 _ 8B. 45, FC
        add     eax, ecx                                ; 09CC _ 01. C8
        mov     ecx, eax                                ; 09CE _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 09D0 _ 8B. 45, 20
        add     eax, ecx                                ; 09D3 _ 01. C8
        movzx   eax, byte [eax]                         ; 09D5 _ 0F B6. 00
        mov     byte [edx], al                          ; 09D8 _ 88. 02
        add     dword [ebp-4H], 1                       ; 09DA _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 09DE _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 09E1 _ 3B. 45, 18
        jl      ?_031                                   ; 09E4 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 09E6 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 09EA _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 09ED _ 3B. 45, 1C
        jl      ?_030                                   ; 09F0 _ 7C, A8
        leave                                           ; 09F2 _ C9
        ret                                             ; 09F3 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 09F4 _ 55
        mov     ebp, esp                                ; 09F5 _ 89. E5
        sub     esp, 24                                 ; 09F7 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 09FA _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0A02 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0A0A _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0A11 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0A16 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0A1E _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0A26 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0A2D _ E8, FFFFFFFC(rel)
        leave                                           ; 0A32 _ C9
        ret                                             ; 0A33 _ C3
; init_fifo_buf End of function

eraser_mouse:; Function begin
        push    ebp                                     ; 0A34 _ 55
        mov     ebp, esp                                ; 0A35 _ 89. E5
        push    ebx                                     ; 0A37 _ 53
        sub     esp, 44                                 ; 0A38 _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0A3B _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0A40 _ 89. 45, F4
        movzx   eax, word [?_074]                       ; 0A43 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0A4A _ 98
        mov     dword [ebp-8H], eax                     ; 0A4B _ 89. 45, F8
        mov     eax, dword [mouse_y]                    ; 0A4E _ A1, 00000124(d)
        lea     ebx, [eax+0FH]                          ; 0A53 _ 8D. 58, 0F
        mov     eax, dword [mouse_x]                    ; 0A56 _ A1, 00000120(d)
        lea     ecx, [eax+0FH]                          ; 0A5B _ 8D. 48, 0F
        mov     edx, dword [mouse_y]                    ; 0A5E _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0A64 _ A1, 00000120(d)
        mov     dword [esp+18H], ebx                    ; 0A69 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A6D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A71 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A75 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A79 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-8H]                     ; 0A81 _ 8B. 45, F8
        mov     dword [esp+4H], eax                     ; 0A84 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0A88 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0A8B _ 89. 04 24
        call    paint_rectangle                         ; 0A8E _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 0A93 _ 83. C4, 2C
        pop     ebx                                     ; 0A96 _ 5B
        pop     ebp                                     ; 0A97 _ 5D
        ret                                             ; 0A98 _ C3
; eraser_mouse End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0A99 _ 55
        mov     ebp, esp                                ; 0A9A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A9C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A9F _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0AA2 _ A1, 00000120(d)
        add     eax, edx                                ; 0AA7 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0AA9 _ A3, 00000120(d)
        mov     eax, dword [ebp+8H]                     ; 0AAE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0AB1 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0AB4 _ A1, 00000124(d)
        add     eax, edx                                ; 0AB9 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0ABB _ A3, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0AC0 _ A1, 00000120(d)
        test    eax, eax                                ; 0AC5 _ 85. C0
        jns     ?_034                                   ; 0AC7 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0AC9 _ C7. 05, 00000120(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0AD3 _ A1, 00000124(d)
        test    eax, eax                                ; 0AD8 _ 85. C0
        jns     ?_035                                   ; 0ADA _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0ADC _ C7. 05, 00000124(d), 00000000
?_035:  movzx   eax, word [?_074]                       ; 0AE6 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0AED _ 98
        lea     edx, [eax-10H]                          ; 0AEE _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0AF1 _ A1, 00000120(d)
        cmp     edx, eax                                ; 0AF6 _ 39. C2
        jge     ?_036                                   ; 0AF8 _ 7D, 10
        movzx   eax, word [?_074]                       ; 0AFA _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B01 _ 98
        sub     eax, 16                                 ; 0B02 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0B05 _ A3, 00000120(d)
?_036:  movzx   eax, word [?_074]                       ; 0B0A _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B11 _ 98
        lea     edx, [eax-10H]                          ; 0B12 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0B15 _ A1, 00000124(d)
        cmp     edx, eax                                ; 0B1A _ 39. C2
        jge     ?_037                                   ; 0B1C _ 7D, 10
        movzx   eax, word [?_074]                       ; 0B1E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B25 _ 98
        sub     eax, 16                                 ; 0B26 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0B29 _ A3, 00000124(d)
?_037:  pop     ebp                                     ; 0B2E _ 5D
        ret                                             ; 0B2F _ C3
; compute_mouse_position End of function

draw_mouse:; Function begin
        push    ebp                                     ; 0B30 _ 55
        mov     ebp, esp                                ; 0B31 _ 89. E5
        sub     esp, 44                                 ; 0B33 _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0B36 _ A1, 00000000(d)
        mov     dword [ebp-8H], eax                     ; 0B3B _ 89. 45, F8
        movzx   eax, word [?_074]                       ; 0B3E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B45 _ 98
        mov     dword [ebp-4H], eax                     ; 0B46 _ 89. 45, FC
        mov     edx, dword [mouse_y]                    ; 0B49 _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0B4F _ A1, 00000120(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0B54 _ C7. 44 24, 18, 00000020(d)
        mov     dword [esp+14H], 16                     ; 0B5C _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 0B64 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 0B6C _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0B70 _ 89. 44 24, 08
        mov     eax, dword [ebp-4H]                     ; 0B74 _ 8B. 45, FC
        mov     dword [esp+4H], eax                     ; 0B77 _ 89. 44 24, 04
        mov     eax, dword [ebp-8H]                     ; 0B7B _ 8B. 45, F8
        mov     dword [esp], eax                        ; 0B7E _ 89. 04 24
        call    paint_block                             ; 0B81 _ E8, FFFFFFFC(rel)
        leave                                           ; 0B86 _ C9
        ret                                             ; 0B87 _ C3
; draw_mouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0B88 _ 55
        mov     ebp, esp                                ; 0B89 _ 89. E5
        sub     esp, 40                                 ; 0B8B _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0B8E _ C6. 45, F7, 00
        call    io_sti                                  ; 0B92 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0B97 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0B9E _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0BA3 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0BA6 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0BAA _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0BAE _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0BB5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0BBA _ 85. C0
        jz      ?_038                                   ; 0BBC _ 74, 16
        call    eraser_mouse                            ; 0BBE _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouse_send_info            ; 0BC3 _ C7. 04 24, 00000000(d)
        call    compute_mouse_position                  ; 0BCA _ E8, FFFFFFFC(rel)
        call    draw_mouse                              ; 0BCF _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0BD4 _ C9
        ret                                             ; 0BD5 _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0BD6 _ 55
        mov     ebp, esp                                ; 0BD7 _ 89. E5
        sub     esp, 24                                 ; 0BD9 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0BDC _ C7. 04 24, 00000064
        call    io_in8                                  ; 0BE3 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0BE8 _ 83. E0, 02
        test    eax, eax                                ; 0BEB _ 85. C0
        jnz     ?_040                                   ; 0BED _ 75, 02
        jmp     ?_041                                   ; 0BEF _ EB, 02

?_040:  jmp     ?_039                                   ; 0BF1 _ EB, E9

?_041:  leave                                           ; 0BF3 _ C9
        ret                                             ; 0BF4 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0BF5 _ 55
        mov     ebp, esp                                ; 0BF6 _ 89. E5
        sub     esp, 24                                 ; 0BF8 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0BFB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0C00 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0C08 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C0F _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C14 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0C19 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0C21 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C28 _ E8, FFFFFFFC(rel)
        leave                                           ; 0C2D _ C9
        ret                                             ; 0C2E _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C2F _ 55
        mov     ebp, esp                                ; 0C30 _ 89. E5
        sub     esp, 24                                 ; 0C32 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C35 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0C3A _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0C42 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C49 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C4E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0C53 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0C5B _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C62 _ E8, FFFFFFFC(rel)
        leave                                           ; 0C67 _ C9
        ret                                             ; 0C68 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0C69 _ 55
        mov     ebp, esp                                ; 0C6A _ 89. E5
        sub     esp, 4                                  ; 0C6C _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C6F _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C72 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C75 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C78 _ 0F B6. 40, 03
        test    al, al                                  ; 0C7C _ 84. C0
        jnz     ?_043                                   ; 0C7E _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C80 _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0C84 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C86 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C89 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0C8D _ B8, 00000000
        jmp     ?_050                                   ; 0C92 _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0C97 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C9A _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C9E _ 3C, 01
        jnz     ?_045                                   ; 0CA0 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0CA2 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0CA6 _ 25, 000000C8
        cmp     eax, 8                                  ; 0CAB _ 83. F8, 08
        jnz     ?_044                                   ; 0CAE _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0CB0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CB3 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0CB7 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0CB9 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0CBC _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0CC0 _ B8, 00000000
        jmp     ?_050                                   ; 0CC5 _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0CCA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CCD _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0CD1 _ 3C, 02
        jnz     ?_046                                   ; 0CD3 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0CD5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CD8 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0CDC _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0CDF _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0CE2 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0CE6 _ B8, 00000000
        jmp     ?_050                                   ; 0CEB _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0CF0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CF3 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0CF7 _ 3C, 03
        jne     ?_049                                   ; 0CF9 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0CFF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D02 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0D06 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0D09 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D0C _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0D10 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D13 _ 0F B6. 00
        movzx   eax, al                                 ; 0D16 _ 0F B6. C0
        and     eax, 07H                                ; 0D19 _ 83. E0, 07
        mov     edx, eax                                ; 0D1C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D1E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0D21 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D24 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0D27 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0D2B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D2E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D31 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D34 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0D37 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0D3B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D3E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D41 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0D44 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D47 _ 0F B6. 00
        movzx   eax, al                                 ; 0D4A _ 0F B6. C0
        and     eax, 10H                                ; 0D4D _ 83. E0, 10
        test    eax, eax                                ; 0D50 _ 85. C0
        jz      ?_047                                   ; 0D52 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D54 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D57 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0D5A _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D61 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D64 _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0D67 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D6A _ 0F B6. 00
        movzx   eax, al                                 ; 0D6D _ 0F B6. C0
        and     eax, 20H                                ; 0D70 _ 83. E0, 20
        test    eax, eax                                ; 0D73 _ 85. C0
        jz      ?_048                                   ; 0D75 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D77 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D7A _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D7D _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D82 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D84 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D87 _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0D8A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D8D _ 8B. 40, 08
        neg     eax                                     ; 0D90 _ F7. D8
        mov     edx, eax                                ; 0D92 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D94 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D97 _ 89. 50, 08
        mov     eax, 1                                  ; 0D9A _ B8, 00000001
        jmp     ?_050                                   ; 0D9F _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0DA1 _ B8, FFFFFFFF
?_050:  leave                                           ; 0DA6 _ C9
        ret                                             ; 0DA7 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0DA8 _ 55
        mov     ebp, esp                                ; 0DA9 _ 89. E5
        sub     esp, 40                                 ; 0DAB _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0DAE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0DB6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0DBD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0DC2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0DCA _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0DD1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0DD6 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0DDD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0DE2 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0DE5 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0DE9 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0DED _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0DF4 _ E8, FFFFFFFC(rel)
        leave                                           ; 0DF9 _ C9
        ret                                             ; 0DFA _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0DFB _ 55
        mov     ebp, esp                                ; 0DFC _ 89. E5
        sub     esp, 40                                 ; 0DFE _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0E01 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0E09 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0E10 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0E15 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0E1D _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0E24 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0E29 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0E30 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0E35 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E38 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0E3C _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0E40 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0E47 _ E8, FFFFFFFC(rel)
        leave                                           ; 0E4C _ C9
        ret                                             ; 0E4D _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0E4E _ 55
        mov     ebp, esp                                ; 0E4F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E51 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0E54 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0E57 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0E59 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0E5C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E63 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E66 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E6D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E70 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0E73 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E76 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E79 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0E7C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E7F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0E82 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0E89 _ 5D
        ret                                             ; 0E8A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0E8B _ 55
        mov     ebp, esp                                ; 0E8C _ 89. E5
        sub     esp, 20                                 ; 0E8E _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0E91 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0E94 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0E97 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E9A _ 8B. 40, 10
        test    eax, eax                                ; 0E9D _ 85. C0
        jnz     ?_051                                   ; 0E9F _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0EA1 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0EA4 _ 8B. 40, 14
        or      eax, 01H                                ; 0EA7 _ 83. C8, 01
        mov     edx, eax                                ; 0EAA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EAC _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0EAF _ 89. 50, 14
        mov     eax, 4294967295                         ; 0EB2 _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0EB7 _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0EBC _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0EBF _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0EC2 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0EC5 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0EC7 _ 8B. 45, FC
        add     edx, eax                                ; 0ECA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0ECC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0ED0 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0ED2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0ED5 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0ED8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EDB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0EDE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EE1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0EE4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EE7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0EEA _ 8B. 40, 0C
        cmp     edx, eax                                ; 0EED _ 39. C2
        jnz     ?_052                                   ; 0EEF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0EF1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0EF4 _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0EFB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0EFE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0F01 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0F04 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F07 _ 89. 50, 10
        mov     eax, 0                                  ; 0F0A _ B8, 00000000
?_053:  leave                                           ; 0F0F _ C9
        ret                                             ; 0F10 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0F11 _ 55
        mov     ebp, esp                                ; 0F12 _ 89. E5
        sub     esp, 16                                 ; 0F14 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0F17 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0F1A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F1D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F20 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F23 _ 39. C2
        jnz     ?_054                                   ; 0F25 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0F27 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0F2A _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0F31 _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0F36 _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 0F38 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F3B _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0F3E _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0F41 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0F44 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0F46 _ 8B. 45, F8
        add     eax, edx                                ; 0F49 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F4B _ 0F B6. 00
        movzx   eax, al                                 ; 0F4E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0F51 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F54 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F57 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0F5A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F5D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F60 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F63 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0F66 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F69 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F6C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F6F _ 39. C2
        jnz     ?_055                                   ; 0F71 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0F73 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F76 _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 0F7D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F80 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0F83 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F86 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F89 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0F8C _ 8B. 45, FC
?_056:  leave                                           ; 0F8F _ C9
        ret                                             ; 0F90 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0F91 _ 55
        mov     ebp, esp                                ; 0F92 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F94 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0F97 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F9A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F9D _ 8B. 40, 10
        sub     edx, eax                                ; 0FA0 _ 29. C2
        mov     eax, edx                                ; 0FA2 _ 89. D0
        pop     ebp                                     ; 0FA4 _ 5D
        ret                                             ; 0FA5 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0FA6 _ 55
        mov     ebp, esp                                ; 0FA7 _ 89. E5
        sub     esp, 4                                  ; 0FA9 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0FAC _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0FAF _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0FB2 _ 80. 7D, FC, 09
        jle     ?_057                                   ; 0FB6 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0FB8 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0FBC _ 83. C0, 37
        jmp     ?_058                                   ; 0FBF _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 0FC1 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0FC5 _ 83. C0, 30
?_058:  leave                                           ; 0FC8 _ C9
        ret                                             ; 0FC9 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0FCA _ 55
        mov     ebp, esp                                ; 0FCB _ 89. E5
        sub     esp, 24                                 ; 0FCD _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0FD0 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0FD3 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FD6 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0FDD _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0FE1 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0FE4 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0FE7 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0FEB _ 89. 04 24
        call    charToHexVal                            ; 0FEE _ E8, FFFFFFFC(rel)
        mov     byte [?_073], al                        ; 0FF3 _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 0FF8 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0FFC _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0FFF _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1002 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1006 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1009 _ 89. 04 24
        call    charToHexVal                            ; 100C _ E8, FFFFFFFC(rel)
        mov     byte [?_072], al                        ; 1011 _ A2, 00000142(d)
        mov     eax, keyval                             ; 1016 _ B8, 00000140(d)
        leave                                           ; 101B _ C9
        ret                                             ; 101C _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 101D _ 55
        mov     ebp, esp                                ; 101E _ 89. E5
        sub     esp, 16                                 ; 1020 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1023 _ C6. 05, 00000220(d), 30
        mov     byte [?_076], 88                        ; 102A _ C6. 05, 00000221(d), 58
        mov     byte [?_077], 0                         ; 1031 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1038 _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 103F _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 1041 _ 8B. 45, F4
        add     eax, str.1386                           ; 1044 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 1049 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 104C _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 1050 _ 83. 7D, F4, 09
        jle     ?_059                                   ; 1054 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1056 _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 105D _ EB, 40

?_061:  mov     eax, dword [ebp+8H]                     ; 105F _ 8B. 45, 08
        and     eax, 0FH                                ; 1062 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1065 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1068 _ 8B. 45, 08
        shr     eax, 4                                  ; 106B _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 106E _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1071 _ 83. 7D, FC, 09
        jle     ?_062                                   ; 1075 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1077 _ 8B. 45, FC
        add     eax, 55                                 ; 107A _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 107D _ 8B. 55, F8
        add     edx, str.1386                           ; 1080 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1086 _ 88. 02
        jmp     ?_063                                   ; 1088 _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 108A _ 8B. 45, FC
        add     eax, 48                                 ; 108D _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1090 _ 8B. 55, F8
        add     edx, str.1386                           ; 1093 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1099 _ 88. 02
?_063:  sub     dword [ebp-8H], 1                       ; 109B _ 83. 6D, F8, 01
?_064:  cmp     dword [ebp-8H], 1                       ; 109F _ 83. 7D, F8, 01
        jle     ?_065                                   ; 10A3 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 10A5 _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 10A9 _ 75, B4
?_065:  mov     eax, str.1386                           ; 10AB _ B8, 00000220(d)
        leave                                           ; 10B0 _ C9
        ret                                             ; 10B1 _ C3
; intToHexStr End of function

show_memory_info:; Function begin
        push    ebp                                     ; 10B2 _ 55
        mov     ebp, esp                                ; 10B3 _ 89. E5
        sub     esp, 88                                 ; 10B5 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 10B8 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 10BF _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 10C6 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 10CD _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 10D2 _ 89. 45, D4
        movzx   eax, word [screen_info+4H]              ; 10D5 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 10DC _ 98
        mov     dword [ebp-28H], eax                    ; 10DD _ 89. 45, D8
        movzx   eax, word [screen_info+6H]              ; 10E0 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 10E7 _ 98
        mov     dword [ebp-24H], eax                    ; 10E8 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10EB _ 8B. 45, DC
        mov     dword [esp+8H], eax                     ; 10EE _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 10F2 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 10F5 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 10F9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 10FC _ 89. 04 24
        call    init_desktop                            ; 10FF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1104 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_066                  ; 110C _ C7. 44 24, 10, 00000000(d)
        mov     eax, dword [ebp-34H]                    ; 1114 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1117 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 111B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 111E _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1122 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1125 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1129 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 112C _ 89. 04 24
        call    paint_string                            ; 112F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1134 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1137 _ 89. 04 24
        call    intToHexStr                             ; 113A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 113F _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1142 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 114A _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 114D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1151 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1154 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1158 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 115B _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 115F _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1162 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1166 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1169 _ 89. 04 24
        call    paint_string                            ; 116C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1171 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1175 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_067                  ; 117D _ C7. 44 24, 10, 0000000A(d)
        mov     eax, dword [ebp-34H]                    ; 1185 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1188 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 118C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 118F _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1193 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1196 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 119A _ 8B. 45, D4
        mov     dword [esp], eax                        ; 119D _ 89. 04 24
        call    paint_string                            ; 11A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 11A5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 11A8 _ 8B. 00
        mov     dword [esp], eax                        ; 11AA _ 89. 04 24
        call    intToHexStr                             ; 11AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 11B2 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 11B5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 11BD _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 11C0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11C4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11C7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11CB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11CE _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11D2 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11D5 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 11D9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 11DC _ 89. 04 24
        call    paint_string                            ; 11DF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11E4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11E8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_068                  ; 11F0 _ C7. 44 24, 10, 00000016(d)
        mov     eax, dword [ebp-34H]                    ; 11F8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11FB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11FF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1202 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1206 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1209 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 120D _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1210 _ 89. 04 24
        call    paint_string                            ; 1213 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1218 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 121B _ 8B. 40, 04
        mov     dword [esp], eax                        ; 121E _ 89. 04 24
        call    intToHexStr                             ; 1221 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1226 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1229 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1231 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1234 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1238 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 123B _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 123F _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1242 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1246 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1249 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 124D _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1250 _ 89. 04 24
        call    paint_string                            ; 1253 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1258 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 125C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_069                  ; 1264 _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 126C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 126F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1273 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1276 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 127A _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 127D _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1281 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1284 _ 89. 04 24
        call    paint_string                            ; 1287 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 128C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 128F _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1292 _ 89. 04 24
        call    intToHexStr                             ; 1295 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 129A _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 129D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 12A5 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 12A8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12AC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12AF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12B3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12B6 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12BA _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12BD _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12C1 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12C4 _ 89. 04 24
        call    paint_string                            ; 12C7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12CC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12D0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_070                  ; 12D8 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 12E0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12E3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12E7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12EA _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12EE _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12F1 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12F5 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12F8 _ 89. 04 24
        call    paint_string                            ; 12FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1300 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1303 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1306 _ 89. 04 24
        call    intToHexStr                             ; 1309 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 130E _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1311 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1319 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 131C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1320 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1323 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1327 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 132A _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 132E _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1331 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1335 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1338 _ 89. 04 24
        call    paint_string                            ; 133B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1340 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1344 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_071                  ; 134C _ C7. 44 24, 10, 0000003B(d)
        mov     eax, dword [ebp-34H]                    ; 1354 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1357 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 135B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 135E _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1362 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1365 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1369 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 136C _ 89. 04 24
        call    paint_string                            ; 136F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1374 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1377 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 137A _ 89. 04 24
        call    intToHexStr                             ; 137D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1382 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1385 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 138D _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1390 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1394 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1397 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 139B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 139E _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 13A2 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 13A5 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 13A9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 13AC _ 89. 04 24
        call    paint_string                            ; 13AF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13B4 _ 83. 45, CC, 10
        leave                                           ; 13B8 _ C9
        ret                                             ; 13B9 _ C3
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


