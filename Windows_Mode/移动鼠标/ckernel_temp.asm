; Disassembly of file: ckernel.o
; Fri Feb 14 20:45:44 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global init_screeninfo: function
global init_palette: function
global set_palette: function
global paint_rectangle: function
global init_desktop: function
global init_mouse_position: function
global paint_font: function
global paint_string: function
global init_mouse_cursor: function
global paint_block: function
global init_fifo_buf: function
global eraser_mouse: function
global compute_mouse_position: function
global draw_mouse: function
global show_mouse_info: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global mouse_decode: function
global intHandlerKeyboard: function
global intHandlerMouse: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function

extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
extern io_out8                                          ; near
extern mouse_send_info                                  ; byte
extern io_sti                                           ; near
extern keybuf                                           ; byte
extern io_store_eflags                                  ; near
extern io_stihlt                                        ; near
extern mouse_cursor_buf                                 ; byte
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern mouseinfo                                        ; byte
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near
extern mouse_x                                          ; dword
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
        call    init_mouse_position                     ; 0031 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0036 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 003B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0040 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0045 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 004A _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 004D _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 0051 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0054 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0058 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 005B _ 89. 04 24
        call    init_desktop                            ; 005E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 2                       ; 0063 _ C7. 44 24, 04, 00000002
        mov     dword [esp], mouse_cursor_buf           ; 006B _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0072 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0077 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 007D _ A1, 00000000(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0082 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 16                     ; 008A _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 0092 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 009A _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 009E _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 00A2 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 00A5 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00A9 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00AC _ 89. 04 24
        call    paint_block                             ; 00AF _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 00B4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 00B9 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 00C0 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 00C5 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 00CC _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 00D1 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 00D3 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 00DA _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 00DF _ 01. D8
        test    eax, eax                                ; 00E1 _ 85. C0
        jnz     ?_002                                   ; 00E3 _ 75, 0A
        call    io_stihlt                               ; 00E5 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 00EA _ E9, 00000090

?_002:  mov     dword [esp], keyinfo                    ; 00EF _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 00F6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 00FB _ 85. C0
        jz      ?_003                                   ; 00FD _ 74, 66
        call    io_sti                                  ; 00FF _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0104 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 010B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0110 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0113 _ 8B. 45, F0
        movzx   eax, al                                 ; 0116 _ 0F B6. C0
        mov     dword [esp], eax                        ; 0119 _ 89. 04 24
        call    charToHexStr                            ; 011C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0121 _ 89. 45, F4
        mov     eax, dword [showPos.1496]               ; 0124 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0129 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0CH]                    ; 0131 _ 8B. 55, F4
        mov     dword [esp+10H], edx                    ; 0134 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0138 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], eax                     ; 0140 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 0144 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0147 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 014B _ 8B. 45, E4
        mov     dword [esp], eax                        ; 014E _ 89. 04 24
        call    paint_string                            ; 0151 _ E8, FFFFFFFC(rel)
        mov     eax, dword [showPos.1496]               ; 0156 _ A1, 00000000(d)
        add     eax, 32                                 ; 015B _ 83. C0, 20
        mov     dword [showPos.1496], eax               ; 015E _ A3, 00000000(d)
        jmp     ?_004                                   ; 0163 _ EB, 1A

?_003:  mov     dword [esp], mouseinfo                  ; 0165 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 016C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0171 _ 85. C0
        jz      ?_004                                   ; 0173 _ 74, 0A
        call    show_mouse_info                         ; 0175 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 017A _ E9, FFFFFF41

?_004:  jmp     ?_001                                   ; 017F _ E9, FFFFFF3C
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0184 _ 55
        mov     ebp, esp                                ; 0185 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0187 _ A1, 00000000(d)
        mov     edx, eax                                ; 018C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 018E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0191 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0193 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0196 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 019C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 019F _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 01A5 _ 5D
        ret                                             ; 01A6 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 01A7 _ 55
        mov     ebp, esp                                ; 01A8 _ 89. E5
        sub     esp, 24                                 ; 01AA _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1497          ; 01AD _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 01B5 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 01BD _ C7. 04 24, 00000000
        call    set_palette                             ; 01C4 _ E8, FFFFFFFC(rel)
        nop                                             ; 01C9 _ 90
        leave                                           ; 01CA _ C9
        ret                                             ; 01CB _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 01CC _ 55
        mov     ebp, esp                                ; 01CD _ 89. E5
        sub     esp, 40                                 ; 01CF _ 83. EC, 28
        call    io_load_eflags                          ; 01D2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 01D7 _ 89. 45, F4
        call    io_cli                                  ; 01DA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 01DF _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 01E2 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 01E6 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 01ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 01F2 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 01F5 _ 89. 45, F0
        jmp     ?_006                                   ; 01F8 _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 01FA _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 01FD _ 0F B6. 00
        shr     al, 2                                   ; 0200 _ C0. E8, 02
        movzx   eax, al                                 ; 0203 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0206 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 020A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0211 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0216 _ 8B. 45, 10
        add     eax, 1                                  ; 0219 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 021C _ 0F B6. 00
        shr     al, 2                                   ; 021F _ C0. E8, 02
        movzx   eax, al                                 ; 0222 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0225 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0229 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0230 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0235 _ 8B. 45, 10
        add     eax, 2                                  ; 0238 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 023B _ 0F B6. 00
        shr     al, 2                                   ; 023E _ C0. E8, 02
        movzx   eax, al                                 ; 0241 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0244 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0248 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 024F _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0254 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0258 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 025C _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 025F _ 3B. 45, 0C
        jle     ?_005                                   ; 0262 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0264 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0267 _ 89. 04 24
        call    io_store_eflags                         ; 026A _ E8, FFFFFFFC(rel)
        nop                                             ; 026F _ 90
        leave                                           ; 0270 _ C9
        ret                                             ; 0271 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0272 _ 55
        mov     ebp, esp                                ; 0273 _ 89. E5
        sub     esp, 20                                 ; 0275 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0278 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 027B _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 027E _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0281 _ 89. 45, FC
        jmp     ?_010                                   ; 0284 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0286 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0289 _ 89. 45, F8
        jmp     ?_009                                   ; 028C _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 028E _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0291 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0295 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0297 _ 8B. 45, F8
        add     eax, edx                                ; 029A _ 01. D0
        mov     edx, eax                                ; 029C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 029E _ 8B. 45, 08
        add     edx, eax                                ; 02A1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 02A3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 02A7 _ 88. 02
        add     dword [ebp-8H], 1                       ; 02A9 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 02AD _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 02B0 _ 3B. 45, 1C
        jle     ?_008                                   ; 02B3 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 02B5 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 02B9 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 02BC _ 3B. 45, 20
        jle     ?_007                                   ; 02BF _ 7E, C5
        leave                                           ; 02C1 _ C9
        ret                                             ; 02C2 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 02C3 _ 55
        mov     ebp, esp                                ; 02C4 _ 89. E5
        push    ebx                                     ; 02C6 _ 53
        sub     esp, 28                                 ; 02C7 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 02CA _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 02CD _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 02D0 _ 8B. 45, 0C
        sub     eax, 1                                  ; 02D3 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 02D6 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 02DA _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 02DE _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 02E6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 02EE _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 02F6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0300 _ 89. 04 24
        call    paint_rectangle                         ; 0303 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0308 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 030B _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 030E _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0311 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0314 _ 8B. 45, 10
        sub     eax, 28                                 ; 0317 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 031A _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 031E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0322 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0326 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 032E _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0336 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0339 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 033D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0340 _ 89. 04 24
        call    paint_rectangle                         ; 0343 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0348 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 034B _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 034E _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0351 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0354 _ 8B. 45, 10
        sub     eax, 27                                 ; 0357 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 035A _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 035E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0362 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0366 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 036E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0376 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0379 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 037D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0380 _ 89. 04 24
        call    paint_rectangle                         ; 0383 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0388 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 038B _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 038E _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0391 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0394 _ 8B. 45, 10
        sub     eax, 26                                 ; 0397 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 039A _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 039E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03A2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03A6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 03AE _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 03B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03C0 _ 89. 04 24
        call    paint_rectangle                         ; 03C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03C8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 03CB _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 03CE _ 8B. 45, 10
        sub     eax, 24                                 ; 03D1 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 03D4 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 03D8 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 03E0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 03E4 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 03EC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03F4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03FE _ 89. 04 24
        call    paint_rectangle                         ; 0401 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0406 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0409 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 040C _ 8B. 45, 10
        sub     eax, 24                                 ; 040F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0412 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0416 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 041E _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0422 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 042A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0432 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0435 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0439 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 043C _ 89. 04 24
        call    paint_rectangle                         ; 043F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0444 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0447 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 044A _ 8B. 45, 10
        sub     eax, 4                                  ; 044D _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0450 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0454 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 045C _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0460 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0468 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0470 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0473 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0477 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 047A _ 89. 04 24
        call    paint_rectangle                         ; 047D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0482 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0485 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0488 _ 8B. 45, 10
        sub     eax, 23                                 ; 048B _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 048E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0492 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 049A _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 049E _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 04A6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04B8 _ 89. 04 24
        call    paint_rectangle                         ; 04BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04C0 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 04C3 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 04C6 _ 8B. 45, 10
        sub     eax, 3                                  ; 04C9 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 04CC _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04D0 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04D8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 04DC _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 04E4 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 04EC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04EF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04F3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04F6 _ 89. 04 24
        call    paint_rectangle                         ; 04F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04FE _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0501 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0504 _ 8B. 45, 10
        sub     eax, 24                                 ; 0507 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 050A _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 050E _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0516 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 051A _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0522 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 052A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 052D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0531 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0534 _ 89. 04 24
        call    paint_rectangle                         ; 0537 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 053C _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 053F _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0542 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0545 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0548 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 054B _ 8D. 50, E8
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
        lea     ebx, [eax-4H]                           ; 0581 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0584 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0587 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 058A _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 058D _ 8D. 50, E9
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
        lea     ebx, [eax-3H]                           ; 05C3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 05C6 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05C9 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 05CC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05CF _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 05D2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05D5 _ 83. E8, 2F
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
        mov     eax, dword [ebp+10H]                    ; 0602 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0605 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0608 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 060B _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 060E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0611 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0614 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0617 _ 83. E8, 03
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
        add     esp, 28                                 ; 0644 _ 83. C4, 1C
        pop     ebx                                     ; 0647 _ 5B
        pop     ebp                                     ; 0648 _ 5D
        ret                                             ; 0649 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 064A _ 55
        mov     ebp, esp                                ; 064B _ 89. E5
        sub     esp, 16                                 ; 064D _ 83. EC, 10
        movzx   eax, word [?_067]                       ; 0650 _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0657 _ 98
        mov     dword [ebp-8H], eax                     ; 0658 _ 89. 45, F8
        movzx   eax, word [?_068]                       ; 065B _ 0F B7. 05, 00000026(d)
        cwde                                            ; 0662 _ 98
        mov     dword [ebp-4H], eax                     ; 0663 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0666 _ 8B. 45, F8
        sub     eax, 16                                 ; 0669 _ 83. E8, 10
        mov     edx, eax                                ; 066C _ 89. C2
        shr     edx, 31                                 ; 066E _ C1. EA, 1F
        add     eax, edx                                ; 0671 _ 01. D0
        sar     eax, 1                                  ; 0673 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0675 _ A3, 00000140(d)
        mov     eax, dword [ebp-4H]                     ; 067A _ 8B. 45, FC
        sub     eax, 44                                 ; 067D _ 83. E8, 2C
        mov     edx, eax                                ; 0680 _ 89. C2
        shr     edx, 31                                 ; 0682 _ C1. EA, 1F
        add     eax, edx                                ; 0685 _ 01. D0
        sar     eax, 1                                  ; 0687 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0689 _ A3, 00000144(d)
        leave                                           ; 068E _ C9
        ret                                             ; 068F _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0690 _ 55
        mov     ebp, esp                                ; 0691 _ 89. E5
        sub     esp, 20                                 ; 0693 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0696 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0699 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 069C _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 06A3 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 06A8 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 06AB _ 8B. 45, 18
        add     eax, edx                                ; 06AE _ 01. D0
        movzx   eax, byte [eax]                         ; 06B0 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 06B3 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 06B6 _ 0F B6. 45, FB
        test    al, al                                  ; 06BA _ 84. C0
        jns     ?_012                                   ; 06BC _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 06BE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06C1 _ 8B. 55, 14
        add     eax, edx                                ; 06C4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06CC _ 8B. 45, 10
        add     eax, edx                                ; 06CF _ 01. D0
        mov     edx, eax                                ; 06D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06D3 _ 8B. 45, 08
        add     edx, eax                                ; 06D6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06DC _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 06DE _ 0F B6. 45, FB
        and     eax, 40H                                ; 06E2 _ 83. E0, 40
        test    eax, eax                                ; 06E5 _ 85. C0
        jz      ?_013                                   ; 06E7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06E9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06EC _ 8B. 55, 14
        add     eax, edx                                ; 06EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F7 _ 8B. 45, 10
        add     eax, edx                                ; 06FA _ 01. D0
        lea     edx, [eax+1H]                           ; 06FC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 06FF _ 8B. 45, 08
        add     edx, eax                                ; 0702 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0704 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0708 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 070A _ 0F B6. 45, FB
        and     eax, 20H                                ; 070E _ 83. E0, 20
        test    eax, eax                                ; 0711 _ 85. C0
        jz      ?_014                                   ; 0713 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0715 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0718 _ 8B. 55, 14
        add     eax, edx                                ; 071B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 071D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0721 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0723 _ 8B. 45, 10
        add     eax, edx                                ; 0726 _ 01. D0
        lea     edx, [eax+2H]                           ; 0728 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 072B _ 8B. 45, 08
        add     edx, eax                                ; 072E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0730 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0734 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 0736 _ 0F B6. 45, FB
        and     eax, 10H                                ; 073A _ 83. E0, 10
        test    eax, eax                                ; 073D _ 85. C0
        jz      ?_015                                   ; 073F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0741 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0744 _ 8B. 55, 14
        add     eax, edx                                ; 0747 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0749 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 074D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 074F _ 8B. 45, 10
        add     eax, edx                                ; 0752 _ 01. D0
        lea     edx, [eax+3H]                           ; 0754 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0757 _ 8B. 45, 08
        add     edx, eax                                ; 075A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 075C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0760 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0762 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0766 _ 83. E0, 08
        test    eax, eax                                ; 0769 _ 85. C0
        jz      ?_016                                   ; 076B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 076D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0770 _ 8B. 55, 14
        add     eax, edx                                ; 0773 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0775 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0779 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 077B _ 8B. 45, 10
        add     eax, edx                                ; 077E _ 01. D0
        lea     edx, [eax+4H]                           ; 0780 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0783 _ 8B. 45, 08
        add     edx, eax                                ; 0786 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0788 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 078C _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 078E _ 0F B6. 45, FB
        and     eax, 04H                                ; 0792 _ 83. E0, 04
        test    eax, eax                                ; 0795 _ 85. C0
        jz      ?_017                                   ; 0797 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0799 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 079C _ 8B. 55, 14
        add     eax, edx                                ; 079F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07A1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07A5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07A7 _ 8B. 45, 10
        add     eax, edx                                ; 07AA _ 01. D0
        lea     edx, [eax+5H]                           ; 07AC _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 07AF _ 8B. 45, 08
        add     edx, eax                                ; 07B2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07B4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07B8 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 07BA _ 0F B6. 45, FB
        and     eax, 02H                                ; 07BE _ 83. E0, 02
        test    eax, eax                                ; 07C1 _ 85. C0
        jz      ?_018                                   ; 07C3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07C5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07C8 _ 8B. 55, 14
        add     eax, edx                                ; 07CB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07CD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07D1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07D3 _ 8B. 45, 10
        add     eax, edx                                ; 07D6 _ 01. D0
        lea     edx, [eax+6H]                           ; 07D8 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 07DB _ 8B. 45, 08
        add     edx, eax                                ; 07DE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07E0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07E4 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 07E6 _ 0F B6. 45, FB
        and     eax, 01H                                ; 07EA _ 83. E0, 01
        test    eax, eax                                ; 07ED _ 85. C0
        jz      ?_019                                   ; 07EF _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07F1 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07F4 _ 8B. 55, 14
        add     eax, edx                                ; 07F7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07F9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07FD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07FF _ 8B. 45, 10
        add     eax, edx                                ; 0802 _ 01. D0
        lea     edx, [eax+7H]                           ; 0804 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0807 _ 8B. 45, 08
        add     edx, eax                                ; 080A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 080C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0810 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 0812 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 0816 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 081A _ 0F 8E, FFFFFE88
        leave                                           ; 0820 _ C9
        ret                                             ; 0821 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0822 _ 55
        mov     ebp, esp                                ; 0823 _ 89. E5
        sub     esp, 28                                 ; 0825 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 0828 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 082B _ 88. 45, FC
        jmp     ?_022                                   ; 082E _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 0830 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0834 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 0837 _ 0F B6. 12
        movsx   edx, dl                                 ; 083A _ 0F BE. D2
        shl     edx, 4                                  ; 083D _ C1. E2, 04
        add     edx, systemFont                         ; 0840 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 0846 _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 084A _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 084E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0851 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0855 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0858 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 085C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 085F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0863 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0866 _ 89. 04 24
        call    paint_font                              ; 0869 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 086E _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0872 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 0876 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0879 _ 0F B6. 00
        test    al, al                                  ; 087C _ 84. C0
        jnz     ?_021                                   ; 087E _ 75, B0
        leave                                           ; 0880 _ C9
        ret                                             ; 0881 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0882 _ 55
        mov     ebp, esp                                ; 0883 _ 89. E5
        sub     esp, 20                                 ; 0885 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0888 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 088B _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 088E _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0895 _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 089A _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 08A1 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 08A6 _ 8B. 45, F8
        shl     eax, 4                                  ; 08A9 _ C1. E0, 04
        mov     edx, eax                                ; 08AC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08AE _ 8B. 45, FC
        add     eax, edx                                ; 08B1 _ 01. D0
        add     eax, cursor.1564                        ; 08B3 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 08B8 _ 0F B6. 00
        cmp     al, 42                                  ; 08BB _ 3C, 2A
        jnz     ?_025                                   ; 08BD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 08BF _ 8B. 45, F8
        shl     eax, 4                                  ; 08C2 _ C1. E0, 04
        mov     edx, eax                                ; 08C5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08C7 _ 8B. 45, FC
        add     eax, edx                                ; 08CA _ 01. D0
        mov     edx, eax                                ; 08CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08CE _ 8B. 45, 08
        add     eax, edx                                ; 08D1 _ 01. D0
        mov     byte [eax], 0                           ; 08D3 _ C6. 00, 00
        jmp     ?_027                                   ; 08D6 _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 08D8 _ 8B. 45, F8
        shl     eax, 4                                  ; 08DB _ C1. E0, 04
        mov     edx, eax                                ; 08DE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08E0 _ 8B. 45, FC
        add     eax, edx                                ; 08E3 _ 01. D0
        add     eax, cursor.1564                        ; 08E5 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 08EA _ 0F B6. 00
        cmp     al, 79                                  ; 08ED _ 3C, 4F
        jnz     ?_026                                   ; 08EF _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 08F1 _ 8B. 45, F8
        shl     eax, 4                                  ; 08F4 _ C1. E0, 04
        mov     edx, eax                                ; 08F7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08F9 _ 8B. 45, FC
        add     eax, edx                                ; 08FC _ 01. D0
        mov     edx, eax                                ; 08FE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0900 _ 8B. 45, 08
        add     eax, edx                                ; 0903 _ 01. D0
        mov     byte [eax], 7                           ; 0905 _ C6. 00, 07
        jmp     ?_027                                   ; 0908 _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 090A _ 8B. 45, F8
        shl     eax, 4                                  ; 090D _ C1. E0, 04
        mov     edx, eax                                ; 0910 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0912 _ 8B. 45, FC
        add     eax, edx                                ; 0915 _ 01. D0
        mov     edx, eax                                ; 0917 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0919 _ 8B. 45, 08
        add     edx, eax                                ; 091C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 091E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0922 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0924 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0928 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 092C _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0932 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0936 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 093A _ 0F 8E, FFFFFF5A
        leave                                           ; 0940 _ C9
        ret                                             ; 0941 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0942 _ 55
        mov     ebp, esp                                ; 0943 _ 89. E5
        sub     esp, 16                                 ; 0945 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0948 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 094F _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0951 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0958 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 095A _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 095D _ 8B. 55, 14
        add     eax, edx                                ; 0960 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0962 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0966 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0969 _ 8B. 4D, 10
        add     edx, ecx                                ; 096C _ 01. CA
        add     eax, edx                                ; 096E _ 01. D0
        mov     edx, eax                                ; 0970 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0972 _ 8B. 45, 08
        add     edx, eax                                ; 0975 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0977 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 097A _ 0F AF. 45, 18
        mov     ecx, eax                                ; 097E _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0980 _ 8B. 45, FC
        add     eax, ecx                                ; 0983 _ 01. C8
        mov     ecx, eax                                ; 0985 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0987 _ 8B. 45, 20
        add     eax, ecx                                ; 098A _ 01. C8
        movzx   eax, byte [eax]                         ; 098C _ 0F B6. 00
        mov     byte [edx], al                          ; 098F _ 88. 02
        add     dword [ebp-4H], 1                       ; 0991 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0995 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0998 _ 3B. 45, 18
        jl      ?_031                                   ; 099B _ 7C, BD
        add     dword [ebp-8H], 1                       ; 099D _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 09A1 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 09A4 _ 3B. 45, 1C
        jl      ?_030                                   ; 09A7 _ 7C, A8
        leave                                           ; 09A9 _ C9
        ret                                             ; 09AA _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 09AB _ 55
        mov     ebp, esp                                ; 09AC _ 89. E5
        sub     esp, 24                                 ; 09AE _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 09B1 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 09B9 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 09C1 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 09C8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 09CD _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 09D5 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 09DD _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 09E4 _ E8, FFFFFFFC(rel)
        leave                                           ; 09E9 _ C9
        ret                                             ; 09EA _ C3
; init_fifo_buf End of function

eraser_mouse:; Function begin
        push    ebp                                     ; 09EB _ 55
        mov     ebp, esp                                ; 09EC _ 89. E5
        push    ebx                                     ; 09EE _ 53
        sub     esp, 44                                 ; 09EF _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 09F2 _ A1, 00000020(d)
        mov     dword [ebp-0CH], eax                    ; 09F7 _ 89. 45, F4
        movzx   eax, word [?_067]                       ; 09FA _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0A01 _ 98
        mov     dword [ebp-8H], eax                     ; 0A02 _ 89. 45, F8
        mov     eax, dword [mouse_y]                    ; 0A05 _ A1, 00000144(d)
        lea     ebx, [eax+0FH]                          ; 0A0A _ 8D. 58, 0F
        mov     eax, dword [mouse_x]                    ; 0A0D _ A1, 00000140(d)
        lea     ecx, [eax+0FH]                          ; 0A12 _ 8D. 48, 0F
        mov     edx, dword [mouse_y]                    ; 0A15 _ 8B. 15, 00000144(d)
        mov     eax, dword [mouse_x]                    ; 0A1B _ A1, 00000140(d)
        mov     dword [esp+18H], ebx                    ; 0A20 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A24 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A28 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A2C _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A30 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-8H]                     ; 0A38 _ 8B. 45, F8
        mov     dword [esp+4H], eax                     ; 0A3B _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0A3F _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0A42 _ 89. 04 24
        call    paint_rectangle                         ; 0A45 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 0A4A _ 83. C4, 2C
        pop     ebx                                     ; 0A4D _ 5B
        pop     ebp                                     ; 0A4E _ 5D
        ret                                             ; 0A4F _ C3
; eraser_mouse End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0A50 _ 55
        mov     ebp, esp                                ; 0A51 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A53 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A56 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0A59 _ A1, 00000140(d)
        add     eax, edx                                ; 0A5E _ 01. D0
        mov     dword [mouse_x], eax                    ; 0A60 _ A3, 00000140(d)
        mov     eax, dword [ebp+8H]                     ; 0A65 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0A68 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0A6B _ A1, 00000144(d)
        add     eax, edx                                ; 0A70 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0A72 _ A3, 00000144(d)
        mov     eax, dword [mouse_x]                    ; 0A77 _ A1, 00000140(d)
        test    eax, eax                                ; 0A7C _ 85. C0
        jns     ?_034                                   ; 0A7E _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0A80 _ C7. 05, 00000140(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0A8A _ A1, 00000144(d)
        test    eax, eax                                ; 0A8F _ 85. C0
        jns     ?_035                                   ; 0A91 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0A93 _ C7. 05, 00000144(d), 00000000
?_035:  movzx   eax, word [?_067]                       ; 0A9D _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0AA4 _ 98
        lea     edx, [eax-10H]                          ; 0AA5 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0AA8 _ A1, 00000140(d)
        cmp     edx, eax                                ; 0AAD _ 39. C2
        jge     ?_036                                   ; 0AAF _ 7D, 10
        movzx   eax, word [?_067]                       ; 0AB1 _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0AB8 _ 98
        sub     eax, 16                                 ; 0AB9 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0ABC _ A3, 00000140(d)
?_036:  movzx   eax, word [?_067]                       ; 0AC1 _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0AC8 _ 98
        lea     edx, [eax-10H]                          ; 0AC9 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0ACC _ A1, 00000144(d)
        cmp     edx, eax                                ; 0AD1 _ 39. C2
        jge     ?_037                                   ; 0AD3 _ 7D, 10
        movzx   eax, word [?_067]                       ; 0AD5 _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0ADC _ 98
        sub     eax, 16                                 ; 0ADD _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0AE0 _ A3, 00000144(d)
?_037:  pop     ebp                                     ; 0AE5 _ 5D
        ret                                             ; 0AE6 _ C3
; compute_mouse_position End of function

draw_mouse:; Function begin
        push    ebp                                     ; 0AE7 _ 55
        mov     ebp, esp                                ; 0AE8 _ 89. E5
        sub     esp, 44                                 ; 0AEA _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0AED _ A1, 00000020(d)
        mov     dword [ebp-8H], eax                     ; 0AF2 _ 89. 45, F8
        movzx   eax, word [?_067]                       ; 0AF5 _ 0F B7. 05, 00000024(d)
        cwde                                            ; 0AFC _ 98
        mov     dword [ebp-4H], eax                     ; 0AFD _ 89. 45, FC
        mov     edx, dword [mouse_y]                    ; 0B00 _ 8B. 15, 00000144(d)
        mov     eax, dword [mouse_x]                    ; 0B06 _ A1, 00000140(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0B0B _ C7. 44 24, 18, 00000040(d)
        mov     dword [esp+14H], 16                     ; 0B13 _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 0B1B _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 0B23 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0B27 _ 89. 44 24, 08
        mov     eax, dword [ebp-4H]                     ; 0B2B _ 8B. 45, FC
        mov     dword [esp+4H], eax                     ; 0B2E _ 89. 44 24, 04
        mov     eax, dword [ebp-8H]                     ; 0B32 _ 8B. 45, F8
        mov     dword [esp], eax                        ; 0B35 _ 89. 04 24
        call    paint_block                             ; 0B38 _ E8, FFFFFFFC(rel)
        leave                                           ; 0B3D _ C9
        ret                                             ; 0B3E _ C3
; draw_mouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0B3F _ 55
        mov     ebp, esp                                ; 0B40 _ 89. E5
        sub     esp, 40                                 ; 0B42 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0B45 _ C6. 45, F7, 00
        call    io_sti                                  ; 0B49 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0B4E _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0B55 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0B5A _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0B5D _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0B61 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0B65 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0B6C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0B71 _ 85. C0
        jz      ?_038                                   ; 0B73 _ 74, 16
        call    eraser_mouse                            ; 0B75 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouse_send_info            ; 0B7A _ C7. 04 24, 00000000(d)
        call    compute_mouse_position                  ; 0B81 _ E8, FFFFFFFC(rel)
        call    draw_mouse                              ; 0B86 _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0B8B _ C9
        ret                                             ; 0B8C _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0B8D _ 55
        mov     ebp, esp                                ; 0B8E _ 89. E5
        sub     esp, 24                                 ; 0B90 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0B93 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0B9A _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0B9F _ 83. E0, 02
        test    eax, eax                                ; 0BA2 _ 85. C0
        jnz     ?_040                                   ; 0BA4 _ 75, 02
        jmp     ?_041                                   ; 0BA6 _ EB, 02

?_040:  jmp     ?_039                                   ; 0BA8 _ EB, E9

?_041:  leave                                           ; 0BAA _ C9
        ret                                             ; 0BAB _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0BAC _ 55
        mov     ebp, esp                                ; 0BAD _ 89. E5
        sub     esp, 24                                 ; 0BAF _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0BB2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0BB7 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0BBF _ C7. 04 24, 00000064
        call    io_out8                                 ; 0BC6 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0BCB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0BD0 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0BD8 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0BDF _ E8, FFFFFFFC(rel)
        leave                                           ; 0BE4 _ C9
        ret                                             ; 0BE5 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0BE6 _ 55
        mov     ebp, esp                                ; 0BE7 _ 89. E5
        sub     esp, 24                                 ; 0BE9 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0BEC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0BF1 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0BF9 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C00 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C05 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0C0A _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0C12 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C19 _ E8, FFFFFFFC(rel)
        leave                                           ; 0C1E _ C9
        ret                                             ; 0C1F _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0C20 _ 55
        mov     ebp, esp                                ; 0C21 _ 89. E5
        sub     esp, 4                                  ; 0C23 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C26 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C29 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C2C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C2F _ 0F B6. 40, 03
        test    al, al                                  ; 0C33 _ 84. C0
        jnz     ?_043                                   ; 0C35 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C37 _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0C3B _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C3D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C40 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0C44 _ B8, 00000000
        jmp     ?_050                                   ; 0C49 _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0C4E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C51 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C55 _ 3C, 01
        jnz     ?_045                                   ; 0C57 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0C59 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0C5D _ 25, 000000C8
        cmp     eax, 8                                  ; 0C62 _ 83. F8, 08
        jnz     ?_044                                   ; 0C65 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0C67 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C6A _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0C6E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0C70 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0C73 _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0C77 _ B8, 00000000
        jmp     ?_050                                   ; 0C7C _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0C81 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C84 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C88 _ 3C, 02
        jnz     ?_046                                   ; 0C8A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C8C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C8F _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C93 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C96 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C99 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0C9D _ B8, 00000000
        jmp     ?_050                                   ; 0CA2 _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0CA7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CAA _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0CAE _ 3C, 03
        jne     ?_049                                   ; 0CB0 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0CB6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CB9 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0CBD _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0CC0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0CC3 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0CC7 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CCA _ 0F B6. 00
        movzx   eax, al                                 ; 0CCD _ 0F B6. C0
        and     eax, 07H                                ; 0CD0 _ 83. E0, 07
        mov     edx, eax                                ; 0CD3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CD5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0CD8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CDB _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0CDE _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0CE2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CE5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CE8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CEB _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0CEE _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0CF2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CF5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CF8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CFB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CFE _ 0F B6. 00
        movzx   eax, al                                 ; 0D01 _ 0F B6. C0
        and     eax, 10H                                ; 0D04 _ 83. E0, 10
        test    eax, eax                                ; 0D07 _ 85. C0
        jz      ?_047                                   ; 0D09 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D0B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D0E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0D11 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D16 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D18 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D1B _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0D1E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D21 _ 0F B6. 00
        movzx   eax, al                                 ; 0D24 _ 0F B6. C0
        and     eax, 20H                                ; 0D27 _ 83. E0, 20
        test    eax, eax                                ; 0D2A _ 85. C0
        jz      ?_048                                   ; 0D2C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D2E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D31 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D34 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D39 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D3B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D3E _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0D41 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D44 _ 8B. 40, 08
        neg     eax                                     ; 0D47 _ F7. D8
        mov     edx, eax                                ; 0D49 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D4B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D4E _ 89. 50, 08
        mov     eax, 1                                  ; 0D51 _ B8, 00000001
        jmp     ?_050                                   ; 0D56 _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0D58 _ B8, FFFFFFFF
?_050:  leave                                           ; 0D5D _ C9
        ret                                             ; 0D5E _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0D5F _ 55
        mov     ebp, esp                                ; 0D60 _ 89. E5
        sub     esp, 40                                 ; 0D62 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0D65 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0D6D _ C7. 04 24, 00000020
        call    io_out8                                 ; 0D74 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0D79 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0D81 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0D88 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0D8D _ C7. 04 24, 00000060
        call    io_in8                                  ; 0D94 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0D99 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D9C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0DA0 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0DA4 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0DAB _ E8, FFFFFFFC(rel)
        leave                                           ; 0DB0 _ C9
        ret                                             ; 0DB1 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0DB2 _ 55
        mov     ebp, esp                                ; 0DB3 _ 89. E5
        sub     esp, 40                                 ; 0DB5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0DB8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0DC0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0DC7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0DCC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0DD4 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0DDB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0DE0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0DE7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0DEC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0DEF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0DF3 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0DF7 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0DFE _ E8, FFFFFFFC(rel)
        leave                                           ; 0E03 _ C9
        ret                                             ; 0E04 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0E05 _ 55
        mov     ebp, esp                                ; 0E06 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E08 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0E0B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0E0E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0E10 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0E13 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E1A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E1D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0E24 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E27 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0E2A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E2D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0E30 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0E33 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E36 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0E39 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0E40 _ 5D
        ret                                             ; 0E41 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0E42 _ 55
        mov     ebp, esp                                ; 0E43 _ 89. E5
        sub     esp, 20                                 ; 0E45 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0E48 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0E4B _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0E4E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E51 _ 8B. 40, 10
        test    eax, eax                                ; 0E54 _ 85. C0
        jnz     ?_051                                   ; 0E56 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0E58 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0E5B _ 8B. 40, 14
        or      eax, 01H                                ; 0E5E _ 83. C8, 01
        mov     edx, eax                                ; 0E61 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E63 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0E66 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0E69 _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0E6E _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 0E70 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E73 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0E76 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E79 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E7C _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0E7E _ 8B. 45, FC
        add     edx, eax                                ; 0E81 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E83 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E87 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0E89 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E8C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0E8F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E92 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0E95 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0E98 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0E9B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0E9E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0EA1 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0EA4 _ 39. C2
        jnz     ?_052                                   ; 0EA6 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0EA8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0EAB _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0EB2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0EB5 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0EB8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0EBB _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0EBE _ 89. 50, 10
        mov     eax, 0                                  ; 0EC1 _ B8, 00000000
?_053:  leave                                           ; 0EC6 _ C9
        ret                                             ; 0EC7 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0EC8 _ 55
        mov     ebp, esp                                ; 0EC9 _ 89. E5
        sub     esp, 16                                 ; 0ECB _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0ECE _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0ED1 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0ED7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0EDA _ 39. C2
        jnz     ?_054                                   ; 0EDC _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0EDE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0EE1 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0EE8 _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0EED _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 0EEF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0EF2 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0EF5 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0EF8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0EFB _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0EFD _ 8B. 45, F8
        add     eax, edx                                ; 0F00 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F02 _ 0F B6. 00
        movzx   eax, al                                 ; 0F05 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0F08 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F0B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F0E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0F11 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F14 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F17 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F1A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0F1D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F20 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F23 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F26 _ 39. C2
        jnz     ?_055                                   ; 0F28 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0F2A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F2D _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 0F34 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F37 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0F3A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F3D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0F40 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0F43 _ 8B. 45, FC
?_056:  leave                                           ; 0F46 _ C9
        ret                                             ; 0F47 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0F48 _ 55
        mov     ebp, esp                                ; 0F49 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F4B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0F4E _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F51 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F54 _ 8B. 40, 10
        sub     edx, eax                                ; 0F57 _ 29. C2
        mov     eax, edx                                ; 0F59 _ 89. D0
        pop     ebp                                     ; 0F5B _ 5D
        ret                                             ; 0F5C _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0F5D _ 55
        mov     ebp, esp                                ; 0F5E _ 89. E5
        sub     esp, 4                                  ; 0F60 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0F63 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0F66 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0F69 _ 80. 7D, FC, 09
        jle     ?_057                                   ; 0F6D _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0F6F _ 0F B6. 45, FC
        add     eax, 55                                 ; 0F73 _ 83. C0, 37
        jmp     ?_058                                   ; 0F76 _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 0F78 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0F7C _ 83. C0, 30
?_058:  leave                                           ; 0F7F _ C9
        ret                                             ; 0F80 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0F81 _ 55
        mov     ebp, esp                                ; 0F82 _ 89. E5
        sub     esp, 24                                 ; 0F84 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0F87 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0F8A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F8D _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0F94 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0F98 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0F9B _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0F9E _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0FA2 _ 89. 04 24
        call    charToHexVal                            ; 0FA5 _ E8, FFFFFFFC(rel)
        mov     byte [?_066], al                        ; 0FAA _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 0FAF _ 0F B6. 45, EC
        shr     al, 4                                   ; 0FB3 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0FB6 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0FB9 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0FBD _ 0F BE. C0
        mov     dword [esp], eax                        ; 0FC0 _ 89. 04 24
        call    charToHexVal                            ; 0FC3 _ E8, FFFFFFFC(rel)
        mov     byte [?_065], al                        ; 0FC8 _ A2, 00000142(d)
        mov     eax, keyval                             ; 0FCD _ B8, 00000140(d)
        leave                                           ; 0FD2 _ C9
        ret                                             ; 0FD3 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0FD4 _ 55
        mov     ebp, esp                                ; 0FD5 _ 89. E5
        sub     esp, 16                                 ; 0FD7 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 0FDA _ C6. 05, 00000240(d), 30
        mov     byte [?_069], 88                        ; 0FE1 _ C6. 05, 00000241(d), 58
        mov     byte [?_070], 0                         ; 0FE8 _ C6. 05, 0000024A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0FEF _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 0FF6 _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 0FF8 _ 8B. 45, F4
        add     eax, str.1386                           ; 0FFB _ 05, 00000240(d)
        mov     byte [eax], 48                          ; 1000 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1003 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 1007 _ 83. 7D, F4, 09
        jle     ?_059                                   ; 100B _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 100D _ C7. 45, F8, 00000009
        jmp     ?_063                                   ; 1014 _ EB, 3C

?_061:  mov     eax, dword [ebp+8H]                     ; 1016 _ 8B. 45, 08
        and     eax, 0FH                                ; 1019 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 101C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 101F _ 8B. 45, 08
        shr     eax, 4                                  ; 1022 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1025 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1028 _ 83. 7D, FC, 09
        jle     ?_062                                   ; 102C _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 102E _ 8B. 45, FC
        add     eax, 55                                 ; 1031 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1034 _ 8B. 55, F8
        add     edx, str.1386                           ; 1037 _ 81. C2, 00000240(d)
        mov     byte [edx], al                          ; 103D _ 88. 02
        jmp     ?_063                                   ; 103F _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 1041 _ 8B. 45, FC
        add     eax, 48                                 ; 1044 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1047 _ 8B. 55, F8
        add     edx, str.1386                           ; 104A _ 81. C2, 00000240(d)
        mov     byte [edx], al                          ; 1050 _ 88. 02
?_063:  cmp     dword [ebp-8H], 1                       ; 1052 _ 83. 7D, F8, 01
        jle     ?_064                                   ; 1056 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1058 _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 105C _ 75, B8
?_064:  leave                                           ; 105E _ C9
        ret                                             ; 105F _ C3
; intToHexStr End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

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

?_065:  db 00H                                          ; 0142 _ .

?_066:  db 00H, 00H                                     ; 0143 _ ..


SECTION .bss    align=32 noexecute                      ; section number 3, bss

showPos.1496:                                           ; dword
        resd    8                                       ; 0000

screen_info:                                            ; qword
        resb    4                                       ; 0020

?_067:  resw    1                                       ; 0024

?_068:  resw    13                                      ; 0026

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0040

mouse_x: resd   1                                       ; 0140

mouse_y: resd   1                                       ; 0144

mouse_send_info:                                        ; oword
        resb    24                                      ; 0148

keyinfo:                                                ; byte
        resb    32                                      ; 0160

keybuf:                                                 ; yword
        resb    32                                      ; 0180

mouseinfo:                                              ; byte
        resb    32                                      ; 01A0

mousebuf:                                               ; byte
        resb    128                                     ; 01C0

str.1386:                                               ; byte
        resb    1                                       ; 0240

?_069:  resb    9                                       ; 0241

?_070:  resb    1                                       ; 024A


