; Disassembly of file: ckernel.o
; Tue Feb 18 13:56:30 2020
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
global compute_mouse_position: function
global show_mouse_info: function
global show_memory_info: function
global message_box: function
global make_windows: function
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
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global sheet_control_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refresh_local: function
global sheet_refresh_map: function

extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
extern memman                                           ; dword
extern back_buf                                         ; dword
extern io_out8                                          ; near
extern mouse_send_info                                  ; byte
extern io_sti                                           ; near
extern keybuf                                           ; byte
extern io_store_eflags                                  ; near
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
        sub     esp, 84                                 ; 0004 _ 83. EC, 54
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-30H], eax                    ; 0018 _ 89. 45, D0
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-2CH], eax                    ; 0023 _ 89. 45, D4
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-28H], eax                    ; 002E _ 89. 45, D8
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], 0                      ; 005B _ C7. 45, DC, 00000000
        mov     dword [ebp-20H], 0                      ; 0062 _ C7. 45, E0, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-28H]                    ; 006E _ 8B. 55, D8
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-2CH]                    ; 0075 _ 8B. 55, D4
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-30H]                    ; 007C _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 008B _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 008E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0099 _ 89. 45, DC
        mov     eax, dword [ebp-1CH]                    ; 009C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 00A7 _ 89. 45, E0
        mov     eax, dword [ebp-2CH]                    ; 00AA _ 8B. 45, D4
        imul    eax, dword [ebp-28H]                    ; 00AD _ 0F AF. 45, D8
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-28H]                    ; 00D6 _ 8B. 55, D8
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-2CH]                    ; 00DD _ 8B. 55, D4
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 00E8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-20H]                    ; 0113 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0132 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0137 _ A1, 00000000(d)
        mov     edx, dword [ebp-28H]                    ; 013C _ 8B. 55, D8
        mov     dword [esp+8H], edx                     ; 013F _ 89. 54 24, 08
        mov     edx, dword [ebp-2CH]                    ; 0143 _ 8B. 55, D4
        mov     dword [esp+4H], edx                     ; 0146 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 014A _ 89. 04 24
        call    init_desktop                            ; 014D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0152 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 015A _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0161 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0166 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 016E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-24H]                    ; 0176 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 0179 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 017D _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0180 _ 89. 04 24
        call    sheet_slide                             ; 0183 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0188 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 018E _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0193 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0197 _ 89. 44 24, 08
        mov     eax, dword [ebp-20H]                    ; 019B _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 019E _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 01A2 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01A5 _ 89. 04 24
        call    sheet_slide                             ; 01A8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_146                   ; 01AD _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-1CH]                    ; 01B5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01B8 _ 89. 04 24
        call    message_box                             ; 01BB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 01C0 _ 89. 45, E8
        mov     dword [esp+8H], 0                       ; 01C3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-24H]                    ; 01CB _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 01CE _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 01D2 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01D5 _ 89. 04 24
        call    sheet_updown                            ; 01D8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 01DD _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-20H]                    ; 01E5 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 01E8 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 01EC _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    sheet_updown                            ; 01F2 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 01F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 01FC _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 0203 _ C7. 45, F0, 00000000
        mov     dword [ebp-34H], 0                      ; 020A _ C7. 45, CC, 00000000
?_001:  mov     eax, dword [ebp-34H]                    ; 0211 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0214 _ 89. 04 24
        call    intToHexStr                             ; 0217 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 021C _ 89. 45, F4
        add     dword [ebp-34H], 1                      ; 021F _ 83. 45, CC, 01
        mov     eax, dword [ebp-18H]                    ; 0223 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 0226 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 0229 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 022C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 022E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], 119                    ; 0236 _ C7. 44 24, 14, 00000077
        mov     dword [esp+10H], 28                     ; 023E _ C7. 44 24, 10, 0000001C
        mov     dword [esp+0CH], 40                     ; 0246 _ C7. 44 24, 0C, 00000028
        mov     dword [esp+8H], 8                       ; 024E _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 0256 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 025A _ 89. 04 24
        call    paint_rectangle                         ; 025D _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0262 _ C7. 44 24, 14, 00000000
        mov     eax, dword [ebp-0CH]                    ; 026A _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 026D _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 0271 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 40                      ; 0279 _ C7. 44 24, 08, 00000028
        mov     eax, dword [ebp-18H]                    ; 0281 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0284 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0288 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 028B _ 89. 04 24
        call    paint_string                            ; 028E _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 0293 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0298 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 029F _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 02A4 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 02A6 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 02AD _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 02B2 _ 01. D8
        test    eax, eax                                ; 02B4 _ 85. C0
        jnz     ?_002                                   ; 02B6 _ 75, 07
        call    io_sti                                  ; 02B8 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 02BD _ EB, 54

?_002:  mov     dword [esp], keyinfo                    ; 02BF _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 02C6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 02CB _ 85. C0
        jz      ?_003                                   ; 02CD _ 74, 16
        call    io_sti                                  ; 02CF _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 02D4 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 02DB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 02E0 _ 89. 45, EC
        jmp     ?_004                                   ; 02E3 _ EB, 2E

?_003:  mov     dword [esp], mouseinfo                  ; 02E5 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 02EC _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 02F1 _ 85. C0
        jz      ?_004                                   ; 02F3 _ 74, 1E
        mov     eax, dword [ebp-20H]                    ; 02F5 _ 8B. 45, E0
        mov     dword [esp+8H], eax                     ; 02F8 _ 89. 44 24, 08
        mov     eax, dword [ebp-24H]                    ; 02FC _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 02FF _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0303 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0306 _ 89. 04 24
        call    show_mouse_info                         ; 0309 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 030E _ E9, FFFFFEFE

?_004:  jmp     ?_001                                   ; 0313 _ E9, FFFFFEF9
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0318 _ 55
        mov     ebp, esp                                ; 0319 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 031B _ A1, 00000000(d)
        mov     edx, eax                                ; 0320 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0322 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0325 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0327 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 032A _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0330 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0333 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0339 _ 5D
        ret                                             ; 033A _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 033B _ 55
        mov     ebp, esp                                ; 033C _ 89. E5
        sub     esp, 24                                 ; 033E _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1615          ; 0341 _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 0349 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0351 _ C7. 04 24, 00000000
        call    set_palette                             ; 0358 _ E8, FFFFFFFC(rel)
        nop                                             ; 035D _ 90
        leave                                           ; 035E _ C9
        ret                                             ; 035F _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0360 _ 55
        mov     ebp, esp                                ; 0361 _ 89. E5
        sub     esp, 40                                 ; 0363 _ 83. EC, 28
        call    io_load_eflags                          ; 0366 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 036B _ 89. 45, F4
        call    io_cli                                  ; 036E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0373 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0376 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 037A _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0381 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0386 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0389 _ 89. 45, F0
        jmp     ?_006                                   ; 038C _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 038E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0391 _ 0F B6. 00
        shr     al, 2                                   ; 0394 _ C0. E8, 02
        movzx   eax, al                                 ; 0397 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 039A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 039E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 03A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03AA _ 8B. 45, 10
        add     eax, 1                                  ; 03AD _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03B0 _ 0F B6. 00
        shr     al, 2                                   ; 03B3 _ C0. E8, 02
        movzx   eax, al                                 ; 03B6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 03B9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 03BD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 03C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03C9 _ 8B. 45, 10
        add     eax, 2                                  ; 03CC _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03CF _ 0F B6. 00
        shr     al, 2                                   ; 03D2 _ C0. E8, 02
        movzx   eax, al                                 ; 03D5 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 03D8 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 03DC _ C7. 04 24, 000003C9
        call    io_out8                                 ; 03E3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 03E8 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 03EC _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 03F0 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 03F3 _ 3B. 45, 0C
        jle     ?_005                                   ; 03F6 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 03F8 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 03FB _ 89. 04 24
        call    io_store_eflags                         ; 03FE _ E8, FFFFFFFC(rel)
        nop                                             ; 0403 _ 90
        leave                                           ; 0404 _ C9
        ret                                             ; 0405 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0406 _ 55
        mov     ebp, esp                                ; 0407 _ 89. E5
        sub     esp, 20                                 ; 0409 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 040C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 040F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0412 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0415 _ 89. 45, FC
        jmp     ?_010                                   ; 0418 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 041A _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 041D _ 89. 45, F8
        jmp     ?_009                                   ; 0420 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0422 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0425 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0429 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 042B _ 8B. 45, F8
        add     eax, edx                                ; 042E _ 01. D0
        mov     edx, eax                                ; 0430 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0432 _ 8B. 45, 08
        add     edx, eax                                ; 0435 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0437 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 043B _ 88. 02
        add     dword [ebp-8H], 1                       ; 043D _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0441 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0444 _ 3B. 45, 1C
        jle     ?_008                                   ; 0447 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0449 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 044D _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0450 _ 3B. 45, 20
        jle     ?_007                                   ; 0453 _ 7E, C5
        leave                                           ; 0455 _ C9
        ret                                             ; 0456 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0457 _ 55
        mov     ebp, esp                                ; 0458 _ 89. E5
        push    ebx                                     ; 045A _ 53
        sub     esp, 28                                 ; 045B _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 045E _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0461 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0464 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0467 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 046A _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 046E _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0472 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 047A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0482 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 048A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 048D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0491 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0494 _ 89. 04 24
        call    paint_rectangle                         ; 0497 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 049C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 049F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 04A2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 04A5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 04A8 _ 8B. 45, 10
        sub     eax, 28                                 ; 04AB _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 04AE _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 04B2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 04B6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 04BA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 04C2 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 04CA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04CD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04D1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04D4 _ 89. 04 24
        call    paint_rectangle                         ; 04D7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04DC _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 04DF _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 04E2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 04E5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 04E8 _ 8B. 45, 10
        sub     eax, 27                                 ; 04EB _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 04EE _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 04F2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 04F6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 04FA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0502 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 050A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 050D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0511 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0514 _ 89. 04 24
        call    paint_rectangle                         ; 0517 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 051C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 051F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0522 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0525 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0528 _ 8B. 45, 10
        sub     eax, 26                                 ; 052B _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 052E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0532 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0536 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 053A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0542 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 054A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 054D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0551 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0554 _ 89. 04 24
        call    paint_rectangle                         ; 0557 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 055C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 055F _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0562 _ 8B. 45, 10
        sub     eax, 24                                 ; 0565 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0568 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 056C _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0574 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0578 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0580 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0588 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 058B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 058F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0592 _ 89. 04 24
        call    paint_rectangle                         ; 0595 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 059A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 059D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 05A0 _ 8B. 45, 10
        sub     eax, 24                                 ; 05A3 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 05A6 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 05AA _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 05B2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 05B6 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 05BE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 05C6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05D0 _ 89. 04 24
        call    paint_rectangle                         ; 05D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05D8 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 05DB _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 05DE _ 8B. 45, 10
        sub     eax, 4                                  ; 05E1 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 05E4 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 05E8 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 05F0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 05F4 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 05FC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0604 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0607 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 060B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 060E _ 89. 04 24
        call    paint_rectangle                         ; 0611 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0616 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0619 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 061C _ 8B. 45, 10
        sub     eax, 23                                 ; 061F _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0622 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0626 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 062E _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0632 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 063A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0642 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0645 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0649 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 064C _ 89. 04 24
        call    paint_rectangle                         ; 064F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0654 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0657 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 065A _ 8B. 45, 10
        sub     eax, 3                                  ; 065D _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0660 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0664 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 066C _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0670 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0678 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0680 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0683 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0687 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 068A _ 89. 04 24
        call    paint_rectangle                         ; 068D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0692 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0695 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0698 _ 8B. 45, 10
        sub     eax, 24                                 ; 069B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 069E _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 06A2 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 06AA _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 06AE _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 06B6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 06BE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06C8 _ 89. 04 24
        call    paint_rectangle                         ; 06CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06D0 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 06D3 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 06D6 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 06D9 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 06DC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06DF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 06E2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 06E5 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 06E8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06EC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06F0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06F4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 06F8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0700 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0703 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0707 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 070A _ 89. 04 24
        call    paint_rectangle                         ; 070D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0712 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0715 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0718 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 071B _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 071E _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0721 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0724 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0727 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 072A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 072E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0732 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0736 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 073A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0742 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0745 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0749 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 074C _ 89. 04 24
        call    paint_rectangle                         ; 074F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0754 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0757 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 075A _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 075D _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0760 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0763 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0766 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0769 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 076C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0770 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0774 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0778 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 077C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0784 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0787 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 078B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 078E _ 89. 04 24
        call    paint_rectangle                         ; 0791 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0796 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0799 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 079C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 079F _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 07A2 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 07A5 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 07A8 _ 8B. 45, 0C
        sub     eax, 3                                  ; 07AB _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 07AE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 07B2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 07B6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 07BA _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 07BE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 07C6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07D0 _ 89. 04 24
        call    paint_rectangle                         ; 07D3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 07D8 _ 83. C4, 1C
        pop     ebx                                     ; 07DB _ 5B
        pop     ebp                                     ; 07DC _ 5D
        ret                                             ; 07DD _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 07DE _ 55
        mov     ebp, esp                                ; 07DF _ 89. E5
        sub     esp, 16                                 ; 07E1 _ 83. EC, 10
        movzx   eax, word [?_158]                       ; 07E4 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 07EB _ 98
        mov     dword [ebp-8H], eax                     ; 07EC _ 89. 45, F8
        movzx   eax, word [?_159]                       ; 07EF _ 0F B7. 05, 00000006(d)
        cwde                                            ; 07F6 _ 98
        mov     dword [ebp-4H], eax                     ; 07F7 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 07FA _ 8B. 45, F8
        sub     eax, 16                                 ; 07FD _ 83. E8, 10
        mov     edx, eax                                ; 0800 _ 89. C2
        shr     edx, 31                                 ; 0802 _ C1. EA, 1F
        add     eax, edx                                ; 0805 _ 01. D0
        sar     eax, 1                                  ; 0807 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0809 _ A3, 00000124(d)
        mov     eax, dword [ebp-4H]                     ; 080E _ 8B. 45, FC
        sub     eax, 44                                 ; 0811 _ 83. E8, 2C
        mov     edx, eax                                ; 0814 _ 89. C2
        shr     edx, 31                                 ; 0816 _ C1. EA, 1F
        add     eax, edx                                ; 0819 _ 01. D0
        sar     eax, 1                                  ; 081B _ D1. F8
        mov     dword [mouse_y], eax                    ; 081D _ A3, 00000128(d)
        leave                                           ; 0822 _ C9
        ret                                             ; 0823 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0824 _ 55
        mov     ebp, esp                                ; 0825 _ 89. E5
        sub     esp, 20                                 ; 0827 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 082A _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 082D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0830 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 0837 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 083C _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 083F _ 8B. 45, 18
        add     eax, edx                                ; 0842 _ 01. D0
        movzx   eax, byte [eax]                         ; 0844 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0847 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 084A _ 0F B6. 45, FB
        test    al, al                                  ; 084E _ 84. C0
        jns     ?_012                                   ; 0850 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0852 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0855 _ 8B. 55, 14
        add     eax, edx                                ; 0858 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 085A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 085E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0860 _ 8B. 45, 10
        add     eax, edx                                ; 0863 _ 01. D0
        mov     edx, eax                                ; 0865 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0867 _ 8B. 45, 08
        add     edx, eax                                ; 086A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 086C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0870 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 0872 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0876 _ 83. E0, 40
        test    eax, eax                                ; 0879 _ 85. C0
        jz      ?_013                                   ; 087B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 087D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0880 _ 8B. 55, 14
        add     eax, edx                                ; 0883 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0885 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0889 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 088B _ 8B. 45, 10
        add     eax, edx                                ; 088E _ 01. D0
        lea     edx, [eax+1H]                           ; 0890 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0893 _ 8B. 45, 08
        add     edx, eax                                ; 0896 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0898 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 089C _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 089E _ 0F B6. 45, FB
        and     eax, 20H                                ; 08A2 _ 83. E0, 20
        test    eax, eax                                ; 08A5 _ 85. C0
        jz      ?_014                                   ; 08A7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08A9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08AC _ 8B. 55, 14
        add     eax, edx                                ; 08AF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08B5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08B7 _ 8B. 45, 10
        add     eax, edx                                ; 08BA _ 01. D0
        lea     edx, [eax+2H]                           ; 08BC _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08BF _ 8B. 45, 08
        add     edx, eax                                ; 08C2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08C4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08C8 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 08CA _ 0F B6. 45, FB
        and     eax, 10H                                ; 08CE _ 83. E0, 10
        test    eax, eax                                ; 08D1 _ 85. C0
        jz      ?_015                                   ; 08D3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08D5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08D8 _ 8B. 55, 14
        add     eax, edx                                ; 08DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08E3 _ 8B. 45, 10
        add     eax, edx                                ; 08E6 _ 01. D0
        lea     edx, [eax+3H]                           ; 08E8 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08EB _ 8B. 45, 08
        add     edx, eax                                ; 08EE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08F4 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 08F6 _ 0F B6. 45, FB
        and     eax, 08H                                ; 08FA _ 83. E0, 08
        test    eax, eax                                ; 08FD _ 85. C0
        jz      ?_016                                   ; 08FF _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0901 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0904 _ 8B. 55, 14
        add     eax, edx                                ; 0907 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0909 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 090D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 090F _ 8B. 45, 10
        add     eax, edx                                ; 0912 _ 01. D0
        lea     edx, [eax+4H]                           ; 0914 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0917 _ 8B. 45, 08
        add     edx, eax                                ; 091A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 091C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0920 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 0922 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0926 _ 83. E0, 04
        test    eax, eax                                ; 0929 _ 85. C0
        jz      ?_017                                   ; 092B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 092D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0930 _ 8B. 55, 14
        add     eax, edx                                ; 0933 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0935 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0939 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 093B _ 8B. 45, 10
        add     eax, edx                                ; 093E _ 01. D0
        lea     edx, [eax+5H]                           ; 0940 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0943 _ 8B. 45, 08
        add     edx, eax                                ; 0946 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0948 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 094C _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 094E _ 0F B6. 45, FB
        and     eax, 02H                                ; 0952 _ 83. E0, 02
        test    eax, eax                                ; 0955 _ 85. C0
        jz      ?_018                                   ; 0957 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0959 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 095C _ 8B. 55, 14
        add     eax, edx                                ; 095F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0961 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0965 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0967 _ 8B. 45, 10
        add     eax, edx                                ; 096A _ 01. D0
        lea     edx, [eax+6H]                           ; 096C _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 096F _ 8B. 45, 08
        add     edx, eax                                ; 0972 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0974 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0978 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 097A _ 0F B6. 45, FB
        and     eax, 01H                                ; 097E _ 83. E0, 01
        test    eax, eax                                ; 0981 _ 85. C0
        jz      ?_019                                   ; 0983 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0985 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0988 _ 8B. 55, 14
        add     eax, edx                                ; 098B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 098D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0991 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0993 _ 8B. 45, 10
        add     eax, edx                                ; 0996 _ 01. D0
        lea     edx, [eax+7H]                           ; 0998 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 099B _ 8B. 45, 08
        add     edx, eax                                ; 099E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09A0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09A4 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 09A6 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 09AA _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 09AE _ 0F 8E, FFFFFE88
        leave                                           ; 09B4 _ C9
        ret                                             ; 09B5 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 09B6 _ 55
        mov     ebp, esp                                ; 09B7 _ 89. E5
        push    ebx                                     ; 09B9 _ 53
        sub     esp, 52                                 ; 09BA _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 09BD _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 09C0 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 09C3 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 09C6 _ 89. 45, F4
        jmp     ?_022                                   ; 09C9 _ EB, 4B

?_021:  movsx   ecx, byte [ebp-1CH]                     ; 09CB _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 09CF _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 09D2 _ 0F B6. 00
        movsx   eax, al                                 ; 09D5 _ 0F BE. C0
        shl     eax, 4                                  ; 09D8 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 09DB _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 09E1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09E4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09E7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09EA _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 09EC _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 09F0 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 09F4 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 09F7 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 09FB _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 09FE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A06 _ 89. 04 24
        call    paint_font                              ; 0A09 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0A0E _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0A12 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 0A16 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0A19 _ 0F B6. 00
        test    al, al                                  ; 0A1C _ 84. C0
        jnz     ?_021                                   ; 0A1E _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0A20 _ 8B. 45, 14
        add     eax, 16                                 ; 0A23 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0A26 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0A2A _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0A2D _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0A31 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0A34 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0A38 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0A3B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A3F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A42 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A46 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A49 _ 89. 04 24
        call    sheet_refresh                           ; 0A4C _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0A51 _ 83. C4, 34
        pop     ebx                                     ; 0A54 _ 5B
        pop     ebp                                     ; 0A55 _ 5D
        ret                                             ; 0A56 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0A57 _ 55
        mov     ebp, esp                                ; 0A58 _ 89. E5
        sub     esp, 20                                 ; 0A5A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0A5D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0A60 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0A63 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0A6A _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 0A6F _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0A76 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 0A7B _ 8B. 45, F8
        shl     eax, 4                                  ; 0A7E _ C1. E0, 04
        mov     edx, eax                                ; 0A81 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A83 _ 8B. 45, FC
        add     eax, edx                                ; 0A86 _ 01. D0
        add     eax, cursor.1683                        ; 0A88 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0A8D _ 0F B6. 00
        cmp     al, 42                                  ; 0A90 _ 3C, 2A
        jnz     ?_025                                   ; 0A92 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A94 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A97 _ C1. E0, 04
        mov     edx, eax                                ; 0A9A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A9C _ 8B. 45, FC
        add     eax, edx                                ; 0A9F _ 01. D0
        mov     edx, eax                                ; 0AA1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AA3 _ 8B. 45, 08
        add     eax, edx                                ; 0AA6 _ 01. D0
        mov     byte [eax], 0                           ; 0AA8 _ C6. 00, 00
        jmp     ?_027                                   ; 0AAB _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 0AAD _ 8B. 45, F8
        shl     eax, 4                                  ; 0AB0 _ C1. E0, 04
        mov     edx, eax                                ; 0AB3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AB5 _ 8B. 45, FC
        add     eax, edx                                ; 0AB8 _ 01. D0
        add     eax, cursor.1683                        ; 0ABA _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0ABF _ 0F B6. 00
        cmp     al, 79                                  ; 0AC2 _ 3C, 4F
        jnz     ?_026                                   ; 0AC4 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0AC6 _ 8B. 45, F8
        shl     eax, 4                                  ; 0AC9 _ C1. E0, 04
        mov     edx, eax                                ; 0ACC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0ACE _ 8B. 45, FC
        add     eax, edx                                ; 0AD1 _ 01. D0
        mov     edx, eax                                ; 0AD3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AD5 _ 8B. 45, 08
        add     eax, edx                                ; 0AD8 _ 01. D0
        mov     byte [eax], 7                           ; 0ADA _ C6. 00, 07
        jmp     ?_027                                   ; 0ADD _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 0ADF _ 8B. 45, F8
        shl     eax, 4                                  ; 0AE2 _ C1. E0, 04
        mov     edx, eax                                ; 0AE5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AE7 _ 8B. 45, FC
        add     eax, edx                                ; 0AEA _ 01. D0
        mov     edx, eax                                ; 0AEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AEE _ 8B. 45, 08
        add     edx, eax                                ; 0AF1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AF3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AF7 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0AF9 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0AFD _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0B01 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0B07 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0B0B _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0B0F _ 0F 8E, FFFFFF5A
        leave                                           ; 0B15 _ C9
        ret                                             ; 0B16 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0B17 _ 55
        mov     ebp, esp                                ; 0B18 _ 89. E5
        sub     esp, 16                                 ; 0B1A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0B1D _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0B24 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0B26 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0B2D _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0B2F _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0B32 _ 8B. 55, 14
        add     eax, edx                                ; 0B35 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B37 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0B3B _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0B3E _ 8B. 4D, 10
        add     edx, ecx                                ; 0B41 _ 01. CA
        add     eax, edx                                ; 0B43 _ 01. D0
        mov     edx, eax                                ; 0B45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B47 _ 8B. 45, 08
        add     edx, eax                                ; 0B4A _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0B4C _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0B4F _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0B53 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0B55 _ 8B. 45, FC
        add     eax, ecx                                ; 0B58 _ 01. C8
        mov     ecx, eax                                ; 0B5A _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0B5C _ 8B. 45, 20
        add     eax, ecx                                ; 0B5F _ 01. C8
        movzx   eax, byte [eax]                         ; 0B61 _ 0F B6. 00
        mov     byte [edx], al                          ; 0B64 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0B66 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0B6A _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0B6D _ 3B. 45, 18
        jl      ?_031                                   ; 0B70 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0B72 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0B76 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0B79 _ 3B. 45, 1C
        jl      ?_030                                   ; 0B7C _ 7C, A8
        leave                                           ; 0B7E _ C9
        ret                                             ; 0B7F _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0B80 _ 55
        mov     ebp, esp                                ; 0B81 _ 89. E5
        sub     esp, 24                                 ; 0B83 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0B86 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0B8E _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0B96 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0B9D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0BA2 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0BAA _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0BB2 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0BB9 _ E8, FFFFFFFC(rel)
        leave                                           ; 0BBE _ C9
        ret                                             ; 0BBF _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0BC0 _ 55
        mov     ebp, esp                                ; 0BC1 _ 89. E5
        sub     esp, 40                                 ; 0BC3 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0BC6 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0BC9 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0BCC _ A1, 00000124(d)
        add     eax, edx                                ; 0BD1 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0BD3 _ A3, 00000124(d)
        mov     eax, dword [ebp+10H]                    ; 0BD8 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0BDB _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0BDE _ A1, 00000128(d)
        add     eax, edx                                ; 0BE3 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0BE5 _ A3, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0BEA _ A1, 00000124(d)
        test    eax, eax                                ; 0BEF _ 85. C0
        jns     ?_034                                   ; 0BF1 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0BF3 _ C7. 05, 00000124(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0BFD _ A1, 00000128(d)
        test    eax, eax                                ; 0C02 _ 85. C0
        jns     ?_035                                   ; 0C04 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0C06 _ C7. 05, 00000128(d), 00000000
?_035:  movzx   eax, word [?_158]                       ; 0C10 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C17 _ 98
        lea     edx, [eax-10H]                          ; 0C18 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0C1B _ A1, 00000124(d)
        cmp     edx, eax                                ; 0C20 _ 39. C2
        jge     ?_036                                   ; 0C22 _ 7D, 10
        movzx   eax, word [?_158]                       ; 0C24 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C2B _ 98
        sub     eax, 16                                 ; 0C2C _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0C2F _ A3, 00000124(d)
?_036:  movzx   eax, word [?_158]                       ; 0C34 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C3B _ 98
        lea     edx, [eax-10H]                          ; 0C3C _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0C3F _ A1, 00000128(d)
        cmp     edx, eax                                ; 0C44 _ 39. C2
        jge     ?_037                                   ; 0C46 _ 7D, 10
        movzx   eax, word [?_158]                       ; 0C48 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C4F _ 98
        sub     eax, 16                                 ; 0C50 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0C53 _ A3, 00000128(d)
?_037:  mov     dword [esp+14H], 7                      ; 0C58 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_147                  ; 0C60 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 0C68 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C70 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0C78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C82 _ 89. 04 24
        call    paint_string                            ; 0C85 _ E8, FFFFFFFC(rel)
        leave                                           ; 0C8A _ C9
        ret                                             ; 0C8B _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0C8C _ 55
        mov     ebp, esp                                ; 0C8D _ 89. E5
        sub     esp, 40                                 ; 0C8F _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0C92 _ C6. 45, F7, 00
        call    io_sti                                  ; 0C96 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0C9B _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0CA2 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0CA7 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0CAA _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0CAE _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0CB2 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0CB9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0CBE _ 85. C0
        jz      ?_038                                   ; 0CC0 _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 0CC2 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0CCA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CCD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CD1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CD4 _ 89. 04 24
        call    compute_mouse_position                  ; 0CD7 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0CDC _ 8B. 15, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0CE2 _ A1, 00000124(d)
        mov     dword [esp+0CH], edx                    ; 0CE7 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0CEB _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0CEF _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0CF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CF9 _ 89. 04 24
        call    sheet_slide                             ; 0CFC _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0D01 _ C9
        ret                                             ; 0D02 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 0D03 _ 55
        mov     ebp, esp                                ; 0D04 _ 89. E5
        sub     esp, 88                                 ; 0D06 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 0D09 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0D10 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 0D17 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 0D1E _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 0D23 _ 89. 45, D4
        movzx   eax, word [?_158]                       ; 0D26 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0D2D _ 98
        mov     dword [ebp-28H], eax                    ; 0D2E _ 89. 45, D8
        movzx   eax, word [?_159]                       ; 0D31 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0D38 _ 98
        mov     dword [ebp-24H], eax                    ; 0D39 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 0D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0D3F _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 0D41 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 0D44 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 0D48 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 0D4B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D4F _ 89. 04 24
        call    init_desktop                            ; 0D52 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0D57 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_148                  ; 0D5F _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 0D67 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D6A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0D6E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0D71 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D7F _ 89. 04 24
        call    paint_string                            ; 0D82 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 0D87 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 0D8A _ 89. 04 24
        call    intToHexStr                             ; 0D8D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0D92 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 0D95 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 0D9D _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 0DA0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0DA4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DA7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0DAB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0DAE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0DB2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DBC _ 89. 04 24
        call    paint_string                            ; 0DBF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0DC4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0DC8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_149                  ; 0DD0 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 0DD8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DDB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0DDF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0DE2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0DE6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DE9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DF0 _ 89. 04 24
        call    paint_string                            ; 0DF3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DF8 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0DFB _ 8B. 00
        mov     dword [esp], eax                        ; 0DFD _ 89. 04 24
        call    intToHexStr                             ; 0E00 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E05 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 0E08 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 0E10 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 0E13 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0E17 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E1A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E1E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E21 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E25 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E28 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E2C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E2F _ 89. 04 24
        call    paint_string                            ; 0E32 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0E37 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0E3B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_150                  ; 0E43 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 0E4B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E4E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0E52 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0E55 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E59 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E5C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E60 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E63 _ 89. 04 24
        call    paint_string                            ; 0E66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E6B _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0E6E _ 8B. 40, 04
        mov     dword [esp], eax                        ; 0E71 _ 89. 04 24
        call    intToHexStr                             ; 0E74 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0E79 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 0E7C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 0E84 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 0E87 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0E8B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E8E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E92 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E95 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E99 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E9C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EA0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EA3 _ 89. 04 24
        call    paint_string                            ; 0EA6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0EAB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0EAF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_151                  ; 0EB7 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 0EBF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0EC2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0EC6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0EC9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0ECD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0ED0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0ED7 _ 89. 04 24
        call    paint_string                            ; 0EDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EDF _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0EE2 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 0EE5 _ 89. 04 24
        call    intToHexStr                             ; 0EE8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0EED _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 0EF0 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 0EF8 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 0EFB _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0EFF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F02 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0F06 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0F09 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F0D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F17 _ 89. 04 24
        call    paint_string                            ; 0F1A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0F1F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0F23 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_152                  ; 0F2B _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 0F33 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F36 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0F3A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0F3D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F41 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F44 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F4B _ 89. 04 24
        call    paint_string                            ; 0F4E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F53 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0F56 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 0F59 _ 89. 04 24
        call    intToHexStr                             ; 0F5C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0F61 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 0F64 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 0F6C _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 0F6F _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0F73 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F76 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0F7A _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0F7D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F81 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F84 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F8B _ 89. 04 24
        call    paint_string                            ; 0F8E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0F93 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0F97 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_153                  ; 0F9F _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 0FA7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0FAA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0FAE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0FB1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0FB5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FB8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FBC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FBF _ 89. 04 24
        call    paint_string                            ; 0FC2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FC7 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 0FCA _ 8B. 40, 10
        mov     dword [esp], eax                        ; 0FCD _ 89. 04 24
        call    intToHexStr                             ; 0FD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0FD5 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 0FD8 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 0FE0 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 0FE3 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0FE7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0FEA _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0FEE _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0FF1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0FF5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FF8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FFC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FFF _ 89. 04 24
        call    paint_string                            ; 1002 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1007 _ 83. 45, CC, 10
        leave                                           ; 100B _ C9
        ret                                             ; 100C _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 100D _ 55
        mov     ebp, esp                                ; 100E _ 89. E5
        sub     esp, 56                                 ; 1010 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1013 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1016 _ 89. 04 24
        call    sheet_alloc                             ; 1019 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 101E _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1021 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1026 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 102E _ 89. 04 24
        call    memman_alloc_4k                         ; 1031 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1036 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1039 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1041 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1049 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1051 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1054 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1058 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 105B _ 89. 04 24
        call    sheet_setbuf                            ; 105E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1063 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1066 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 106A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 106D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1071 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1074 _ 89. 04 24
        call    make_windows                            ; 1077 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 107C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_154                  ; 1084 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 108C _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 1094 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 109C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 109F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10A3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10A6 _ 89. 04 24
        call    paint_string                            ; 10A9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 10AE _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_155                  ; 10B6 _ C7. 44 24, 10, 0000006B(d)
        mov     dword [esp+0CH], 44                     ; 10BE _ C7. 44 24, 0C, 0000002C
        mov     dword [esp+8H], 24                      ; 10C6 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 10CE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 10D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10D8 _ 89. 04 24
        call    paint_string                            ; 10DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 10E0 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 10E8 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 10F0 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 10F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10FA _ 89. 04 24
        call    sheet_slide                             ; 10FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1102 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 110A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 110D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1111 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1114 _ 89. 04 24
        call    sheet_updown                            ; 1117 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 111C _ 8B. 45, F0
        leave                                           ; 111F _ C9
        ret                                             ; 1120 _ C3
; message_box End of function

make_windows:; Function begin
        push    ebp                                     ; 1121 _ 55
        mov     ebp, esp                                ; 1122 _ 89. E5
        push    ebx                                     ; 1124 _ 53
        sub     esp, 68                                 ; 1125 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1128 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 112B _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 112E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1131 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1134 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1137 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 113A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 113D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1140 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1143 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1145 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 114D _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1151 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1159 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1161 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1169 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 116C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1170 _ 89. 04 24
        call    paint_rectangle                         ; 1173 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1178 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 117B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 117E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1181 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1183 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 118B _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 118F _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1197 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 119F _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 11A7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 11AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11AE _ 89. 04 24
        call    paint_rectangle                         ; 11B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 11B6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 11B9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 11BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11BF _ 8B. 00
        mov     dword [esp+18H], edx                    ; 11C1 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 11C5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 11CD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 11D5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 11DD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 11E5 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 11E8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11EC _ 89. 04 24
        call    paint_rectangle                         ; 11EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 11F4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 11F7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 11FA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11FD _ 8B. 00
        mov     dword [esp+18H], edx                    ; 11FF _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1203 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 120B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1213 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 121B _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1223 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1226 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 122A _ 89. 04 24
        call    paint_rectangle                         ; 122D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1232 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1235 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1238 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 123B _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 123E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1241 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1244 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1247 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1249 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 124D _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1251 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1259 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 125D _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1265 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1268 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 126C _ 89. 04 24
        call    paint_rectangle                         ; 126F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1274 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1277 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 127A _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 127D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1280 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1283 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1286 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1289 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 128B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 128F _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1293 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 129B _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 129F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 12A7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 12AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12AE _ 89. 04 24
        call    paint_rectangle                         ; 12B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 12B6 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 12B9 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 12BC _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 12BF _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 12C2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12C5 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 12C7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 12CB _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 12CF _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 12D7 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 12DF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 12E7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 12EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12EE _ 89. 04 24
        call    paint_rectangle                         ; 12F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 12F6 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 12F9 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 12FC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12FF _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1301 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1309 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 130D _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1315 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 131D _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1325 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1328 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 132C _ 89. 04 24
        call    paint_rectangle                         ; 132F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1334 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1337 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 133A _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 133D _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1340 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1343 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1346 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1349 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 134B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 134F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1353 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1357 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 135F _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1367 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 136A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 136E _ 89. 04 24
        call    paint_rectangle                         ; 1371 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1376 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1379 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 137C _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 137F _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1382 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1385 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1388 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 138B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 138D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1391 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1395 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1399 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 13A1 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 13A9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 13AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13B0 _ 89. 04 24
        call    paint_rectangle                         ; 13B3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 13B8 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 13C0 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 13C3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 13C7 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 13CF _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 13D7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13DA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13E1 _ 89. 04 24
        call    paint_string                            ; 13E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 13E9 _ C7. 45, EC, 00000000
        jmp     ?_046                                   ; 13F0 _ E9, 00000083

?_039:  mov     dword [ebp-18H], 0                      ; 13F5 _ C7. 45, E8, 00000000
        jmp     ?_045                                   ; 13FC _ EB, 70

?_040:  mov     eax, dword [ebp-14H]                    ; 13FE _ 8B. 45, EC
        shl     eax, 4                                  ; 1401 _ C1. E0, 04
        mov     edx, eax                                ; 1404 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1406 _ 8B. 45, E8
        add     eax, edx                                ; 1409 _ 01. D0
        add     eax, closebtn.1751                      ; 140B _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1410 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1413 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1416 _ 80. 7D, E7, 40
        jnz     ?_041                                   ; 141A _ 75, 06
        mov     byte [ebp-19H], 0                       ; 141C _ C6. 45, E7, 00
        jmp     ?_044                                   ; 1420 _ EB, 1C

?_041:  cmp     byte [ebp-19H], 36                      ; 1422 _ 80. 7D, E7, 24
        jnz     ?_042                                   ; 1426 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1428 _ C6. 45, E7, 0F
        jmp     ?_044                                   ; 142C _ EB, 10

?_042:  cmp     byte [ebp-19H], 81                      ; 142E _ 80. 7D, E7, 51
        jnz     ?_043                                   ; 1432 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1434 _ C6. 45, E7, 08
        jmp     ?_044                                   ; 1438 _ EB, 04

?_043:  mov     byte [ebp-19H], 7                       ; 143A _ C6. 45, E7, 07
?_044:  mov     eax, dword [ebp+0CH]                    ; 143E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1441 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1443 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1446 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1449 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 144C _ 8B. 40, 04
        imul    ecx, eax                                ; 144F _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1452 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1455 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1458 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 145B _ 8B. 45, E8
        add     eax, ebx                                ; 145E _ 01. D8
        add     eax, ecx                                ; 1460 _ 01. C8
        add     edx, eax                                ; 1462 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1464 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1468 _ 88. 02
        add     dword [ebp-18H], 1                      ; 146A _ 83. 45, E8, 01
?_045:  cmp     dword [ebp-18H], 15                     ; 146E _ 83. 7D, E8, 0F
        jle     ?_040                                   ; 1472 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1474 _ 83. 45, EC, 01
?_046:  cmp     dword [ebp-14H], 13                     ; 1478 _ 83. 7D, EC, 0D
        jle     ?_039                                   ; 147C _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1482 _ 83. C4, 44
        pop     ebx                                     ; 1485 _ 5B
        pop     ebp                                     ; 1486 _ 5D
        ret                                             ; 1487 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1488 _ 55
        mov     ebp, esp                                ; 1489 _ 89. E5
        sub     esp, 24                                 ; 148B _ 83. EC, 18
?_047:  mov     dword [esp], 100                        ; 148E _ C7. 04 24, 00000064
        call    io_in8                                  ; 1495 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 149A _ 83. E0, 02
        test    eax, eax                                ; 149D _ 85. C0
        jnz     ?_048                                   ; 149F _ 75, 02
        jmp     ?_049                                   ; 14A1 _ EB, 02

?_048:  jmp     ?_047                                   ; 14A3 _ EB, E9

?_049:  leave                                           ; 14A5 _ C9
        ret                                             ; 14A6 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 14A7 _ 55
        mov     ebp, esp                                ; 14A8 _ 89. E5
        sub     esp, 24                                 ; 14AA _ 83. EC, 18
        call    wait_KBC_sendready                      ; 14AD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 14B2 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 14BA _ C7. 04 24, 00000064
        call    io_out8                                 ; 14C1 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 14C6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 14CB _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 14D3 _ C7. 04 24, 00000060
        call    io_out8                                 ; 14DA _ E8, FFFFFFFC(rel)
        leave                                           ; 14DF _ C9
        ret                                             ; 14E0 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 14E1 _ 55
        mov     ebp, esp                                ; 14E2 _ 89. E5
        sub     esp, 24                                 ; 14E4 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 14E7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 14EC _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 14F4 _ C7. 04 24, 00000064
        call    io_out8                                 ; 14FB _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1500 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1505 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 150D _ C7. 04 24, 00000060
        call    io_out8                                 ; 1514 _ E8, FFFFFFFC(rel)
        leave                                           ; 1519 _ C9
        ret                                             ; 151A _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 151B _ 55
        mov     ebp, esp                                ; 151C _ 89. E5
        sub     esp, 4                                  ; 151E _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1521 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1524 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1527 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 152A _ 0F B6. 40, 03
        test    al, al                                  ; 152E _ 84. C0
        jnz     ?_051                                   ; 1530 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1532 _ 80. 7D, FC, FA
        jnz     ?_050                                   ; 1536 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1538 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 153B _ C6. 40, 03, 01
?_050:  mov     eax, 0                                  ; 153F _ B8, 00000000
        jmp     ?_058                                   ; 1544 _ E9, 0000010F

?_051:  mov     eax, dword [ebp+8H]                     ; 1549 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 154C _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1550 _ 3C, 01
        jnz     ?_053                                   ; 1552 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1554 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1558 _ 25, 000000C8
        cmp     eax, 8                                  ; 155D _ 83. F8, 08
        jnz     ?_052                                   ; 1560 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1562 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1565 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1569 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 156B _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 156E _ C6. 40, 03, 02
?_052:  mov     eax, 0                                  ; 1572 _ B8, 00000000
        jmp     ?_058                                   ; 1577 _ E9, 000000DC

?_053:  mov     eax, dword [ebp+8H]                     ; 157C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 157F _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1583 _ 3C, 02
        jnz     ?_054                                   ; 1585 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1587 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 158A _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 158E _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1591 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1594 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1598 _ B8, 00000000
        jmp     ?_058                                   ; 159D _ E9, 000000B6

?_054:  mov     eax, dword [ebp+8H]                     ; 15A2 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 15A5 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 15A9 _ 3C, 03
        jne     ?_057                                   ; 15AB _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 15B1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 15B4 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 15B8 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 15BB _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 15BE _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 15C2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 15C5 _ 0F B6. 00
        movzx   eax, al                                 ; 15C8 _ 0F B6. C0
        and     eax, 07H                                ; 15CB _ 83. E0, 07
        mov     edx, eax                                ; 15CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15D0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 15D3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 15D6 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 15D9 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 15DD _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15E0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15E3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15E6 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 15E9 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 15ED _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15F0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15F3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 15F6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 15F9 _ 0F B6. 00
        movzx   eax, al                                 ; 15FC _ 0F B6. C0
        and     eax, 10H                                ; 15FF _ 83. E0, 10
        test    eax, eax                                ; 1602 _ 85. C0
        jz      ?_055                                   ; 1604 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1606 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1609 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 160C _ 0D, FFFFFF00
        mov     edx, eax                                ; 1611 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1613 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1616 _ 89. 50, 04
?_055:  mov     eax, dword [ebp+8H]                     ; 1619 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 161C _ 0F B6. 00
        movzx   eax, al                                 ; 161F _ 0F B6. C0
        and     eax, 20H                                ; 1622 _ 83. E0, 20
        test    eax, eax                                ; 1625 _ 85. C0
        jz      ?_056                                   ; 1627 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1629 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 162C _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 162F _ 0D, FFFFFF00
        mov     edx, eax                                ; 1634 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1636 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1639 _ 89. 50, 08
?_056:  mov     eax, dword [ebp+8H]                     ; 163C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 163F _ 8B. 40, 08
        neg     eax                                     ; 1642 _ F7. D8
        mov     edx, eax                                ; 1644 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1646 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1649 _ 89. 50, 08
        mov     eax, 1                                  ; 164C _ B8, 00000001
        jmp     ?_058                                   ; 1651 _ EB, 05

?_057:  mov     eax, 4294967295                         ; 1653 _ B8, FFFFFFFF
?_058:  leave                                           ; 1658 _ C9
        ret                                             ; 1659 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 165A _ 55
        mov     ebp, esp                                ; 165B _ 89. E5
        sub     esp, 40                                 ; 165D _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1660 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1668 _ C7. 04 24, 00000020
        call    io_out8                                 ; 166F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1674 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 167C _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1683 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1688 _ C7. 04 24, 00000060
        call    io_in8                                  ; 168F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1694 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1697 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 169B _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 169F _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 16A6 _ E8, FFFFFFFC(rel)
        leave                                           ; 16AB _ C9
        ret                                             ; 16AC _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 16AD _ 55
        mov     ebp, esp                                ; 16AE _ 89. E5
        sub     esp, 40                                 ; 16B0 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 16B3 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 16BB _ C7. 04 24, 00000020
        call    io_out8                                 ; 16C2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 16C7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 16CF _ C7. 04 24, 000000A0
        call    io_out8                                 ; 16D6 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 16DB _ C7. 04 24, 00000060
        call    io_in8                                  ; 16E2 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 16E7 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 16EA _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 16EE _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 16F2 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 16F9 _ E8, FFFFFFFC(rel)
        leave                                           ; 16FE _ C9
        ret                                             ; 16FF _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1700 _ 55
        mov     ebp, esp                                ; 1701 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1703 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1706 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1709 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 170B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 170E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1715 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1718 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 171F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1722 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1725 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1728 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 172B _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 172E _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1731 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1734 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 173B _ 5D
        ret                                             ; 173C _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 173D _ 55
        mov     ebp, esp                                ; 173E _ 89. E5
        sub     esp, 20                                 ; 1740 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1743 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1746 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1749 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 174C _ 8B. 40, 10
        test    eax, eax                                ; 174F _ 85. C0
        jnz     ?_059                                   ; 1751 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1753 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1756 _ 8B. 40, 14
        or      eax, 01H                                ; 1759 _ 83. C8, 01
        mov     edx, eax                                ; 175C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 175E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1761 _ 89. 50, 14
        mov     eax, 4294967295                         ; 1764 _ B8, FFFFFFFF
        jmp     ?_061                                   ; 1769 _ EB, 56

?_059:  mov     eax, dword [ebp+8H]                     ; 176B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 176E _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1771 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1774 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1777 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1779 _ 8B. 45, FC
        add     edx, eax                                ; 177C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 177E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1782 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1784 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1787 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 178A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 178D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1790 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1793 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1796 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1799 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 179C _ 8B. 40, 0C
        cmp     edx, eax                                ; 179F _ 39. C2
        jnz     ?_060                                   ; 17A1 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 17A3 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 17A6 _ C7. 40, 04, 00000000
?_060:  mov     eax, dword [ebp+8H]                     ; 17AD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 17B0 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 17B3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17B6 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 17B9 _ 89. 50, 10
        mov     eax, 0                                  ; 17BC _ B8, 00000000
?_061:  leave                                           ; 17C1 _ C9
        ret                                             ; 17C2 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 17C3 _ 55
        mov     ebp, esp                                ; 17C4 _ 89. E5
        sub     esp, 16                                 ; 17C6 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 17C9 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 17CC _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 17CF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17D2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 17D5 _ 39. C2
        jnz     ?_062                                   ; 17D7 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 17D9 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 17DC _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 17E3 _ B8, FFFFFFFF
        jmp     ?_064                                   ; 17E8 _ EB, 57

?_062:  mov     eax, dword [ebp+8H]                     ; 17EA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 17ED _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 17F0 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 17F3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 17F6 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 17F8 _ 8B. 45, F8
        add     eax, edx                                ; 17FB _ 01. D0
        movzx   eax, byte [eax]                         ; 17FD _ 0F B6. 00
        movzx   eax, al                                 ; 1800 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1803 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1806 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1809 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 180C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 180F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1812 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1815 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1818 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 181B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 181E _ 8B. 40, 0C
        cmp     edx, eax                                ; 1821 _ 39. C2
        jnz     ?_063                                   ; 1823 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1825 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1828 _ C7. 40, 08, 00000000
?_063:  mov     eax, dword [ebp+8H]                     ; 182F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1832 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1835 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1838 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 183B _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 183E _ 8B. 45, FC
?_064:  leave                                           ; 1841 _ C9
        ret                                             ; 1842 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1843 _ 55
        mov     ebp, esp                                ; 1844 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1846 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1849 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 184C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 184F _ 8B. 40, 10
        sub     edx, eax                                ; 1852 _ 29. C2
        mov     eax, edx                                ; 1854 _ 89. D0
        pop     ebp                                     ; 1856 _ 5D
        ret                                             ; 1857 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1858 _ 55
        mov     ebp, esp                                ; 1859 _ 89. E5
        sub     esp, 4                                  ; 185B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 185E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1861 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1864 _ 80. 7D, FC, 09
        jle     ?_065                                   ; 1868 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 186A _ 0F B6. 45, FC
        add     eax, 55                                 ; 186E _ 83. C0, 37
        jmp     ?_066                                   ; 1871 _ EB, 07

?_065:  movzx   eax, byte [ebp-4H]                      ; 1873 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1877 _ 83. C0, 30
?_066:  leave                                           ; 187A _ C9
        ret                                             ; 187B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 187C _ 55
        mov     ebp, esp                                ; 187D _ 89. E5
        sub     esp, 24                                 ; 187F _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1882 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1885 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1888 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 188F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1893 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1896 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1899 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 189D _ 89. 04 24
        call    charToHexVal                            ; 18A0 _ E8, FFFFFFFC(rel)
        mov     byte [?_157], al                        ; 18A5 _ A2, 00000243(d)
        movzx   eax, byte [ebp-14H]                     ; 18AA _ 0F B6. 45, EC
        shr     al, 4                                   ; 18AE _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 18B1 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 18B4 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 18B8 _ 0F BE. C0
        mov     dword [esp], eax                        ; 18BB _ 89. 04 24
        call    charToHexVal                            ; 18BE _ E8, FFFFFFFC(rel)
        mov     byte [?_156], al                        ; 18C3 _ A2, 00000242(d)
        mov     eax, keyval                             ; 18C8 _ B8, 00000240(d)
        leave                                           ; 18CD _ C9
        ret                                             ; 18CE _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 18CF _ 55
        mov     ebp, esp                                ; 18D0 _ 89. E5
        sub     esp, 16                                 ; 18D2 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 18D5 _ C6. 05, 00000220(d), 30
        mov     byte [?_160], 88                        ; 18DC _ C6. 05, 00000221(d), 58
        mov     byte [?_161], 0                         ; 18E3 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 18EA _ C7. 45, F4, 00000002
        jmp     ?_068                                   ; 18F1 _ EB, 0F

?_067:  mov     eax, dword [ebp-0CH]                    ; 18F3 _ 8B. 45, F4
        add     eax, str.1386                           ; 18F6 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 18FB _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 18FE _ 83. 45, F4, 01
?_068:  cmp     dword [ebp-0CH], 9                      ; 1902 _ 83. 7D, F4, 09
        jle     ?_067                                   ; 1906 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1908 _ C7. 45, F8, 00000009
        jmp     ?_072                                   ; 190F _ EB, 40

?_069:  mov     eax, dword [ebp+8H]                     ; 1911 _ 8B. 45, 08
        and     eax, 0FH                                ; 1914 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1917 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 191A _ 8B. 45, 08
        shr     eax, 4                                  ; 191D _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1920 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1923 _ 83. 7D, FC, 09
        jle     ?_070                                   ; 1927 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1929 _ 8B. 45, FC
        add     eax, 55                                 ; 192C _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 192F _ 8B. 55, F8
        add     edx, str.1386                           ; 1932 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1938 _ 88. 02
        jmp     ?_071                                   ; 193A _ EB, 11

?_070:  mov     eax, dword [ebp-4H]                     ; 193C _ 8B. 45, FC
        add     eax, 48                                 ; 193F _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1942 _ 8B. 55, F8
        add     edx, str.1386                           ; 1945 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 194B _ 88. 02
?_071:  sub     dword [ebp-8H], 1                       ; 194D _ 83. 6D, F8, 01
?_072:  cmp     dword [ebp-8H], 1                       ; 1951 _ 83. 7D, F8, 01
        jle     ?_073                                   ; 1955 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1957 _ 83. 7D, 08, 00
        jnz     ?_069                                   ; 195B _ 75, B4
?_073:  mov     eax, str.1386                           ; 195D _ B8, 00000220(d)
        leave                                           ; 1962 _ C9
        ret                                             ; 1963 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1964 _ 55
        mov     ebp, esp                                ; 1965 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1967 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 196A _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1970 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1973 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 197A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 197D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1987 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 198E _ 5D
        ret                                             ; 198F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1990 _ 55
        mov     ebp, esp                                ; 1991 _ 89. E5
        sub     esp, 16                                 ; 1993 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1996 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 199D _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 19A4 _ EB, 14

?_074:  mov     eax, dword [ebp+8H]                     ; 19A6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19A9 _ 8B. 55, F8
        add     edx, 2                                  ; 19AC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 19AF _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 19B3 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 19B6 _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 19BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19BD _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 19BF _ 3B. 45, F8
        ja      ?_074                                   ; 19C2 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 19C4 _ 8B. 45, FC
        leave                                           ; 19C7 _ C9
        ret                                             ; 19C8 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 19C9 _ 55
        mov     ebp, esp                                ; 19CA _ 89. E5
        sub     esp, 16                                 ; 19CC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 19CF _ C7. 45, F8, 00000000
        jmp     ?_079                                   ; 19D6 _ E9, 00000085

?_076:  mov     eax, dword [ebp+8H]                     ; 19DB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19DE _ 8B. 55, F8
        add     edx, 2                                  ; 19E1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 19E4 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 19E8 _ 3B. 45, 0C
        jc      ?_078                                   ; 19EB _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 19ED _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19F0 _ 8B. 55, F8
        add     edx, 2                                  ; 19F3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 19F6 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 19F9 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 19FC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19FF _ 8B. 55, F8
        add     edx, 2                                  ; 1A02 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1A05 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1A08 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1A0B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A0E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A11 _ 8B. 55, F8
        add     edx, 2                                  ; 1A14 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1A17 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1A1A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A1D _ 8B. 55, F8
        add     edx, 2                                  ; 1A20 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1A23 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1A27 _ 2B. 45, 0C
        mov     edx, eax                                ; 1A2A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1A2C _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1A2F _ 8B. 4D, F8
        add     ecx, 2                                  ; 1A32 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1A35 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1A39 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A3C _ 8B. 55, F8
        add     edx, 2                                  ; 1A3F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1A42 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1A46 _ 85. C0
        jnz     ?_077                                   ; 1A48 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1A4A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A4D _ 8B. 00
        lea     edx, [eax-1H]                           ; 1A4F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A52 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1A55 _ 89. 10
?_077:  mov     eax, dword [ebp-4H]                     ; 1A57 _ 8B. 45, FC
        jmp     ?_080                                   ; 1A5A _ EB, 17

?_078:  add     dword [ebp-8H], 1                       ; 1A5C _ 83. 45, F8, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 1A60 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A63 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1A65 _ 3B. 45, F8
        ja      ?_076                                   ; 1A68 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 1A6E _ B8, 00000000
?_080:  leave                                           ; 1A73 _ C9
        ret                                             ; 1A74 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1A75 _ 55
        mov     ebp, esp                                ; 1A76 _ 89. E5
        push    ebx                                     ; 1A78 _ 53
        sub     esp, 16                                 ; 1A79 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1A7C _ C7. 45, F4, 00000000
        jmp     ?_083                                   ; 1A83 _ EB, 17

?_081:  mov     eax, dword [ebp+8H]                     ; 1A85 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A88 _ 8B. 55, F4
        add     edx, 2                                  ; 1A8B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A8E _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1A91 _ 3B. 45, 0C
        jbe     ?_082                                   ; 1A94 _ 76, 02
        jmp     ?_084                                   ; 1A96 _ EB, 0E

?_082:  add     dword [ebp-0CH], 1                      ; 1A98 _ 83. 45, F4, 01
?_083:  mov     eax, dword [ebp+8H]                     ; 1A9C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A9F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1AA1 _ 3B. 45, F4
        jg      ?_081                                   ; 1AA4 _ 7F, DF
?_084:  cmp     dword [ebp-0CH], 0                      ; 1AA6 _ 83. 7D, F4, 00
        jle     ?_086                                   ; 1AAA _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1AB0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1AB3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AB6 _ 8B. 45, 08
        add     edx, 2                                  ; 1AB9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1ABC _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1ABF _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1AC2 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1AC5 _ 8B. 45, 08
        add     ecx, 2                                  ; 1AC8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1ACB _ 8B. 44 C8, 04
        add     eax, edx                                ; 1ACF _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1AD1 _ 3B. 45, 0C
        jne     ?_086                                   ; 1AD4 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1ADA _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1ADD _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1AE0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1AE3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AE6 _ 8B. 45, 08
        add     edx, 2                                  ; 1AE9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1AEC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1AF0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1AF3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AF6 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1AF9 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1AFC _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1B00 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B03 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1B05 _ 3B. 45, F4
        jle     ?_085                                   ; 1B08 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1B0A _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1B0D _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1B10 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B13 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B16 _ 8B. 55, F4
        add     edx, 2                                  ; 1B19 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1B1C _ 8B. 04 D0
        cmp     ecx, eax                                ; 1B1F _ 39. C1
        jnz     ?_085                                   ; 1B21 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1B23 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1B26 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1B29 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B2C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B2F _ 8B. 45, 08
        add     edx, 2                                  ; 1B32 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1B35 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1B39 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1B3C _ 8B. 4D, F4
        add     ecx, 2                                  ; 1B3F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1B42 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1B46 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B49 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1B4C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1B4F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1B53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B56 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1B58 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B5B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1B5E _ 89. 10
?_085:  mov     eax, 0                                  ; 1B60 _ B8, 00000000
        jmp     ?_092                                   ; 1B65 _ E9, 0000011C

?_086:  mov     eax, dword [ebp+8H]                     ; 1B6A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B6D _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1B6F _ 3B. 45, F4
        jle     ?_087                                   ; 1B72 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1B74 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1B77 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1B7A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B7D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B80 _ 8B. 55, F4
        add     edx, 2                                  ; 1B83 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1B86 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1B89 _ 39. C1
        jnz     ?_087                                   ; 1B8B _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1B8D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B90 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1B93 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1B96 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1B99 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1B9C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B9F _ 8B. 55, F4
        add     edx, 2                                  ; 1BA2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1BA5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1BA9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1BAC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1BAF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BB2 _ 8B. 55, F4
        add     edx, 2                                  ; 1BB5 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1BB8 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1BBC _ B8, 00000000
        jmp     ?_092                                   ; 1BC1 _ E9, 000000C0

?_087:  mov     eax, dword [ebp+8H]                     ; 1BC6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BC9 _ 8B. 00
        cmp     eax, 4095                               ; 1BCB _ 3D, 00000FFF
        jg      ?_091                                   ; 1BD0 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1BD6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BD9 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1BDB _ 89. 45, F8
        jmp     ?_089                                   ; 1BDE _ EB, 28

?_088:  mov     eax, dword [ebp-8H]                     ; 1BE0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1BE3 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1BE6 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1BE9 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1BEC _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1BEF _ 8B. 45, 08
        add     edx, 2                                  ; 1BF2 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1BF5 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1BF8 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1BFA _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1BFD _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1C00 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1C04 _ 83. 6D, F8, 01
?_089:  mov     eax, dword [ebp-8H]                     ; 1C08 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1C0B _ 3B. 45, F4
        jg      ?_088                                   ; 1C0E _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1C10 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C13 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1C15 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C18 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1C1B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1C1D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C20 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C23 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C26 _ 8B. 00
        cmp     edx, eax                                ; 1C28 _ 39. C2
        jge     ?_090                                   ; 1C2A _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1C2C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1C2F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1C31 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1C34 _ 89. 50, 04
?_090:  mov     eax, dword [ebp+8H]                     ; 1C37 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1C3A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1C3D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1C40 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1C43 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1C46 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1C49 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1C4C _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1C4F _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1C52 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1C56 _ B8, 00000000
        jmp     ?_092                                   ; 1C5B _ EB, 29

?_091:  mov     eax, dword [ebp+8H]                     ; 1C5D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C60 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1C63 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C66 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C69 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1C6C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1C6F _ 8B. 40, 08
        mov     edx, eax                                ; 1C72 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1C74 _ 8B. 45, 10
        add     eax, edx                                ; 1C77 _ 01. D0
        mov     edx, eax                                ; 1C79 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C7B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1C7E _ 89. 50, 08
        mov     eax, 4294967295                         ; 1C81 _ B8, FFFFFFFF
?_092:  add     esp, 16                                 ; 1C86 _ 83. C4, 10
        pop     ebx                                     ; 1C89 _ 5B
        pop     ebp                                     ; 1C8A _ 5D
        ret                                             ; 1C8B _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1C8C _ 55
        mov     ebp, esp                                ; 1C8D _ 89. E5
        sub     esp, 24                                 ; 1C8F _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1C92 _ 8B. 45, 0C
        add     eax, 4095                               ; 1C95 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C9A _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1C9F _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CA2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CAC _ 89. 04 24
        call    memman_alloc                            ; 1CAF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1CB4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1CB7 _ 8B. 45, FC
        leave                                           ; 1CBA _ C9
        ret                                             ; 1CBB _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1CBC _ 55
        mov     ebp, esp                                ; 1CBD _ 89. E5
        sub     esp, 28                                 ; 1CBF _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1CC2 _ 8B. 45, 10
        add     eax, 4095                               ; 1CC5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1CCA _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1CCF _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1CD2 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1CD5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1CD9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CDC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CE0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CE3 _ 89. 04 24
        call    memman_free                             ; 1CE6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1CEB _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1CEE _ 8B. 45, FC
        leave                                           ; 1CF1 _ C9
        ret                                             ; 1CF2 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 1CF3 _ 55
        mov     ebp, esp                                ; 1CF4 _ 89. E5
        sub     esp, 40                                 ; 1CF6 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 1CF9 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 1D01 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D04 _ 89. 04 24
        call    memman_alloc_4k                         ; 1D07 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1D0C _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1D0F _ 83. 7D, F4, 00
        jnz     ?_093                                   ; 1D13 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 1D15 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 1D18 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 1D20 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D27 _ 89. 04 24
        call    memman_free_4k                          ; 1D2A _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 1D2F _ B8, 00000000
        jmp     ?_097                                   ; 1D34 _ E9, 0000009D

?_093:  mov     eax, dword [ebp-0CH]                    ; 1D39 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1D3C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1D3F _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1D41 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1D44 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1D47 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1D4A _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1D4D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1D50 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1D53 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1D56 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1D5D _ C7. 45, F0, 00000000
        jmp     ?_095                                   ; 1D64 _ EB, 1B

?_094:  mov     eax, dword [ebp-0CH]                    ; 1D66 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1D69 _ 8B. 55, F0
        add     edx, 33                                 ; 1D6C _ 83. C2, 21
        shl     edx, 5                                  ; 1D6F _ C1. E2, 05
        add     eax, edx                                ; 1D72 _ 01. D0
        add     eax, 16                                 ; 1D74 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1D77 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1D7D _ 83. 45, F0, 01
?_095:  cmp     dword [ebp-10H], 255                    ; 1D81 _ 81. 7D, F0, 000000FF
        jle     ?_094                                   ; 1D88 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1D8A _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1D8D _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 1D91 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D95 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D98 _ 89. 04 24
        call    memman_alloc_4k                         ; 1D9B _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 1DA0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1DA2 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 1DA5 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 1DA8 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 1DAB _ 8B. 40, 10
        test    eax, eax                                ; 1DAE _ 85. C0
        jnz     ?_096                                   ; 1DB0 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 1DB2 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 1DB5 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 1DBD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DC1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DC4 _ 89. 04 24
        call    memman_free_4k                          ; 1DC7 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 1DCC _ B8, 00000000
        jmp     ?_097                                   ; 1DD1 _ EB, 03

?_096:  mov     eax, dword [ebp-0CH]                    ; 1DD3 _ 8B. 45, F4
?_097:  leave                                           ; 1DD6 _ C9
        ret                                             ; 1DD7 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1DD8 _ 55
        mov     ebp, esp                                ; 1DD9 _ 89. E5
        sub     esp, 16                                 ; 1DDB _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1DDE _ C7. 45, F8, 00000000
        jmp     ?_100                                   ; 1DE5 _ EB, 5B

?_098:  mov     eax, dword [ebp+8H]                     ; 1DE7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1DEA _ 8B. 55, F8
        add     edx, 33                                 ; 1DED _ 83. C2, 21
        shl     edx, 5                                  ; 1DF0 _ C1. E2, 05
        add     eax, edx                                ; 1DF3 _ 01. D0
        add     eax, 16                                 ; 1DF5 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 1DF8 _ 8B. 00
        test    eax, eax                                ; 1DFA _ 85. C0
        jnz     ?_099                                   ; 1DFC _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 1DFE _ 8B. 45, F8
        shl     eax, 5                                  ; 1E01 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1E04 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1E0A _ 8B. 45, 08
        add     eax, edx                                ; 1E0D _ 01. D0
        add     eax, 4                                  ; 1E0F _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 1E12 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E15 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E18 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1E1B _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1E1E _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 1E21 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 1E25 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1E28 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1E2F _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1E32 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1E39 _ 8B. 45, FC
        jmp     ?_101                                   ; 1E3C _ EB, 12

?_099:  add     dword [ebp-8H], 1                       ; 1E3E _ 83. 45, F8, 01
?_100:  cmp     dword [ebp-8H], 255                     ; 1E42 _ 81. 7D, F8, 000000FF
        jle     ?_098                                   ; 1E49 _ 7E, 9C
        mov     eax, 0                                  ; 1E4B _ B8, 00000000
?_101:  leave                                           ; 1E50 _ C9
        ret                                             ; 1E51 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1E52 _ 55
        mov     ebp, esp                                ; 1E53 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1E55 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1E58 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1E5B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1E5D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1E60 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1E63 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E66 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1E69 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1E6C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1E6F _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1E72 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1E75 _ 89. 50, 14
        pop     ebp                                     ; 1E78 _ 5D
        ret                                             ; 1E79 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1E7A _ 55
        mov     ebp, esp                                ; 1E7B _ 89. E5
        push    esi                                     ; 1E7D _ 56
        push    ebx                                     ; 1E7E _ 53
        sub     esp, 48                                 ; 1E7F _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 1E82 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E85 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1E88 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1E8B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E8E _ 8B. 40, 0C
        add     eax, 1                                  ; 1E91 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 1E94 _ 3B. 45, 10
        jge     ?_102                                   ; 1E97 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 1E99 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E9C _ 8B. 40, 0C
        add     eax, 1                                  ; 1E9F _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1EA2 _ 89. 45, 10
?_102:  cmp     dword [ebp+10H], -1                     ; 1EA5 _ 83. 7D, 10, FF
        jge     ?_103                                   ; 1EA9 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1EAB _ C7. 45, 10, FFFFFFFF
?_103:  mov     eax, dword [ebp+0CH]                    ; 1EB2 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1EB5 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1EB8 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1EBB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1EBE _ 3B. 45, 10
        jle     ?_110                                   ; 1EC1 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 1EC7 _ 83. 7D, 10, 00
        js      ?_106                                   ; 1ECB _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 1ED1 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1ED4 _ 89. 45, F0
        jmp     ?_105                                   ; 1ED7 _ EB, 34

?_104:  mov     eax, dword [ebp-10H]                    ; 1ED9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1EDC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EDF _ 8B. 45, 08
        add     edx, 4                                  ; 1EE2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1EE5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1EE9 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1EEC _ 8B. 4D, F0
        add     ecx, 4                                  ; 1EEF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1EF2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1EF6 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1EF9 _ 8B. 55, F0
        add     edx, 4                                  ; 1EFC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1EFF _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1F03 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1F06 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1F09 _ 83. 6D, F0, 01
?_105:  mov     eax, dword [ebp-10H]                    ; 1F0D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F10 _ 3B. 45, 10
        jg      ?_104                                   ; 1F13 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 1F15 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F18 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1F1B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1F1E _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1F21 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1F25 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1F28 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1F2B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F2E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F31 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1F34 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1F37 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1F3A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1F3D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F40 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F43 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1F46 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1F49 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F4C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F4F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1F52 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 1F55 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1F59 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1F5D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1F61 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1F65 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F69 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F6C _ 89. 04 24
        call    sheet_refresh_map                       ; 1F6F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F74 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1F77 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1F7A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F7D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F80 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1F83 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1F86 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1F89 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1F8C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F8F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F92 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1F95 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1F98 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F9B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F9E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1FA1 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 1FA4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1FA8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1FAC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1FB0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1FB4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FB8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FBB _ 89. 04 24
        call    sheet_refresh_local                     ; 1FBE _ E8, FFFFFFFC(rel)
        jmp     ?_117                                   ; 1FC3 _ E9, 0000026C

?_106:  mov     eax, dword [ebp+8H]                     ; 1FC8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1FCB _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 1FCE _ 3B. 45, F4
        jle     ?_109                                   ; 1FD1 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 1FD3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1FD6 _ 89. 45, F0
        jmp     ?_108                                   ; 1FD9 _ EB, 34

?_107:  mov     eax, dword [ebp-10H]                    ; 1FDB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1FDE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FE1 _ 8B. 45, 08
        add     edx, 4                                  ; 1FE4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1FE7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1FEB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1FEE _ 8B. 4D, F0
        add     ecx, 4                                  ; 1FF1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1FF4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1FF8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1FFB _ 8B. 55, F0
        add     edx, 4                                  ; 1FFE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2001 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2005 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2008 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 200B _ 83. 45, F0, 01
?_108:  mov     eax, dword [ebp+8H]                     ; 200F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2012 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2015 _ 3B. 45, F0
        jg      ?_107                                   ; 2018 _ 7F, C1
?_109:  mov     eax, dword [ebp+8H]                     ; 201A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 201D _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2020 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2023 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2026 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2029 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 202C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 202F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2032 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2035 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2038 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 203B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 203E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2041 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2044 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2047 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 204A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 204D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2050 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2053 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 205B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 205F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2063 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2067 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 206B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 206E _ 89. 04 24
        call    sheet_refresh_map                       ; 2071 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2076 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2079 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 207C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 207F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2082 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2085 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2088 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 208B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 208E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2091 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2094 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2097 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 209A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 209D _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 20A0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 20A8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 20AC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 20B0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 20B4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20B8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20BB _ 89. 04 24
        call    sheet_refresh_local                     ; 20BE _ E8, FFFFFFFC(rel)
        jmp     ?_117                                   ; 20C3 _ E9, 0000016C

?_110:  mov     eax, dword [ebp-0CH]                    ; 20C8 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 20CB _ 3B. 45, 10
        jge     ?_117                                   ; 20CE _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 20D4 _ 83. 7D, F4, 00
        js      ?_113                                   ; 20D8 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 20DA _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 20DD _ 89. 45, F0
        jmp     ?_112                                   ; 20E0 _ EB, 34

?_111:  mov     eax, dword [ebp-10H]                    ; 20E2 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 20E5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20E8 _ 8B. 45, 08
        add     edx, 4                                  ; 20EB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 20EE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 20F2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 20F5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 20F8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 20FB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 20FF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2102 _ 8B. 55, F0
        add     edx, 4                                  ; 2105 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2108 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 210C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 210F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2112 _ 83. 45, F0, 01
?_112:  mov     eax, dword [ebp-10H]                    ; 2116 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2119 _ 3B. 45, 10
        jl      ?_111                                   ; 211C _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 211E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2121 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2124 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2127 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 212A _ 89. 54 88, 04
        jmp     ?_116                                   ; 212E _ EB, 6C

?_113:  mov     eax, dword [ebp+8H]                     ; 2130 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2133 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2136 _ 89. 45, F0
        jmp     ?_115                                   ; 2139 _ EB, 3A

?_114:  mov     eax, dword [ebp-10H]                    ; 213B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 213E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2141 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2144 _ 8B. 55, F0
        add     edx, 4                                  ; 2147 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 214A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 214E _ 8B. 45, 08
        add     ecx, 4                                  ; 2151 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2154 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2158 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 215B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 215E _ 8B. 45, 08
        add     edx, 4                                  ; 2161 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2164 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2168 _ 8B. 55, F0
        add     edx, 1                                  ; 216B _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 216E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2171 _ 83. 6D, F0, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 2175 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2178 _ 3B. 45, 10
        jge     ?_114                                   ; 217B _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 217D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2180 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2183 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2186 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2189 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 218D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2190 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2193 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2196 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2199 _ 89. 50, 0C
?_116:  mov     eax, dword [ebp+0CH]                    ; 219C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 219F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21A2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 21A5 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 21A8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 21AB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 21AE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21B1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 21B4 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 21B7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 21BA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21BD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21C0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21C3 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 21C6 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 21C9 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 21CD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 21D1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 21D5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 21D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21E0 _ 89. 04 24
        call    sheet_refresh_map                       ; 21E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 21E8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21EB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21EE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 21F1 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 21F4 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 21F7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 21FA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21FD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2200 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2203 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2206 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2209 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 220C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 220F _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2212 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2215 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2219 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 221D _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2221 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2225 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2229 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 222C _ 89. 04 24
        call    sheet_refresh_local                     ; 222F _ E8, FFFFFFFC(rel)
?_117:  add     esp, 48                                 ; 2234 _ 83. C4, 30
        pop     ebx                                     ; 2237 _ 5B
        pop     esi                                     ; 2238 _ 5E
        pop     ebp                                     ; 2239 _ 5D
        ret                                             ; 223A _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 223B _ 55
        mov     ebp, esp                                ; 223C _ 89. E5
        push    edi                                     ; 223E _ 57
        push    esi                                     ; 223F _ 56
        push    ebx                                     ; 2240 _ 53
        sub     esp, 44                                 ; 2241 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2244 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2247 _ 8B. 40, 18
        test    eax, eax                                ; 224A _ 85. C0
        js      ?_118                                   ; 224C _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 224E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2251 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2254 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2257 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 225A _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 225D _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2260 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2263 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2266 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2269 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 226C _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 226F _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2272 _ 8B. 55, 14
        add     ecx, edx                                ; 2275 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2277 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 227A _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 227D _ 8B. 55, 10
        add     edx, edi                                ; 2280 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2282 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2286 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 228A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 228E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2292 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2296 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2299 _ 89. 04 24
        call    sheet_refresh_local                     ; 229C _ E8, FFFFFFFC(rel)
?_118:  mov     eax, 0                                  ; 22A1 _ B8, 00000000
        add     esp, 44                                 ; 22A6 _ 83. C4, 2C
        pop     ebx                                     ; 22A9 _ 5B
        pop     esi                                     ; 22AA _ 5E
        pop     edi                                     ; 22AB _ 5F
        pop     ebp                                     ; 22AC _ 5D
        ret                                             ; 22AD _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 22AE _ 55
        mov     ebp, esp                                ; 22AF _ 89. E5
        push    ebx                                     ; 22B1 _ 53
        sub     esp, 52                                 ; 22B2 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 22B5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22B8 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 22BB _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 22BE _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 22C1 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 22C4 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 22C7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 22CA _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 22CD _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22D0 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 22D3 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 22D6 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22D9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 22DC _ 8B. 40, 18
        test    eax, eax                                ; 22DF _ 85. C0
        js      ?_119                                   ; 22E1 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 22E7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 22EA _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 22ED _ 8B. 45, F4
        add     edx, eax                                ; 22F0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 22F2 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 22F5 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 22F8 _ 8B. 45, F0
        add     eax, ecx                                ; 22FB _ 01. C8
        mov     dword [esp+14H], 0                      ; 22FD _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2305 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2309 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 230D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2310 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2314 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2317 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 231B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 231E _ 89. 04 24
        call    sheet_refresh_map                       ; 2321 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2326 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2329 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 232C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 232F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2332 _ 8B. 55, 14
        add     ecx, edx                                ; 2335 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2337 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 233A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 233D _ 8B. 55, 10
        add     edx, ebx                                ; 2340 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2342 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2346 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 234A _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 234E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2351 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2355 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2358 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 235C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 235F _ 89. 04 24
        call    sheet_refresh_map                       ; 2362 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2367 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 236A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 236D _ 8B. 45, F4
        add     edx, eax                                ; 2370 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2372 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2375 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2378 _ 8B. 45, F0
        add     eax, ecx                                ; 237B _ 01. C8
        mov     dword [esp+14H], 0                      ; 237D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2385 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2389 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 238D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2390 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2394 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2397 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 239B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 239E _ 89. 04 24
        call    sheet_refresh_local                     ; 23A1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 23A6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 23A9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 23AC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 23AF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 23B2 _ 8B. 55, 14
        add     ecx, edx                                ; 23B5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 23B7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 23BA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 23BD _ 8B. 55, 10
        add     edx, ebx                                ; 23C0 _ 01. DA
        mov     dword [esp+14H], eax                    ; 23C2 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 23C6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 23CA _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 23CE _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 23D1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 23D5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 23D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23DF _ 89. 04 24
        call    sheet_refresh_local                     ; 23E2 _ E8, FFFFFFFC(rel)
?_119:  add     esp, 52                                 ; 23E7 _ 83. C4, 34
        pop     ebx                                     ; 23EA _ 5B
        pop     ebp                                     ; 23EB _ 5D
        ret                                             ; 23EC _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 23ED _ 55
        mov     ebp, esp                                ; 23EE _ 89. E5
        sub     esp, 48                                 ; 23F0 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 23F3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23F6 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 23F8 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 23FB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23FE _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2401 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2404 _ 83. 7D, 0C, 00
        jns     ?_120                                   ; 2408 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 240A _ C7. 45, 0C, 00000000
?_120:  cmp     dword [ebp+10H], 0                      ; 2411 _ 83. 7D, 10, 00
        jns     ?_121                                   ; 2415 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2417 _ C7. 45, 10, 00000000
?_121:  mov     eax, dword [ebp+8H]                     ; 241E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2421 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2424 _ 3B. 45, 14
        jge     ?_122                                   ; 2427 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2429 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 242C _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 242F _ 89. 45, 14
?_122:  mov     eax, dword [ebp+8H]                     ; 2432 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2435 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2438 _ 3B. 45, 18
        jge     ?_123                                   ; 243B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 243D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2440 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2443 _ 89. 45, 18
?_123:  mov     eax, dword [ebp+1CH]                    ; 2446 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2449 _ 89. 45, DC
        jmp     ?_130                                   ; 244C _ E9, 00000119

?_124:  mov     eax, dword [ebp+8H]                     ; 2451 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2454 _ 8B. 55, DC
        add     edx, 4                                  ; 2457 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 245A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 245E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2461 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2464 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2466 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2469 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 246C _ 8B. 45, 08
        add     eax, 1044                               ; 246F _ 05, 00000414
        sub     edx, eax                                ; 2474 _ 29. C2
        mov     eax, edx                                ; 2476 _ 89. D0
        sar     eax, 5                                  ; 2478 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 247B _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 247E _ C7. 45, E4, 00000000
        jmp     ?_129                                   ; 2485 _ E9, 000000CD

?_125:  mov     eax, dword [ebp-10H]                    ; 248A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 248D _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2490 _ 8B. 45, E4
        add     eax, edx                                ; 2493 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2495 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2498 _ C7. 45, E0, 00000000
        jmp     ?_128                                   ; 249F _ E9, 000000A0

?_126:  mov     eax, dword [ebp-10H]                    ; 24A4 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 24A7 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 24AA _ 8B. 45, E0
        add     eax, edx                                ; 24AD _ 01. D0
        mov     dword [ebp-4H], eax                     ; 24AF _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 24B2 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 24B5 _ 3B. 45, FC
        jg      ?_127                                   ; 24B8 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 24BE _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 24C1 _ 3B. 45, 14
        jge     ?_127                                   ; 24C4 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 24C6 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 24C9 _ 3B. 45, F8
        jg      ?_127                                   ; 24CC _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 24CE _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 24D1 _ 3B. 45, 18
        jge     ?_127                                   ; 24D4 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 24D6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 24D9 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 24DC _ 0F AF. 45, E4
        mov     edx, eax                                ; 24E0 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 24E2 _ 8B. 45, E0
        add     eax, edx                                ; 24E5 _ 01. D0
        mov     edx, eax                                ; 24E7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 24E9 _ 8B. 45, F4
        add     eax, edx                                ; 24EC _ 01. D0
        movzx   eax, byte [eax]                         ; 24EE _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 24F1 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 24F4 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 24F8 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 24FB _ 8B. 40, 14
        cmp     edx, eax                                ; 24FE _ 39. C2
        jz      ?_127                                   ; 2500 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2502 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2505 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2508 _ 0F AF. 45, F8
        mov     edx, eax                                ; 250C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 250E _ 8B. 45, FC
        add     eax, edx                                ; 2511 _ 01. D0
        mov     edx, eax                                ; 2513 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2515 _ 8B. 45, EC
        add     eax, edx                                ; 2518 _ 01. D0
        movzx   eax, byte [eax]                         ; 251A _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 251D _ 3A. 45, DA
        jnz     ?_127                                   ; 2520 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2522 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2525 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2528 _ 0F AF. 45, F8
        mov     edx, eax                                ; 252C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 252E _ 8B. 45, FC
        add     eax, edx                                ; 2531 _ 01. D0
        mov     edx, eax                                ; 2533 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2535 _ 8B. 45, E8
        add     edx, eax                                ; 2538 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 253A _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 253E _ 88. 02
?_127:  add     dword [ebp-20H], 1                      ; 2540 _ 83. 45, E0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2544 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2547 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 254A _ 3B. 45, E0
        jg      ?_126                                   ; 254D _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2553 _ 83. 45, E4, 01
?_129:  mov     eax, dword [ebp-10H]                    ; 2557 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 255A _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 255D _ 3B. 45, E4
        jg      ?_125                                   ; 2560 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2566 _ 83. 45, DC, 01
?_130:  mov     eax, dword [ebp+8H]                     ; 256A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 256D _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2570 _ 3B. 45, DC
        jge     ?_124                                   ; 2573 _ 0F 8D, FFFFFED8
        leave                                           ; 2579 _ C9
        ret                                             ; 257A _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 257B _ 55
        mov     ebp, esp                                ; 257C _ 89. E5
        sub     esp, 64                                 ; 257E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2581 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2584 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2586 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2589 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 258C _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 258F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2592 _ 83. 7D, 0C, 00
        jns     ?_131                                   ; 2596 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2598 _ C7. 45, 0C, 00000000
?_131:  cmp     dword [ebp+10H], 0                      ; 259F _ 83. 7D, 10, 00
        jns     ?_132                                   ; 25A3 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 25A5 _ C7. 45, 10, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 25AC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 25AF _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 25B2 _ 3B. 45, 14
        jge     ?_133                                   ; 25B5 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 25B7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 25BA _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 25BD _ 89. 45, 14
?_133:  mov     eax, dword [ebp+8H]                     ; 25C0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 25C3 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 25C6 _ 3B. 45, 18
        jge     ?_134                                   ; 25C9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 25CB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 25CE _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 25D1 _ 89. 45, 18
?_134:  mov     eax, dword [ebp+1CH]                    ; 25D4 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 25D7 _ 89. 45, CC
        jmp     ?_145                                   ; 25DA _ E9, 00000141

?_135:  mov     eax, dword [ebp+8H]                     ; 25DF _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 25E2 _ 8B. 55, CC
        add     edx, 4                                  ; 25E5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 25E8 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 25EC _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 25EF _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 25F2 _ 8B. 45, 08
        add     eax, 1044                               ; 25F5 _ 05, 00000414
        sub     edx, eax                                ; 25FA _ 29. C2
        mov     eax, edx                                ; 25FC _ 89. D0
        sar     eax, 5                                  ; 25FE _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2601 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2604 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2607 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2609 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 260C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 260F _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2612 _ 8B. 55, 0C
        sub     edx, eax                                ; 2615 _ 29. C2
        mov     eax, edx                                ; 2617 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2619 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 261C _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 261F _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2622 _ 8B. 55, 10
        sub     edx, eax                                ; 2625 _ 29. C2
        mov     eax, edx                                ; 2627 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2629 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 262C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 262F _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2632 _ 8B. 55, 14
        sub     edx, eax                                ; 2635 _ 29. C2
        mov     eax, edx                                ; 2637 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2639 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 263C _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 263F _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2642 _ 8B. 55, 18
        sub     edx, eax                                ; 2645 _ 29. C2
        mov     eax, edx                                ; 2647 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2649 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 264C _ 83. 7D, D0, 00
        jns     ?_136                                   ; 2650 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2652 _ C7. 45, D0, 00000000
?_136:  cmp     dword [ebp-2CH], 0                      ; 2659 _ 83. 7D, D4, 00
        jns     ?_137                                   ; 265D _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 265F _ C7. 45, D4, 00000000
?_137:  mov     eax, dword [ebp-10H]                    ; 2666 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2669 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 266C _ 3B. 45, D8
        jge     ?_138                                   ; 266F _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2671 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2674 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2677 _ 89. 45, D8
?_138:  mov     eax, dword [ebp-10H]                    ; 267A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 267D _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2680 _ 3B. 45, DC
        jge     ?_139                                   ; 2683 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2685 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2688 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 268B _ 89. 45, DC
?_139:  mov     eax, dword [ebp-2CH]                    ; 268E _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2691 _ 89. 45, E4
        jmp     ?_144                                   ; 2694 _ EB, 7A

?_140:  mov     eax, dword [ebp-10H]                    ; 2696 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2699 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 269C _ 8B. 45, E4
        add     eax, edx                                ; 269F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 26A1 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 26A4 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 26A7 _ 89. 45, E0
        jmp     ?_143                                   ; 26AA _ EB, 58

?_141:  mov     eax, dword [ebp-10H]                    ; 26AC _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 26AF _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 26B2 _ 8B. 45, E0
        add     eax, edx                                ; 26B5 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 26B7 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 26BA _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 26BD _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 26C0 _ 0F AF. 45, E4
        mov     edx, eax                                ; 26C4 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 26C6 _ 8B. 45, E0
        add     eax, edx                                ; 26C9 _ 01. D0
        mov     edx, eax                                ; 26CB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 26CD _ 8B. 45, F4
        add     eax, edx                                ; 26D0 _ 01. D0
        movzx   eax, byte [eax]                         ; 26D2 _ 0F B6. 00
        movzx   edx, al                                 ; 26D5 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 26D8 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 26DB _ 8B. 40, 14
        cmp     edx, eax                                ; 26DE _ 39. C2
        jz      ?_142                                   ; 26E0 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 26E2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 26E5 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 26E8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 26EC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 26EE _ 8B. 45, FC
        add     eax, edx                                ; 26F1 _ 01. D0
        mov     edx, eax                                ; 26F3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 26F5 _ 8B. 45, EC
        add     edx, eax                                ; 26F8 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 26FA _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 26FE _ 88. 02
?_142:  add     dword [ebp-20H], 1                      ; 2700 _ 83. 45, E0, 01
?_143:  mov     eax, dword [ebp-20H]                    ; 2704 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2707 _ 3B. 45, D8
        jl      ?_141                                   ; 270A _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 270C _ 83. 45, E4, 01
?_144:  mov     eax, dword [ebp-1CH]                    ; 2710 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2713 _ 3B. 45, DC
        jl      ?_140                                   ; 2716 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 271C _ 83. 45, CC, 01
?_145:  mov     eax, dword [ebp+8H]                     ; 2720 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2723 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2726 _ 3B. 45, CC
        jge     ?_135                                   ; 2729 _ 0F 8D, FFFFFEB0
        leave                                           ; 272F _ C9
        ret                                             ; 2730 _ C3
; sheet_refresh_map End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_146:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_147:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0007 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 000F _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0017 _ howing.

?_148:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_149:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_150:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_151:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_152:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_153:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_154:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0060 _ Welcome 
        db 74H, 6FH, 00H                                ; 0068 _ to.

?_155:                                                  ; byte
        db 57H, 65H, 54H, 72H, 65H, 65H, 4FH, 53H       ; 006B _ WeTreeOS
        db 00H                                          ; 0073 _ .


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1615:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0020 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1683:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0060 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0068 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0070 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0078 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0080 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0090 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00A0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 00B0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 00C0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 00D0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 00F0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0100 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0110 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0120 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0130 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0140 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0150 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ ........

closebtn.1751:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0240 _ 0X

?_156:  db 00H                                          ; 0242 _ .

?_157:  db 00H, 00H                                     ; 0243 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

screen_info:                                            ; qword
        resb    4                                       ; 0000

?_158:  resw    1                                       ; 0004

?_159:  resw    13                                      ; 0006

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020

back_buf: resd  1                                       ; 0120

mouse_x: resd   1                                       ; 0124

mouse_y: resd   1                                       ; 0128

mouse_send_info:                                        ; oword
        resb    20                                      ; 012C

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

?_160:  resb    9                                       ; 0221

?_161:  resb    1                                       ; 022A


