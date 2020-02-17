; Disassembly of file: ckernel.o
; Mon Feb 17 20:21:07 2020
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

extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
extern memman                                           ; dword
extern back_buf                                         ; dword
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
        mov     dword [ebp-28H], eax                    ; 0018 _ 89. 45, D8
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-24H], eax                    ; 0023 _ 89. 45, DC
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-20H], eax                    ; 002E _ 89. 45, E0
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 0                      ; 005B _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 0062 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-20H]                    ; 006E _ 8B. 55, E0
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-24H]                    ; 0075 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 007C _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 008B _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 008E _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0099 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 009C _ 8B. 45, EC
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 00A7 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 00AA _ 8B. 45, DC
        imul    eax, dword [ebp-20H]                    ; 00AD _ 0F AF. 45, E0
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-20H]                    ; 00D6 _ 8B. 55, E0
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-24H]                    ; 00DD _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00E8 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 0113 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0132 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0137 _ A1, 00000000(d)
        mov     edx, dword [ebp-20H]                    ; 013C _ 8B. 55, E0
        mov     dword [esp+8H], edx                     ; 013F _ 89. 54 24, 08
        mov     edx, dword [ebp-24H]                    ; 0143 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 0146 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 014A _ 89. 04 24
        call    init_desktop                            ; 014D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0152 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 015A _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0161 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0166 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 016E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 0176 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0179 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 017D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0180 _ 89. 04 24
        call    sheet_slide                             ; 0183 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0188 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 018E _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0193 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0197 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 019B _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 019E _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 01A2 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01A5 _ 89. 04 24
        call    sheet_slide                             ; 01A8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_127                   ; 01AD _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-14H]                    ; 01B5 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01B8 _ 89. 04 24
        call    message_box                             ; 01BB _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 0                       ; 01C0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 01C8 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 01CB _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 01CF _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01D2 _ 89. 04 24
        call    sheet_updown                            ; 01D5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 01DA _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-18H]                    ; 01E2 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 01E5 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 01E9 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    sheet_updown                            ; 01EF _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 01F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 01F9 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 0200 _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 0207 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 020C _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0213 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0218 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 021A _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0221 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0226 _ 01. D8
        test    eax, eax                                ; 0228 _ 85. C0
        jnz     ?_002                                   ; 022A _ 75, 07
        call    io_stihlt                               ; 022C _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 0231 _ EB, 51

?_002:  mov     dword [esp], keyinfo                    ; 0233 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 023A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 023F _ 85. C0
        jz      ?_003                                   ; 0241 _ 74, 16
        call    io_sti                                  ; 0243 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0248 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 024F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0254 _ 89. 45, F0
        jmp     ?_004                                   ; 0257 _ EB, 2B

?_003:  mov     dword [esp], mouseinfo                  ; 0259 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0260 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0265 _ 85. C0
        jz      ?_004                                   ; 0267 _ 74, 1B
        mov     eax, dword [ebp-18H]                    ; 0269 _ 8B. 45, E8
        mov     dword [esp+8H], eax                     ; 026C _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 0270 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0273 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0277 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 027A _ 89. 04 24
        call    show_mouse_info                         ; 027D _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0282 _ EB, 83

?_004:  jmp     ?_001                                   ; 0284 _ EB, 81
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0286 _ 55
        mov     ebp, esp                                ; 0287 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0289 _ A1, 00000000(d)
        mov     edx, eax                                ; 028E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0290 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0293 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0295 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0298 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 029E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 02A1 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 02A7 _ 5D
        ret                                             ; 02A8 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 02A9 _ 55
        mov     ebp, esp                                ; 02AA _ 89. E5
        sub     esp, 24                                 ; 02AC _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1606          ; 02AF _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 02B7 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 02BF _ C7. 04 24, 00000000
        call    set_palette                             ; 02C6 _ E8, FFFFFFFC(rel)
        nop                                             ; 02CB _ 90
        leave                                           ; 02CC _ C9
        ret                                             ; 02CD _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 02CE _ 55
        mov     ebp, esp                                ; 02CF _ 89. E5
        sub     esp, 40                                 ; 02D1 _ 83. EC, 28
        call    io_load_eflags                          ; 02D4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02D9 _ 89. 45, F4
        call    io_cli                                  ; 02DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02E1 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 02E4 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 02E8 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 02EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02F4 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 02F7 _ 89. 45, F0
        jmp     ?_006                                   ; 02FA _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 02FC _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02FF _ 0F B6. 00
        shr     al, 2                                   ; 0302 _ C0. E8, 02
        movzx   eax, al                                 ; 0305 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0308 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 030C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0313 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0318 _ 8B. 45, 10
        add     eax, 1                                  ; 031B _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 031E _ 0F B6. 00
        shr     al, 2                                   ; 0321 _ C0. E8, 02
        movzx   eax, al                                 ; 0324 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0327 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 032B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0332 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0337 _ 8B. 45, 10
        add     eax, 2                                  ; 033A _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 033D _ 0F B6. 00
        shr     al, 2                                   ; 0340 _ C0. E8, 02
        movzx   eax, al                                 ; 0343 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0346 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 034A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0351 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0356 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 035A _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 035E _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0361 _ 3B. 45, 0C
        jle     ?_005                                   ; 0364 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0366 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0369 _ 89. 04 24
        call    io_store_eflags                         ; 036C _ E8, FFFFFFFC(rel)
        nop                                             ; 0371 _ 90
        leave                                           ; 0372 _ C9
        ret                                             ; 0373 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0374 _ 55
        mov     ebp, esp                                ; 0375 _ 89. E5
        sub     esp, 20                                 ; 0377 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 037A _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 037D _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0380 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0383 _ 89. 45, FC
        jmp     ?_010                                   ; 0386 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0388 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 038B _ 89. 45, F8
        jmp     ?_009                                   ; 038E _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0390 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0393 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0397 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0399 _ 8B. 45, F8
        add     eax, edx                                ; 039C _ 01. D0
        mov     edx, eax                                ; 039E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 03A0 _ 8B. 45, 08
        add     edx, eax                                ; 03A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 03A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 03A9 _ 88. 02
        add     dword [ebp-8H], 1                       ; 03AB _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 03AF _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 03B2 _ 3B. 45, 1C
        jle     ?_008                                   ; 03B5 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 03B7 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 03BB _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 03BE _ 3B. 45, 20
        jle     ?_007                                   ; 03C1 _ 7E, C5
        leave                                           ; 03C3 _ C9
        ret                                             ; 03C4 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 03C5 _ 55
        mov     ebp, esp                                ; 03C6 _ 89. E5
        push    ebx                                     ; 03C8 _ 53
        sub     esp, 28                                 ; 03C9 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 03CC _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 03CF _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 03D2 _ 8B. 45, 0C
        sub     eax, 1                                  ; 03D5 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 03D8 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 03DC _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 03E0 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 03E8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 03F0 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03F8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0402 _ 89. 04 24
        call    paint_rectangle                         ; 0405 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 040A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 040D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0410 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0413 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0416 _ 8B. 45, 10
        sub     eax, 28                                 ; 0419 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 041C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0420 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0424 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0428 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0430 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0438 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 043B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 043F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0442 _ 89. 04 24
        call    paint_rectangle                         ; 0445 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 044A _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 044D _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0450 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0453 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0456 _ 8B. 45, 10
        sub     eax, 27                                 ; 0459 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 045C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0460 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0464 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0468 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0470 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0478 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 047B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 047F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0482 _ 89. 04 24
        call    paint_rectangle                         ; 0485 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 048A _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 048D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0490 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0493 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0496 _ 8B. 45, 10
        sub     eax, 26                                 ; 0499 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 049C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 04A0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 04A4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 04A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 04B0 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 04B8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04BB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04BF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04C2 _ 89. 04 24
        call    paint_rectangle                         ; 04C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04CA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04CD _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04D0 _ 8B. 45, 10
        sub     eax, 24                                 ; 04D3 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04D6 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04DA _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04E2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04E6 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 04EE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04F6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0500 _ 89. 04 24
        call    paint_rectangle                         ; 0503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0508 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 050B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 050E _ 8B. 45, 10
        sub     eax, 24                                 ; 0511 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0514 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0518 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0520 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0524 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 052C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0534 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0537 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 053B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 053E _ 89. 04 24
        call    paint_rectangle                         ; 0541 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0546 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0549 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 054C _ 8B. 45, 10
        sub     eax, 4                                  ; 054F _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0552 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0556 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 055E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0562 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 056A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0572 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0575 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0579 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 057C _ 89. 04 24
        call    paint_rectangle                         ; 057F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0584 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0587 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 058A _ 8B. 45, 10
        sub     eax, 23                                 ; 058D _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0590 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0594 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 059C _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 05A0 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 05A8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 05B0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05B3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05B7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05BA _ 89. 04 24
        call    paint_rectangle                         ; 05BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05C2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05C5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05C8 _ 8B. 45, 10
        sub     eax, 3                                  ; 05CB _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 05CE _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 05D2 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 05DA _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 05DE _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 05E6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05F8 _ 89. 04 24
        call    paint_rectangle                         ; 05FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0600 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0603 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0606 _ 8B. 45, 10
        sub     eax, 24                                 ; 0609 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 060C _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0610 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0618 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 061C _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0624 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 062C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 062F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0633 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0636 _ 89. 04 24
        call    paint_rectangle                         ; 0639 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 063E _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0641 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0644 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0647 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 064A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 064D _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0650 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0653 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0656 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 065A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 065E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0662 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0666 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 066E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0671 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0675 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0678 _ 89. 04 24
        call    paint_rectangle                         ; 067B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0680 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0683 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0686 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0689 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 068C _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 068F _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0692 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0695 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0698 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 069C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06A0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06A4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 06A8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 06B0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06B3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06B7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06BA _ 89. 04 24
        call    paint_rectangle                         ; 06BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06C2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06C5 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06C8 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 06CB _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 06CE _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 06D1 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 06D4 _ 8B. 45, 0C
        sub     eax, 47                                 ; 06D7 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 06DA _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06DE _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06E2 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06E6 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06EA _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06F2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06FC _ 89. 04 24
        call    paint_rectangle                         ; 06FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0704 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0707 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 070A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 070D _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0710 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0713 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0716 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0719 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 071C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0720 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0724 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0728 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 072C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0734 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0737 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 073B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 073E _ 89. 04 24
        call    paint_rectangle                         ; 0741 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0746 _ 83. C4, 1C
        pop     ebx                                     ; 0749 _ 5B
        pop     ebp                                     ; 074A _ 5D
        ret                                             ; 074B _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 074C _ 55
        mov     ebp, esp                                ; 074D _ 89. E5
        sub     esp, 16                                 ; 074F _ 83. EC, 10
        movzx   eax, word [?_139]                       ; 0752 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0759 _ 98
        mov     dword [ebp-8H], eax                     ; 075A _ 89. 45, F8
        movzx   eax, word [?_140]                       ; 075D _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0764 _ 98
        mov     dword [ebp-4H], eax                     ; 0765 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0768 _ 8B. 45, F8
        sub     eax, 16                                 ; 076B _ 83. E8, 10
        mov     edx, eax                                ; 076E _ 89. C2
        shr     edx, 31                                 ; 0770 _ C1. EA, 1F
        add     eax, edx                                ; 0773 _ 01. D0
        sar     eax, 1                                  ; 0775 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0777 _ A3, 00000124(d)
        mov     eax, dword [ebp-4H]                     ; 077C _ 8B. 45, FC
        sub     eax, 44                                 ; 077F _ 83. E8, 2C
        mov     edx, eax                                ; 0782 _ 89. C2
        shr     edx, 31                                 ; 0784 _ C1. EA, 1F
        add     eax, edx                                ; 0787 _ 01. D0
        sar     eax, 1                                  ; 0789 _ D1. F8
        mov     dword [mouse_y], eax                    ; 078B _ A3, 00000128(d)
        leave                                           ; 0790 _ C9
        ret                                             ; 0791 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0792 _ 55
        mov     ebp, esp                                ; 0793 _ 89. E5
        sub     esp, 20                                 ; 0795 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0798 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 079B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 079E _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 07A5 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 07AA _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 07AD _ 8B. 45, 18
        add     eax, edx                                ; 07B0 _ 01. D0
        movzx   eax, byte [eax]                         ; 07B2 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 07B5 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 07B8 _ 0F B6. 45, FB
        test    al, al                                  ; 07BC _ 84. C0
        jns     ?_012                                   ; 07BE _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07C0 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07C3 _ 8B. 55, 14
        add     eax, edx                                ; 07C6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07C8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07CC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07CE _ 8B. 45, 10
        add     eax, edx                                ; 07D1 _ 01. D0
        mov     edx, eax                                ; 07D3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07D5 _ 8B. 45, 08
        add     edx, eax                                ; 07D8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07DA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07DE _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 07E0 _ 0F B6. 45, FB
        and     eax, 40H                                ; 07E4 _ 83. E0, 40
        test    eax, eax                                ; 07E7 _ 85. C0
        jz      ?_013                                   ; 07E9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07EB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07EE _ 8B. 55, 14
        add     eax, edx                                ; 07F1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07F3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07F7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07F9 _ 8B. 45, 10
        add     eax, edx                                ; 07FC _ 01. D0
        lea     edx, [eax+1H]                           ; 07FE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0801 _ 8B. 45, 08
        add     edx, eax                                ; 0804 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0806 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 080A _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 080C _ 0F B6. 45, FB
        and     eax, 20H                                ; 0810 _ 83. E0, 20
        test    eax, eax                                ; 0813 _ 85. C0
        jz      ?_014                                   ; 0815 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0817 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 081A _ 8B. 55, 14
        add     eax, edx                                ; 081D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 081F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0823 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0825 _ 8B. 45, 10
        add     eax, edx                                ; 0828 _ 01. D0
        lea     edx, [eax+2H]                           ; 082A _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 082D _ 8B. 45, 08
        add     edx, eax                                ; 0830 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0832 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0836 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 0838 _ 0F B6. 45, FB
        and     eax, 10H                                ; 083C _ 83. E0, 10
        test    eax, eax                                ; 083F _ 85. C0
        jz      ?_015                                   ; 0841 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0843 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0846 _ 8B. 55, 14
        add     eax, edx                                ; 0849 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 084B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 084F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0851 _ 8B. 45, 10
        add     eax, edx                                ; 0854 _ 01. D0
        lea     edx, [eax+3H]                           ; 0856 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0859 _ 8B. 45, 08
        add     edx, eax                                ; 085C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 085E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0862 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0864 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0868 _ 83. E0, 08
        test    eax, eax                                ; 086B _ 85. C0
        jz      ?_016                                   ; 086D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 086F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0872 _ 8B. 55, 14
        add     eax, edx                                ; 0875 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0877 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 087B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 087D _ 8B. 45, 10
        add     eax, edx                                ; 0880 _ 01. D0
        lea     edx, [eax+4H]                           ; 0882 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0885 _ 8B. 45, 08
        add     edx, eax                                ; 0888 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 088A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 088E _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 0890 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0894 _ 83. E0, 04
        test    eax, eax                                ; 0897 _ 85. C0
        jz      ?_017                                   ; 0899 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 089B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 089E _ 8B. 55, 14
        add     eax, edx                                ; 08A1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08A7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A9 _ 8B. 45, 10
        add     eax, edx                                ; 08AC _ 01. D0
        lea     edx, [eax+5H]                           ; 08AE _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08B1 _ 8B. 45, 08
        add     edx, eax                                ; 08B4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08B6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08BA _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 08BC _ 0F B6. 45, FB
        and     eax, 02H                                ; 08C0 _ 83. E0, 02
        test    eax, eax                                ; 08C3 _ 85. C0
        jz      ?_018                                   ; 08C5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08C7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08CA _ 8B. 55, 14
        add     eax, edx                                ; 08CD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08CF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D5 _ 8B. 45, 10
        add     eax, edx                                ; 08D8 _ 01. D0
        lea     edx, [eax+6H]                           ; 08DA _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08DD _ 8B. 45, 08
        add     edx, eax                                ; 08E0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08E2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08E6 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 08E8 _ 0F B6. 45, FB
        and     eax, 01H                                ; 08EC _ 83. E0, 01
        test    eax, eax                                ; 08EF _ 85. C0
        jz      ?_019                                   ; 08F1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08F3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08F6 _ 8B. 55, 14
        add     eax, edx                                ; 08F9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08FB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08FF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0901 _ 8B. 45, 10
        add     eax, edx                                ; 0904 _ 01. D0
        lea     edx, [eax+7H]                           ; 0906 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0909 _ 8B. 45, 08
        add     edx, eax                                ; 090C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 090E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0912 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 0914 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 0918 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 091C _ 0F 8E, FFFFFE88
        leave                                           ; 0922 _ C9
        ret                                             ; 0923 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0924 _ 55
        mov     ebp, esp                                ; 0925 _ 89. E5
        push    ebx                                     ; 0927 _ 53
        sub     esp, 52                                 ; 0928 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 092B _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 092E _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0931 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0934 _ 89. 45, F4
        jmp     ?_022                                   ; 0937 _ EB, 4B

?_021:  movsx   ecx, byte [ebp-1CH]                     ; 0939 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 093D _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0940 _ 0F B6. 00
        movsx   eax, al                                 ; 0943 _ 0F BE. C0
        shl     eax, 4                                  ; 0946 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0949 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 094F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0952 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0955 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0958 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 095A _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 095E _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0962 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0965 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0969 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 096C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0970 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0974 _ 89. 04 24
        call    paint_font                              ; 0977 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 097C _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0980 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 0984 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0987 _ 0F B6. 00
        test    al, al                                  ; 098A _ 84. C0
        jnz     ?_021                                   ; 098C _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 098E _ 8B. 45, 14
        add     eax, 16                                 ; 0991 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0994 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0998 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 099B _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 099F _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 09A2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 09A6 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 09A9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 09AD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09B0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09B4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09B7 _ 89. 04 24
        call    sheet_refresh                           ; 09BA _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 09BF _ 83. C4, 34
        pop     ebx                                     ; 09C2 _ 5B
        pop     ebp                                     ; 09C3 _ 5D
        ret                                             ; 09C4 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09C5 _ 55
        mov     ebp, esp                                ; 09C6 _ 89. E5
        sub     esp, 20                                 ; 09C8 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09CE _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09D1 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 09D8 _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 09DD _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 09E4 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 09E9 _ 8B. 45, F8
        shl     eax, 4                                  ; 09EC _ C1. E0, 04
        mov     edx, eax                                ; 09EF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F1 _ 8B. 45, FC
        add     eax, edx                                ; 09F4 _ 01. D0
        add     eax, cursor.1674                        ; 09F6 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09FB _ 0F B6. 00
        cmp     al, 42                                  ; 09FE _ 3C, 2A
        jnz     ?_025                                   ; 0A00 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A02 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A05 _ C1. E0, 04
        mov     edx, eax                                ; 0A08 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A0A _ 8B. 45, FC
        add     eax, edx                                ; 0A0D _ 01. D0
        mov     edx, eax                                ; 0A0F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A11 _ 8B. 45, 08
        add     eax, edx                                ; 0A14 _ 01. D0
        mov     byte [eax], 0                           ; 0A16 _ C6. 00, 00
        jmp     ?_027                                   ; 0A19 _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 0A1B _ 8B. 45, F8
        shl     eax, 4                                  ; 0A1E _ C1. E0, 04
        mov     edx, eax                                ; 0A21 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A23 _ 8B. 45, FC
        add     eax, edx                                ; 0A26 _ 01. D0
        add     eax, cursor.1674                        ; 0A28 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0A2D _ 0F B6. 00
        cmp     al, 79                                  ; 0A30 _ 3C, 4F
        jnz     ?_026                                   ; 0A32 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A34 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A37 _ C1. E0, 04
        mov     edx, eax                                ; 0A3A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A3C _ 8B. 45, FC
        add     eax, edx                                ; 0A3F _ 01. D0
        mov     edx, eax                                ; 0A41 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A43 _ 8B. 45, 08
        add     eax, edx                                ; 0A46 _ 01. D0
        mov     byte [eax], 7                           ; 0A48 _ C6. 00, 07
        jmp     ?_027                                   ; 0A4B _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 0A4D _ 8B. 45, F8
        shl     eax, 4                                  ; 0A50 _ C1. E0, 04
        mov     edx, eax                                ; 0A53 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A55 _ 8B. 45, FC
        add     eax, edx                                ; 0A58 _ 01. D0
        mov     edx, eax                                ; 0A5A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A5C _ 8B. 45, 08
        add     edx, eax                                ; 0A5F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A61 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A65 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0A67 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0A6B _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0A6F _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0A75 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0A79 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0A7D _ 0F 8E, FFFFFF5A
        leave                                           ; 0A83 _ C9
        ret                                             ; 0A84 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0A85 _ 55
        mov     ebp, esp                                ; 0A86 _ 89. E5
        sub     esp, 16                                 ; 0A88 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A8B _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A92 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0A94 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0A9B _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0A9D _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0AA0 _ 8B. 55, 14
        add     eax, edx                                ; 0AA3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AA5 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0AA9 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0AAC _ 8B. 4D, 10
        add     edx, ecx                                ; 0AAF _ 01. CA
        add     eax, edx                                ; 0AB1 _ 01. D0
        mov     edx, eax                                ; 0AB3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AB5 _ 8B. 45, 08
        add     edx, eax                                ; 0AB8 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0ABA _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0ABD _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0AC1 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0AC3 _ 8B. 45, FC
        add     eax, ecx                                ; 0AC6 _ 01. C8
        mov     ecx, eax                                ; 0AC8 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0ACA _ 8B. 45, 20
        add     eax, ecx                                ; 0ACD _ 01. C8
        movzx   eax, byte [eax]                         ; 0ACF _ 0F B6. 00
        mov     byte [edx], al                          ; 0AD2 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0AD4 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0AD8 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0ADB _ 3B. 45, 18
        jl      ?_031                                   ; 0ADE _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0AE0 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0AE4 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0AE7 _ 3B. 45, 1C
        jl      ?_030                                   ; 0AEA _ 7C, A8
        leave                                           ; 0AEC _ C9
        ret                                             ; 0AED _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0AEE _ 55
        mov     ebp, esp                                ; 0AEF _ 89. E5
        sub     esp, 24                                 ; 0AF1 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0AF4 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0AFC _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0B04 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0B0B _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0B10 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0B18 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0B20 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0B27 _ E8, FFFFFFFC(rel)
        leave                                           ; 0B2C _ C9
        ret                                             ; 0B2D _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0B2E _ 55
        mov     ebp, esp                                ; 0B2F _ 89. E5
        sub     esp, 40                                 ; 0B31 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0B34 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0B37 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0B3A _ A1, 00000124(d)
        add     eax, edx                                ; 0B3F _ 01. D0
        mov     dword [mouse_x], eax                    ; 0B41 _ A3, 00000124(d)
        mov     eax, dword [ebp+10H]                    ; 0B46 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0B49 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0B4C _ A1, 00000128(d)
        add     eax, edx                                ; 0B51 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0B53 _ A3, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0B58 _ A1, 00000124(d)
        test    eax, eax                                ; 0B5D _ 85. C0
        jns     ?_034                                   ; 0B5F _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0B61 _ C7. 05, 00000124(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0B6B _ A1, 00000128(d)
        test    eax, eax                                ; 0B70 _ 85. C0
        jns     ?_035                                   ; 0B72 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0B74 _ C7. 05, 00000128(d), 00000000
?_035:  movzx   eax, word [?_139]                       ; 0B7E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B85 _ 98
        lea     edx, [eax-10H]                          ; 0B86 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0B89 _ A1, 00000124(d)
        cmp     edx, eax                                ; 0B8E _ 39. C2
        jge     ?_036                                   ; 0B90 _ 7D, 10
        movzx   eax, word [?_139]                       ; 0B92 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B99 _ 98
        sub     eax, 16                                 ; 0B9A _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0B9D _ A3, 00000124(d)
?_036:  movzx   eax, word [?_139]                       ; 0BA2 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BA9 _ 98
        lea     edx, [eax-10H]                          ; 0BAA _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0BAD _ A1, 00000128(d)
        cmp     edx, eax                                ; 0BB2 _ 39. C2
        jge     ?_037                                   ; 0BB4 _ 7D, 10
        movzx   eax, word [?_139]                       ; 0BB6 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BBD _ 98
        sub     eax, 16                                 ; 0BBE _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0BC1 _ A3, 00000128(d)
?_037:  mov     dword [esp+14H], 7                      ; 0BC6 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_128                  ; 0BCE _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 0BD6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0BDE _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0BE6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BE9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BF0 _ 89. 04 24
        call    paint_string                            ; 0BF3 _ E8, FFFFFFFC(rel)
        leave                                           ; 0BF8 _ C9
        ret                                             ; 0BF9 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0BFA _ 55
        mov     ebp, esp                                ; 0BFB _ 89. E5
        sub     esp, 40                                 ; 0BFD _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0C00 _ C6. 45, F7, 00
        call    io_sti                                  ; 0C04 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0C09 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0C10 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0C15 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C18 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0C1C _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0C20 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0C27 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0C2C _ 85. C0
        jz      ?_038                                   ; 0C2E _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 0C30 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0C38 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C42 _ 89. 04 24
        call    compute_mouse_position                  ; 0C45 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0C4A _ 8B. 15, 00000128(d)
        mov     eax, dword [mouse_x]                    ; 0C50 _ A1, 00000124(d)
        mov     dword [esp+0CH], edx                    ; 0C55 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0C59 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0C5D _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0C60 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C64 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C67 _ 89. 04 24
        call    sheet_slide                             ; 0C6A _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0C6F _ C9
        ret                                             ; 0C70 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 0C71 _ 55
        mov     ebp, esp                                ; 0C72 _ 89. E5
        sub     esp, 88                                 ; 0C74 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 0C77 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0C7E _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 0C85 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 0C8C _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 0C91 _ 89. 45, D4
        movzx   eax, word [?_139]                       ; 0C94 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C9B _ 98
        mov     dword [ebp-28H], eax                    ; 0C9C _ 89. 45, D8
        movzx   eax, word [?_140]                       ; 0C9F _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0CA6 _ 98
        mov     dword [ebp-24H], eax                    ; 0CA7 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 0CAA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0CAD _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 0CAF _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 0CB2 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 0CB6 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 0CB9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CBD _ 89. 04 24
        call    init_desktop                            ; 0CC0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0CC5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_129                  ; 0CCD _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 0CD5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0CD8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0CDC _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0CDF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0CE3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CE6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CEA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CED _ 89. 04 24
        call    paint_string                            ; 0CF0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 0CF5 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 0CF8 _ 89. 04 24
        call    intToHexStr                             ; 0CFB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0D00 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 0D03 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 0D0B _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 0D0E _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0D12 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D15 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0D19 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0D1C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D20 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D23 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D27 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D2A _ 89. 04 24
        call    paint_string                            ; 0D2D _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0D32 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0D36 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_130                  ; 0D3E _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 0D46 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D49 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0D4D _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0D50 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D54 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D57 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D5B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D5E _ 89. 04 24
        call    paint_string                            ; 0D61 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D66 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0D69 _ 8B. 00
        mov     dword [esp], eax                        ; 0D6B _ 89. 04 24
        call    intToHexStr                             ; 0D6E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0D73 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 0D76 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 0D7E _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 0D81 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0D85 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0D88 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0D8C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0D8F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D93 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D96 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D9A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D9D _ 89. 04 24
        call    paint_string                            ; 0DA0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0DA5 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0DA9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_131                  ; 0DB1 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 0DB9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DBC _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0DC0 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0DC3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0DC7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DCA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DCE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DD1 _ 89. 04 24
        call    paint_string                            ; 0DD4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DD9 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0DDC _ 8B. 40, 04
        mov     dword [esp], eax                        ; 0DDF _ 89. 04 24
        call    intToHexStr                             ; 0DE2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0DE7 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 0DEA _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 0DF2 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 0DF5 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0DF9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0DFC _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E00 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E03 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E07 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E0A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E0E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E11 _ 89. 04 24
        call    paint_string                            ; 0E14 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0E19 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0E1D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_132                  ; 0E25 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 0E2D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E30 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0E34 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0E37 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E3B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E3E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E42 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E45 _ 89. 04 24
        call    paint_string                            ; 0E48 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E4D _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0E50 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 0E53 _ 89. 04 24
        call    intToHexStr                             ; 0E56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0E5B _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 0E5E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 0E66 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 0E69 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0E6D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0E70 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E74 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E77 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E7B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E7E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E82 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E85 _ 89. 04 24
        call    paint_string                            ; 0E88 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0E8D _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0E91 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_133                  ; 0E99 _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 0EA1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0EA4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0EA8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0EAB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0EAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EB9 _ 89. 04 24
        call    paint_string                            ; 0EBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EC1 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0EC4 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 0EC7 _ 89. 04 24
        call    intToHexStr                             ; 0ECA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0ECF _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 0ED2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 0EDA _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 0EDD _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0EE1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0EE4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0EE8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0EEB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0EEF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EF9 _ 89. 04 24
        call    paint_string                            ; 0EFC _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0F01 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 0F05 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_134                  ; 0F0D _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 0F15 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F18 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 0F1C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0F1F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F23 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F26 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F2A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F2D _ 89. 04 24
        call    paint_string                            ; 0F30 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F35 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 0F38 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 0F3B _ 89. 04 24
        call    intToHexStr                             ; 0F3E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0F43 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 0F46 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 0F4E _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 0F51 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 0F55 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 0F58 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0F5C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0F5F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0F63 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F66 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F6A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F6D _ 89. 04 24
        call    paint_string                            ; 0F70 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 0F75 _ 83. 45, CC, 10
        leave                                           ; 0F79 _ C9
        ret                                             ; 0F7A _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 0F7B _ 55
        mov     ebp, esp                                ; 0F7C _ 89. E5
        sub     esp, 56                                 ; 0F7E _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 0F81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F84 _ 89. 04 24
        call    sheet_alloc                             ; 0F87 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0F8C _ 89. 45, F0
        mov     eax, dword [memman]                     ; 0F8F _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 0F94 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 0F9C _ 89. 04 24
        call    memman_alloc_4k                         ; 0F9F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0FA4 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 0FA7 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 0FAF _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 0FB7 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 0FBF _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 0FC2 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0FC6 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0FC9 _ 89. 04 24
        call    sheet_setbuf                            ; 0FCC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 0FD1 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 0FD4 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 0FD8 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0FDB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FDF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FE2 _ 89. 04 24
        call    make_windows                            ; 0FE5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0FEA _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_135                  ; 0FF2 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 0FFA _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 1002 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 100A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 100D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1011 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1014 _ 89. 04 24
        call    paint_string                            ; 1017 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 101C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_136                  ; 1024 _ C7. 44 24, 10, 0000006B(d)
        mov     dword [esp+0CH], 44                     ; 102C _ C7. 44 24, 0C, 0000002C
        mov     dword [esp+8H], 24                      ; 1034 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 103C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 103F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1043 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1046 _ 89. 04 24
        call    paint_string                            ; 1049 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 104E _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 1056 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 105E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1061 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1065 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1068 _ 89. 04 24
        call    sheet_slide                             ; 106B _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1070 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1078 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 107B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 107F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1082 _ 89. 04 24
        call    sheet_updown                            ; 1085 _ E8, FFFFFFFC(rel)
        leave                                           ; 108A _ C9
        ret                                             ; 108B _ C3
; message_box End of function

make_windows:; Function begin
        push    ebp                                     ; 108C _ 55
        mov     ebp, esp                                ; 108D _ 89. E5
        push    ebx                                     ; 108F _ 53
        sub     esp, 68                                 ; 1090 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1093 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1096 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1099 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 109C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 109F _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 10A2 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 10A5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 10A8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 10AB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 10AE _ 8B. 00
        mov     dword [esp+18H], 0                      ; 10B0 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 10B8 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 10BC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 10C4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 10CC _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 10D4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 10D7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10DB _ 89. 04 24
        call    paint_rectangle                         ; 10DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 10E3 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 10E6 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 10E9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 10EC _ 8B. 00
        mov     dword [esp+18H], 1                      ; 10EE _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 10F6 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 10FA _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1102 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 110A _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1112 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1115 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1119 _ 89. 04 24
        call    paint_rectangle                         ; 111C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1121 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1124 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1127 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 112A _ 8B. 00
        mov     dword [esp+18H], edx                    ; 112C _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1130 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1138 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1140 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1148 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1150 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1153 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1157 _ 89. 04 24
        call    paint_rectangle                         ; 115A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 115F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1162 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1165 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1168 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 116A _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 116E _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1176 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 117E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1186 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 118E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1191 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1195 _ 89. 04 24
        call    paint_rectangle                         ; 1198 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 119D _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 11A0 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 11A3 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 11A6 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 11A9 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 11AC _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 11AF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11B2 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 11B4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 11B8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 11BC _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 11C4 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 11C8 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 11D0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 11D3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11D7 _ 89. 04 24
        call    paint_rectangle                         ; 11DA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 11DF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 11E2 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 11E5 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 11E8 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 11EB _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 11EE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 11F1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11F4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 11F6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 11FA _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 11FE _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1206 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 120A _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1212 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1215 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1219 _ 89. 04 24
        call    paint_rectangle                         ; 121C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1221 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1224 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1227 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 122A _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 122D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1230 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1232 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1236 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 123A _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1242 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 124A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1252 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1255 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1259 _ 89. 04 24
        call    paint_rectangle                         ; 125C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1261 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1264 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1267 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 126A _ 8B. 00
        mov     dword [esp+18H], 20                     ; 126C _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1274 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1278 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1280 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1288 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1290 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1293 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1297 _ 89. 04 24
        call    paint_rectangle                         ; 129A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 129F _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 12A2 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 12A5 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 12A8 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 12AB _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 12AE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 12B1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12B4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 12B6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 12BA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 12BE _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 12C2 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 12CA _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 12D2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 12D5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12D9 _ 89. 04 24
        call    paint_rectangle                         ; 12DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 12E1 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 12E4 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 12E7 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 12EA _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 12ED _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 12F0 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12F3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12F6 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 12F8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 12FC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1300 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1304 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 130C _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1314 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1317 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 131B _ 89. 04 24
        call    paint_rectangle                         ; 131E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1323 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 132B _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 132E _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1332 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 133A _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1342 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1345 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1349 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 134C _ 89. 04 24
        call    paint_string                            ; 134F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1354 _ C7. 45, EC, 00000000
        jmp     ?_046                                   ; 135B _ E9, 00000083

?_039:  mov     dword [ebp-18H], 0                      ; 1360 _ C7. 45, E8, 00000000
        jmp     ?_045                                   ; 1367 _ EB, 70

?_040:  mov     eax, dword [ebp-14H]                    ; 1369 _ 8B. 45, EC
        shl     eax, 4                                  ; 136C _ C1. E0, 04
        mov     edx, eax                                ; 136F _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1371 _ 8B. 45, E8
        add     eax, edx                                ; 1374 _ 01. D0
        add     eax, closebtn.1742                      ; 1376 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 137B _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 137E _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1381 _ 80. 7D, E7, 40
        jnz     ?_041                                   ; 1385 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1387 _ C6. 45, E7, 00
        jmp     ?_044                                   ; 138B _ EB, 1C

?_041:  cmp     byte [ebp-19H], 36                      ; 138D _ 80. 7D, E7, 24
        jnz     ?_042                                   ; 1391 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1393 _ C6. 45, E7, 0F
        jmp     ?_044                                   ; 1397 _ EB, 10

?_042:  cmp     byte [ebp-19H], 81                      ; 1399 _ 80. 7D, E7, 51
        jnz     ?_043                                   ; 139D _ 75, 06
        mov     byte [ebp-19H], 8                       ; 139F _ C6. 45, E7, 08
        jmp     ?_044                                   ; 13A3 _ EB, 04

?_043:  mov     byte [ebp-19H], 7                       ; 13A5 _ C6. 45, E7, 07
?_044:  mov     eax, dword [ebp+0CH]                    ; 13A9 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 13AC _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 13AE _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 13B1 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 13B4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 13B7 _ 8B. 40, 04
        imul    ecx, eax                                ; 13BA _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 13BD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 13C0 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 13C3 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 13C6 _ 8B. 45, E8
        add     eax, ebx                                ; 13C9 _ 01. D8
        add     eax, ecx                                ; 13CB _ 01. C8
        add     edx, eax                                ; 13CD _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 13CF _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 13D3 _ 88. 02
        add     dword [ebp-18H], 1                      ; 13D5 _ 83. 45, E8, 01
?_045:  cmp     dword [ebp-18H], 15                     ; 13D9 _ 83. 7D, E8, 0F
        jle     ?_040                                   ; 13DD _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 13DF _ 83. 45, EC, 01
?_046:  cmp     dword [ebp-14H], 13                     ; 13E3 _ 83. 7D, EC, 0D
        jle     ?_039                                   ; 13E7 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 13ED _ 83. C4, 44
        pop     ebx                                     ; 13F0 _ 5B
        pop     ebp                                     ; 13F1 _ 5D
        ret                                             ; 13F2 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 13F3 _ 55
        mov     ebp, esp                                ; 13F4 _ 89. E5
        sub     esp, 24                                 ; 13F6 _ 83. EC, 18
?_047:  mov     dword [esp], 100                        ; 13F9 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1400 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1405 _ 83. E0, 02
        test    eax, eax                                ; 1408 _ 85. C0
        jnz     ?_048                                   ; 140A _ 75, 02
        jmp     ?_049                                   ; 140C _ EB, 02

?_048:  jmp     ?_047                                   ; 140E _ EB, E9

?_049:  leave                                           ; 1410 _ C9
        ret                                             ; 1411 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1412 _ 55
        mov     ebp, esp                                ; 1413 _ 89. E5
        sub     esp, 24                                 ; 1415 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1418 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 141D _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1425 _ C7. 04 24, 00000064
        call    io_out8                                 ; 142C _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1431 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1436 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 143E _ C7. 04 24, 00000060
        call    io_out8                                 ; 1445 _ E8, FFFFFFFC(rel)
        leave                                           ; 144A _ C9
        ret                                             ; 144B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 144C _ 55
        mov     ebp, esp                                ; 144D _ 89. E5
        sub     esp, 24                                 ; 144F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1452 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1457 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 145F _ C7. 04 24, 00000064
        call    io_out8                                 ; 1466 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 146B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1470 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1478 _ C7. 04 24, 00000060
        call    io_out8                                 ; 147F _ E8, FFFFFFFC(rel)
        leave                                           ; 1484 _ C9
        ret                                             ; 1485 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1486 _ 55
        mov     ebp, esp                                ; 1487 _ 89. E5
        sub     esp, 4                                  ; 1489 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 148C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 148F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1492 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1495 _ 0F B6. 40, 03
        test    al, al                                  ; 1499 _ 84. C0
        jnz     ?_051                                   ; 149B _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 149D _ 80. 7D, FC, FA
        jnz     ?_050                                   ; 14A1 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 14A3 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 14A6 _ C6. 40, 03, 01
?_050:  mov     eax, 0                                  ; 14AA _ B8, 00000000
        jmp     ?_058                                   ; 14AF _ E9, 0000010F

?_051:  mov     eax, dword [ebp+8H]                     ; 14B4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 14B7 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 14BB _ 3C, 01
        jnz     ?_053                                   ; 14BD _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 14BF _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 14C3 _ 25, 000000C8
        cmp     eax, 8                                  ; 14C8 _ 83. F8, 08
        jnz     ?_052                                   ; 14CB _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 14CD _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 14D0 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 14D4 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 14D6 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 14D9 _ C6. 40, 03, 02
?_052:  mov     eax, 0                                  ; 14DD _ B8, 00000000
        jmp     ?_058                                   ; 14E2 _ E9, 000000DC

?_053:  mov     eax, dword [ebp+8H]                     ; 14E7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 14EA _ 0F B6. 40, 03
        cmp     al, 2                                   ; 14EE _ 3C, 02
        jnz     ?_054                                   ; 14F0 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 14F2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 14F5 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 14F9 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 14FF _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1503 _ B8, 00000000
        jmp     ?_058                                   ; 1508 _ E9, 000000B6

?_054:  mov     eax, dword [ebp+8H]                     ; 150D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1510 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1514 _ 3C, 03
        jne     ?_057                                   ; 1516 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 151C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 151F _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1523 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1526 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1529 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 152D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1530 _ 0F B6. 00
        movzx   eax, al                                 ; 1533 _ 0F B6. C0
        and     eax, 07H                                ; 1536 _ 83. E0, 07
        mov     edx, eax                                ; 1539 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 153B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 153E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1541 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1544 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1548 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 154B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 154E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1551 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1554 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1558 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 155B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 155E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1561 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1564 _ 0F B6. 00
        movzx   eax, al                                 ; 1567 _ 0F B6. C0
        and     eax, 10H                                ; 156A _ 83. E0, 10
        test    eax, eax                                ; 156D _ 85. C0
        jz      ?_055                                   ; 156F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1571 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1574 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1577 _ 0D, FFFFFF00
        mov     edx, eax                                ; 157C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 157E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1581 _ 89. 50, 04
?_055:  mov     eax, dword [ebp+8H]                     ; 1584 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1587 _ 0F B6. 00
        movzx   eax, al                                 ; 158A _ 0F B6. C0
        and     eax, 20H                                ; 158D _ 83. E0, 20
        test    eax, eax                                ; 1590 _ 85. C0
        jz      ?_056                                   ; 1592 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1594 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1597 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 159A _ 0D, FFFFFF00
        mov     edx, eax                                ; 159F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15A1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15A4 _ 89. 50, 08
?_056:  mov     eax, dword [ebp+8H]                     ; 15A7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15AA _ 8B. 40, 08
        neg     eax                                     ; 15AD _ F7. D8
        mov     edx, eax                                ; 15AF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15B1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15B4 _ 89. 50, 08
        mov     eax, 1                                  ; 15B7 _ B8, 00000001
        jmp     ?_058                                   ; 15BC _ EB, 05

?_057:  mov     eax, 4294967295                         ; 15BE _ B8, FFFFFFFF
?_058:  leave                                           ; 15C3 _ C9
        ret                                             ; 15C4 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 15C5 _ 55
        mov     ebp, esp                                ; 15C6 _ 89. E5
        sub     esp, 40                                 ; 15C8 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 15CB _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 15D3 _ C7. 04 24, 00000020
        call    io_out8                                 ; 15DA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 15DF _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 15E7 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 15EE _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 15F3 _ C7. 04 24, 00000060
        call    io_in8                                  ; 15FA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 15FF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1602 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1606 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 160A _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1611 _ E8, FFFFFFFC(rel)
        leave                                           ; 1616 _ C9
        ret                                             ; 1617 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1618 _ 55
        mov     ebp, esp                                ; 1619 _ 89. E5
        sub     esp, 40                                 ; 161B _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 161E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1626 _ C7. 04 24, 00000020
        call    io_out8                                 ; 162D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1632 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 163A _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1641 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1646 _ C7. 04 24, 00000060
        call    io_in8                                  ; 164D _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1652 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1655 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1659 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 165D _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1664 _ E8, FFFFFFFC(rel)
        leave                                           ; 1669 _ C9
        ret                                             ; 166A _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 166B _ 55
        mov     ebp, esp                                ; 166C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 166E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1671 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1674 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1676 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1679 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1680 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1683 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 168A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 168D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1690 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1693 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1696 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1699 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 169C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 169F _ C7. 40, 14, 00000000
        pop     ebp                                     ; 16A6 _ 5D
        ret                                             ; 16A7 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 16A8 _ 55
        mov     ebp, esp                                ; 16A9 _ 89. E5
        sub     esp, 20                                 ; 16AB _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 16AE _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 16B1 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 16B4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 16B7 _ 8B. 40, 10
        test    eax, eax                                ; 16BA _ 85. C0
        jnz     ?_059                                   ; 16BC _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 16BE _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 16C1 _ 8B. 40, 14
        or      eax, 01H                                ; 16C4 _ 83. C8, 01
        mov     edx, eax                                ; 16C7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16C9 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 16CC _ 89. 50, 14
        mov     eax, 4294967295                         ; 16CF _ B8, FFFFFFFF
        jmp     ?_061                                   ; 16D4 _ EB, 56

?_059:  mov     eax, dword [ebp+8H]                     ; 16D6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 16D9 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 16DC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 16DF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 16E2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 16E4 _ 8B. 45, FC
        add     edx, eax                                ; 16E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 16E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 16ED _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 16EF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 16F2 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 16F5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 16F8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 16FB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16FE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1701 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1704 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1707 _ 8B. 40, 0C
        cmp     edx, eax                                ; 170A _ 39. C2
        jnz     ?_060                                   ; 170C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 170E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1711 _ C7. 40, 04, 00000000
?_060:  mov     eax, dword [ebp+8H]                     ; 1718 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 171B _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 171E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1721 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1724 _ 89. 50, 10
        mov     eax, 0                                  ; 1727 _ B8, 00000000
?_061:  leave                                           ; 172C _ C9
        ret                                             ; 172D _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 172E _ 55
        mov     ebp, esp                                ; 172F _ 89. E5
        sub     esp, 16                                 ; 1731 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1734 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1737 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 173A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 173D _ 8B. 40, 0C
        cmp     edx, eax                                ; 1740 _ 39. C2
        jnz     ?_062                                   ; 1742 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1744 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1747 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 174E _ B8, FFFFFFFF
        jmp     ?_064                                   ; 1753 _ EB, 57

?_062:  mov     eax, dword [ebp+8H]                     ; 1755 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1758 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 175B _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 175E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1761 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1763 _ 8B. 45, F8
        add     eax, edx                                ; 1766 _ 01. D0
        movzx   eax, byte [eax]                         ; 1768 _ 0F B6. 00
        movzx   eax, al                                 ; 176B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 176E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1771 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1774 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1777 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 177D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1780 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1783 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1786 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1789 _ 8B. 40, 0C
        cmp     edx, eax                                ; 178C _ 39. C2
        jnz     ?_063                                   ; 178E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1790 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1793 _ C7. 40, 08, 00000000
?_063:  mov     eax, dword [ebp+8H]                     ; 179A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 179D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 17A0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17A3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 17A6 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 17A9 _ 8B. 45, FC
?_064:  leave                                           ; 17AC _ C9
        ret                                             ; 17AD _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 17AE _ 55
        mov     ebp, esp                                ; 17AF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 17B1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 17B4 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 17B7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 17BA _ 8B. 40, 10
        sub     edx, eax                                ; 17BD _ 29. C2
        mov     eax, edx                                ; 17BF _ 89. D0
        pop     ebp                                     ; 17C1 _ 5D
        ret                                             ; 17C2 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 17C3 _ 55
        mov     ebp, esp                                ; 17C4 _ 89. E5
        sub     esp, 4                                  ; 17C6 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 17C9 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 17CC _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 17CF _ 80. 7D, FC, 09
        jle     ?_065                                   ; 17D3 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 17D5 _ 0F B6. 45, FC
        add     eax, 55                                 ; 17D9 _ 83. C0, 37
        jmp     ?_066                                   ; 17DC _ EB, 07

?_065:  movzx   eax, byte [ebp-4H]                      ; 17DE _ 0F B6. 45, FC
        add     eax, 48                                 ; 17E2 _ 83. C0, 30
?_066:  leave                                           ; 17E5 _ C9
        ret                                             ; 17E6 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 17E7 _ 55
        mov     ebp, esp                                ; 17E8 _ 89. E5
        sub     esp, 24                                 ; 17EA _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 17ED _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 17F0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 17F3 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 17FA _ 0F B6. 45, EC
        and     eax, 0FH                                ; 17FE _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1801 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1804 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1808 _ 89. 04 24
        call    charToHexVal                            ; 180B _ E8, FFFFFFFC(rel)
        mov     byte [?_138], al                        ; 1810 _ A2, 00000243(d)
        movzx   eax, byte [ebp-14H]                     ; 1815 _ 0F B6. 45, EC
        shr     al, 4                                   ; 1819 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 181C _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 181F _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1823 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1826 _ 89. 04 24
        call    charToHexVal                            ; 1829 _ E8, FFFFFFFC(rel)
        mov     byte [?_137], al                        ; 182E _ A2, 00000242(d)
        mov     eax, keyval                             ; 1833 _ B8, 00000240(d)
        leave                                           ; 1838 _ C9
        ret                                             ; 1839 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 183A _ 55
        mov     ebp, esp                                ; 183B _ 89. E5
        sub     esp, 16                                 ; 183D _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1840 _ C6. 05, 00000220(d), 30
        mov     byte [?_141], 88                        ; 1847 _ C6. 05, 00000221(d), 58
        mov     byte [?_142], 0                         ; 184E _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1855 _ C7. 45, F4, 00000002
        jmp     ?_068                                   ; 185C _ EB, 0F

?_067:  mov     eax, dword [ebp-0CH]                    ; 185E _ 8B. 45, F4
        add     eax, str.1386                           ; 1861 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 1866 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1869 _ 83. 45, F4, 01
?_068:  cmp     dword [ebp-0CH], 9                      ; 186D _ 83. 7D, F4, 09
        jle     ?_067                                   ; 1871 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1873 _ C7. 45, F8, 00000009
        jmp     ?_072                                   ; 187A _ EB, 40

?_069:  mov     eax, dword [ebp+8H]                     ; 187C _ 8B. 45, 08
        and     eax, 0FH                                ; 187F _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1882 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1885 _ 8B. 45, 08
        shr     eax, 4                                  ; 1888 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 188B _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 188E _ 83. 7D, FC, 09
        jle     ?_070                                   ; 1892 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1894 _ 8B. 45, FC
        add     eax, 55                                 ; 1897 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 189A _ 8B. 55, F8
        add     edx, str.1386                           ; 189D _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 18A3 _ 88. 02
        jmp     ?_071                                   ; 18A5 _ EB, 11

?_070:  mov     eax, dword [ebp-4H]                     ; 18A7 _ 8B. 45, FC
        add     eax, 48                                 ; 18AA _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 18AD _ 8B. 55, F8
        add     edx, str.1386                           ; 18B0 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 18B6 _ 88. 02
?_071:  sub     dword [ebp-8H], 1                       ; 18B8 _ 83. 6D, F8, 01
?_072:  cmp     dword [ebp-8H], 1                       ; 18BC _ 83. 7D, F8, 01
        jle     ?_073                                   ; 18C0 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 18C2 _ 83. 7D, 08, 00
        jnz     ?_069                                   ; 18C6 _ 75, B4
?_073:  mov     eax, str.1386                           ; 18C8 _ B8, 00000220(d)
        leave                                           ; 18CD _ C9
        ret                                             ; 18CE _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 18CF _ 55
        mov     ebp, esp                                ; 18D0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 18D2 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 18D5 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 18DB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 18DE _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 18E5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 18E8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 18EF _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 18F2 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 18F9 _ 5D
        ret                                             ; 18FA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 18FB _ 55
        mov     ebp, esp                                ; 18FC _ 89. E5
        sub     esp, 16                                 ; 18FE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1901 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1908 _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 190F _ EB, 14

?_074:  mov     eax, dword [ebp+8H]                     ; 1911 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1914 _ 8B. 55, F8
        add     edx, 2                                  ; 1917 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 191A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 191E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1921 _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 1925 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1928 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 192A _ 3B. 45, F8
        ja      ?_074                                   ; 192D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 192F _ 8B. 45, FC
        leave                                           ; 1932 _ C9
        ret                                             ; 1933 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1934 _ 55
        mov     ebp, esp                                ; 1935 _ 89. E5
        sub     esp, 16                                 ; 1937 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 193A _ C7. 45, F8, 00000000
        jmp     ?_079                                   ; 1941 _ E9, 00000085

?_076:  mov     eax, dword [ebp+8H]                     ; 1946 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1949 _ 8B. 55, F8
        add     edx, 2                                  ; 194C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 194F _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1953 _ 3B. 45, 0C
        jc      ?_078                                   ; 1956 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1958 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 195B _ 8B. 55, F8
        add     edx, 2                                  ; 195E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1961 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1964 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1967 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 196A _ 8B. 55, F8
        add     edx, 2                                  ; 196D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1970 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1973 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1976 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1979 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 197C _ 8B. 55, F8
        add     edx, 2                                  ; 197F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1982 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1985 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1988 _ 8B. 55, F8
        add     edx, 2                                  ; 198B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 198E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1992 _ 2B. 45, 0C
        mov     edx, eax                                ; 1995 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1997 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 199A _ 8B. 4D, F8
        add     ecx, 2                                  ; 199D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 19A0 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 19A4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19A7 _ 8B. 55, F8
        add     edx, 2                                  ; 19AA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 19AD _ 8B. 44 D0, 04
        test    eax, eax                                ; 19B1 _ 85. C0
        jnz     ?_077                                   ; 19B3 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 19B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19B8 _ 8B. 00
        lea     edx, [eax-1H]                           ; 19BA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19BD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 19C0 _ 89. 10
?_077:  mov     eax, dword [ebp-4H]                     ; 19C2 _ 8B. 45, FC
        jmp     ?_080                                   ; 19C5 _ EB, 17

?_078:  add     dword [ebp-8H], 1                       ; 19C7 _ 83. 45, F8, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 19CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19CE _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 19D0 _ 3B. 45, F8
        ja      ?_076                                   ; 19D3 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 19D9 _ B8, 00000000
?_080:  leave                                           ; 19DE _ C9
        ret                                             ; 19DF _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 19E0 _ 55
        mov     ebp, esp                                ; 19E1 _ 89. E5
        push    ebx                                     ; 19E3 _ 53
        sub     esp, 16                                 ; 19E4 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 19E7 _ C7. 45, F4, 00000000
        jmp     ?_083                                   ; 19EE _ EB, 17

?_081:  mov     eax, dword [ebp+8H]                     ; 19F0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 19F3 _ 8B. 55, F4
        add     edx, 2                                  ; 19F6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 19F9 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 19FC _ 3B. 45, 0C
        jbe     ?_082                                   ; 19FF _ 76, 02
        jmp     ?_084                                   ; 1A01 _ EB, 0E

?_082:  add     dword [ebp-0CH], 1                      ; 1A03 _ 83. 45, F4, 01
?_083:  mov     eax, dword [ebp+8H]                     ; 1A07 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A0A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1A0C _ 3B. 45, F4
        jg      ?_081                                   ; 1A0F _ 7F, DF
?_084:  cmp     dword [ebp-0CH], 0                      ; 1A11 _ 83. 7D, F4, 00
        jle     ?_086                                   ; 1A15 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1A1B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A1E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A21 _ 8B. 45, 08
        add     edx, 2                                  ; 1A24 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1A27 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1A2A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1A2D _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1A30 _ 8B. 45, 08
        add     ecx, 2                                  ; 1A33 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1A36 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1A3A _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1A3C _ 3B. 45, 0C
        jne     ?_086                                   ; 1A3F _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1A45 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A48 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1A4B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A4E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A51 _ 8B. 45, 08
        add     edx, 2                                  ; 1A54 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A57 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1A5B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A5E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A61 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1A64 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A67 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A6B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A6E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1A70 _ 3B. 45, F4
        jle     ?_085                                   ; 1A73 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1A75 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1A78 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1A7B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A7E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A81 _ 8B. 55, F4
        add     edx, 2                                  ; 1A84 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A87 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1A8A _ 39. C1
        jnz     ?_085                                   ; 1A8C _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1A8E _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A91 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1A94 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A97 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A9A _ 8B. 45, 08
        add     edx, 2                                  ; 1A9D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1AA0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1AA4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1AA7 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1AAA _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1AAD _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1AB1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AB4 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1AB7 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1ABA _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1ABE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AC1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1AC3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AC6 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1AC9 _ 89. 10
?_085:  mov     eax, 0                                  ; 1ACB _ B8, 00000000
        jmp     ?_092                                   ; 1AD0 _ E9, 0000011C

?_086:  mov     eax, dword [ebp+8H]                     ; 1AD5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AD8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1ADA _ 3B. 45, F4
        jle     ?_087                                   ; 1ADD _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1ADF _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1AE2 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1AE5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AE8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AEB _ 8B. 55, F4
        add     edx, 2                                  ; 1AEE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1AF1 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1AF4 _ 39. C1
        jnz     ?_087                                   ; 1AF6 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1AF8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AFB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1AFE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1B01 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1B04 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1B07 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B0A _ 8B. 55, F4
        add     edx, 2                                  ; 1B0D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1B10 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1B14 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1B17 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B1A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B1D _ 8B. 55, F4
        add     edx, 2                                  ; 1B20 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1B23 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1B27 _ B8, 00000000
        jmp     ?_092                                   ; 1B2C _ E9, 000000C0

?_087:  mov     eax, dword [ebp+8H]                     ; 1B31 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B34 _ 8B. 00
        cmp     eax, 4095                               ; 1B36 _ 3D, 00000FFF
        jg      ?_091                                   ; 1B3B _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1B41 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B44 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1B46 _ 89. 45, F8
        jmp     ?_089                                   ; 1B49 _ EB, 28

?_088:  mov     eax, dword [ebp-8H]                     ; 1B4B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1B4E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1B51 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1B54 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1B57 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1B5A _ 8B. 45, 08
        add     edx, 2                                  ; 1B5D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1B60 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1B63 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1B65 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1B68 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1B6B _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1B6F _ 83. 6D, F8, 01
?_089:  mov     eax, dword [ebp-8H]                     ; 1B73 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1B76 _ 3B. 45, F4
        jg      ?_088                                   ; 1B79 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1B7B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B7E _ 8B. 00
        lea     edx, [eax+1H]                           ; 1B80 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B83 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1B86 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1B88 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B8B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B8E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B91 _ 8B. 00
        cmp     edx, eax                                ; 1B93 _ 39. C2
        jge     ?_090                                   ; 1B95 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1B97 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1B9A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1B9C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1B9F _ 89. 50, 04
?_090:  mov     eax, dword [ebp+8H]                     ; 1BA2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BA5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1BA8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1BAB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1BAE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1BB1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BB4 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1BB7 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1BBA _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1BBD _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1BC1 _ B8, 00000000
        jmp     ?_092                                   ; 1BC6 _ EB, 29

?_091:  mov     eax, dword [ebp+8H]                     ; 1BC8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BCB _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1BCE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BD1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1BD4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1BD7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1BDA _ 8B. 40, 08
        mov     edx, eax                                ; 1BDD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1BDF _ 8B. 45, 10
        add     eax, edx                                ; 1BE2 _ 01. D0
        mov     edx, eax                                ; 1BE4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1BE6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1BE9 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1BEC _ B8, FFFFFFFF
?_092:  add     esp, 16                                 ; 1BF1 _ 83. C4, 10
        pop     ebx                                     ; 1BF4 _ 5B
        pop     ebp                                     ; 1BF5 _ 5D
        ret                                             ; 1BF6 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1BF7 _ 55
        mov     ebp, esp                                ; 1BF8 _ 89. E5
        sub     esp, 24                                 ; 1BFA _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1BFD _ 8B. 45, 0C
        add     eax, 4095                               ; 1C00 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C05 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1C0A _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C0D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C17 _ 89. 04 24
        call    memman_alloc                            ; 1C1A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1C1F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1C22 _ 8B. 45, FC
        leave                                           ; 1C25 _ C9
        ret                                             ; 1C26 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1C27 _ 55
        mov     ebp, esp                                ; 1C28 _ 89. E5
        sub     esp, 28                                 ; 1C2A _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1C2D _ 8B. 45, 10
        add     eax, 4095                               ; 1C30 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C35 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1C3A _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1C3D _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1C40 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1C44 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C47 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C4B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C4E _ 89. 04 24
        call    memman_free                             ; 1C51 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1C56 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1C59 _ 8B. 45, FC
        leave                                           ; 1C5C _ C9
        ret                                             ; 1C5D _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 1C5E _ 55
        mov     ebp, esp                                ; 1C5F _ 89. E5
        sub     esp, 40                                 ; 1C61 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 1C64 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 1C6C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C6F _ 89. 04 24
        call    memman_alloc_4k                         ; 1C72 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1C77 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1C7A _ 83. 7D, F4, 00
        jnz     ?_093                                   ; 1C7E _ 75, 07
        mov     eax, 0                                  ; 1C80 _ B8, 00000000
        jmp     ?_096                                   ; 1C85 _ EB, 54

?_093:  mov     eax, dword [ebp-0CH]                    ; 1C87 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1C8A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1C8D _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1C8F _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1C92 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1C95 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1C98 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1C9B _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1C9E _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1CA1 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1CA4 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1CAB _ C7. 45, F0, 00000000
        jmp     ?_095                                   ; 1CB2 _ EB, 1B

?_094:  mov     eax, dword [ebp-0CH]                    ; 1CB4 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1CB7 _ 8B. 55, F0
        add     edx, 33                                 ; 1CBA _ 83. C2, 21
        shl     edx, 5                                  ; 1CBD _ C1. E2, 05
        add     eax, edx                                ; 1CC0 _ 01. D0
        add     eax, 12                                 ; 1CC2 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1CC5 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1CCB _ 83. 45, F0, 01
?_095:  cmp     dword [ebp-10H], 255                    ; 1CCF _ 81. 7D, F0, 000000FF
        jle     ?_094                                   ; 1CD6 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 1CD8 _ 8B. 45, F4
?_096:  leave                                           ; 1CDB _ C9
        ret                                             ; 1CDC _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1CDD _ 55
        mov     ebp, esp                                ; 1CDE _ 89. E5
        sub     esp, 16                                 ; 1CE0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1CE3 _ C7. 45, F8, 00000000
        jmp     ?_099                                   ; 1CEA _ EB, 57

?_097:  mov     eax, dword [ebp+8H]                     ; 1CEC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CEF _ 8B. 55, F8
        add     edx, 33                                 ; 1CF2 _ 83. C2, 21
        shl     edx, 5                                  ; 1CF5 _ C1. E2, 05
        add     eax, edx                                ; 1CF8 _ 01. D0
        add     eax, 12                                 ; 1CFA _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1CFD _ 8B. 00
        test    eax, eax                                ; 1CFF _ 85. C0
        jnz     ?_098                                   ; 1D01 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1D03 _ 8B. 45, F8
        shl     eax, 5                                  ; 1D06 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1D09 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1D0F _ 8B. 45, 08
        add     eax, edx                                ; 1D12 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1D14 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1D17 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D1A _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1D1D _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1D20 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1D23 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1D26 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1D29 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1D30 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1D33 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1D3A _ 8B. 45, FC
        jmp     ?_100                                   ; 1D3D _ EB, 12

?_098:  add     dword [ebp-8H], 1                       ; 1D3F _ 83. 45, F8, 01
?_099:  cmp     dword [ebp-8H], 255                     ; 1D43 _ 81. 7D, F8, 000000FF
        jle     ?_097                                   ; 1D4A _ 7E, A0
        mov     eax, 0                                  ; 1D4C _ B8, 00000000
?_100:  leave                                           ; 1D51 _ C9
        ret                                             ; 1D52 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1D53 _ 55
        mov     ebp, esp                                ; 1D54 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1D56 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1D59 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1D5C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1D5E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D61 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1D64 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D67 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1D6A _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1D6D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1D70 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1D73 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1D76 _ 89. 50, 14
        pop     ebp                                     ; 1D79 _ 5D
        ret                                             ; 1D7A _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1D7B _ 55
        mov     ebp, esp                                ; 1D7C _ 89. E5
        push    ebx                                     ; 1D7E _ 53
        sub     esp, 52                                 ; 1D7F _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 1D82 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D85 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1D88 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1D8B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1D8E _ 8B. 40, 0C
        add     eax, 1                                  ; 1D91 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 1D94 _ 3B. 45, 10
        jge     ?_101                                   ; 1D97 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 1D99 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1D9C _ 8B. 40, 0C
        add     eax, 1                                  ; 1D9F _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1DA2 _ 89. 45, 10
?_101:  cmp     dword [ebp+10H], -1                     ; 1DA5 _ 83. 7D, 10, FF
        jge     ?_102                                   ; 1DA9 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1DAB _ C7. 45, 10, FFFFFFFF
?_102:  mov     eax, dword [ebp+0CH]                    ; 1DB2 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1DB5 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1DB8 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1DBB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1DBE _ 3B. 45, 10
        jle     ?_110                                   ; 1DC1 _ 0F 8E, 00000100
        cmp     dword [ebp+10H], 0                      ; 1DC7 _ 83. 7D, 10, 00
        js      ?_105                                   ; 1DCB _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1DCD _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1DD0 _ 89. 45, F0
        jmp     ?_104                                   ; 1DD3 _ EB, 31

?_103:  mov     eax, dword [ebp-10H]                    ; 1DD5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1DD8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DDB _ 8B. 45, 08
        add     edx, 4                                  ; 1DDE _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1DE1 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1DE4 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1DE7 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1DEA _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1DED _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1DF0 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1DF3 _ 8B. 55, F0
        add     edx, 4                                  ; 1DF6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1DF9 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1DFC _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1DFF _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1E02 _ 83. 6D, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1E06 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1E09 _ 3B. 45, 10
        jg      ?_103                                   ; 1E0C _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1E0E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1E11 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1E14 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1E17 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1E1A _ 89. 14 88
        jmp     ?_109                                   ; 1E1D _ EB, 5E

?_105:  mov     eax, dword [ebp+8H]                     ; 1E1F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E22 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 1E25 _ 3B. 45, F4
        jle     ?_108                                   ; 1E28 _ 7E, 44
        mov     eax, dword [ebp-0CH]                    ; 1E2A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1E2D _ 89. 45, F0
        jmp     ?_107                                   ; 1E30 _ EB, 31

?_106:  mov     eax, dword [ebp-10H]                    ; 1E32 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1E35 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E38 _ 8B. 45, 08
        add     edx, 4                                  ; 1E3B _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1E3E _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1E41 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1E44 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1E47 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1E4A _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1E4D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1E50 _ 8B. 55, F0
        add     edx, 4                                  ; 1E53 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1E56 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1E59 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1E5C _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1E5F _ 83. 45, F0, 01
?_107:  mov     eax, dword [ebp+8H]                     ; 1E63 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E66 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 1E69 _ 3B. 45, F0
        jg      ?_106                                   ; 1E6C _ 7F, C4
?_108:  mov     eax, dword [ebp+8H]                     ; 1E6E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E71 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1E74 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E77 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1E7A _ 89. 50, 0C
?_109:  mov     eax, dword [ebp+0CH]                    ; 1E7D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E80 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E83 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1E86 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1E89 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1E8C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1E8F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E92 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E95 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1E98 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1E9B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E9E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EA1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1EA4 _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1EA7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1EAB _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1EAF _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1EB3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1EB7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1EBA _ 89. 04 24
        call    sheet_refresh_local                     ; 1EBD _ E8, FFFFFFFC(rel)
        jmp     ?_117                                   ; 1EC2 _ E9, 00000111

?_110:  mov     eax, dword [ebp-0CH]                    ; 1EC7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1ECA _ 3B. 45, 10
        jge     ?_117                                   ; 1ECD _ 0F 8D, 00000105
        cmp     dword [ebp-0CH], 0                      ; 1ED3 _ 83. 7D, F4, 00
        js      ?_113                                   ; 1ED7 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1ED9 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1EDC _ 89. 45, F0
        jmp     ?_112                                   ; 1EDF _ EB, 31

?_111:  mov     eax, dword [ebp-10H]                    ; 1EE1 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1EE4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EE7 _ 8B. 45, 08
        add     edx, 4                                  ; 1EEA _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1EED _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1EF0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1EF3 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1EF6 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1EF9 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1EFC _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1EFF _ 8B. 55, F0
        add     edx, 4                                  ; 1F02 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1F05 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1F08 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1F0B _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1F0E _ 83. 45, F0, 01
?_112:  mov     eax, dword [ebp-10H]                    ; 1F12 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F15 _ 3B. 45, 10
        jl      ?_111                                   ; 1F18 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1F1A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F1D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1F20 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1F23 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1F26 _ 89. 14 88
        jmp     ?_116                                   ; 1F29 _ EB, 68

?_113:  mov     eax, dword [ebp+8H]                     ; 1F2B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F2E _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1F31 _ 89. 45, F0
        jmp     ?_115                                   ; 1F34 _ EB, 37

?_114:  mov     eax, dword [ebp-10H]                    ; 1F36 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1F39 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1F3C _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1F3F _ 8B. 55, F0
        add     edx, 4                                  ; 1F42 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1F45 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1F48 _ 8B. 45, 08
        add     ecx, 4                                  ; 1F4B _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1F4E _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1F51 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1F54 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F57 _ 8B. 45, 08
        add     edx, 4                                  ; 1F5A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1F5D _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1F60 _ 8B. 55, F0
        add     edx, 1                                  ; 1F63 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1F66 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1F69 _ 83. 6D, F0, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 1F6D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F70 _ 3B. 45, 10
        jge     ?_114                                   ; 1F73 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1F75 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F78 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1F7B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1F7E _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1F81 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1F84 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F87 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1F8A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F8D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F90 _ 89. 50, 0C
?_116:  mov     eax, dword [ebp+0CH]                    ; 1F93 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F96 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F99 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1F9C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1F9F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1FA2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1FA5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1FA8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1FAB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1FAE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1FB1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1FB4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1FB7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1FBA _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1FBD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1FC1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1FC5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1FC9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FCD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FD0 _ 89. 04 24
        call    sheet_refresh_local                     ; 1FD3 _ E8, FFFFFFFC(rel)
?_117:  add     esp, 52                                 ; 1FD8 _ 83. C4, 34
        pop     ebx                                     ; 1FDB _ 5B
        pop     ebp                                     ; 1FDC _ 5D
        ret                                             ; 1FDD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1FDE _ 55
        mov     ebp, esp                                ; 1FDF _ 89. E5
        push    esi                                     ; 1FE1 _ 56
        push    ebx                                     ; 1FE2 _ 53
        sub     esp, 32                                 ; 1FE3 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1FE6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1FE9 _ 8B. 40, 18
        test    eax, eax                                ; 1FEC _ 85. C0
        js      ?_118                                   ; 1FEE _ 78, 49
        mov     eax, dword [ebp+0CH]                    ; 1FF0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1FF3 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1FF6 _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1FF9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1FFC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1FFF _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 2002 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 2005 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2008 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 200B _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 200E _ 8B. 45, 14
        add     edx, eax                                ; 2011 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2013 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 2016 _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 2019 _ 8B. 45, 10
        add     eax, esi                                ; 201C _ 01. F0
        mov     dword [esp+10H], ebx                    ; 201E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2022 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2026 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 202A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 202E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2031 _ 89. 04 24
        call    sheet_refresh_local                     ; 2034 _ E8, FFFFFFFC(rel)
?_118:  mov     eax, 0                                  ; 2039 _ B8, 00000000
        add     esp, 32                                 ; 203E _ 83. C4, 20
        pop     ebx                                     ; 2041 _ 5B
        pop     esi                                     ; 2042 _ 5E
        pop     ebp                                     ; 2043 _ 5D
        ret                                             ; 2044 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2045 _ 55
        mov     ebp, esp                                ; 2046 _ 89. E5
        sub     esp, 56                                 ; 2048 _ 83. EC, 38
        mov     eax, dword [ebp+0CH]                    ; 204B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 204E _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2051 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2054 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2057 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 205A _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 205D _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2060 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2063 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2066 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2069 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 206C _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 206F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2072 _ 8B. 40, 18
        test    eax, eax                                ; 2075 _ 85. C0
        js      ?_119                                   ; 2077 _ 78, 6E
        mov     eax, dword [ebp+0CH]                    ; 2079 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 207C _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 207F _ 8B. 45, F4
        add     edx, eax                                ; 2082 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2084 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2087 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 208A _ 8B. 45, F0
        add     eax, ecx                                ; 208D _ 01. C8
        mov     dword [esp+10H], edx                    ; 208F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2093 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2097 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 209A _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 209E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 20A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20A8 _ 89. 04 24
        call    sheet_refresh_local                     ; 20AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 20B0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 20B3 _ 8B. 50, 08
        mov     eax, dword [ebp+10H]                    ; 20B6 _ 8B. 45, 10
        add     edx, eax                                ; 20B9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 20BB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 20BE _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 20C1 _ 8B. 45, 10
        add     eax, ecx                                ; 20C4 _ 01. C8
        mov     dword [esp+10H], edx                    ; 20C6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 20CA _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 20CE _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 20D1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 20D5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 20D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20DF _ 89. 04 24
        call    sheet_refresh_local                     ; 20E2 _ E8, FFFFFFFC(rel)
?_119:  leave                                           ; 20E7 _ C9
        ret                                             ; 20E8 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 20E9 _ 55
        mov     ebp, esp                                ; 20EA _ 89. E5
        sub     esp, 48                                 ; 20EC _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 20EF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20F2 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 20F4 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 20F7 _ C7. 45, E0, 00000000
        jmp     ?_126                                   ; 20FE _ E9, 000000DC

?_120:  mov     eax, dword [ebp+8H]                     ; 2103 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 2106 _ 8B. 55, E0
        add     edx, 4                                  ; 2109 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 210C _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 210F _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2112 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2115 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2117 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 211A _ C7. 45, E8, 00000000
        jmp     ?_125                                   ; 2121 _ E9, 000000A6

?_121:  mov     eax, dword [ebp-10H]                    ; 2126 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2129 _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 212C _ 8B. 45, E8
        add     eax, edx                                ; 212F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2131 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 2134 _ C7. 45, E4, 00000000
        jmp     ?_124                                   ; 213B _ EB, 7C

?_122:  mov     eax, dword [ebp-10H]                    ; 213D _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2140 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 2143 _ 8B. 45, E4
        add     eax, edx                                ; 2146 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2148 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 214B _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 214E _ 3B. 45, FC
        jg      ?_123                                   ; 2151 _ 7F, 62
        mov     eax, dword [ebp-4H]                     ; 2153 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2156 _ 3B. 45, 14
        jge     ?_123                                   ; 2159 _ 7D, 5A
        mov     eax, dword [ebp+10H]                    ; 215B _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 215E _ 3B. 45, F8
        jg      ?_123                                   ; 2161 _ 7F, 52
        mov     eax, dword [ebp-8H]                     ; 2163 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2166 _ 3B. 45, 18
        jge     ?_123                                   ; 2169 _ 7D, 4A
        mov     eax, dword [ebp-10H]                    ; 216B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 216E _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 2171 _ 0F AF. 45, E8
        mov     edx, eax                                ; 2175 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2177 _ 8B. 45, E4
        add     eax, edx                                ; 217A _ 01. D0
        mov     edx, eax                                ; 217C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 217E _ 8B. 45, F4
        add     eax, edx                                ; 2181 _ 01. D0
        movzx   eax, byte [eax]                         ; 2183 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 2186 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 2189 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 218D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2190 _ 8B. 40, 14
        cmp     edx, eax                                ; 2193 _ 39. C2
        jz      ?_123                                   ; 2195 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2197 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 219A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 219D _ 0F AF. 45, F8
        mov     edx, eax                                ; 21A1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 21A3 _ 8B. 45, FC
        add     eax, edx                                ; 21A6 _ 01. D0
        mov     edx, eax                                ; 21A8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 21AA _ 8B. 45, EC
        add     edx, eax                                ; 21AD _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 21AF _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 21B3 _ 88. 02
?_123:  add     dword [ebp-1CH], 1                      ; 21B5 _ 83. 45, E4, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 21B9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 21BC _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 21BF _ 3B. 45, E4
        jg      ?_122                                   ; 21C2 _ 0F 8F, FFFFFF75
        add     dword [ebp-18H], 1                      ; 21C8 _ 83. 45, E8, 01
?_125:  mov     eax, dword [ebp-10H]                    ; 21CC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 21CF _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 21D2 _ 3B. 45, E8
        jg      ?_121                                   ; 21D5 _ 0F 8F, FFFFFF4B
        add     dword [ebp-20H], 1                      ; 21DB _ 83. 45, E0, 01
?_126:  mov     eax, dword [ebp+8H]                     ; 21DF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21E2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-20H]                    ; 21E5 _ 3B. 45, E0
        jge     ?_120                                   ; 21E8 _ 0F 8D, FFFFFF15
        leave                                           ; 21EE _ C9
        ret                                             ; 21EF _ C3
; sheet_refresh_local End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_127:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_128:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0007 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 000F _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0017 _ howing.

?_129:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_130:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_131:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_132:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_133:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_134:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_135:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0060 _ Welcome 
        db 74H, 6FH, 00H                                ; 0068 _ to.

?_136:                                                  ; byte
        db 57H, 65H, 54H, 72H, 65H, 65H, 4FH, 53H       ; 006B _ WeTreeOS
        db 00H                                          ; 0073 _ .


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1606:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0020 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1674:                                            ; byte
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

closebtn.1742:                                          ; byte
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

?_137:  db 00H                                          ; 0242 _ .

?_138:  db 00H, 00H                                     ; 0243 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

screen_info:                                            ; qword
        resb    4                                       ; 0000

?_139:  resw    1                                       ; 0004

?_140:  resw    13                                      ; 0006

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

?_141:  resb    9                                       ; 0221

?_142:  resb    1                                       ; 022A


