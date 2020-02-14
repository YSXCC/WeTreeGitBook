; Disassembly of file: ckernel.o
; Fri Feb 14 16:32:09 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global init_screeninfo: function
global init_palette: function
global set_palette: function
global paint_rectangle: function
global init_desktop: function
global paint_font: function
global paint_string: function
global init_mouse_cursor: function
global paint_block: function
global init_fifo_buf: function
global show_mouse_info: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerKeyboard: function
global intHandlerMouse: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function

extern keyinfo                                          ; byte
extern io_out8                                          ; near
extern io_sti                                           ; near
extern keybuf                                           ; byte
extern io_store_eflags                                  ; near
extern io_stihlt                                        ; near
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern mouseinfo                                        ; byte
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near
extern mousebuf                                         ; byte


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-1CH], eax                    ; 0018 _ 89. 45, E4
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-18H], eax                    ; 0023 _ 89. 45, E8
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-14H], eax                    ; 002E _ 89. 45, EC
        call    init_palette                            ; 0031 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0036 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 003B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0040 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 0043 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 0047 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 004A _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 004E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0051 _ 89. 04 24
        call    init_desktop                            ; 0054 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0059 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 005E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0063 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 006A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 006F _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0076 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 007B _ 89. C3
        mov     dword [esp], mouseinfo                  ; 007D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0084 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0089 _ 01. D8
        test    eax, eax                                ; 008B _ 85. C0
        jnz     ?_002                                   ; 008D _ 75, 0A
        call    io_stihlt                               ; 008F _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 0094 _ E9, 000000A4

?_002:  mov     dword [esp], keyinfo                    ; 0099 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 00A0 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 00A5 _ 85. C0
        jz      ?_003                                   ; 00A7 _ 74, 66
        call    io_sti                                  ; 00A9 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 00AE _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 00BA _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 00BD _ 8B. 45, F0
        movzx   eax, al                                 ; 00C0 _ 0F B6. C0
        mov     dword [esp], eax                        ; 00C3 _ 89. 04 24
        call    charToHexStr                            ; 00C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 00CB _ 89. 45, F4
        mov     eax, dword [showPos.1483]               ; 00CE _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 00D3 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0CH]                    ; 00DB _ 8B. 55, F4
        mov     dword [esp+10H], edx                    ; 00DE _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 00E2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], eax                     ; 00EA _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 00EE _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 00F1 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00F5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00F8 _ 89. 04 24
        call    paint_string                            ; 00FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [showPos.1483]               ; 0100 _ A1, 00000000(d)
        add     eax, 32                                 ; 0105 _ 83. C0, 20
        mov     dword [showPos.1483], eax               ; 0108 _ A3, 00000000(d)
        jmp     ?_004                                   ; 010D _ EB, 2E

?_003:  mov     dword [esp], mouseinfo                  ; 010F _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0116 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 011B _ 85. C0
        jz      ?_004                                   ; 011D _ 74, 1E
        mov     eax, dword [ebp-14H]                    ; 011F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 0122 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 0126 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0129 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 012D _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0130 _ 89. 04 24
        call    show_mouse_info                         ; 0133 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0138 _ E9, FFFFFF2D

?_004:  jmp     ?_001                                   ; 013D _ E9, FFFFFF28
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0142 _ 55
        mov     ebp, esp                                ; 0143 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0145 _ A1, 00000000(d)
        mov     edx, eax                                ; 014A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 014C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 014F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0151 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0154 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 015A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 015D _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0163 _ 5D
        ret                                             ; 0164 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0165 _ 55
        mov     ebp, esp                                ; 0166 _ 89. E5
        sub     esp, 24                                 ; 0168 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1476          ; 016B _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0173 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 017B _ C7. 04 24, 00000000
        call    set_palette                             ; 0182 _ E8, FFFFFFFC(rel)
        nop                                             ; 0187 _ 90
        leave                                           ; 0188 _ C9
        ret                                             ; 0189 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 018A _ 55
        mov     ebp, esp                                ; 018B _ 89. E5
        sub     esp, 40                                 ; 018D _ 83. EC, 28
        call    io_load_eflags                          ; 0190 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0195 _ 89. 45, F4
        call    io_cli                                  ; 0198 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 019D _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 01A0 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 01A4 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 01AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 01B0 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 01B3 _ 89. 45, F0
        jmp     ?_006                                   ; 01B6 _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 01B8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 01BB _ 0F B6. 00
        shr     al, 2                                   ; 01BE _ C0. E8, 02
        movzx   eax, al                                 ; 01C1 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01C4 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01C8 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01D4 _ 8B. 45, 10
        add     eax, 1                                  ; 01D7 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 01DA _ 0F B6. 00
        shr     al, 2                                   ; 01DD _ C0. E8, 02
        movzx   eax, al                                 ; 01E0 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01E3 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01E7 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01EE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01F3 _ 8B. 45, 10
        add     eax, 2                                  ; 01F6 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 01F9 _ 0F B6. 00
        shr     al, 2                                   ; 01FC _ C0. E8, 02
        movzx   eax, al                                 ; 01FF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0202 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0206 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 020D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0212 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0216 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 021A _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 021D _ 3B. 45, 0C
        jle     ?_005                                   ; 0220 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0222 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0225 _ 89. 04 24
        call    io_store_eflags                         ; 0228 _ E8, FFFFFFFC(rel)
        nop                                             ; 022D _ 90
        leave                                           ; 022E _ C9
        ret                                             ; 022F _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0230 _ 55
        mov     ebp, esp                                ; 0231 _ 89. E5
        sub     esp, 20                                 ; 0233 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0236 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0239 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 023C _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 023F _ 89. 45, FC
        jmp     ?_010                                   ; 0242 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0244 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0247 _ 89. 45, F8
        jmp     ?_009                                   ; 024A _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 024C _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 024F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0253 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0255 _ 8B. 45, F8
        add     eax, edx                                ; 0258 _ 01. D0
        mov     edx, eax                                ; 025A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 025C _ 8B. 45, 08
        add     edx, eax                                ; 025F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0261 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0265 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0267 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 026B _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 026E _ 3B. 45, 1C
        jle     ?_008                                   ; 0271 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0273 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 0277 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 027A _ 3B. 45, 20
        jle     ?_007                                   ; 027D _ 7E, C5
        leave                                           ; 027F _ C9
        ret                                             ; 0280 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0281 _ 55
        mov     ebp, esp                                ; 0282 _ 89. E5
        push    ebx                                     ; 0284 _ 53
        sub     esp, 28                                 ; 0285 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0288 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 028B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 028E _ 8B. 45, 0C
        sub     eax, 1                                  ; 0291 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0294 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0298 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 029C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 02AC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 02B4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02B7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02BE _ 89. 04 24
        call    paint_rectangle                         ; 02C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02C6 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 02C9 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 02CC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 02CF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 02D2 _ 8B. 45, 10
        sub     eax, 28                                 ; 02D5 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 02D8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02DC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02E0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02E4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 02EC _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 02F4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02FE _ 89. 04 24
        call    paint_rectangle                         ; 0301 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0306 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0309 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 030C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 030F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0312 _ 8B. 45, 10
        sub     eax, 27                                 ; 0315 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0318 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 031C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0320 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0324 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 032C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0334 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0337 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 033B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 033E _ 89. 04 24
        call    paint_rectangle                         ; 0341 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0346 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0349 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 034C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 034F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0352 _ 8B. 45, 10
        sub     eax, 26                                 ; 0355 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0358 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 035C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0360 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0364 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 036C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0374 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0377 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 037B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 037E _ 89. 04 24
        call    paint_rectangle                         ; 0381 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0386 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0389 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 038C _ 8B. 45, 10
        sub     eax, 24                                 ; 038F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0392 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0396 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 039E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 03A2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 03AA _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03B2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03B5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03BC _ 89. 04 24
        call    paint_rectangle                         ; 03BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03C4 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03C7 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03CA _ 8B. 45, 10
        sub     eax, 24                                 ; 03CD _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 03D0 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 03D4 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 03DC _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 03E0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 03E8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03FA _ 89. 04 24
        call    paint_rectangle                         ; 03FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0402 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0405 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0408 _ 8B. 45, 10
        sub     eax, 4                                  ; 040B _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 040E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0412 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 041A _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 041E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0426 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 042E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0431 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0435 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0438 _ 89. 04 24
        call    paint_rectangle                         ; 043B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0440 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0443 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0446 _ 8B. 45, 10
        sub     eax, 23                                 ; 0449 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 044C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0450 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0458 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 045C _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0464 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 046C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 046F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0473 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0476 _ 89. 04 24
        call    paint_rectangle                         ; 0479 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 047E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0481 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0484 _ 8B. 45, 10
        sub     eax, 3                                  ; 0487 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 048A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 048E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0496 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 049A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 04A2 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 04AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04B4 _ 89. 04 24
        call    paint_rectangle                         ; 04B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04BC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 04BF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 04C2 _ 8B. 45, 10
        sub     eax, 24                                 ; 04C5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04C8 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 04CC _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 04D4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 04D8 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 04E0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 04E8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04EB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04EF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04F2 _ 89. 04 24
        call    paint_rectangle                         ; 04F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04FA _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04FD _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0500 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0503 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0506 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0509 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 050C _ 8B. 45, 0C
        sub     eax, 47                                 ; 050F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0512 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0516 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 051A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 051E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0522 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 052A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 052D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0531 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0534 _ 89. 04 24
        call    paint_rectangle                         ; 0537 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 053C _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 053F _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0542 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0545 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0548 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 054B _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 054E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0551 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0554 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0558 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 055C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0560 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0564 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 056C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 056F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0573 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0576 _ 89. 04 24
        call    paint_rectangle                         ; 0579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 057E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0581 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0584 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0587 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 058A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 058D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0590 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0593 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0596 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 059A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 059E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05A2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 05A6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 05AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05B8 _ 89. 04 24
        call    paint_rectangle                         ; 05BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05C0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 05C3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 05C6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 05C9 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 05CC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05CF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05D2 _ 8B. 45, 0C
        sub     eax, 3                                  ; 05D5 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 05D8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05DC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05E4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 05E8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 05F0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05FA _ 89. 04 24
        call    paint_rectangle                         ; 05FD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0602 _ 83. C4, 1C
        pop     ebx                                     ; 0605 _ 5B
        pop     ebp                                     ; 0606 _ 5D
        ret                                             ; 0607 _ C3
; init_desktop End of function

paint_font:; Function begin
        push    ebp                                     ; 0608 _ 55
        mov     ebp, esp                                ; 0609 _ 89. E5
        sub     esp, 20                                 ; 060B _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 060E _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0611 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0614 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 061B _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 0620 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0623 _ 8B. 45, 18
        add     eax, edx                                ; 0626 _ 01. D0
        movzx   eax, byte [eax]                         ; 0628 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 062B _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 062E _ 0F B6. 45, FB
        test    al, al                                  ; 0632 _ 84. C0
        jns     ?_012                                   ; 0634 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0636 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0639 _ 8B. 55, 14
        add     eax, edx                                ; 063C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 063E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0642 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0644 _ 8B. 45, 10
        add     eax, edx                                ; 0647 _ 01. D0
        mov     edx, eax                                ; 0649 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 064B _ 8B. 45, 08
        add     edx, eax                                ; 064E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0650 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0654 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 0656 _ 0F B6. 45, FB
        and     eax, 40H                                ; 065A _ 83. E0, 40
        test    eax, eax                                ; 065D _ 85. C0
        jz      ?_013                                   ; 065F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0661 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0664 _ 8B. 55, 14
        add     eax, edx                                ; 0667 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0669 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 066D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066F _ 8B. 45, 10
        add     eax, edx                                ; 0672 _ 01. D0
        lea     edx, [eax+1H]                           ; 0674 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0677 _ 8B. 45, 08
        add     edx, eax                                ; 067A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 067C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0680 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 0682 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0686 _ 83. E0, 20
        test    eax, eax                                ; 0689 _ 85. C0
        jz      ?_014                                   ; 068B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 068D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0690 _ 8B. 55, 14
        add     eax, edx                                ; 0693 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0695 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0699 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069B _ 8B. 45, 10
        add     eax, edx                                ; 069E _ 01. D0
        lea     edx, [eax+2H]                           ; 06A0 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 06A3 _ 8B. 45, 08
        add     edx, eax                                ; 06A6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AC _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 06AE _ 0F B6. 45, FB
        and     eax, 10H                                ; 06B2 _ 83. E0, 10
        test    eax, eax                                ; 06B5 _ 85. C0
        jz      ?_015                                   ; 06B7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06B9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06BC _ 8B. 55, 14
        add     eax, edx                                ; 06BF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C7 _ 8B. 45, 10
        add     eax, edx                                ; 06CA _ 01. D0
        lea     edx, [eax+3H]                           ; 06CC _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 06CF _ 8B. 45, 08
        add     edx, eax                                ; 06D2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D8 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 06DA _ 0F B6. 45, FB
        and     eax, 08H                                ; 06DE _ 83. E0, 08
        test    eax, eax                                ; 06E1 _ 85. C0
        jz      ?_016                                   ; 06E3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06E5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06E8 _ 8B. 55, 14
        add     eax, edx                                ; 06EB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06ED _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F3 _ 8B. 45, 10
        add     eax, edx                                ; 06F6 _ 01. D0
        lea     edx, [eax+4H]                           ; 06F8 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06FB _ 8B. 45, 08
        add     edx, eax                                ; 06FE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0700 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0704 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 0706 _ 0F B6. 45, FB
        and     eax, 04H                                ; 070A _ 83. E0, 04
        test    eax, eax                                ; 070D _ 85. C0
        jz      ?_017                                   ; 070F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0711 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0714 _ 8B. 55, 14
        add     eax, edx                                ; 0717 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0719 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 071D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 071F _ 8B. 45, 10
        add     eax, edx                                ; 0722 _ 01. D0
        lea     edx, [eax+5H]                           ; 0724 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0727 _ 8B. 45, 08
        add     edx, eax                                ; 072A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 072C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0730 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 0732 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0736 _ 83. E0, 02
        test    eax, eax                                ; 0739 _ 85. C0
        jz      ?_018                                   ; 073B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 073D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0740 _ 8B. 55, 14
        add     eax, edx                                ; 0743 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0745 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0749 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 074B _ 8B. 45, 10
        add     eax, edx                                ; 074E _ 01. D0
        lea     edx, [eax+6H]                           ; 0750 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0753 _ 8B. 45, 08
        add     edx, eax                                ; 0756 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0758 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 075C _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 075E _ 0F B6. 45, FB
        and     eax, 01H                                ; 0762 _ 83. E0, 01
        test    eax, eax                                ; 0765 _ 85. C0
        jz      ?_019                                   ; 0767 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0769 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 076C _ 8B. 55, 14
        add     eax, edx                                ; 076F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0771 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0775 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0777 _ 8B. 45, 10
        add     eax, edx                                ; 077A _ 01. D0
        lea     edx, [eax+7H]                           ; 077C _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 077F _ 8B. 45, 08
        add     edx, eax                                ; 0782 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0784 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0788 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 078A _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 078E _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 0792 _ 0F 8E, FFFFFE88
        leave                                           ; 0798 _ C9
        ret                                             ; 0799 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 079A _ 55
        mov     ebp, esp                                ; 079B _ 89. E5
        sub     esp, 28                                 ; 079D _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 07A0 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 07A3 _ 88. 45, FC
        jmp     ?_022                                   ; 07A6 _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 07A8 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 07AC _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 07AF _ 0F B6. 12
        movsx   edx, dl                                 ; 07B2 _ 0F BE. D2
        shl     edx, 4                                  ; 07B5 _ C1. E2, 04
        add     edx, systemFont                         ; 07B8 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 07BE _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 07C2 _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 07C6 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 07C9 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 07CD _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 07D0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 07D4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07D7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07DB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07DE _ 89. 04 24
        call    paint_font                              ; 07E1 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 07E6 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 07EA _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 07EE _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 07F1 _ 0F B6. 00
        test    al, al                                  ; 07F4 _ 84. C0
        jnz     ?_021                                   ; 07F6 _ 75, B0
        leave                                           ; 07F8 _ C9
        ret                                             ; 07F9 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 07FA _ 55
        mov     ebp, esp                                ; 07FB _ 89. E5
        sub     esp, 20                                 ; 07FD _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0800 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0803 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0806 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 080D _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 0812 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0819 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 081E _ 8B. 45, F8
        shl     eax, 4                                  ; 0821 _ C1. E0, 04
        mov     edx, eax                                ; 0824 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0826 _ 8B. 45, FC
        add     eax, edx                                ; 0829 _ 01. D0
        add     eax, cursor.1539                        ; 082B _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0830 _ 0F B6. 00
        cmp     al, 42                                  ; 0833 _ 3C, 2A
        jnz     ?_025                                   ; 0835 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0837 _ 8B. 45, F8
        shl     eax, 4                                  ; 083A _ C1. E0, 04
        mov     edx, eax                                ; 083D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 083F _ 8B. 45, FC
        add     eax, edx                                ; 0842 _ 01. D0
        mov     edx, eax                                ; 0844 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0846 _ 8B. 45, 08
        add     eax, edx                                ; 0849 _ 01. D0
        mov     byte [eax], 0                           ; 084B _ C6. 00, 00
        jmp     ?_027                                   ; 084E _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 0850 _ 8B. 45, F8
        shl     eax, 4                                  ; 0853 _ C1. E0, 04
        mov     edx, eax                                ; 0856 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0858 _ 8B. 45, FC
        add     eax, edx                                ; 085B _ 01. D0
        add     eax, cursor.1539                        ; 085D _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0862 _ 0F B6. 00
        cmp     al, 79                                  ; 0865 _ 3C, 4F
        jnz     ?_026                                   ; 0867 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0869 _ 8B. 45, F8
        shl     eax, 4                                  ; 086C _ C1. E0, 04
        mov     edx, eax                                ; 086F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0871 _ 8B. 45, FC
        add     eax, edx                                ; 0874 _ 01. D0
        mov     edx, eax                                ; 0876 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0878 _ 8B. 45, 08
        add     eax, edx                                ; 087B _ 01. D0
        mov     byte [eax], 7                           ; 087D _ C6. 00, 07
        jmp     ?_027                                   ; 0880 _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 0882 _ 8B. 45, F8
        shl     eax, 4                                  ; 0885 _ C1. E0, 04
        mov     edx, eax                                ; 0888 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 088A _ 8B. 45, FC
        add     eax, edx                                ; 088D _ 01. D0
        mov     edx, eax                                ; 088F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0891 _ 8B. 45, 08
        add     edx, eax                                ; 0894 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0896 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 089A _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 089C _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 08A0 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 08A4 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 08AA _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 08AE _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 08B2 _ 0F 8E, FFFFFF5A
        leave                                           ; 08B8 _ C9
        ret                                             ; 08B9 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 08BA _ 55
        mov     ebp, esp                                ; 08BB _ 89. E5
        sub     esp, 16                                 ; 08BD _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 08C0 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 08C7 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 08C9 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 08D0 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 08D2 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 08D5 _ 8B. 55, 14
        add     eax, edx                                ; 08D8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08DA _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 08DE _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 08E1 _ 8B. 4D, 10
        add     edx, ecx                                ; 08E4 _ 01. CA
        add     eax, edx                                ; 08E6 _ 01. D0
        mov     edx, eax                                ; 08E8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08EA _ 8B. 45, 08
        add     edx, eax                                ; 08ED _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 08EF _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 08F2 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 08F6 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 08F8 _ 8B. 45, FC
        add     eax, ecx                                ; 08FB _ 01. C8
        mov     ecx, eax                                ; 08FD _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 08FF _ 8B. 45, 20
        add     eax, ecx                                ; 0902 _ 01. C8
        movzx   eax, byte [eax]                         ; 0904 _ 0F B6. 00
        mov     byte [edx], al                          ; 0907 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0909 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 090D _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0910 _ 3B. 45, 18
        jl      ?_031                                   ; 0913 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0915 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0919 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 091C _ 3B. 45, 1C
        jl      ?_030                                   ; 091F _ 7C, A8
        leave                                           ; 0921 _ C9
        ret                                             ; 0922 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0923 _ 55
        mov     ebp, esp                                ; 0924 _ 89. E5
        sub     esp, 24                                 ; 0926 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0929 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0931 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0939 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0940 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0945 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 094D _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0955 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 095C _ E8, FFFFFFFC(rel)
        leave                                           ; 0961 _ C9
        ret                                             ; 0962 _ C3
; init_fifo_buf End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0963 _ 55
        mov     ebp, esp                                ; 0964 _ 89. E5
        sub     esp, 56                                 ; 0966 _ 83. EC, 38
        mov     dword [esp], mouseinfo                  ; 0969 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0970 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 0975 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0978 _ 0F B6. 45, F3
        mov     dword [esp], eax                        ; 097C _ 89. 04 24
        call    charToHexStr                            ; 097F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0984 _ 89. 45, F4
        mov     eax, dword [mousePos.1574]              ; 0987 _ A1, 00000140(d)
        mov     dword [esp+14H], 7                      ; 098C _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0CH]                    ; 0994 _ 8B. 55, F4
        mov     dword [esp+10H], edx                    ; 0997 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 099B _ 89. 44 24, 0C
        mov     dword [esp+8H], 0                       ; 099F _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 09A7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09B1 _ 89. 04 24
        call    paint_string                            ; 09B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mousePos.1574]              ; 09B9 _ A1, 00000140(d)
        add     eax, 16                                 ; 09BE _ 83. C0, 10
        mov     dword [mousePos.1574], eax              ; 09C1 _ A3, 00000140(d)
        mov     eax, dword [mousePos.1574]              ; 09C6 _ A1, 00000140(d)
        cmp     eax, 250                                ; 09CB _ 3D, 000000FA
        jle     ?_034                                   ; 09D0 _ 7E, 0A
        mov     dword [mousePos.1574], 16               ; 09D2 _ C7. 05, 00000140(d), 00000010
?_034:  leave                                           ; 09DC _ C9
        ret                                             ; 09DD _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 09DE _ 55
        mov     ebp, esp                                ; 09DF _ 89. E5
        sub     esp, 24                                 ; 09E1 _ 83. EC, 18
?_035:  mov     dword [esp], 100                        ; 09E4 _ C7. 04 24, 00000064
        call    io_in8                                  ; 09EB _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 09F0 _ 83. E0, 02
        test    eax, eax                                ; 09F3 _ 85. C0
        jnz     ?_036                                   ; 09F5 _ 75, 02
        jmp     ?_037                                   ; 09F7 _ EB, 02

?_036:  jmp     ?_035                                   ; 09F9 _ EB, E9

?_037:  leave                                           ; 09FB _ C9
        ret                                             ; 09FC _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 09FD _ 55
        mov     ebp, esp                                ; 09FE _ 89. E5
        sub     esp, 24                                 ; 0A00 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0A03 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0A08 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0A10 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0A17 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0A1C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0A21 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0A29 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0A30 _ E8, FFFFFFFC(rel)
        leave                                           ; 0A35 _ C9
        ret                                             ; 0A36 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0A37 _ 55
        mov     ebp, esp                                ; 0A38 _ 89. E5
        sub     esp, 24                                 ; 0A3A _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0A3D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0A42 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0A4A _ C7. 04 24, 00000064
        call    io_out8                                 ; 0A51 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0A56 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0A5B _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0A63 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0A6A _ E8, FFFFFFFC(rel)
        leave                                           ; 0A6F _ C9
        ret                                             ; 0A70 _ C3
; enable_mouse End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0A71 _ 55
        mov     ebp, esp                                ; 0A72 _ 89. E5
        sub     esp, 40                                 ; 0A74 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0A77 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0A7F _ C7. 04 24, 00000020
        call    io_out8                                 ; 0A86 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0A8B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0A93 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0A9A _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0A9F _ C7. 04 24, 00000060
        call    io_in8                                  ; 0AA6 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0AAB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0AAE _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0AB2 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0AB6 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0ABD _ E8, FFFFFFFC(rel)
        leave                                           ; 0AC2 _ C9
        ret                                             ; 0AC3 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0AC4 _ 55
        mov     ebp, esp                                ; 0AC5 _ 89. E5
        sub     esp, 40                                 ; 0AC7 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0ACA _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0AD2 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0AD9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0ADE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0AE6 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0AED _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0AF2 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0AF9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0AFE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0B01 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0B05 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0B09 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0B10 _ E8, FFFFFFFC(rel)
        leave                                           ; 0B15 _ C9
        ret                                             ; 0B16 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0B17 _ 55
        mov     ebp, esp                                ; 0B18 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B1A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0B1D _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0B20 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0B22 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B25 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0B2C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B2F _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0B36 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0B39 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0B3C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B3F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0B42 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0B45 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B48 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0B4B _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0B52 _ 5D
        ret                                             ; 0B53 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0B54 _ 55
        mov     ebp, esp                                ; 0B55 _ 89. E5
        sub     esp, 20                                 ; 0B57 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0B5A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0B5D _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0B60 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B63 _ 8B. 40, 10
        test    eax, eax                                ; 0B66 _ 85. C0
        jnz     ?_038                                   ; 0B68 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0B6A _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0B6D _ 8B. 40, 14
        or      eax, 01H                                ; 0B70 _ 83. C8, 01
        mov     edx, eax                                ; 0B73 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B75 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0B78 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0B7B _ B8, FFFFFFFF
        jmp     ?_040                                   ; 0B80 _ EB, 56

?_038:  mov     eax, dword [ebp+8H]                     ; 0B82 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B85 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0B88 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B8B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B8E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0B90 _ 8B. 45, FC
        add     edx, eax                                ; 0B93 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B95 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B99 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0B9B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B9E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0BA1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BA4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0BA7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BAA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0BAD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BB0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BB3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BB6 _ 39. C2
        jnz     ?_039                                   ; 0BB8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0BBA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0BBD _ C7. 40, 04, 00000000
?_039:  mov     eax, dword [ebp+8H]                     ; 0BC4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BC7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0BCA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0BCD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0BD0 _ 89. 50, 10
        mov     eax, 0                                  ; 0BD3 _ B8, 00000000
?_040:  leave                                           ; 0BD8 _ C9
        ret                                             ; 0BD9 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0BDA _ 55
        mov     ebp, esp                                ; 0BDB _ 89. E5
        sub     esp, 16                                 ; 0BDD _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0BE0 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0BE3 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0BE6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BE9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BEC _ 39. C2
        jnz     ?_041                                   ; 0BEE _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0BF0 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0BF3 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0BFA _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0BFF _ EB, 57

?_041:  mov     eax, dword [ebp+8H]                     ; 0C01 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C04 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0C07 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0C0A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0C0D _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0C0F _ 8B. 45, F8
        add     eax, edx                                ; 0C12 _ 01. D0
        movzx   eax, byte [eax]                         ; 0C14 _ 0F B6. 00
        movzx   eax, al                                 ; 0C17 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0C1A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C1D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C20 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0C23 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C26 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C29 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C2C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0C2F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C32 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0C35 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0C38 _ 39. C2
        jnz     ?_042                                   ; 0C3A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0C3C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0C3F _ C7. 40, 08, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0C46 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C49 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0C4C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C4F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0C52 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0C55 _ 8B. 45, FC
?_043:  leave                                           ; 0C58 _ C9
        ret                                             ; 0C59 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0C5A _ 55
        mov     ebp, esp                                ; 0C5B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0C5D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0C60 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C63 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C66 _ 8B. 40, 10
        sub     edx, eax                                ; 0C69 _ 29. C2
        mov     eax, edx                                ; 0C6B _ 89. D0
        pop     ebp                                     ; 0C6D _ 5D
        ret                                             ; 0C6E _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0C6F _ 55
        mov     ebp, esp                                ; 0C70 _ 89. E5
        sub     esp, 4                                  ; 0C72 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0C75 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0C78 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0C7B _ 80. 7D, FC, 09
        jle     ?_044                                   ; 0C7F _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0C81 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0C85 _ 83. C0, 37
        jmp     ?_045                                   ; 0C88 _ EB, 07

?_044:  movzx   eax, byte [ebp-4H]                      ; 0C8A _ 0F B6. 45, FC
        add     eax, 48                                 ; 0C8E _ 83. C0, 30
?_045:  leave                                           ; 0C91 _ C9
        ret                                             ; 0C92 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0C93 _ 55
        mov     ebp, esp                                ; 0C94 _ 89. E5
        sub     esp, 24                                 ; 0C96 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0C99 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0C9C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0C9F _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0CA6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0CAA _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0CAD _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0CB0 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0CB4 _ 89. 04 24
        call    charToHexVal                            ; 0CB7 _ E8, FFFFFFFC(rel)
        mov     byte [?_053], al                        ; 0CBC _ A2, 00000147(d)
        movzx   eax, byte [ebp-14H]                     ; 0CC1 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0CC5 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0CC8 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0CCB _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0CCF _ 0F BE. C0
        mov     dword [esp], eax                        ; 0CD2 _ 89. 04 24
        call    charToHexVal                            ; 0CD5 _ E8, FFFFFFFC(rel)
        mov     byte [?_052], al                        ; 0CDA _ A2, 00000146(d)
        mov     eax, keyval                             ; 0CDF _ B8, 00000144(d)
        leave                                           ; 0CE4 _ C9
        ret                                             ; 0CE5 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0CE6 _ 55
        mov     ebp, esp                                ; 0CE7 _ 89. E5
        sub     esp, 16                                 ; 0CE9 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 0CEC _ C6. 05, 00000220(d), 30
        mov     byte [?_054], 88                        ; 0CF3 _ C6. 05, 00000221(d), 58
        mov     byte [?_055], 0                         ; 0CFA _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0D01 _ C7. 45, F4, 00000002
        jmp     ?_047                                   ; 0D08 _ EB, 0F

?_046:  mov     eax, dword [ebp-0CH]                    ; 0D0A _ 8B. 45, F4
        add     eax, str.1386                           ; 0D0D _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0D12 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0D15 _ 83. 45, F4, 01
?_047:  cmp     dword [ebp-0CH], 9                      ; 0D19 _ 83. 7D, F4, 09
        jle     ?_046                                   ; 0D1D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0D1F _ C7. 45, F8, 00000009
        jmp     ?_050                                   ; 0D26 _ EB, 3C

?_048:  mov     eax, dword [ebp+8H]                     ; 0D28 _ 8B. 45, 08
        and     eax, 0FH                                ; 0D2B _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0D2E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D31 _ 8B. 45, 08
        shr     eax, 4                                  ; 0D34 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0D37 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0D3A _ 83. 7D, FC, 09
        jle     ?_049                                   ; 0D3E _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 0D40 _ 8B. 45, FC
        add     eax, 55                                 ; 0D43 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 0D46 _ 8B. 55, F8
        add     edx, str.1386                           ; 0D49 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0D4F _ 88. 02
        jmp     ?_050                                   ; 0D51 _ EB, 11

?_049:  mov     eax, dword [ebp-4H]                     ; 0D53 _ 8B. 45, FC
        add     eax, 48                                 ; 0D56 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 0D59 _ 8B. 55, F8
        add     edx, str.1386                           ; 0D5C _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0D62 _ 88. 02
?_050:  cmp     dword [ebp-8H], 1                       ; 0D64 _ 83. 7D, F8, 01
        jle     ?_051                                   ; 0D68 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0D6A _ 83. 7D, 08, 00
        jnz     ?_048                                   ; 0D6E _ 75, B8
?_051:  leave                                           ; 0D70 _ C9
        ret                                             ; 0D71 _ C3
; intToHexStr End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1476:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1539:                                            ; byte
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

mousePos.1574:                                          ; dword
        dd 00000010H                                    ; 0140 _ 16 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0144 _ 0X

?_052:  db 00H                                          ; 0146 _ .

?_053:  db 00H, 00H                                     ; 0147 _ ..


SECTION .bss    align=32 noexecute                      ; section number 3, bss

showPos.1483:                                           ; dword
        resd    8                                       ; 0000

screen_info:                                            ; qword
        resq    4                                       ; 0020

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0040

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

?_054:  resb    9                                       ; 0221

?_055:  resb    1                                       ; 022A


