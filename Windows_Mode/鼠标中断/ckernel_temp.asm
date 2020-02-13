; Disassembly of file: ckernel.o
; Thu Feb 13 21:07:43 2020
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
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerKeyboard: function
global intHandlerMouse: function

extern io_out8                                          ; near
extern io_sti                                           ; near
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern systemFont                                       ; byte
extern io_hlt                                           ; near
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 56                                 ; 0003 _ 83. EC, 38
        mov     dword [esp], screen_info                ; 0006 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000D _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0012 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0017 _ 89. 45, EC
        movzx   eax, word [screen_info+4H]              ; 001A _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0021 _ 98
        mov     dword [ebp-10H], eax                    ; 0022 _ 89. 45, F0
        movzx   eax, word [screen_info+6H]              ; 0025 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002C _ 98
        mov     dword [ebp-0CH], eax                    ; 002D _ 89. 45, F4
        call    init_palette                            ; 0030 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0035 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 003A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 003F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0042 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 0046 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0049 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 004D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0050 _ 89. 04 24
        call    init_desktop                            ; 0053 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0058 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], systemFont+410H        ; 0060 _ C7. 44 24, 10, 00000410(d)
        mov     dword [esp+0CH], 0                      ; 0068 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0070 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0078 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 007B _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 007F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0082 _ 89. 04 24
        call    paint_font                              ; 0085 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 008A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_036                  ; 0092 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 16                     ; 009A _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 0                       ; 00A2 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 00AA _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 00AD _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 00B1 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 00B4 _ 89. 04 24
        call    paint_string                            ; 00B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 2                       ; 00BC _ C7. 44 24, 04, 00000002
        mov     dword [esp], mouse_cursor_buf           ; 00C4 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 00CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+18H], mouse_cursor_buf       ; 00D0 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 16                     ; 00D8 _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 00E0 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 100                    ; 00E8 _ C7. 44 24, 0C, 00000064
        mov     dword [esp+8H], 100                     ; 00F0 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-10H]                    ; 00F8 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 00FB _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 00FF _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0102 _ 89. 04 24
        call    paint_block                             ; 0105 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 010A _ E8, FFFFFFFC(rel)
?_001:  call    io_hlt                                  ; 010F _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0114 _ EB, F9
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0116 _ 55
        mov     ebp, esp                                ; 0117 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0119 _ A1, 00000000(d)
        mov     edx, eax                                ; 011E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0120 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0123 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0125 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0128 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 012E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0131 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0137 _ 5D
        ret                                             ; 0138 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0139 _ 55
        mov     ebp, esp                                ; 013A _ 89. E5
        sub     esp, 24                                 ; 013C _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1442          ; 013F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0147 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 014F _ C7. 04 24, 00000000
        call    set_palette                             ; 0156 _ E8, FFFFFFFC(rel)
        nop                                             ; 015B _ 90
        leave                                           ; 015C _ C9
        ret                                             ; 015D _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 015E _ 55
        mov     ebp, esp                                ; 015F _ 89. E5
        sub     esp, 40                                 ; 0161 _ 83. EC, 28
        call    io_load_eflags                          ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0169 _ 89. 45, F4
        call    io_cli                                  ; 016C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0171 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0174 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0178 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 017F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0184 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0187 _ 89. 45, F0
        jmp     ?_003                                   ; 018A _ EB, 62

?_002:  mov     eax, dword [ebp+10H]                    ; 018C _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 018F _ 0F B6. 00
        shr     al, 2                                   ; 0192 _ C0. E8, 02
        movzx   eax, al                                 ; 0195 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0198 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 019C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01A8 _ 8B. 45, 10
        add     eax, 1                                  ; 01AB _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 01AE _ 0F B6. 00
        shr     al, 2                                   ; 01B1 _ C0. E8, 02
        movzx   eax, al                                 ; 01B4 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01B7 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01BB _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 01C7 _ 8B. 45, 10
        add     eax, 2                                  ; 01CA _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 01CD _ 0F B6. 00
        shr     al, 2                                   ; 01D0 _ C0. E8, 02
        movzx   eax, al                                 ; 01D3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 01D6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 01DA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 01E1 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 01E6 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 01EA _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 01EE _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 01F1 _ 3B. 45, 0C
        jle     ?_002                                   ; 01F4 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 01F6 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 01F9 _ 89. 04 24
        call    io_store_eflags                         ; 01FC _ E8, FFFFFFFC(rel)
        nop                                             ; 0201 _ 90
        leave                                           ; 0202 _ C9
        ret                                             ; 0203 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0204 _ 55
        mov     ebp, esp                                ; 0205 _ 89. E5
        sub     esp, 20                                 ; 0207 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 020A _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 020D _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0210 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0213 _ 89. 45, FC
        jmp     ?_007                                   ; 0216 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0218 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 021B _ 89. 45, F8
        jmp     ?_006                                   ; 021E _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0220 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0223 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0227 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0229 _ 8B. 45, F8
        add     eax, edx                                ; 022C _ 01. D0
        mov     edx, eax                                ; 022E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0230 _ 8B. 45, 08
        add     edx, eax                                ; 0233 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0235 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0239 _ 88. 02
        add     dword [ebp-8H], 1                       ; 023B _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 023F _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0242 _ 3B. 45, 1C
        jle     ?_005                                   ; 0245 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0247 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 024B _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 024E _ 3B. 45, 20
        jle     ?_004                                   ; 0251 _ 7E, C5
        leave                                           ; 0253 _ C9
        ret                                             ; 0254 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0255 _ 55
        mov     ebp, esp                                ; 0256 _ 89. E5
        push    ebx                                     ; 0258 _ 53
        sub     esp, 28                                 ; 0259 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 025C _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 025F _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0262 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0265 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0268 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 026C _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0270 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0278 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0280 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0288 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 028B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 028F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0292 _ 89. 04 24
        call    paint_rectangle                         ; 0295 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 029A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 029D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 02A0 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 02A3 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 02A6 _ 8B. 45, 10
        sub     eax, 28                                 ; 02A9 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 02AC _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02B0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02B4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02B8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 02C0 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 02C8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 02CB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 02CF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 02D2 _ 89. 04 24
        call    paint_rectangle                         ; 02D5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02DA _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 02DD _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 02E0 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 02E3 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 02E6 _ 8B. 45, 10
        sub     eax, 27                                 ; 02E9 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 02EC _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 02F0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 02F4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 02F8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0300 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0308 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 030B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 030F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0312 _ 89. 04 24
        call    paint_rectangle                         ; 0315 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 031A _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 031D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0320 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0323 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0326 _ 8B. 45, 10
        sub     eax, 26                                 ; 0329 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 032C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0330 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0334 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0338 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0340 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0348 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 034B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 034F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0352 _ 89. 04 24
        call    paint_rectangle                         ; 0355 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 035A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 035D _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0360 _ 8B. 45, 10
        sub     eax, 24                                 ; 0363 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0366 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 036A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0372 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0376 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 037E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0386 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0389 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 038D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0390 _ 89. 04 24
        call    paint_rectangle                         ; 0393 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0398 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 039B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 039E _ 8B. 45, 10
        sub     eax, 24                                 ; 03A1 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 03A4 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 03A8 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 03B0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 03B4 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 03BC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 03C4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03C7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03CB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03CE _ 89. 04 24
        call    paint_rectangle                         ; 03D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03D6 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03D9 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03DC _ 8B. 45, 10
        sub     eax, 4                                  ; 03DF _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 03E2 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 03E6 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 03EE _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 03F2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 03FA _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0402 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0405 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0409 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 040C _ 89. 04 24
        call    paint_rectangle                         ; 040F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0414 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0417 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 041A _ 8B. 45, 10
        sub     eax, 23                                 ; 041D _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0420 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0424 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 042C _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0430 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0438 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0440 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0443 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0447 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 044A _ 89. 04 24
        call    paint_rectangle                         ; 044D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0452 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0455 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0458 _ 8B. 45, 10
        sub     eax, 3                                  ; 045B _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 045E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0462 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 046A _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 046E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0476 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 047E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0481 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0485 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0488 _ 89. 04 24
        call    paint_rectangle                         ; 048B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0490 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0493 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0496 _ 8B. 45, 10
        sub     eax, 24                                 ; 0499 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 049C _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 04A0 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 04A8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 04AC _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 04B4 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 04BC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04BF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04C6 _ 89. 04 24
        call    paint_rectangle                         ; 04C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04CE _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04D1 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04D4 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04D7 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04DA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04DD _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04E0 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04E3 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 04E6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 04EA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 04EE _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 04F2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 04F6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 04FE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0501 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0505 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0508 _ 89. 04 24
        call    paint_rectangle                         ; 050B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0510 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0513 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0516 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0519 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 051C _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 051F _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0522 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0525 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0528 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 052C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0530 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0534 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0538 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0540 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0543 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0547 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 054A _ 89. 04 24
        call    paint_rectangle                         ; 054D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0552 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0555 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0558 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 055B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 055E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0561 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0564 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0567 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 056A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 056E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0572 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0576 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 057A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0582 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0585 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0589 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 058C _ 89. 04 24
        call    paint_rectangle                         ; 058F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0594 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0597 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 059A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 059D _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 05A0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05A3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05A6 _ 8B. 45, 0C
        sub     eax, 3                                  ; 05A9 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 05AC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05B0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05B4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05B8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 05BC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 05C4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05C7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05CB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05CE _ 89. 04 24
        call    paint_rectangle                         ; 05D1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 05D6 _ 83. C4, 1C
        pop     ebx                                     ; 05D9 _ 5B
        pop     ebp                                     ; 05DA _ 5D
        ret                                             ; 05DB _ C3
; init_desktop End of function

paint_font:; Function begin
        push    ebp                                     ; 05DC _ 55
        mov     ebp, esp                                ; 05DD _ 89. E5
        sub     esp, 20                                 ; 05DF _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 05E2 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 05E5 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05E8 _ C7. 45, FC, 00000000
        jmp     ?_017                                   ; 05EF _ E9, 0000016E

?_008:  mov     edx, dword [ebp-4H]                     ; 05F4 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 05F7 _ 8B. 45, 18
        add     eax, edx                                ; 05FA _ 01. D0
        movzx   eax, byte [eax]                         ; 05FC _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05FF _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0602 _ 0F B6. 45, FB
        test    al, al                                  ; 0606 _ 84. C0
        jns     ?_009                                   ; 0608 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 060A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 060D _ 8B. 55, 14
        add     eax, edx                                ; 0610 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0612 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0616 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0618 _ 8B. 45, 10
        add     eax, edx                                ; 061B _ 01. D0
        mov     edx, eax                                ; 061D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 061F _ 8B. 45, 08
        add     edx, eax                                ; 0622 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0624 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0628 _ 88. 02
?_009:  movzx   eax, byte [ebp-5H]                      ; 062A _ 0F B6. 45, FB
        and     eax, 40H                                ; 062E _ 83. E0, 40
        test    eax, eax                                ; 0631 _ 85. C0
        jz      ?_010                                   ; 0633 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0635 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0638 _ 8B. 55, 14
        add     eax, edx                                ; 063B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 063D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0641 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0643 _ 8B. 45, 10
        add     eax, edx                                ; 0646 _ 01. D0
        lea     edx, [eax+1H]                           ; 0648 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 064B _ 8B. 45, 08
        add     edx, eax                                ; 064E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0650 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0654 _ 88. 02
?_010:  movzx   eax, byte [ebp-5H]                      ; 0656 _ 0F B6. 45, FB
        and     eax, 20H                                ; 065A _ 83. E0, 20
        test    eax, eax                                ; 065D _ 85. C0
        jz      ?_011                                   ; 065F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0661 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0664 _ 8B. 55, 14
        add     eax, edx                                ; 0667 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0669 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 066D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066F _ 8B. 45, 10
        add     eax, edx                                ; 0672 _ 01. D0
        lea     edx, [eax+2H]                           ; 0674 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0677 _ 8B. 45, 08
        add     edx, eax                                ; 067A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 067C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0680 _ 88. 02
?_011:  movzx   eax, byte [ebp-5H]                      ; 0682 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0686 _ 83. E0, 10
        test    eax, eax                                ; 0689 _ 85. C0
        jz      ?_012                                   ; 068B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 068D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0690 _ 8B. 55, 14
        add     eax, edx                                ; 0693 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0695 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0699 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069B _ 8B. 45, 10
        add     eax, edx                                ; 069E _ 01. D0
        lea     edx, [eax+3H]                           ; 06A0 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 06A3 _ 8B. 45, 08
        add     edx, eax                                ; 06A6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AC _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 06AE _ 0F B6. 45, FB
        and     eax, 08H                                ; 06B2 _ 83. E0, 08
        test    eax, eax                                ; 06B5 _ 85. C0
        jz      ?_013                                   ; 06B7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06B9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06BC _ 8B. 55, 14
        add     eax, edx                                ; 06BF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C7 _ 8B. 45, 10
        add     eax, edx                                ; 06CA _ 01. D0
        lea     edx, [eax+4H]                           ; 06CC _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06CF _ 8B. 45, 08
        add     edx, eax                                ; 06D2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D8 _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 06DA _ 0F B6. 45, FB
        and     eax, 04H                                ; 06DE _ 83. E0, 04
        test    eax, eax                                ; 06E1 _ 85. C0
        jz      ?_014                                   ; 06E3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06E5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06E8 _ 8B. 55, 14
        add     eax, edx                                ; 06EB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06ED _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F3 _ 8B. 45, 10
        add     eax, edx                                ; 06F6 _ 01. D0
        lea     edx, [eax+5H]                           ; 06F8 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06FB _ 8B. 45, 08
        add     edx, eax                                ; 06FE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0700 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0704 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 0706 _ 0F B6. 45, FB
        and     eax, 02H                                ; 070A _ 83. E0, 02
        test    eax, eax                                ; 070D _ 85. C0
        jz      ?_015                                   ; 070F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0711 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0714 _ 8B. 55, 14
        add     eax, edx                                ; 0717 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0719 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 071D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 071F _ 8B. 45, 10
        add     eax, edx                                ; 0722 _ 01. D0
        lea     edx, [eax+6H]                           ; 0724 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0727 _ 8B. 45, 08
        add     edx, eax                                ; 072A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 072C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0730 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0732 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0736 _ 83. E0, 01
        test    eax, eax                                ; 0739 _ 85. C0
        jz      ?_016                                   ; 073B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 073D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0740 _ 8B. 55, 14
        add     eax, edx                                ; 0743 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0745 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0749 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 074B _ 8B. 45, 10
        add     eax, edx                                ; 074E _ 01. D0
        lea     edx, [eax+7H]                           ; 0750 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0753 _ 8B. 45, 08
        add     edx, eax                                ; 0756 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0758 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 075C _ 88. 02
?_016:  add     dword [ebp-4H], 1                       ; 075E _ 83. 45, FC, 01
?_017:  cmp     dword [ebp-4H], 15                      ; 0762 _ 83. 7D, FC, 0F
        jle     ?_008                                   ; 0766 _ 0F 8E, FFFFFE88
        leave                                           ; 076C _ C9
        ret                                             ; 076D _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 076E _ 55
        mov     ebp, esp                                ; 076F _ 89. E5
        sub     esp, 28                                 ; 0771 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 0774 _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 0777 _ 88. 45, FC
        jmp     ?_019                                   ; 077A _ EB, 46

?_018:  movsx   eax, byte [ebp-4H]                      ; 077C _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0780 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 0783 _ 0F B6. 12
        movsx   edx, dl                                 ; 0786 _ 0F BE. D2
        shl     edx, 4                                  ; 0789 _ C1. E2, 04
        add     edx, systemFont                         ; 078C _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 0792 _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 0796 _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 079A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 079D _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 07A1 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 07A4 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 07A8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07AB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07AF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07B2 _ 89. 04 24
        call    paint_font                              ; 07B5 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 07BA _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 07BE _ 83. 45, 18, 01
?_019:  mov     eax, dword [ebp+18H]                    ; 07C2 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 07C5 _ 0F B6. 00
        test    al, al                                  ; 07C8 _ 84. C0
        jnz     ?_018                                   ; 07CA _ 75, B0
        leave                                           ; 07CC _ C9
        ret                                             ; 07CD _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 07CE _ 55
        mov     ebp, esp                                ; 07CF _ 89. E5
        sub     esp, 20                                 ; 07D1 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 07D4 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 07D7 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 07DA _ C7. 45, F8, 00000000
        jmp     ?_026                                   ; 07E1 _ E9, 0000009C

?_020:  mov     dword [ebp-4H], 0                       ; 07E6 _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 07ED _ E9, 00000082

?_021:  mov     eax, dword [ebp-8H]                     ; 07F2 _ 8B. 45, F8
        shl     eax, 4                                  ; 07F5 _ C1. E0, 04
        mov     edx, eax                                ; 07F8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07FA _ 8B. 45, FC
        add     eax, edx                                ; 07FD _ 01. D0
        add     eax, cursor.1505                        ; 07FF _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0804 _ 0F B6. 00
        cmp     al, 42                                  ; 0807 _ 3C, 2A
        jnz     ?_022                                   ; 0809 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 080B _ 8B. 45, F8
        shl     eax, 4                                  ; 080E _ C1. E0, 04
        mov     edx, eax                                ; 0811 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0813 _ 8B. 45, FC
        add     eax, edx                                ; 0816 _ 01. D0
        mov     edx, eax                                ; 0818 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 081A _ 8B. 45, 08
        add     eax, edx                                ; 081D _ 01. D0
        mov     byte [eax], 0                           ; 081F _ C6. 00, 00
        jmp     ?_024                                   ; 0822 _ EB, 4C

?_022:  mov     eax, dword [ebp-8H]                     ; 0824 _ 8B. 45, F8
        shl     eax, 4                                  ; 0827 _ C1. E0, 04
        mov     edx, eax                                ; 082A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 082C _ 8B. 45, FC
        add     eax, edx                                ; 082F _ 01. D0
        add     eax, cursor.1505                        ; 0831 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0836 _ 0F B6. 00
        cmp     al, 79                                  ; 0839 _ 3C, 4F
        jnz     ?_023                                   ; 083B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 083D _ 8B. 45, F8
        shl     eax, 4                                  ; 0840 _ C1. E0, 04
        mov     edx, eax                                ; 0843 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0845 _ 8B. 45, FC
        add     eax, edx                                ; 0848 _ 01. D0
        mov     edx, eax                                ; 084A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 084C _ 8B. 45, 08
        add     eax, edx                                ; 084F _ 01. D0
        mov     byte [eax], 7                           ; 0851 _ C6. 00, 07
        jmp     ?_024                                   ; 0854 _ EB, 1A

?_023:  mov     eax, dword [ebp-8H]                     ; 0856 _ 8B. 45, F8
        shl     eax, 4                                  ; 0859 _ C1. E0, 04
        mov     edx, eax                                ; 085C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 085E _ 8B. 45, FC
        add     eax, edx                                ; 0861 _ 01. D0
        mov     edx, eax                                ; 0863 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0865 _ 8B. 45, 08
        add     edx, eax                                ; 0868 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 086A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 086E _ 88. 02
?_024:  add     dword [ebp-4H], 1                       ; 0870 _ 83. 45, FC, 01
?_025:  cmp     dword [ebp-4H], 15                      ; 0874 _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0878 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 087E _ 83. 45, F8, 01
?_026:  cmp     dword [ebp-8H], 15                      ; 0882 _ 83. 7D, F8, 0F
        jle     ?_020                                   ; 0886 _ 0F 8E, FFFFFF5A
        leave                                           ; 088C _ C9
        ret                                             ; 088D _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 088E _ 55
        mov     ebp, esp                                ; 088F _ 89. E5
        sub     esp, 16                                 ; 0891 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0894 _ C7. 45, F8, 00000000
        jmp     ?_030                                   ; 089B _ EB, 50

?_027:  mov     dword [ebp-4H], 0                       ; 089D _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 08A4 _ EB, 3B

?_028:  mov     eax, dword [ebp-8H]                     ; 08A6 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 08A9 _ 8B. 55, 14
        add     eax, edx                                ; 08AC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08AE _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 08B2 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 08B5 _ 8B. 4D, 10
        add     edx, ecx                                ; 08B8 _ 01. CA
        add     eax, edx                                ; 08BA _ 01. D0
        mov     edx, eax                                ; 08BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08BE _ 8B. 45, 08
        add     edx, eax                                ; 08C1 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 08C3 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 08C6 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 08CA _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 08CC _ 8B. 45, FC
        add     eax, ecx                                ; 08CF _ 01. C8
        mov     ecx, eax                                ; 08D1 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 08D3 _ 8B. 45, 20
        add     eax, ecx                                ; 08D6 _ 01. C8
        movzx   eax, byte [eax]                         ; 08D8 _ 0F B6. 00
        mov     byte [edx], al                          ; 08DB _ 88. 02
        add     dword [ebp-4H], 1                       ; 08DD _ 83. 45, FC, 01
?_029:  mov     eax, dword [ebp-4H]                     ; 08E1 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 08E4 _ 3B. 45, 18
        jl      ?_028                                   ; 08E7 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 08E9 _ 83. 45, F8, 01
?_030:  mov     eax, dword [ebp-8H]                     ; 08ED _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 08F0 _ 3B. 45, 1C
        jl      ?_027                                   ; 08F3 _ 7C, A8
        leave                                           ; 08F5 _ C9
        ret                                             ; 08F6 _ C3
; paint_block End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 08F7 _ 55
        mov     ebp, esp                                ; 08F8 _ 89. E5
        sub     esp, 24                                 ; 08FA _ 83. EC, 18
?_031:  mov     dword [esp], 100                        ; 08FD _ C7. 04 24, 00000064
        call    io_in8                                  ; 0904 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0909 _ 83. E0, 02
        test    eax, eax                                ; 090C _ 85. C0
        jnz     ?_032                                   ; 090E _ 75, 02
        jmp     ?_033                                   ; 0910 _ EB, 02

?_032:  jmp     ?_031                                   ; 0912 _ EB, E9

?_033:  leave                                           ; 0914 _ C9
        ret                                             ; 0915 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0916 _ 55
        mov     ebp, esp                                ; 0917 _ 89. E5
        sub     esp, 24                                 ; 0919 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 091C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0921 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0929 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0930 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0935 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 093A _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0942 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0949 _ E8, FFFFFFFC(rel)
        nop                                             ; 094E _ 90
        leave                                           ; 094F _ C9
        ret                                             ; 0950 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0951 _ 55
        mov     ebp, esp                                ; 0952 _ 89. E5
        sub     esp, 24                                 ; 0954 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0957 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 095C _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0964 _ C7. 04 24, 00000064
        call    io_out8                                 ; 096B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0970 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0975 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 097D _ C7. 04 24, 00000060
        call    io_out8                                 ; 0984 _ E8, FFFFFFFC(rel)
        nop                                             ; 0989 _ 90
        leave                                           ; 098A _ C9
        ret                                             ; 098B _ C3
; enable_mouse End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 098C _ 55
        mov     ebp, esp                                ; 098D _ 89. E5
        sub     esp, 56                                 ; 098F _ 83. EC, 38
        mov     eax, dword [screen_info]                ; 0992 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0997 _ 89. 45, EC
        movzx   eax, word [screen_info+4H]              ; 099A _ 0F B7. 05, 00000004(d)
        cwde                                            ; 09A1 _ 98
        mov     dword [ebp-10H], eax                    ; 09A2 _ 89. 45, F0
        movzx   eax, word [screen_info+6H]              ; 09A5 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 09AC _ 98
        mov     dword [ebp-0CH], eax                    ; 09AD _ 89. 45, F4
        mov     dword [esp+18H], 15                     ; 09B0 _ C7. 44 24, 18, 0000000F
        mov     dword [esp+14H], 255                    ; 09B8 _ C7. 44 24, 14, 000000FF
        mov     dword [esp+10H], 0                      ; 09C0 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 09C8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 09D0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 09D8 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 09DB _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 09DF _ 8B. 45, EC
        mov     dword [esp], eax                        ; 09E2 _ 89. 04 24
        call    paint_rectangle                         ; 09E5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 09EA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_037                  ; 09F2 _ C7. 44 24, 10, 0000000B(d)
        mov     dword [esp+0CH], 0                      ; 09FA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0A02 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0A0A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0A0D _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0A11 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0A14 _ 89. 04 24
        call    paint_string                            ; 0A17 _ E8, FFFFFFFC(rel)
?_034:  call    io_hlt                                  ; 0A1C _ E8, FFFFFFFC(rel)
        jmp     ?_034                                   ; 0A21 _ EB, F9
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0A23 _ 55
        mov     ebp, esp                                ; 0A24 _ 89. E5
        sub     esp, 56                                 ; 0A26 _ 83. EC, 38
        mov     eax, dword [screen_info]                ; 0A29 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0A2E _ 89. 45, EC
        movzx   eax, word [screen_info+4H]              ; 0A31 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0A38 _ 98
        mov     dword [ebp-10H], eax                    ; 0A39 _ 89. 45, F0
        movzx   eax, word [screen_info+6H]              ; 0A3C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0A43 _ 98
        mov     dword [ebp-0CH], eax                    ; 0A44 _ 89. 45, F4
        mov     dword [esp+18H], 30                     ; 0A47 _ C7. 44 24, 18, 0000001E
        mov     dword [esp+14H], 255                    ; 0A4F _ C7. 44 24, 14, 000000FF
        mov     dword [esp+10H], 16                     ; 0A57 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 0                      ; 0A5F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0A67 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0A6F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0A72 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0A76 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0A79 _ 89. 04 24
        call    paint_rectangle                         ; 0A7C _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0A81 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_038                  ; 0A89 _ C7. 44 24, 10, 00000019(d)
        mov     dword [esp+0CH], 16                     ; 0A91 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 0                       ; 0A99 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0AA1 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0AA4 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0AA8 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0AAB _ 89. 04 24
        call    paint_string                            ; 0AAE _ E8, FFFFFFFC(rel)
?_035:  call    io_hlt                                  ; 0AB3 _ E8, FFFFFFFC(rel)
        jmp     ?_035                                   ; 0AB8 _ EB, F9
; intHandlerMouse End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_036:                                                  ; byte
        db 48H, 65H, 6CH, 6CH, 6FH, 57H, 6FH, 72H       ; 0000 _ HelloWor
        db 6CH, 64H, 00H                                ; 0008 _ ld.

?_037:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4BH, 65H, 79H       ; 000B _ PS/2 Key
        db 62H, 6FH, 61H, 72H, 64H, 00H                 ; 0013 _ board.

?_038:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4DH, 6FH, 75H       ; 0019 _ PS/2 Mou
        db 73H, 65H, 00H                                ; 0021 _ se.


SECTION .data   align=32 noexecute                      ; section number 3, data

table_rgb.1442:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1505:                                            ; byte
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


SECTION .bss    align=32 noexecute                      ; section number 4, bss

screen_info:                                            ; qword
        resq    4                                       ; 0000

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020


