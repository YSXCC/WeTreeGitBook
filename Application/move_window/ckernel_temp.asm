; Disassembly of file: ckernel.o
; Mon Mar 23 20:44:29 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global set_cursor: function
global isSpecialKey: function
global transferScanCode: function
global launch_console: function
global kill_process: function
global cmd_dir: function
global cmd_type: function
global cmd_mem: function
global cmd_cls: function
global cmd_hlt: function
global console_task: function
global cons_putstr: function
global api_linewin: function
global handle_keyboard: function
global kernel_api: function
global cons_putchar: function
global cons_newline: function
global init_screen8: function
global computeMousePosition: function
global show_mouse_info: function
global initBootInfo: function
global showString: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global make_wtitle8: function
global make_textbox8: function
global file_loadfile: function
global intHandlerForStackOverFlow: function
global intHandlerForException: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refreshsub: function
global sheet_refreshmap: function
global sheet_free: function
global init_pit: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global strcmp: function
global set_segmdesc: function
global get_taskctl: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switchsub: function
global send_message: function
global memman
global KEY_CONTROL
global g_hlt
global key_shift
global caps_lock

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern start_app                                        ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern asm_end_app                                      ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000024(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000024(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_370]                       ; 001E _ 0F B7. 05, 00000028(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000015C(d)
        movzx   eax, word [?_371]                       ; 002B _ 0F B7. 05, 0000002A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000160(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000014C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000130(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0066 _ 89. 45, E0
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-20H]                    ; 0079 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-20H]                    ; 008C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 009C _ 89. 45, DC
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-24H]                    ; 00AF _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-24H]                    ; 00C2 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 00D2 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 00E5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 00F8 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 0000002C(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 000000A0(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000048(d)
        call    fifo8_init                              ; 0146 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 014B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0150 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 015A _ 89. 45, D4
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0162 _ 89. 45, D0
        mov     eax, dword [memman]                     ; 0165 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 016A _ 89. 04 24
        call    memman_init                             ; 016D _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0172 _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0177 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 16809984                ; 017F _ C7. 44 24, 04, 01008000
        mov     dword [esp], eax                        ; 0187 _ 89. 04 24
        call    memman_free                             ; 018A _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000160(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000015C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 01A8 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000288(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000028C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000015C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000160(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000164(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000160(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000015C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000164(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000288(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000028C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000180(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000160(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000015C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000164(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000180(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000015C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000154(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000160(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000158(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000158(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000154(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000284(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000284(d)
        mov     dword [esp+4H], ?_339                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000280(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000284(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000284(d)
        mov     dword [esp+8H], 100                     ; 0369 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000120(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1806], eax                ; 039B _ A3, 000002A8(d)
        mov     eax, dword [task_a.1806]                ; 03A0 _ A1, 000002A8(d)
        mov     dword [?_372], eax                      ; 03A5 _ A3, 00000044(d)
        mov     eax, dword [task_a.1806]                ; 03AA _ A1, 000002A8(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000298(d)
        mov     eax, dword [task_a.1806]                ; 03B4 _ A1, 000002A8(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 03D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 03D6 _ 89. 45, CC
        mov     dword [ebp-38H], 0                      ; 03D9 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 03E0 _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 03E7 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 176                    ; 03EE _ C7. 45, BC, 000000B0
        mov     dword [ebp-48H], 0                      ; 03F5 _ C7. 45, B8, 00000000
        mov     dword [ebp-14H], 0                      ; 03FC _ C7. 45, EC, 00000000
        mov     dword [ebp-4CH], 0                      ; 0403 _ C7. 45, B4, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 040A _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0411 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0416 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0418 _ C7. 04 24, 00000048(d)
        call    fifo8_status                            ; 041F _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0424 _ 01. C3
        mov     dword [esp], timerinfo                  ; 0426 _ C7. 04 24, 00000130(d)
        call    fifo8_status                            ; 042D _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0432 _ 01. D8
        test    eax, eax                                ; 0434 _ 85. C0
        jnz     ?_002                                   ; 0436 _ 75, 0A
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 043D _ E9, 000003AC

?_002:  mov     dword [esp], keyinfo                    ; 0442 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0449 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 044E _ 85. C0
        je      ?_009                                   ; 0450 _ 0F 84, 00000367
        call    io_sti                                  ; 0456 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 045B _ C7. 04 24, 0000002C(d)
        call    fifo8_get                               ; 0462 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0467 _ 89. 45, C8
        mov     eax, dword [ebp-38H]                    ; 046A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 046D _ 89. 04 24
        call    transferScanCode                        ; 0470 _ E8, FFFFFFFC(rel)
        mov     eax, dword [KEY_CONTROL]                ; 0475 _ A1, 00000000(d)
        cmp     dword [ebp-38H], eax                    ; 047A _ 39. 45, C8
        jnz     ?_003                                   ; 047D _ 75, 43
        mov     eax, dword [key_shift]                  ; 047F _ A1, 00000000(d)
        test    eax, eax                                ; 0484 _ 85. C0
        jz      ?_003                                   ; 0486 _ 74, 3A
        mov     eax, dword [task_cons]                  ; 0488 _ A1, 00000294(d)
        mov     eax, dword [eax+34H]                    ; 048D _ 8B. 40, 34
        test    eax, eax                                ; 0490 _ 85. C0
        jz      ?_003                                   ; 0492 _ 74, 2E
        mov     dword [esp], ?_340                      ; 0494 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 049B _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 04A0 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 04A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 04AA _ 89. 45, B0
        mov     eax, dword [task_cons]                  ; 04AD _ A1, 00000294(d)
        mov     edx, kill_process                       ; 04B2 _ BA, 00000000(d)
        sub     edx, dword [ebp-50H]                    ; 04B7 _ 2B. 55, B0
        mov     dword [eax+4CH], edx                    ; 04BA _ 89. 50, 4C
        call    io_sti                                  ; 04BD _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-38H], 16                     ; 04C2 _ 83. 7D, C8, 10
        jnz     ?_004                                   ; 04C6 _ 75, 28
        mov     eax, dword [shtctl]                     ; 04C8 _ A1, 00000284(d)
        mov     eax, dword [eax+10H]                    ; 04CD _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 04D0 _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 04D3 _ A1, 00000284(d)
        mov     edx, dword [eax+18H]                    ; 04D8 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 04DB _ A1, 00000284(d)
        mov     dword [esp+8H], ecx                     ; 04E0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04E8 _ 89. 04 24
        call    sheet_updown                            ; 04EB _ E8, FFFFFFFC(rel)
?_004:  cmp     dword [ebp-38H], 15                     ; 04F0 _ 83. 7D, C8, 0F
        jne     ?_007                                   ; 04F4 _ 0F 85, 0000019A
        mov     dword [ebp-18H], -1                     ; 04FA _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 0501 _ 83. 7D, EC, 00
        jne     ?_005                                   ; 0505 _ 0F 85, 00000089
        mov     dword [ebp-14H], 1                      ; 050B _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0512 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0518 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 051D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_341                   ; 0525 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 052D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0531 _ 89. 04 24
        call    make_wtitle8                            ; 0534 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0539 _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 053E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_342                   ; 0546 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 054E _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0551 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0555 _ 89. 04 24
        call    make_wtitle8                            ; 0558 _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 055D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0563 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 0568 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0570 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0578 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 057B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 057F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0583 _ 89. 04 24
        call    set_cursor                              ; 0586 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 87                     ; 058B _ C7. 45, E8, 00000057
        jmp     ?_006                                   ; 0592 _ EB, 71

?_005:  mov     dword [ebp-14H], 0                      ; 0594 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 059B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 05A1 _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 05A6 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_341                   ; 05AE _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 05B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05BA _ 89. 04 24
        call    make_wtitle8                            ; 05BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 05C2 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 05C7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_342                   ; 05CF _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 05D7 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 05DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05DE _ 89. 04 24
        call    make_wtitle8                            ; 05E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_cons]                  ; 05E6 _ A1, 00000294(d)
        add     eax, 16                                 ; 05EB _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 05EE _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05F6 _ 89. 04 24
        call    fifo8_put                               ; 05F9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 88                     ; 05FE _ C7. 45, E8, 00000058
?_006:  mov     eax, dword [shtMsgBox]                  ; 0605 _ A1, 00000280(d)
        mov     ecx, dword [eax+4H]                     ; 060A _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 060D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0613 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 0618 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0620 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0624 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 062C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0634 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0638 _ 89. 04 24
        call    sheet_refresh                           ; 063B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0640 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0643 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0646 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 064B _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], edx                    ; 0653 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0657 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 065F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-34H]                    ; 0667 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 066A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 066E _ 89. 04 24
        call    sheet_refresh                           ; 0671 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_cons]                  ; 0676 _ 8B. 15, 00000294(d)
        mov     eax, dword [task_a.1806]                ; 067C _ A1, 000002A8(d)
        mov     ecx, dword [ebp-18H]                    ; 0681 _ 8B. 4D, E8
        mov     dword [esp+8H], ecx                     ; 0684 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0688 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 068C _ 89. 04 24
        call    send_message                            ; 068F _ E8, FFFFFFFC(rel)
?_007:  cmp     dword [ebp-14H], 0                      ; 0694 _ 83. 7D, EC, 00
        jne     ?_008                                   ; 0698 _ 0F 85, 000000D6
        mov     eax, dword [ebp-38H]                    ; 069E _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06A1 _ 89. 04 24
        call    transferScanCode                        ; 06A4 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 06A9 _ 84. C0
        je      ?_010                                   ; 06AB _ 0F 84, 0000013D
        cmp     dword [ebp-0CH], 143                    ; 06B1 _ 81. 7D, F4, 0000008F
        jg      ?_010                                   ; 06B8 _ 0F 8F, 00000130
        mov     edx, dword [shtMsgBox]                  ; 06BE _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06C4 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 06C9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 06D1 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06D9 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06DC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E4 _ 89. 04 24
        call    set_cursor                              ; 06E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-38H]                    ; 06EC _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06EF _ 89. 04 24
        call    transferScanCode                        ; 06F2 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 06F7 _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06FA _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06FE _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 0701 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 0705 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 070B _ A1, 00000284(d)
        lea     ecx, [ebp-66H]                          ; 0710 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 0713 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 0717 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 071F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0727 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 072A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 072E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0732 _ 89. 04 24
        call    showString                              ; 0735 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 073A _ 83. 45, F4, 08
        mov     dword [ebp-48H], 1                      ; 073E _ C7. 45, B8, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0745 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 074B _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0750 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0753 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0757 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 075F _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0762 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0766 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 076A _ 89. 04 24
        call    set_cursor                              ; 076D _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0772 _ EB, 7A

?_008:  mov     eax, dword [ebp-38H]                    ; 0774 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0777 _ 89. 04 24
        call    isSpecialKey                            ; 077A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 077F _ 85. C0
        jnz     ?_010                                   ; 0781 _ 75, 6B
        mov     eax, dword [ebp-38H]                    ; 0783 _ 8B. 45, C8
        movzx   eax, al                                 ; 0786 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0789 _ 8B. 15, 00000294(d)
        add     edx, 16                                 ; 078F _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0792 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0796 _ 89. 14 24
        call    fifo8_put                               ; 0799 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 079E _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 07A5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07AA _ 85. C0
        jnz     ?_010                                   ; 07AC _ 75, 40
        mov     eax, dword [task_a.1806]                ; 07AE _ A1, 000002A8(d)
        mov     dword [esp], eax                        ; 07B3 _ 89. 04 24
        call    task_sleep                              ; 07B6 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07BB _ EB, 31

?_009:  mov     dword [esp], mouseinfo                  ; 07BD _ C7. 04 24, 00000048(d)
        call    fifo8_status                            ; 07C4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07C9 _ 85. C0
        jz      ?_010                                   ; 07CB _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 07CD _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 07D3 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 07D9 _ A1, 00000284(d)
        mov     dword [esp+8H], ecx                     ; 07DE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E6 _ 89. 04 24
        call    show_mouse_info                         ; 07E9 _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo                  ; 07EE _ C7. 04 24, 00000130(d)
        call    fifo8_status                            ; 07F5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FA _ 85. C0
        je      ?_014                                   ; 07FC _ 0F 84, 000000DB
        call    io_sti                                  ; 0802 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 0807 _ C7. 04 24, 00000130(d)
        call    fifo8_get                               ; 080E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 0813 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 0816 _ 83. 7D, A8, 00
        jz      ?_011                                   ; 081A _ 74, 24
        mov     dword [esp+8H], 0                       ; 081C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 0824 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 082C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 082F _ 89. 04 24
        call    timer_init                              ; 0832 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0837 _ C7. 45, F0, 00000000
        jmp     ?_012                                   ; 083E _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0840 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0848 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 0850 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0853 _ 89. 04 24
        call    timer_init                              ; 0856 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 085B _ C7. 45, F0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 0862 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 086A _ 8B. 45, D8
        mov     dword [esp], eax                        ; 086D _ 89. 04 24
        call    timer_settime                           ; 0870 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0875 _ 83. 7D, EC, 00
        jnz     ?_013                                   ; 0879 _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 087B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0881 _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0886 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0889 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 088D _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0895 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0898 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A0 _ 89. 04 24
        call    set_cursor                              ; 08A3 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 08A8 _ EB, 33

?_013:  mov     edx, dword [shtMsgBox]                  ; 08AA _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 08B0 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 08B5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 08BD _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 08C5 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 08C8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08CC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08D0 _ 89. 04 24
        call    set_cursor                              ; 08D3 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08D8 _ E9, FFFFFB2D

?_014:  jmp     ?_001                                   ; 08DD _ E9, FFFFFB28
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 08E2 _ 55
        mov     ebp, esp                                ; 08E3 _ 89. E5
        push    esi                                     ; 08E5 _ 56
        push    ebx                                     ; 08E6 _ 53
        sub     esp, 32                                 ; 08E7 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 08EA _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 08ED _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 08F0 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 08F3 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 08F6 _ 8B. 45, 18
        movzx   ecx, al                                 ; 08F9 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 08FC _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 08FF _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0902 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0905 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 0907 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 090B _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 090F _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 0912 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 0916 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 0919 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 091D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0921 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0925 _ 89. 04 24
        call    boxfill8                                ; 0928 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 092D _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 0930 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 0933 _ 8B. 45, 10
        add     eax, 8                                  ; 0936 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 0939 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 093D _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0941 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0944 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0948 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 094B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 094F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0952 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0956 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0959 _ 89. 04 24
        call    sheet_refresh                           ; 095C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0961 _ 83. C4, 20
        pop     ebx                                     ; 0964 _ 5B
        pop     esi                                     ; 0965 _ 5E
        pop     ebp                                     ; 0966 _ 5D
        ret                                             ; 0967 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0968 _ 55
        mov     ebp, esp                                ; 0969 _ 89. E5
        sub     esp, 24                                 ; 096B _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 096E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0971 _ 89. 04 24
        call    transferScanCode                        ; 0974 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0979 _ 83. 7D, 08, 3A
        jz      ?_015                                   ; 097D _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 097F _ 83. 7D, 08, 1D
        jz      ?_015                                   ; 0983 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0985 _ 81. 7D, 08, 000000BA
        jz      ?_015                                   ; 098C _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 098E _ 83. 7D, 08, 2A
        jz      ?_015                                   ; 0992 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0994 _ 83. 7D, 08, 36
        jz      ?_015                                   ; 0998 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 099A _ 81. 7D, 08, 000000AA
        jz      ?_015                                   ; 09A1 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 09A3 _ 81. 7D, 08, 000000B6
        jnz     ?_016                                   ; 09AA _ 75, 07
?_015:  mov     eax, 1                                  ; 09AC _ B8, 00000001
        jmp     ?_017                                   ; 09B1 _ EB, 05

?_016:  mov     eax, 0                                  ; 09B3 _ B8, 00000000
?_017:  leave                                           ; 09B8 _ C9
        ret                                             ; 09B9 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 09BA _ 55
        mov     ebp, esp                                ; 09BB _ 89. E5
        sub     esp, 16                                 ; 09BD _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 09C0 _ 83. 7D, 08, 2A
        jnz     ?_018                                   ; 09C4 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09C6 _ A1, 00000000(d)
        or      eax, 01H                                ; 09CB _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 09CE _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 54                      ; 09D3 _ 83. 7D, 08, 36
        jnz     ?_019                                   ; 09D7 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09D9 _ A1, 00000000(d)
        or      eax, 02H                                ; 09DE _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 09E1 _ A3, 00000000(d)
?_019:  cmp     dword [ebp+8H], 170                     ; 09E6 _ 81. 7D, 08, 000000AA
        jnz     ?_020                                   ; 09ED _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09EF _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 09F4 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 09F7 _ A3, 00000000(d)
?_020:  cmp     dword [ebp+8H], 182                     ; 09FC _ 81. 7D, 08, 000000B6
        jnz     ?_021                                   ; 0A03 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A05 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0A0A _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0A0D _ A3, 00000000(d)
?_021:  cmp     dword [ebp+8H], 58                      ; 0A12 _ 83. 7D, 08, 3A
        jnz     ?_023                                   ; 0A16 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0A18 _ A1, 00000000(d)
        test    eax, eax                                ; 0A1D _ 85. C0
        jnz     ?_022                                   ; 0A1F _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0A21 _ C7. 05, 00000000(d), 00000001
        jmp     ?_023                                   ; 0A2B _ EB, 0A

?_022:  mov     dword [caps_lock], 0                    ; 0A2D _ C7. 05, 00000000(d), 00000000
?_023:  cmp     dword [ebp+8H], 42                      ; 0A37 _ 83. 7D, 08, 2A
        jz      ?_024                                   ; 0A3B _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0A3D _ 83. 7D, 08, 36
        jz      ?_024                                   ; 0A41 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0A43 _ 81. 7D, 08, 000000AA
        jz      ?_024                                   ; 0A4A _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0A4C _ 81. 7D, 08, 000000B6
        jz      ?_024                                   ; 0A53 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0A55 _ 83. 7D, 08, 53
        jg      ?_024                                   ; 0A59 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0A5B _ 83. 7D, 08, 3A
        jnz     ?_025                                   ; 0A5F _ 75, 0A
?_024:  mov     eax, 0                                  ; 0A61 _ B8, 00000000
        jmp     ?_030                                   ; 0A66 _ E9, 00000089

?_025:  mov     byte [ebp-1H], 0                        ; 0A6B _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0A6F _ A1, 00000000(d)
        test    eax, eax                                ; 0A74 _ 85. C0
        jnz     ?_027                                   ; 0A76 _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0A78 _ 83. 7D, 08, 53
        jg      ?_027                                   ; 0A7C _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0A7E _ 8B. 45, 08
        add     eax, keytable                           ; 0A81 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A86 _ 0F B6. 00
        test    al, al                                  ; 0A89 _ 84. C0
        jz      ?_027                                   ; 0A8B _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A8D _ 8B. 45, 08
        add     eax, keytable                           ; 0A90 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A95 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A98 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A9B _ 80. 7D, FF, 40
        jle     ?_026                                   ; 0A9F _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0AA1 _ 80. 7D, FF, 5A
        jg      ?_026                                   ; 0AA5 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0AA7 _ A1, 00000000(d)
        test    eax, eax                                ; 0AAC _ 85. C0
        jnz     ?_026                                   ; 0AAE _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0AB0 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0AB4 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0AB7 _ 88. 45, FF
        jmp     ?_029                                   ; 0ABA _ EB, 34

?_026:  jmp     ?_029                                   ; 0ABC _ EB, 32

?_027:  mov     eax, dword [key_shift]                  ; 0ABE _ A1, 00000000(d)
        test    eax, eax                                ; 0AC3 _ 85. C0
        jz      ?_028                                   ; 0AC5 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0AC7 _ 83. 7D, 08, 7F
        jg      ?_028                                   ; 0ACB _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0ACD _ 8B. 45, 08
        add     eax, keytable1                          ; 0AD0 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AD5 _ 0F B6. 00
        test    al, al                                  ; 0AD8 _ 84. C0
        jz      ?_028                                   ; 0ADA _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0ADC _ 8B. 45, 08
        add     eax, keytable1                          ; 0ADF _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AE4 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0AE7 _ 88. 45, FF
        jmp     ?_029                                   ; 0AEA _ EB, 04

?_028:  mov     byte [ebp-1H], 0                        ; 0AEC _ C6. 45, FF, 00
?_029:  movzx   eax, byte [ebp-1H]                      ; 0AF0 _ 0F B6. 45, FF
?_030:  leave                                           ; 0AF4 _ C9
        ret                                             ; 0AF5 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0AF6 _ 55
        mov     ebp, esp                                ; 0AF7 _ 89. E5
        push    ebx                                     ; 0AF9 _ 53
        sub     esp, 52                                 ; 0AFA _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0AFD _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 0B02 _ 89. 04 24
        call    sheet_alloc                             ; 0B05 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0B0A _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0B0D _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0B12 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0B1A _ 89. 04 24
        call    memman_alloc_4k                         ; 0B1D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0B22 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0B25 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0B2D _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0B35 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0B3D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0B40 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0B44 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B47 _ 89. 04 24
        call    sheet_setbuf                            ; 0B4A _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0B4F _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 0B54 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_342                   ; 0B5C _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-0CH]                    ; 0B64 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0B67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B6B _ 89. 04 24
        call    make_window8                            ; 0B6E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0B73 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0B7B _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0B83 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0B8B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0B93 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0B9B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B9E _ 89. 04 24
        call    make_textbox8                           ; 0BA1 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0BA6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0BAB _ 89. 45, EC
        call    get_code32_addr                         ; 0BAE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0BB3 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0BB6 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0BB9 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BC3 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0BC6 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0BD0 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0BD5 _ 2B. 45, E8
        mov     edx, eax                                ; 0BD8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BDA _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BDD _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BE0 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BE3 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BEA _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0BED _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0BF4 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0BF7 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0BFE _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0C01 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0C0B _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0C0E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C18 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0C1B _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 0C25 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C28 _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 0C2B _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0C2E _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C31 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C34 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C37 _ 8B. 40, 64
        add     eax, 4                                  ; 0C3A _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0C3D _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0C40 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0C42 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C45 _ 8B. 40, 64
        add     eax, 8                                  ; 0C48 _ 83. C0, 08
        mov     ebx, eax                                ; 0C4B _ 89. C3
        mov     eax, dword [memman]                     ; 0C4D _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0C52 _ 89. 04 24
        call    memman_total                            ; 0C55 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0C5A _ 89. 03
        mov     dword [esp+8H], 5                       ; 0C5C _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0C64 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0C6C _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0C6F _ 89. 04 24
        call    task_run                                ; 0C72 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C77 _ A1, 00000284(d)
        mov     dword [esp+0CH], 4                      ; 0C7C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0C84 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0C8C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C8F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C93 _ 89. 04 24
        call    sheet_slide                             ; 0C96 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C9B _ A1, 00000284(d)
        mov     dword [esp+8H], 1                       ; 0CA0 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0CA8 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    sheet_updown                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0CB7 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0CBA _ A3, 00000294(d)
        mov     eax, dword [ebp-0CH]                    ; 0CBF _ 8B. 45, F4
        add     esp, 52                                 ; 0CC2 _ 83. C4, 34
        pop     ebx                                     ; 0CC5 _ 5B
        pop     ebp                                     ; 0CC6 _ 5D
        ret                                             ; 0CC7 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0CC8 _ 55
        mov     ebp, esp                                ; 0CC9 _ 89. E5
        sub     esp, 24                                 ; 0CCB _ 83. EC, 18
        mov     edx, dword [g_Console]                  ; 0CCE _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 0CD4 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0CD9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CDD _ 89. 04 24
        call    cons_newline                            ; 0CE0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_365]                      ; 0CE5 _ A1, 00000014(d)
        add     eax, 16                                 ; 0CEA _ 83. C0, 10
        mov     dword [?_365], eax                      ; 0CED _ A3, 00000014(d)
        mov     eax, dword [task_cons]                  ; 0CF2 _ A1, 00000294(d)
        add     eax, 48                                 ; 0CF7 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0CFA _ 89. 04 24
        call    asm_end_app                             ; 0CFD _ E8, FFFFFFFC(rel)
        leave                                           ; 0D02 _ C9
        ret                                             ; 0D03 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0D04 _ 55
        mov     ebp, esp                                ; 0D05 _ 89. E5
        push    ebx                                     ; 0D07 _ 53
        sub     esp, 68                                 ; 0D08 _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 0D0B _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0D12 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0D17 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0D1F _ 89. 04 24
        call    memman_alloc                            ; 0D22 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D27 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0D2A _ 8B. 45, E8
        add     eax, 12                                 ; 0D2D _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0D30 _ C6. 00, 00
        jmp     ?_038                                   ; 0D33 _ E9, 00000125

?_031:  mov     dword [ebp-10H], 0                      ; 0D38 _ C7. 45, F0, 00000000
        jmp     ?_034                                   ; 0D3F _ EB, 2C

?_032:  mov     edx, dword [ebp-0CH]                    ; 0D41 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0D44 _ 8B. 45, F0
        add     eax, edx                                ; 0D47 _ 01. D0
        movzx   eax, byte [eax]                         ; 0D49 _ 0F B6. 00
        test    al, al                                  ; 0D4C _ 84. C0
        jz      ?_033                                   ; 0D4E _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0D50 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D53 _ 8B. 45, E8
        add     edx, eax                                ; 0D56 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D58 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0D5B _ 8B. 45, F0
        add     eax, ecx                                ; 0D5E _ 01. C8
        movzx   eax, byte [eax]                         ; 0D60 _ 0F B6. 00
        mov     byte [edx], al                          ; 0D63 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D65 _ 83. 45, F0, 01
        jmp     ?_034                                   ; 0D69 _ EB, 02

?_033:  jmp     ?_035                                   ; 0D6B _ EB, 06

?_034:  cmp     dword [ebp-10H], 7                      ; 0D6D _ 83. 7D, F0, 07
        jle     ?_032                                   ; 0D71 _ 7E, CE
?_035:  mov     dword [ebp-14H], 0                      ; 0D73 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0D7A _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D7D _ 8B. 45, E8
        add     eax, edx                                ; 0D80 _ 01. D0
        mov     byte [eax], 46                          ; 0D82 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0D85 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0D89 _ C7. 45, EC, 00000000
        jmp     ?_037                                   ; 0D90 _ EB, 1E

?_036:  mov     edx, dword [ebp-10H]                    ; 0D92 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D95 _ 8B. 45, E8
        add     edx, eax                                ; 0D98 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D9A _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0D9D _ 8B. 45, EC
        add     eax, ecx                                ; 0DA0 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0DA2 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0DA6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0DA8 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0DAC _ 83. 45, EC, 01
?_037:  cmp     dword [ebp-14H], 2                      ; 0DB0 _ 83. 7D, EC, 02
        jle     ?_036                                   ; 0DB4 _ 7E, DC
        mov     ecx, dword [?_365]                      ; 0DB6 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0DBC _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0DC2 _ A1, 00000284(d)
        mov     ebx, dword [ebp-18H]                    ; 0DC7 _ 8B. 5D, E8
        mov     dword [esp+14H], ebx                    ; 0DCA _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DCE _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DD6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0DDA _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0DE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DE6 _ 89. 04 24
        call    showString                              ; 0DE9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 0DEE _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0DF5 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0DF8 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0DFB _ 89. 04 24
        call    intToHexStr                             ; 0DFE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0E03 _ 89. 45, E0
        mov     ecx, dword [?_365]                      ; 0E06 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0E0C _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0E12 _ A1, 00000284(d)
        mov     ebx, dword [ebp-20H]                    ; 0E17 _ 8B. 5D, E0
        mov     dword [esp+14H], ebx                    ; 0E1A _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0E1E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0E26 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 0E2A _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 0E2D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0E31 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E35 _ 89. 04 24
        call    showString                              ; 0E38 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 0E3D _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 0E43 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0E48 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E4C _ 89. 04 24
        call    cons_newline                            ; 0E4F _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 0E54 _ A3, 00000014(d)
        add     dword [ebp-0CH], 32                     ; 0E59 _ 83. 45, F4, 20
?_038:  mov     eax, dword [ebp-0CH]                    ; 0E5D _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0E60 _ 0F B6. 00
        test    al, al                                  ; 0E63 _ 84. C0
        jne     ?_031                                   ; 0E65 _ 0F 85, FFFFFECD
        mov     edx, dword [ebp-18H]                    ; 0E6B _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 0E6E _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 0E73 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 0E7B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E7F _ 89. 04 24
        call    memman_free                             ; 0E82 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 0E87 _ 83. C4, 44
        pop     ebx                                     ; 0E8A _ 5B
        pop     ebp                                     ; 0E8B _ 5D
        ret                                             ; 0E8C _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0E8D _ 55
        mov     ebp, esp                                ; 0E8E _ 89. E5
        push    esi                                     ; 0E90 _ 56
        push    ebx                                     ; 0E91 _ 53
        sub     esp, 96                                 ; 0E92 _ 83. EC, 60
        mov     eax, dword [memman]                     ; 0E95 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0E9A _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0EA2 _ 89. 04 24
        call    memman_alloc                            ; 0EA5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0EAA _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0EAD _ 8B. 45, DC
        add     eax, 12                                 ; 0EB0 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0EB3 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0EB6 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0EBD _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0EC4 _ C7. 45, F0, 00000005
        jmp     ?_041                                   ; 0ECB _ EB, 30

?_039:  mov     edx, dword [ebp-10H]                    ; 0ECD _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0ED0 _ 8B. 45, 08
        add     eax, edx                                ; 0ED3 _ 01. D0
        movzx   eax, byte [eax]                         ; 0ED5 _ 0F B6. 00
        test    al, al                                  ; 0ED8 _ 84. C0
        jz      ?_040                                   ; 0EDA _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 0EDC _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0EDF _ 8B. 45, DC
        add     edx, eax                                ; 0EE2 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0EE4 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0EE7 _ 8B. 45, 08
        add     eax, ecx                                ; 0EEA _ 01. C8
        movzx   eax, byte [eax]                         ; 0EEC _ 0F B6. 00
        mov     byte [edx], al                          ; 0EEF _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0EF1 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 0EF5 _ 83. 45, F0, 01
        jmp     ?_041                                   ; 0EF9 _ EB, 02

?_040:  jmp     ?_042                                   ; 0EFB _ EB, 06

?_041:  cmp     dword [ebp-10H], 16                     ; 0EFD _ 83. 7D, F0, 10
        jle     ?_039                                   ; 0F01 _ 7E, CA
?_042:  mov     edx, dword [ebp-0CH]                    ; 0F03 _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0F06 _ 8B. 45, DC
        add     eax, edx                                ; 0F09 _ 01. D0
        mov     byte [eax], 0                           ; 0F0B _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 0F0E _ C7. 45, EC, 00013400
        jmp     ?_058                                   ; 0F15 _ E9, 0000023D

?_043:  mov     byte [ebp-2DH], 0                       ; 0F1A _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 0F1E _ C7. 45, E8, 00000000
        jmp     ?_046                                   ; 0F25 _ EB, 2C

?_044:  mov     edx, dword [ebp-14H]                    ; 0F27 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F2A _ 8B. 45, E8
        add     eax, edx                                ; 0F2D _ 01. D0
        movzx   eax, byte [eax]                         ; 0F2F _ 0F B6. 00
        test    al, al                                  ; 0F32 _ 84. C0
        jz      ?_045                                   ; 0F34 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 0F36 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F39 _ 8B. 45, E8
        add     eax, edx                                ; 0F3C _ 01. D0
        movzx   eax, byte [eax]                         ; 0F3E _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 0F41 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F44 _ 8B. 55, E8
        add     edx, ecx                                ; 0F47 _ 01. CA
        mov     byte [edx], al                          ; 0F49 _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F4B _ 83. 45, E8, 01
        jmp     ?_046                                   ; 0F4F _ EB, 02

?_045:  jmp     ?_047                                   ; 0F51 _ EB, 06

?_046:  cmp     dword [ebp-18H], 7                      ; 0F53 _ 83. 7D, E8, 07
        jle     ?_044                                   ; 0F57 _ 7E, CE
?_047:  mov     dword [ebp-1CH], 0                      ; 0F59 _ C7. 45, E4, 00000000
        lea     edx, [ebp-39H]                          ; 0F60 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0F63 _ 8B. 45, E8
        add     eax, edx                                ; 0F66 _ 01. D0
        mov     byte [eax], 46                          ; 0F68 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0F6B _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0F6F _ C7. 45, E4, 00000000
        jmp     ?_049                                   ; 0F76 _ EB, 1E

?_048:  mov     edx, dword [ebp-14H]                    ; 0F78 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0F7B _ 8B. 45, E4
        add     eax, edx                                ; 0F7E _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 0F80 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 0F84 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F87 _ 8B. 55, E8
        add     edx, ecx                                ; 0F8A _ 01. CA
        mov     byte [edx], al                          ; 0F8C _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F8E _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0F92 _ 83. 45, E4, 01
?_049:  cmp     dword [ebp-1CH], 2                      ; 0F96 _ 83. 7D, E4, 02
        jle     ?_048                                   ; 0F9A _ 7E, DC
        lea     eax, [ebp-39H]                          ; 0F9C _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 0F9F _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0FA3 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0FA6 _ 89. 04 24
        call    strcmp                                  ; 0FA9 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 0FAE _ 83. F8, 01
        jne     ?_057                                   ; 0FB1 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 0FB7 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-14H]                    ; 0FBE _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 0FC1 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 0FC5 _ 0F B7. C0
        shl     eax, 9                                  ; 0FC8 _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 0FCB _ 01. 45, D8
        mov     eax, dword [ebp-14H]                    ; 0FCE _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 0FD1 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 0FD4 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 0FD7 _ C7. 45, E0, 00000000
        mov     dword [?_364], 16                       ; 0FDE _ C7. 05, 00000010(d), 00000010
        mov     dword [ebp-20H], 0                      ; 0FE8 _ C7. 45, E0, 00000000
        jmp     ?_056                                   ; 0FEF _ E9, 00000150

?_050:  mov     edx, dword [ebp-20H]                    ; 0FF4 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 0FF7 _ 8B. 45, D8
        add     eax, edx                                ; 0FFA _ 01. D0
        movzx   eax, byte [eax]                         ; 0FFC _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 0FFF _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 1002 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 1006 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 100A _ 3C, 09
        jnz     ?_053                                   ; 100C _ 75, 7E
?_051:  mov     ebx, dword [?_365]                      ; 100E _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_364]                      ; 1014 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 101A _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1020 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_343                  ; 1025 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 102D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1035 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1039 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 103D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1041 _ 89. 04 24
        call    showString                              ; 1044 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 1049 _ A1, 00000010(d)
        add     eax, 8                                  ; 104E _ 83. C0, 08
        mov     dword [?_364], eax                      ; 1051 _ A3, 00000010(d)
        mov     eax, dword [?_364]                      ; 1056 _ A1, 00000010(d)
        cmp     eax, 248                                ; 105B _ 3D, 000000F8
        jnz     ?_052                                   ; 1060 _ 75, 28
        mov     dword [?_364], 8                        ; 1062 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 106C _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 1072 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1077 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107B _ 89. 04 24
        call    cons_newline                            ; 107E _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 1083 _ A3, 00000014(d)
        jmp     ?_051                                   ; 1088 _ EB, 84

?_052:  jmp     ?_051                                   ; 108A _ EB, 82

?_053:  movzx   eax, byte [ebp-3BH]                     ; 108C _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1090 _ 3C, 0A
        jnz     ?_054                                   ; 1092 _ 75, 2B
        mov     dword [?_364], 8                        ; 1094 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 109E _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 10A4 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 10A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10AD _ 89. 04 24
        call    cons_newline                            ; 10B0 _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 10B5 _ A3, 00000014(d)
        jmp     ?_055                                   ; 10BA _ E9, 00000081

?_054:  movzx   eax, byte [ebp-3BH]                     ; 10BF _ 0F B6. 45, C5
        cmp     al, 13                                  ; 10C3 _ 3C, 0D
        jz      ?_055                                   ; 10C5 _ 74, 79
        mov     ebx, dword [?_365]                      ; 10C7 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_364]                      ; 10CD _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 10D3 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 10D9 _ A1, 00000284(d)
        lea     esi, [ebp-3BH]                          ; 10DE _ 8D. 75, C5
        mov     dword [esp+14H], esi                    ; 10E1 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 10E5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 10ED _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 10F1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10F9 _ 89. 04 24
        call    showString                              ; 10FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 1101 _ A1, 00000010(d)
        add     eax, 8                                  ; 1106 _ 83. C0, 08
        mov     dword [?_364], eax                      ; 1109 _ A3, 00000010(d)
        mov     eax, dword [?_364]                      ; 110E _ A1, 00000010(d)
        cmp     eax, 248                                ; 1113 _ 3D, 000000F8
        jnz     ?_055                                   ; 1118 _ 75, 26
        mov     dword [?_364], 16                       ; 111A _ C7. 05, 00000010(d), 00000010
        mov     edx, dword [g_Console]                  ; 1124 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 112A _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 112F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1133 _ 89. 04 24
        call    cons_newline                            ; 1136 _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 113B _ A3, 00000014(d)
?_055:  add     dword [ebp-20H], 1                      ; 1140 _ 83. 45, E0, 01
?_056:  mov     eax, dword [ebp-20H]                    ; 1144 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 1147 _ 3B. 45, D4
        jl      ?_050                                   ; 114A _ 0F 8C, FFFFFEA4
        nop                                             ; 1150 _ 90
        jmp     ?_059                                   ; 1151 _ EB, 12

?_057:  add     dword [ebp-14H], 32                     ; 1153 _ 83. 45, EC, 20
?_058:  mov     eax, dword [ebp-14H]                    ; 1157 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 115A _ 0F B6. 00
        test    al, al                                  ; 115D _ 84. C0
        jne     ?_043                                   ; 115F _ 0F 85, FFFFFDB5
?_059:  mov     edx, dword [g_Console]                  ; 1165 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 116B _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1170 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1174 _ 89. 04 24
        call    cons_newline                            ; 1177 _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 117C _ A3, 00000014(d)
        mov     edx, dword [ebp-24H]                    ; 1181 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1184 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 1189 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1191 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1195 _ 89. 04 24
        call    memman_free                             ; 1198 _ E8, FFFFFFFC(rel)
        mov     dword [?_364], 16                       ; 119D _ C7. 05, 00000010(d), 00000010
        add     esp, 96                                 ; 11A7 _ 83. C4, 60
        pop     ebx                                     ; 11AA _ 5B
        pop     esi                                     ; 11AB _ 5E
        pop     ebp                                     ; 11AC _ 5D
        ret                                             ; 11AD _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 11AE _ 55
        mov     ebp, esp                                ; 11AF _ 89. E5
        push    ebx                                     ; 11B1 _ 53
        sub     esp, 52                                 ; 11B2 _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 11B5 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 11B8 _ 8D. 90, 000003FF
        test    eax, eax                                ; 11BE _ 85. C0
        cmovs   eax, edx                                ; 11C0 _ 0F 48. C2
        sar     eax, 10                                 ; 11C3 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 11C6 _ 89. 04 24
        call    intToHexStr                             ; 11C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 11CE _ 89. 45, F4
        mov     ecx, dword [?_365]                      ; 11D1 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 11D7 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 11DD _ A1, 00000284(d)
        mov     dword [esp+14H], ?_344                  ; 11E2 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11EA _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11F2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11F6 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11FE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1202 _ 89. 04 24
        call    showString                              ; 1205 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_365]                      ; 120A _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 1210 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1216 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 121B _ 8B. 5D, F4
        mov     dword [esp+14H], ebx                    ; 121E _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1222 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 122A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 122E _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1236 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 123A _ 89. 04 24
        call    showString                              ; 123D _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_365]                      ; 1242 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 1248 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 124E _ A1, 00000284(d)
        mov     dword [esp+14H], ?_345                  ; 1253 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 125B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1263 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1267 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 126F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1273 _ 89. 04 24
        call    showString                              ; 1276 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 127B _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_365]                      ; 1281 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1286 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 128A _ 89. 04 24
        call    cons_newline                            ; 128D _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 1292 _ A3, 00000014(d)
        add     esp, 52                                 ; 1297 _ 83. C4, 34
        pop     ebx                                     ; 129A _ 5B
        pop     ebp                                     ; 129B _ 5D
        ret                                             ; 129C _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 129D _ 55
        mov     ebp, esp                                ; 129E _ 89. E5
        sub     esp, 56                                 ; 12A0 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 12A3 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 12AA _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 12B1 _ C7. 45, F0, 0000001C
        jmp     ?_063                                   ; 12B8 _ EB, 39

?_060:  mov     dword [ebp-0CH], 8                      ; 12BA _ C7. 45, F4, 00000008
        jmp     ?_062                                   ; 12C1 _ EB, 23

?_061:  mov     eax, dword [g_Console]                  ; 12C3 _ A1, 0000000C(d)
        mov     edx, dword [eax]                        ; 12C8 _ 8B. 10
        mov     eax, dword [g_Console]                  ; 12CA _ A1, 0000000C(d)
        mov     eax, dword [eax+4H]                     ; 12CF _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 12D2 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 12D6 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 12D8 _ 8B. 45, F4
        add     eax, ecx                                ; 12DB _ 01. C8
        add     eax, edx                                ; 12DD _ 01. D0
        mov     byte [eax], 0                           ; 12DF _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 12E2 _ 83. 45, F4, 01
?_062:  cmp     dword [ebp-0CH], 247                    ; 12E6 _ 81. 7D, F4, 000000F7
        jle     ?_061                                   ; 12ED _ 7E, D4
        add     dword [ebp-10H], 1                      ; 12EF _ 83. 45, F0, 01
?_063:  cmp     dword [ebp-10H], 155                    ; 12F3 _ 81. 7D, F0, 0000009B
        jle     ?_060                                   ; 12FA _ 7E, BE
        mov     edx, dword [g_Console]                  ; 12FC _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1302 _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 1307 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 130F _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1317 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 131F _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1327 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 132B _ 89. 04 24
        call    sheet_refresh                           ; 132E _ E8, FFFFFFFC(rel)
        mov     dword [?_365], 28                       ; 1333 _ C7. 05, 00000014(d), 0000001C
        mov     edx, dword [g_Console]                  ; 133D _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1343 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_346                  ; 1348 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1350 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1358 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1360 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1368 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 136C _ 89. 04 24
        call    showString                              ; 136F _ E8, FFFFFFFC(rel)
        leave                                           ; 1374 _ C9
        ret                                             ; 1375 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 1376 _ 55
        mov     ebp, esp                                ; 1377 _ 89. E5
        sub     esp, 56                                 ; 1379 _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 137C _ C7. 44 24, 04, 0000029C(d)
        mov     dword [esp], ?_347                      ; 1384 _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 138B _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1390 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1395 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 1398 _ A1, 0000029C(d)
        mov     edx, dword [ebp-0CH]                    ; 139D _ 8B. 55, F4
        add     edx, 88                                 ; 13A0 _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 13A3 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 13AB _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 13AF _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 13B7 _ 89. 14 24
        call    set_segmdesc                            ; 13BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 13BF _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 13C4 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 13CC _ 89. 04 24
        call    memman_alloc_4k                         ; 13CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13D4 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 13D7 _ 8B. 45, F0
        mov     dword [?_374], eax                      ; 13DA _ A3, 000002A0(d)
        mov     eax, dword [ebp-10H]                    ; 13DF _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 13E2 _ 8B. 55, F4
        add     edx, 96                                 ; 13E5 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 13E8 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 13F0 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 13F4 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 13FC _ 89. 14 24
        call    set_segmdesc                            ; 13FF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1404 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1409 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 140C _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 140F _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 1416 _ 8B. 45, EC
        add     eax, 48                                 ; 1419 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 141C _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 1420 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 1428 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 1430 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 1438 _ C7. 04 24, 00000000
        call    start_app                               ; 143F _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_375]                      ; 1444 _ A1, 000002A4(d)
        mov     ecx, eax                                ; 1449 _ 89. C1
        mov     eax, dword [buffer]                     ; 144B _ A1, 0000029C(d)
        mov     edx, eax                                ; 1450 _ 89. C2
        mov     eax, dword [memman]                     ; 1452 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1457 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 145B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 145F _ 89. 04 24
        call    memman_free_4k                          ; 1462 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1467 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 146A _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 146F _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1477 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 147B _ 89. 04 24
        call    memman_free_4k                          ; 147E _ E8, FFFFFFFC(rel)
        leave                                           ; 1483 _ C9
        ret                                             ; 1484 _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 1485 _ 55
        mov     ebp, esp                                ; 1486 _ 89. E5
        push    ebx                                     ; 1488 _ 53
        sub     esp, 84                                 ; 1489 _ 83. EC, 54
        call    task_now                                ; 148C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1491 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1494 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 149B _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 14A2 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 14A9 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 14AE _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 14B6 _ 89. 04 24
        call    memman_alloc                            ; 14B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 14BE _ 89. 45, E4
        mov     eax, dword [memman]                     ; 14C1 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 14C6 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 14CE _ 89. 04 24
        call    memman_alloc                            ; 14D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14D6 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 14D9 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 14DC _ A3, 0000000C(d)
        mov     dword [?_364], 16                       ; 14E1 _ C7. 05, 00000010(d), 00000010
        mov     dword [?_365], 28                       ; 14EB _ C7. 05, 00000014(d), 0000001C
        mov     dword [?_366], -1                       ; 14F5 _ C7. 05, 00000018(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 14FF _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 1502 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1505 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1508 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 150C _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 150F _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 1513 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 151B _ 89. 14 24
        call    fifo8_init                              ; 151E _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 1523 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1528 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 152B _ 8B. 45, F0
        add     eax, 16                                 ; 152E _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1531 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1539 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 153D _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1540 _ 89. 04 24
        call    timer_init                              ; 1543 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1548 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1550 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1553 _ 89. 04 24
        call    timer_settime                           ; 1556 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 155B _ 8B. 45, DC
        mov     dword [?_369], eax                      ; 155E _ A3, 00000020(d)
        mov     eax, dword [shtctl]                     ; 1563 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_346                  ; 1568 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1570 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1578 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1580 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1588 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 158B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 158F _ 89. 04 24
        call    showString                              ; 1592 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1597 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 159E _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 15A5 _ C7. 45, D0, 00000000
?_064:  call    io_cli                                  ; 15AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15B1 _ 8B. 45, F0
        add     eax, 16                                 ; 15B4 _ 83. C0, 10
        mov     dword [esp], eax                        ; 15B7 _ 89. 04 24
        call    fifo8_status                            ; 15BA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 15BF _ 85. C0
        jnz     ?_065                                   ; 15C1 _ 75, 0A
        call    io_sti                                  ; 15C3 _ E8, FFFFFFFC(rel)
        jmp     ?_079                                   ; 15C8 _ E9, 000003EF

?_065:  call    io_sti                                  ; 15CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15D2 _ 8B. 45, F0
        add     eax, 16                                 ; 15D5 _ 83. C0, 10
        mov     dword [esp], eax                        ; 15D8 _ 89. 04 24
        call    fifo8_get                               ; 15DB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15E0 _ 89. 45, CC
        cmp     dword [ebp-30H], 1                      ; 15E3 _ 83. 7D, D0, 01
        jnz     ?_066                                   ; 15E7 _ 75, 37
        mov     edx, dword [sht_back]                   ; 15E9 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 15EF _ A1, 00000284(d)
        mov     dword [esp+14H], ?_348                  ; 15F4 _ C7. 44 24, 14, 0000003A(d)
        mov     dword [esp+10H], 0                      ; 15FC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 232                    ; 1604 _ C7. 44 24, 0C, 000000E8
        mov     dword [esp+8H], 0                       ; 160C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1614 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1618 _ 89. 04 24
        call    showString                              ; 161B _ E8, FFFFFFFC(rel)
?_066:  cmp     dword [ebp-34H], 1                      ; 1620 _ 83. 7D, CC, 01
        jg      ?_069                                   ; 1624 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1626 _ 83. 7D, F4, 00
        js      ?_069                                   ; 162A _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 162C _ 83. 7D, CC, 00
        jz      ?_067                                   ; 1630 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1632 _ 8B. 45, F0
        add     eax, 16                                 ; 1635 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1638 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1640 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1644 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1647 _ 89. 04 24
        call    timer_init                              ; 164A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 164F _ C7. 45, F4, 00000007
        jmp     ?_068                                   ; 1656 _ EB, 24

?_067:  mov     eax, dword [ebp-10H]                    ; 1658 _ 8B. 45, F0
        add     eax, 16                                 ; 165B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 165E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1666 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 166A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 166D _ 89. 04 24
        call    timer_init                              ; 1670 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1675 _ C7. 45, F4, 00000000
?_068:  mov     dword [esp+4H], 50                      ; 167C _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1684 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1687 _ 89. 04 24
        call    timer_settime                           ; 168A _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 168F _ E9, 000002EE

?_069:  cmp     dword [ebp-34H], 87                     ; 1694 _ 83. 7D, CC, 57
        jnz     ?_070                                   ; 1698 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 169A _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 16A1 _ 8B. 45, F0
        add     eax, 16                                 ; 16A4 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 16A7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 16AF _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 16B3 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 16B6 _ 89. 04 24
        call    timer_init                              ; 16B9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 16BE _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 16C6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 16C9 _ 89. 04 24
        call    timer_settime                           ; 16CC _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 16D1 _ E9, 000002AC

?_070:  cmp     dword [ebp-34H], 88                     ; 16D6 _ 83. 7D, CC, 58
        jnz     ?_071                                   ; 16DA _ 75, 59
        mov     ecx, dword [?_365]                      ; 16DC _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_364]                      ; 16E2 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 16E8 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 16ED _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16F5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16F9 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16FD _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1700 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1704 _ 89. 04 24
        call    set_cursor                              ; 1707 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 170C _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1713 _ A1, 00000298(d)
        mov     dword [esp+8H], 0                       ; 1718 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1720 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1728 _ 89. 04 24
        call    task_run                                ; 172B _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1730 _ E9, 0000024D

?_071:  cmp     dword [ebp-34H], 28                     ; 1735 _ 83. 7D, CC, 1C
        jne     ?_076                                   ; 1739 _ 0F 85, 00000157
        mov     ecx, dword [?_365]                      ; 173F _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_364]                      ; 1745 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 174B _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1750 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1758 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 175C _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1760 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1763 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1767 _ 89. 04 24
        call    set_cursor                              ; 176A _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 176F _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 1774 _ 8D. 50, 07
        test    eax, eax                                ; 1777 _ 85. C0
        cmovs   eax, edx                                ; 1779 _ 0F 48. C2
        sar     eax, 3                                  ; 177C _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 177F _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1782 _ 8B. 45, E0
        add     eax, edx                                ; 1785 _ 01. D0
        mov     byte [eax], 0                           ; 1787 _ C6. 00, 00
        mov     eax, dword [?_365]                      ; 178A _ A1, 00000014(d)
        mov     edx, dword [ebp+8H]                     ; 178F _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1792 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1796 _ 89. 04 24
        call    cons_newline                            ; 1799 _ E8, FFFFFFFC(rel)
        mov     dword [?_365], eax                      ; 179E _ A3, 00000014(d)
        mov     dword [?_364], 16                       ; 17A3 _ C7. 05, 00000010(d), 00000010
        mov     dword [esp+4H], ?_349                   ; 17AD _ C7. 44 24, 04, 0000004B(d)
        mov     eax, dword [ebp-20H]                    ; 17B5 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B8 _ 89. 04 24
        call    strcmp                                  ; 17BB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17C0 _ 83. F8, 01
        jnz     ?_072                                   ; 17C3 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 17C5 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 17C8 _ 89. 04 24
        call    cmd_mem                                 ; 17CB _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 17D0 _ E9, 000001AD

?_072:  mov     dword [esp+4H], ?_350                   ; 17D5 _ C7. 44 24, 04, 0000004F(d)
        mov     eax, dword [ebp-20H]                    ; 17DD _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17E0 _ 89. 04 24
        call    strcmp                                  ; 17E3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17E8 _ 83. F8, 01
        jnz     ?_073                                   ; 17EB _ 75, 0A
        call    cmd_cls                                 ; 17ED _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 17F2 _ E9, 0000018B

?_073:  mov     dword [esp+4H], ?_351                   ; 17F7 _ C7. 44 24, 04, 00000053(d)
        mov     eax, dword [ebp-20H]                    ; 17FF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1802 _ 89. 04 24
        call    strcmp                                  ; 1805 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 180A _ 83. F8, 01
        jnz     ?_074                                   ; 180D _ 75, 14
        mov     dword [g_hlt], 1                        ; 180F _ C7. 05, 00000000(d), 00000001
        call    cmd_hlt                                 ; 1819 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 181E _ E9, 0000015F

?_074:  mov     dword [esp+4H], ?_352                   ; 1823 _ C7. 44 24, 04, 00000057(d)
        mov     eax, dword [ebp-20H]                    ; 182B _ 8B. 45, E0
        mov     dword [esp], eax                        ; 182E _ 89. 04 24
        call    strcmp                                  ; 1831 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1836 _ 83. F8, 01
        jnz     ?_075                                   ; 1839 _ 75, 0A
        call    cmd_dir                                 ; 183B _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1840 _ E9, 0000013D

?_075:  mov     eax, dword [ebp-20H]                    ; 1845 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 1848 _ 0F B6. 00
        cmp     al, 116                                 ; 184B _ 3C, 74
        jne     ?_078                                   ; 184D _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 1853 _ 8B. 45, E0
        add     eax, 1                                  ; 1856 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1859 _ 0F B6. 00
        cmp     al, 121                                 ; 185C _ 3C, 79
        jne     ?_078                                   ; 185E _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 1864 _ 8B. 45, E0
        add     eax, 2                                  ; 1867 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 186A _ 0F B6. 00
        cmp     al, 112                                 ; 186D _ 3C, 70
        jne     ?_078                                   ; 186F _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 1875 _ 8B. 45, E0
        add     eax, 3                                  ; 1878 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 187B _ 0F B6. 00
        cmp     al, 101                                 ; 187E _ 3C, 65
        jne     ?_078                                   ; 1880 _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1886 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1889 _ 89. 04 24
        call    cmd_type                                ; 188C _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1891 _ E9, 000000EC

?_076:  cmp     dword [ebp-34H], 14                     ; 1896 _ 83. 7D, CC, 0E
        jnz     ?_077                                   ; 189A _ 75, 79
        mov     eax, dword [?_364]                      ; 189C _ A1, 00000010(d)
        cmp     eax, 8                                  ; 18A1 _ 83. F8, 08
        jle     ?_077                                   ; 18A4 _ 7E, 6F
        mov     ecx, dword [?_365]                      ; 18A6 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_364]                      ; 18AC _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 18B2 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 18B7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 18BF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 18C3 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 18C7 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 18CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18CE _ 89. 04 24
        call    set_cursor                              ; 18D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 18D6 _ A1, 00000010(d)
        sub     eax, 8                                  ; 18DB _ 83. E8, 08
        mov     dword [?_364], eax                      ; 18DE _ A3, 00000010(d)
        mov     ecx, dword [?_365]                      ; 18E3 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_364]                      ; 18E9 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 18EF _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 18F4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 18FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1900 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1904 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1907 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 190B _ 89. 04 24
        call    set_cursor                              ; 190E _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1913 _ EB, 6D

?_077:  mov     eax, dword [ebp-34H]                    ; 1915 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1918 _ 89. 04 24
        call    transferScanCode                        ; 191B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1920 _ 88. 45, CB
        mov     eax, dword [?_364]                      ; 1923 _ A1, 00000010(d)
        cmp     eax, 239                                ; 1928 _ 3D, 000000EF
        jg      ?_078                                   ; 192D _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 192F _ 80. 7D, CB, 00
        jz      ?_078                                   ; 1933 _ 74, 4D
        mov     eax, dword [?_364]                      ; 1935 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 193A _ 8D. 50, 07
        test    eax, eax                                ; 193D _ 85. C0
        cmovs   eax, edx                                ; 193F _ 0F 48. C2
        sar     eax, 3                                  ; 1942 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1945 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1948 _ 8B. 45, E0
        add     edx, eax                                ; 194B _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 194D _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1951 _ 88. 02
        mov     eax, dword [?_364]                      ; 1953 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 1958 _ 8D. 50, 07
        test    eax, eax                                ; 195B _ 85. C0
        cmovs   eax, edx                                ; 195D _ 0F 48. C2
        sar     eax, 3                                  ; 1960 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1963 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 1966 _ 8B. 45, E0
        add     eax, edx                                ; 1969 _ 01. D0
        mov     byte [eax], 0                           ; 196B _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 196E _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1972 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 197A _ 89. 04 24
        call    cons_putchar                            ; 197D _ E8, FFFFFFFC(rel)
?_078:  cmp     dword [ebp-0CH], 0                      ; 1982 _ 83. 7D, F4, 00
        js      ?_079                                   ; 1986 _ 78, 34
        mov     ecx, dword [?_365]                      ; 1988 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_364]                      ; 198E _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 1994 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 1999 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 199C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 19A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 19A4 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 19A8 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 19AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19AF _ 89. 04 24
        call    set_cursor                              ; 19B2 _ E8, FFFFFFFC(rel)
        jmp     ?_064                                   ; 19B7 _ E9, FFFFFBF0

?_079:  jmp     ?_064                                   ; 19BC _ E9, FFFFFBEB
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 19C1 _ 55
        mov     ebp, esp                                ; 19C2 _ 89. E5
        sub     esp, 24                                 ; 19C4 _ 83. EC, 18
        jmp     ?_081                                   ; 19C7 _ EB, 1D

?_080:  mov     eax, dword [ebp+8H]                     ; 19C9 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 19CC _ 0F B6. 00
        movsx   eax, al                                 ; 19CF _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 19D2 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 19DA _ 89. 04 24
        call    cons_putchar                            ; 19DD _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 19E2 _ 83. 45, 08, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 19E6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 19E9 _ 0F B6. 00
        test    al, al                                  ; 19EC _ 84. C0
        jnz     ?_080                                   ; 19EE _ 75, D9
        nop                                             ; 19F0 _ 90
        leave                                           ; 19F1 _ C9
        ret                                             ; 19F2 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 19F3 _ 55
        mov     ebp, esp                                ; 19F4 _ 89. E5
        sub     esp, 32                                 ; 19F6 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 19F9 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 19FC _ 8B. 55, 14
        sub     edx, eax                                ; 19FF _ 29. C2
        mov     eax, edx                                ; 1A01 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 1A03 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1A06 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A09 _ 8B. 55, 18
        sub     edx, eax                                ; 1A0C _ 29. C2
        mov     eax, edx                                ; 1A0E _ 89. D0
        mov     dword [ebp-18H], eax                    ; 1A10 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1A13 _ 8B. 45, 0C
        shl     eax, 10                                 ; 1A16 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1A19 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1A1C _ 8B. 45, 10
        shl     eax, 10                                 ; 1A1F _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1A22 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1A25 _ 83. 7D, EC, 00
        jns     ?_082                                   ; 1A29 _ 79, 03
        neg     dword [ebp-14H]                         ; 1A2B _ F7. 5D, EC
?_082:  cmp     dword [ebp-18H], 0                      ; 1A2E _ 83. 7D, E8, 00
        jns     ?_083                                   ; 1A32 _ 79, 03
        neg     dword [ebp-18H]                         ; 1A34 _ F7. 5D, E8
?_083:  mov     eax, dword [ebp-14H]                    ; 1A37 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1A3A _ 3B. 45, E8
        jl      ?_087                                   ; 1A3D _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 1A3F _ 8B. 45, EC
        add     eax, 1                                  ; 1A42 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A45 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1A48 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1A4B _ 3B. 45, 14
        jle     ?_084                                   ; 1A4E _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1A50 _ C7. 45, EC, FFFFFC00
        jmp     ?_085                                   ; 1A57 _ EB, 07

?_084:  mov     dword [ebp-14H], 1024                   ; 1A59 _ C7. 45, EC, 00000400
?_085:  mov     eax, dword [ebp+10H]                    ; 1A60 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1A63 _ 3B. 45, 18
        jg      ?_086                                   ; 1A66 _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 1A68 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A6B _ 8B. 55, 18
        sub     edx, eax                                ; 1A6E _ 29. C2
        mov     eax, edx                                ; 1A70 _ 89. D0
        add     eax, 1                                  ; 1A72 _ 83. C0, 01
        shl     eax, 10                                 ; 1A75 _ C1. E0, 0A
        cdq                                             ; 1A78 _ 99
        idiv    dword [ebp-10H]                         ; 1A79 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A7C _ 89. 45, E8
        jmp     ?_091                                   ; 1A7F _ EB, 72

?_086:  mov     eax, dword [ebp+10H]                    ; 1A81 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A84 _ 8B. 55, 18
        sub     edx, eax                                ; 1A87 _ 29. C2
        mov     eax, edx                                ; 1A89 _ 89. D0
        sub     eax, 1                                  ; 1A8B _ 83. E8, 01
        shl     eax, 10                                 ; 1A8E _ C1. E0, 0A
        cdq                                             ; 1A91 _ 99
        idiv    dword [ebp-10H]                         ; 1A92 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A95 _ 89. 45, E8
        jmp     ?_091                                   ; 1A98 _ EB, 59

?_087:  mov     eax, dword [ebp-18H]                    ; 1A9A _ 8B. 45, E8
        add     eax, 1                                  ; 1A9D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1AA0 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1AA3 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1AA6 _ 3B. 45, 18
        jle     ?_088                                   ; 1AA9 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1AAB _ C7. 45, E8, FFFFFC00
        jmp     ?_089                                   ; 1AB2 _ EB, 07

?_088:  mov     dword [ebp-18H], 1024                   ; 1AB4 _ C7. 45, E8, 00000400
?_089:  mov     eax, dword [ebp+0CH]                    ; 1ABB _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1ABE _ 3B. 45, 14
        jg      ?_090                                   ; 1AC1 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1AC3 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1AC6 _ 8B. 55, 14
        sub     edx, eax                                ; 1AC9 _ 29. C2
        mov     eax, edx                                ; 1ACB _ 89. D0
        add     eax, 1                                  ; 1ACD _ 83. C0, 01
        shl     eax, 10                                 ; 1AD0 _ C1. E0, 0A
        cdq                                             ; 1AD3 _ 99
        idiv    dword [ebp-10H]                         ; 1AD4 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AD7 _ 89. 45, EC
        jmp     ?_091                                   ; 1ADA _ EB, 17

?_090:  mov     eax, dword [ebp+0CH]                    ; 1ADC _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1ADF _ 8B. 55, 14
        sub     edx, eax                                ; 1AE2 _ 29. C2
        mov     eax, edx                                ; 1AE4 _ 89. D0
        sub     eax, 1                                  ; 1AE6 _ 83. E8, 01
        shl     eax, 10                                 ; 1AE9 _ C1. E0, 0A
        cdq                                             ; 1AEC _ 99
        idiv    dword [ebp-10H]                         ; 1AED _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AF0 _ 89. 45, EC
?_091:  mov     dword [ebp-4H], 0                       ; 1AF3 _ C7. 45, FC, 00000000
        jmp     ?_093                                   ; 1AFA _ EB, 35

?_092:  mov     eax, dword [ebp+8H]                     ; 1AFC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AFF _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1B01 _ 8B. 45, F4
        sar     eax, 10                                 ; 1B04 _ C1. F8, 0A
        mov     ecx, eax                                ; 1B07 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1B09 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1B0C _ 8B. 40, 04
        imul    eax, ecx                                ; 1B0F _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1B12 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1B15 _ C1. F9, 0A
        add     eax, ecx                                ; 1B18 _ 01. C8
        add     edx, eax                                ; 1B1A _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1B1C _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1B1F _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1B21 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1B24 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1B27 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1B2A _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1B2D _ 83. 45, FC, 01
?_093:  mov     eax, dword [ebp-4H]                     ; 1B31 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1B34 _ 3B. 45, F0
        jl      ?_092                                   ; 1B37 _ 7C, C3
        leave                                           ; 1B39 _ C9
        ret                                             ; 1B3A _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1B3B _ 55
        mov     ebp, esp                                ; 1B3C _ 89. E5
        sub     esp, 40                                 ; 1B3E _ 83. EC, 28
        mov     eax, dword [?_369]                      ; 1B41 _ A1, 00000020(d)
        mov     dword [ebp-0CH], eax                    ; 1B46 _ 89. 45, F4
?_094:  mov     eax, dword [ebp+8H]                     ; 1B49 _ 8B. 45, 08
        add     eax, 16                                 ; 1B4C _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B4F _ 89. 04 24
        call    fifo8_status                            ; 1B52 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1B57 _ 85. C0
        jnz     ?_096                                   ; 1B59 _ 75, 23
        cmp     dword [ebp+0CH], 0                      ; 1B5B _ 83. 7D, 0C, 00
        jz      ?_095                                   ; 1B5F _ 74, 05
        jmp     ?_099                                   ; 1B61 _ E9, 00000085

?_095:  call    io_sti                                  ; 1B66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1B6B _ 8B. 45, 10
        add     eax, 28                                 ; 1B6E _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1B71 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1B77 _ B8, 00000000
        jmp     ?_100                                   ; 1B7C _ EB, 72

?_096:  mov     eax, dword [ebp+8H]                     ; 1B7E _ 8B. 45, 08
        add     eax, 16                                 ; 1B81 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B84 _ 89. 04 24
        call    fifo8_get                               ; 1B87 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1B8C _ 89. 45, F0
        cmp     dword [ebp-10H], 1                      ; 1B8F _ 83. 7D, F0, 01
        jg      ?_097                                   ; 1B93 _ 7F, 32
        mov     eax, dword [ebp+8H]                     ; 1B95 _ 8B. 45, 08
        add     eax, 16                                 ; 1B98 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B9B _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1BA3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1BA7 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1BAA _ 89. 04 24
        call    timer_init                              ; 1BAD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1BB2 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CH]                    ; 1BBA _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1BBD _ 89. 04 24
        call    timer_settime                           ; 1BC0 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1BC5 _ EB, 24

?_097:  cmp     dword [ebp-10H], 2                      ; 1BC7 _ 83. 7D, F0, 02
        jnz     ?_098                                   ; 1BCB _ 75, 0C
        mov     dword [?_366], 7                        ; 1BCD _ C7. 05, 00000018(d), 00000007
        jmp     ?_099                                   ; 1BD7 _ EB, 12

?_098:  mov     eax, dword [ebp+10H]                    ; 1BD9 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1BDC _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 1BDF _ 8B. 45, F0
        mov     dword [edx], eax                        ; 1BE2 _ 89. 02
        mov     eax, 0                                  ; 1BE4 _ B8, 00000000
        jmp     ?_100                                   ; 1BE9 _ EB, 05

?_099:  jmp     ?_094                                   ; 1BEB _ E9, FFFFFF59

?_100:  leave                                           ; 1BF0 _ C9
        ret                                             ; 1BF1 _ C3
; handle_keyboard End of function

kernel_api:; Function begin
        push    ebp                                     ; 1BF2 _ 55
        mov     ebp, esp                                ; 1BF3 _ 89. E5
        push    esi                                     ; 1BF5 _ 56
        push    ebx                                     ; 1BF6 _ 53
        sub     esp, 48                                 ; 1BF7 _ 83. EC, 30
        call    task_now                                ; 1BFA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1BFF _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 1C02 _ 8D. 45, 24
        add     eax, 4                                  ; 1C05 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1C08 _ 89. 45, F0
        cmp     dword [ebp+1CH], 1                      ; 1C0B _ 83. 7D, 1C, 01
        jnz     ?_101                                   ; 1C0F _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1C11 _ 8B. 45, 24
        movsx   eax, al                                 ; 1C14 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1C17 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1C1F _ 89. 04 24
        call    cons_putchar                            ; 1C22 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1C27 _ E9, 0000030D

?_101:  cmp     dword [ebp+1CH], 2                      ; 1C2C _ 83. 7D, 1C, 02
        jnz     ?_102                                   ; 1C30 _ 75, 18
        mov     edx, dword [buffer]                     ; 1C32 _ 8B. 15, 0000029C(d)
        mov     eax, dword [ebp+18H]                    ; 1C38 _ 8B. 45, 18
        add     eax, edx                                ; 1C3B _ 01. D0
        mov     dword [esp], eax                        ; 1C3D _ 89. 04 24
        call    cons_putstr                             ; 1C40 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1C45 _ E9, 000002EF

?_102:  cmp     dword [ebp+1CH], 4                      ; 1C4A _ 83. 7D, 1C, 04
        jnz     ?_103                                   ; 1C4E _ 75, 28
        mov     eax, dword [ebp-0CH]                    ; 1C50 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 1C53 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1C5A _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 1C5D _ 8B. 40, 30
        mov     dword [esp], eax                        ; 1C60 _ 89. 04 24
        call    intToHexStr                             ; 1C63 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1C68 _ 89. 45, EC
        mov     eax, dword [task_cons]                  ; 1C6B _ A1, 00000294(d)
        add     eax, 48                                 ; 1C70 _ 83. C0, 30
        jmp     ?_112                                   ; 1C73 _ E9, 000002C6

?_103:  cmp     dword [ebp+1CH], 5                      ; 1C78 _ 83. 7D, 1C, 05
        jne     ?_104                                   ; 1C7C _ 0F 85, 000000BA
        mov     eax, dword [shtctl]                     ; 1C82 _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 1C87 _ 89. 04 24
        call    sheet_alloc                             ; 1C8A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1C8F _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1C92 _ 8B. 45, 24
        mov     ecx, dword [?_374]                      ; 1C95 _ 8B. 0D, 000002A0(d)
        mov     edx, dword [ebp+18H]                    ; 1C9B _ 8B. 55, 18
        add     edx, ecx                                ; 1C9E _ 01. CA
        mov     dword [esp+10H], eax                    ; 1CA0 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1CA4 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1CA7 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CAB _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1CAE _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1CB2 _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 1CB6 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1CB9 _ 89. 04 24
        call    sheet_setbuf                            ; 1CBC _ E8, FFFFFFFC(rel)
        mov     edx, dword [buffer]                     ; 1CC1 _ 8B. 15, 0000029C(d)
        mov     eax, dword [ebp+20H]                    ; 1CC7 _ 8B. 45, 20
        add     edx, eax                                ; 1CCA _ 01. C2
        mov     eax, dword [shtctl]                     ; 1CCC _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 1CD1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 1CD9 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1CDD _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE4 _ 89. 04 24
        call    make_window8                            ; 1CE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1CEC _ A1, 00000284(d)
        mov     dword [esp+0CH], 50                     ; 1CF1 _ C7. 44 24, 0C, 00000032
        mov     dword [esp+8H], 100                     ; 1CF9 _ C7. 44 24, 08, 00000064
        mov     edx, dword [ebp-18H]                    ; 1D01 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D04 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D08 _ 89. 04 24
        call    sheet_slide                             ; 1D0B _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1D10 _ A1, 00000284(d)
        mov     dword [esp+8H], 3                       ; 1D15 _ C7. 44 24, 08, 00000003
        mov     edx, dword [ebp-18H]                    ; 1D1D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D20 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D24 _ 89. 04 24
        call    sheet_updown                            ; 1D27 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D2C _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 1D2F _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 1D32 _ 8B. 45, E8
        mov     dword [edx], eax                        ; 1D35 _ 89. 02
        jmp     ?_111                                   ; 1D37 _ E9, 000001FD

?_104:  cmp     dword [ebp+1CH], 6                      ; 1D3C _ 83. 7D, 1C, 06
        jne     ?_105                                   ; 1D40 _ 0F 85, 00000086
        mov     eax, dword [ebp+18H]                    ; 1D46 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1D49 _ 89. 45, E8
        mov     edx, dword [buffer]                     ; 1D4C _ 8B. 15, 0000029C(d)
        mov     eax, dword [ebp+10H]                    ; 1D52 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D55 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 1D58 _ 8B. 45, 24
        movsx   edx, al                                 ; 1D5B _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 1D5E _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1D63 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D67 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1D6B _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1D6E _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1D72 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1D75 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1D79 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D80 _ 89. 04 24
        call    showString                              ; 1D83 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1D88 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 1D8B _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 1D8E _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 1D91 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1D98 _ 8B. 45, 0C
        add     edx, eax                                ; 1D9B _ 01. C2
        mov     eax, dword [shtctl]                     ; 1D9D _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1DA2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1DA6 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1DAA _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1DAD _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1DB1 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1DB4 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1DB8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1DBB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DBF _ 89. 04 24
        call    sheet_refresh                           ; 1DC2 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1DC7 _ E9, 0000016D

?_105:  cmp     dword [ebp+1CH], 7                      ; 1DCC _ 83. 7D, 1C, 07
        jnz     ?_106                                   ; 1DD0 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 1DD2 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1DD5 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 1DD8 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1DDB _ 8B. 45, 10
        movzx   ecx, al                                 ; 1DDE _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 1DE1 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 1DE4 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 1DE7 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 1DEA _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 1DEC _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 1DEF _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 1DF3 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 1DF6 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 1DFA _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 1DFD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1E01 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1E05 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E09 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E0D _ 89. 04 24
        call    boxfill8                                ; 1E10 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1E15 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1E18 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1E1B _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 1E1E _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 1E21 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1E24 _ A1, 00000284(d)
        mov     dword [esp+14H], ebx                    ; 1E29 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 1E2D _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1E31 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1E34 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E38 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1E3C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1E3F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E43 _ 89. 04 24
        call    sheet_refresh                           ; 1E46 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1E4B _ E9, 000000E9

?_106:  cmp     dword [ebp+1CH], 11                     ; 1E50 _ 83. 7D, 1C, 0B
        jnz     ?_107                                   ; 1E54 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 1E56 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1E59 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 1E5C _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 1E5F _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 1E61 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 1E64 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 1E67 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 1E6B _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 1E6D _ 8B. 45, 0C
        add     eax, ecx                                ; 1E70 _ 01. C8
        add     edx, eax                                ; 1E72 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 1E74 _ 8B. 45, 24
        mov     byte [edx], al                          ; 1E77 _ 88. 02
        jmp     ?_111                                   ; 1E79 _ E9, 000000BB

?_107:  cmp     dword [ebp+1CH], 12                     ; 1E7E _ 83. 7D, 1C, 0C
        jnz     ?_108                                   ; 1E82 _ 75, 38
        mov     eax, dword [ebp+18H]                    ; 1E84 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1E87 _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 1E8A _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1E8D _ A1, 00000284(d)
        mov     ecx, dword [ebp+8H]                     ; 1E92 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 1E95 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 1E99 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 1E9C _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1EA0 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1EA3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1EA7 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1EAB _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1EAE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EB2 _ 89. 04 24
        call    sheet_refresh                           ; 1EB5 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1EBA _ EB, 7D

?_108:  cmp     dword [ebp+1CH], 13                     ; 1EBC _ 83. 7D, 1C, 0D
        jnz     ?_109                                   ; 1EC0 _ 75, 36
        mov     eax, dword [ebp+18H]                    ; 1EC2 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1EC5 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1EC8 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 1ECB _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 1ECE _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 1ED2 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 1ED5 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 1ED9 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 1EDC _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 1EE0 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 1EE3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1EE7 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 1EEB _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1EEE _ 89. 04 24
        call    api_linewin                             ; 1EF1 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1EF6 _ EB, 41

?_109:  cmp     dword [ebp+1CH], 14                     ; 1EF8 _ 83. 7D, 1C, 0E
        jnz     ?_110                                   ; 1EFC _ 75, 1C
        mov     eax, dword [ebp+18H]                    ; 1EFE _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1F01 _ 89. 45, E8
        mov     eax, dword [shtctl]                     ; 1F04 _ A1, 00000284(d)
        mov     edx, dword [ebp-18H]                    ; 1F09 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1F0C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F10 _ 89. 04 24
        call    sheet_free                              ; 1F13 _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1F18 _ EB, 1F

?_110:  cmp     dword [ebp+1CH], 15                     ; 1F1A _ 83. 7D, 1C, 0F
        jnz     ?_111                                   ; 1F1E _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 1F20 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 1F23 _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 1F26 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1F2A _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1F2E _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1F31 _ 89. 04 24
        call    handle_keyboard                         ; 1F34 _ E8, FFFFFFFC(rel)
?_111:  mov     eax, 0                                  ; 1F39 _ B8, 00000000
?_112:  add     esp, 48                                 ; 1F3E _ 83. C4, 30
        pop     ebx                                     ; 1F41 _ 5B
        pop     esi                                     ; 1F42 _ 5E
        pop     ebp                                     ; 1F43 _ 5D
        ret                                             ; 1F44 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1F45 _ 55
        mov     ebp, esp                                ; 1F46 _ 89. E5
        push    ebx                                     ; 1F48 _ 53
        sub     esp, 36                                 ; 1F49 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1F4C _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1F4F _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1F52 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1F55 _ 88. 45, F0
        mov     ebx, dword [?_365]                      ; 1F58 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_364]                      ; 1F5E _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 1F64 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1F6A _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1F6F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1F77 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1F7B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1F7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F83 _ 89. 04 24
        call    set_cursor                              ; 1F86 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 1F8B _ 0F B6. 45, F4
        mov     byte [?_367], al                        ; 1F8F _ A2, 0000001C(d)
        mov     byte [?_368], 0                         ; 1F94 _ C6. 05, 0000001D(d), 00
        mov     ebx, dword [?_365]                      ; 1F9B _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_364]                      ; 1FA1 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 1FA7 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1FAD _ A1, 00000284(d)
        mov     dword [esp+14H], ?_367                  ; 1FB2 _ C7. 44 24, 14, 0000001C(d)
        mov     dword [esp+10H], 7                      ; 1FBA _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1FC2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1FC6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1FCA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FCE _ 89. 04 24
        call    showString                              ; 1FD1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 1FD6 _ A1, 00000010(d)
        add     eax, 8                                  ; 1FDB _ 83. C0, 08
        mov     dword [?_364], eax                      ; 1FDE _ A3, 00000010(d)
        add     esp, 36                                 ; 1FE3 _ 83. C4, 24
        pop     ebx                                     ; 1FE6 _ 5B
        pop     ebp                                     ; 1FE7 _ 5D
        ret                                             ; 1FE8 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 1FE9 _ 55
        mov     ebp, esp                                ; 1FEA _ 89. E5
        push    ebx                                     ; 1FEC _ 53
        sub     esp, 52                                 ; 1FED _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 1FF0 _ 81. 7D, 08, 0000008B
        jg      ?_113                                   ; 1FF7 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1FF9 _ 83. 45, 08, 10
        jmp     ?_122                                   ; 1FFD _ E9, 000000DF

?_113:  mov     dword [ebp-10H], 28                     ; 2002 _ C7. 45, F0, 0000001C
        jmp     ?_117                                   ; 2009 _ EB, 52

?_114:  mov     dword [ebp-0CH], 8                      ; 200B _ C7. 45, F4, 00000008
        jmp     ?_116                                   ; 2012 _ EB, 3C

?_115:  mov     eax, dword [ebp+0CH]                    ; 2014 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2017 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2019 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 201C _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 201F _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2023 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2025 _ 8B. 45, F4
        add     eax, ecx                                ; 2028 _ 01. C8
        add     edx, eax                                ; 202A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 202C _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 202F _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2031 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2034 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2037 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 203A _ 8B. 40, 04
        imul    ebx, eax                                ; 203D _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2040 _ 8B. 45, F4
        add     eax, ebx                                ; 2043 _ 01. D8
        add     eax, ecx                                ; 2045 _ 01. C8
        movzx   eax, byte [eax]                         ; 2047 _ 0F B6. 00
        mov     byte [edx], al                          ; 204A _ 88. 02
        add     dword [ebp-0CH], 1                      ; 204C _ 83. 45, F4, 01
?_116:  cmp     dword [ebp-0CH], 247                    ; 2050 _ 81. 7D, F4, 000000F7
        jle     ?_115                                   ; 2057 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2059 _ 83. 45, F0, 01
?_117:  cmp     dword [ebp-10H], 139                    ; 205D _ 81. 7D, F0, 0000008B
        jle     ?_114                                   ; 2064 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2066 _ C7. 45, F0, 0000008C
        jmp     ?_121                                   ; 206D _ EB, 35

?_118:  mov     dword [ebp-0CH], 8                      ; 206F _ C7. 45, F4, 00000008
        jmp     ?_120                                   ; 2076 _ EB, 1F

?_119:  mov     eax, dword [ebp+0CH]                    ; 2078 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 207B _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 207D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2080 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2083 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2087 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2089 _ 8B. 45, F4
        add     eax, ecx                                ; 208C _ 01. C8
        add     eax, edx                                ; 208E _ 01. D0
        mov     byte [eax], 0                           ; 2090 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2093 _ 83. 45, F4, 01
?_120:  cmp     dword [ebp-0CH], 247                    ; 2097 _ 81. 7D, F4, 000000F7
        jle     ?_119                                   ; 209E _ 7E, D8
        add     dword [ebp-10H], 1                      ; 20A0 _ 83. 45, F0, 01
?_121:  cmp     dword [ebp-10H], 155                    ; 20A4 _ 81. 7D, F0, 0000009B
        jle     ?_118                                   ; 20AB _ 7E, C2
        mov     eax, dword [shtctl]                     ; 20AD _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 20B2 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 20BA _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 20C2 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 20CA _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 20D2 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 20D5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20D9 _ 89. 04 24
        call    sheet_refresh                           ; 20DC _ E8, FFFFFFFC(rel)
?_122:  mov     eax, dword [shtctl]                     ; 20E1 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_346                  ; 20E6 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 20EE _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 20F6 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 20F9 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 20FD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2105 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2108 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 210C _ 89. 04 24
        call    showString                              ; 210F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2114 _ 8B. 45, 08
        add     esp, 52                                 ; 2117 _ 83. C4, 34
        pop     ebx                                     ; 211A _ 5B
        pop     ebp                                     ; 211B _ 5D
        ret                                             ; 211C _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 211D _ 55
        mov     ebp, esp                                ; 211E _ 89. E5
        push    ebx                                     ; 2120 _ 53
        sub     esp, 36                                 ; 2121 _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 2124 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2127 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 212A _ 8B. 45, 0C
        sub     eax, 1                                  ; 212D _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 2130 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2134 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 2138 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2140 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 2148 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2150 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2153 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2157 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 215A _ 89. 04 24
        call    boxfill8                                ; 215D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2162 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2165 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2168 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 216B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 216E _ 8B. 45, 10
        sub     eax, 28                                 ; 2171 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2174 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2178 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 217C _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2180 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2188 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2190 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2193 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2197 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 219A _ 89. 04 24
        call    boxfill8                                ; 219D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21A2 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 21A5 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 21A8 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 21AB _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 21AE _ 8B. 45, 10
        sub     eax, 27                                 ; 21B1 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 21B4 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 21B8 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 21BC _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 21C0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 21C8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 21D0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 21D3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21D7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21DA _ 89. 04 24
        call    boxfill8                                ; 21DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21E2 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 21E5 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 21E8 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 21EB _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 21EE _ 8B. 45, 10
        sub     eax, 26                                 ; 21F1 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 21F4 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 21F8 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 21FC _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2200 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2208 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2210 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2213 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2217 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 221A _ 89. 04 24
        call    boxfill8                                ; 221D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2222 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2225 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2228 _ 8B. 45, 10
        sub     eax, 24                                 ; 222B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 222E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2232 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 223A _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 223E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2246 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 224E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2251 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2255 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2258 _ 89. 04 24
        call    boxfill8                                ; 225B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2260 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2263 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2266 _ 8B. 45, 10
        sub     eax, 24                                 ; 2269 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 226C _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2270 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2278 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 227C _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2284 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 228C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 228F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2293 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2296 _ 89. 04 24
        call    boxfill8                                ; 2299 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 229E _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 22A1 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 22A4 _ 8B. 45, 10
        sub     eax, 4                                  ; 22A7 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 22AA _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 22AE _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 22B6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 22BA _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 22C2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 22CA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 22CD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22D1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22D4 _ 89. 04 24
        call    boxfill8                                ; 22D7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22DC _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 22DF _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 22E2 _ 8B. 45, 10
        sub     eax, 23                                 ; 22E5 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 22E8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 22EC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 22F4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 22F8 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 2300 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2308 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 230B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 230F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2312 _ 89. 04 24
        call    boxfill8                                ; 2315 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 231A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 231D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2320 _ 8B. 45, 10
        sub     eax, 3                                  ; 2323 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2326 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 232A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2332 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2336 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 233E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2346 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2349 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 234D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2350 _ 89. 04 24
        call    boxfill8                                ; 2353 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2358 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 235B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 235E _ 8B. 45, 10
        sub     eax, 24                                 ; 2361 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2364 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2368 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2370 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2374 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 237C _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2384 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2387 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 238B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 238E _ 89. 04 24
        call    boxfill8                                ; 2391 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2396 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2399 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 239C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 239F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 23A2 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 23A5 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 23A8 _ 8B. 45, 0C
        sub     eax, 47                                 ; 23AB _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 23AE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 23B2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 23B6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 23BA _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 23BE _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 23C6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 23C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23D0 _ 89. 04 24
        call    boxfill8                                ; 23D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23D8 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 23DB _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 23DE _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 23E1 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 23E4 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 23E7 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 23EA _ 8B. 45, 0C
        sub     eax, 47                                 ; 23ED _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 23F0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 23F4 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 23F8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 23FC _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2400 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2408 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 240B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 240F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2412 _ 89. 04 24
        call    boxfill8                                ; 2415 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 241A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 241D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2420 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2423 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2426 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2429 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 242C _ 8B. 45, 0C
        sub     eax, 47                                 ; 242F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2432 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2436 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 243A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 243E _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2442 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 244A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 244D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2451 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2454 _ 89. 04 24
        call    boxfill8                                ; 2457 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 245C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 245F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2462 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2465 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2468 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 246B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 246E _ 8B. 45, 0C
        sub     eax, 3                                  ; 2471 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2474 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2478 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 247C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2480 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2484 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 248C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 248F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2493 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2496 _ 89. 04 24
        call    boxfill8                                ; 2499 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 249E _ 83. C4, 24
        pop     ebx                                     ; 24A1 _ 5B
        pop     ebp                                     ; 24A2 _ 5D
        ret                                             ; 24A3 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 24A4 _ 55
        mov     ebp, esp                                ; 24A5 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 24A7 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 24AA _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 24AD _ A1, 00000154(d)
        add     eax, edx                                ; 24B2 _ 01. D0
        mov     dword [mx], eax                         ; 24B4 _ A3, 00000154(d)
        mov     eax, dword [ebp+10H]                    ; 24B9 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 24BC _ 8B. 50, 08
        mov     eax, dword [my]                         ; 24BF _ A1, 00000158(d)
        add     eax, edx                                ; 24C4 _ 01. D0
        mov     dword [my], eax                         ; 24C6 _ A3, 00000158(d)
        mov     eax, dword [mx]                         ; 24CB _ A1, 00000154(d)
        test    eax, eax                                ; 24D0 _ 85. C0
        jns     ?_123                                   ; 24D2 _ 79, 0A
        mov     dword [mx], 0                           ; 24D4 _ C7. 05, 00000154(d), 00000000
?_123:  mov     eax, dword [my]                         ; 24DE _ A1, 00000158(d)
        test    eax, eax                                ; 24E3 _ 85. C0
        jns     ?_124                                   ; 24E5 _ 79, 0A
        mov     dword [my], 0                           ; 24E7 _ C7. 05, 00000158(d), 00000000
?_124:  mov     eax, dword [xsize]                      ; 24F1 _ A1, 0000015C(d)
        lea     edx, [eax-1H]                           ; 24F6 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 24F9 _ A1, 00000154(d)
        cmp     edx, eax                                ; 24FE _ 39. C2
        jge     ?_125                                   ; 2500 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 2502 _ A1, 0000015C(d)
        sub     eax, 1                                  ; 2507 _ 83. E8, 01
        mov     dword [mx], eax                         ; 250A _ A3, 00000154(d)
?_125:  mov     eax, dword [ysize]                      ; 250F _ A1, 00000160(d)
        lea     edx, [eax-1H]                           ; 2514 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2517 _ A1, 00000158(d)
        cmp     edx, eax                                ; 251C _ 39. C2
        jge     ?_126                                   ; 251E _ 7D, 0D
        mov     eax, dword [ysize]                      ; 2520 _ A1, 00000160(d)
        sub     eax, 1                                  ; 2525 _ 83. E8, 01
        mov     dword [my], eax                         ; 2528 _ A3, 00000158(d)
?_126:  pop     ebp                                     ; 252D _ 5D
        ret                                             ; 252E _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 252F _ 55
        mov     ebp, esp                                ; 2530 _ 89. E5
        sub     esp, 56                                 ; 2532 _ 83. EC, 38
        mov     eax, dword [buf_back]                   ; 2535 _ A1, 00000164(d)
        mov     dword [ebp-10H], eax                    ; 253A _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 253D _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2541 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2548 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 254D _ C7. 04 24, 00000048(d)
        call    fifo8_get                               ; 2554 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 2559 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 255C _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 2560 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2564 _ C7. 04 24, 00000120(d)
        call    mouse_decode                            ; 256B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2570 _ 85. C0
        je      ?_135                                   ; 2572 _ 0F 84, 00000254
        mov     dword [esp+8H], mdec                    ; 2578 _ C7. 44 24, 08, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 2580 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2583 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2587 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 258A _ 89. 04 24
        call    computeMousePosition                    ; 258D _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2592 _ 8B. 15, 00000158(d)
        mov     eax, dword [mx]                         ; 2598 _ A1, 00000154(d)
        mov     dword [esp+0CH], edx                    ; 259D _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 25A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 25A5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 25A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25AF _ 89. 04 24
        call    sheet_slide                             ; 25B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_373]                      ; 25B7 _ A1, 0000012C(d)
        and     eax, 01H                                ; 25BC _ 83. E0, 01
        test    eax, eax                                ; 25BF _ 85. C0
        je      ?_134                                   ; 25C1 _ 0F 84, 000001FB
        mov     eax, dword [mmx]                        ; 25C7 _ A1, 00000118(d)
        test    eax, eax                                ; 25CC _ 85. C0
        jns     ?_133                                   ; 25CE _ 0F 89, 0000017D
        mov     eax, dword [ebp+8H]                     ; 25D4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25D7 _ 8B. 40, 10
        sub     eax, 1                                  ; 25DA _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 25DD _ 89. 45, F4
        jmp     ?_131                                   ; 25E0 _ E9, 0000015E

?_127:  mov     eax, dword [ebp+8H]                     ; 25E5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 25E8 _ 8B. 55, F4
        add     edx, 4                                  ; 25EB _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 25EE _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 25F2 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 25F5 _ 8B. 15, 00000154(d)
        mov     eax, dword [ebp-18H]                    ; 25FB _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 25FE _ 8B. 40, 0C
        sub     edx, eax                                ; 2601 _ 29. C2
        mov     eax, edx                                ; 2603 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2605 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2608 _ 8B. 15, 00000158(d)
        mov     eax, dword [ebp-18H]                    ; 260E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2611 _ 8B. 40, 10
        sub     edx, eax                                ; 2614 _ 29. C2
        mov     eax, edx                                ; 2616 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2618 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 261B _ 83. 7D, E4, 00
        js      ?_130                                   ; 261F _ 0F 88, 0000011A
        mov     eax, dword [ebp-18H]                    ; 2625 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2628 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 262B _ 3B. 45, E4
        jle     ?_130                                   ; 262E _ 0F 8E, 0000010B
        cmp     dword [ebp-20H], 0                      ; 2634 _ 83. 7D, E0, 00
        js      ?_130                                   ; 2638 _ 0F 88, 00000101
        mov     eax, dword [ebp-18H]                    ; 263E _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2641 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2644 _ 3B. 45, E0
        jle     ?_130                                   ; 2647 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-18H]                    ; 264D _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2650 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2652 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2655 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2658 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 265C _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 265E _ 8B. 45, E4
        add     eax, ecx                                ; 2661 _ 01. C8
        add     eax, edx                                ; 2663 _ 01. D0
        movzx   eax, byte [eax]                         ; 2665 _ 0F B6. 00
        movzx   edx, al                                 ; 2668 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 266B _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 266E _ 8B. 40, 14
        cmp     edx, eax                                ; 2671 _ 39. C2
        je      ?_130                                   ; 2673 _ 0F 84, 000000C6
        mov     eax, dword [ebp+8H]                     ; 2679 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 267C _ 8B. 40, 10
        sub     eax, 1                                  ; 267F _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 2682 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 2686 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2689 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 268D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2690 _ 89. 04 24
        call    sheet_updown                            ; 2693 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 2698 _ 83. 7D, E4, 02
        jle     ?_128                                   ; 269C _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 269E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 26A1 _ 8B. 40, 04
        sub     eax, 3                                  ; 26A4 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 26A7 _ 3B. 45, E4
        jle     ?_128                                   ; 26AA _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 26AC _ 83. 7D, E0, 02
        jle     ?_128                                   ; 26B0 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 26B2 _ 83. 7D, E0, 14
        jg      ?_128                                   ; 26B6 _ 7F, 1C
        mov     eax, dword [mx]                         ; 26B8 _ A1, 00000154(d)
        mov     dword [mmx], eax                        ; 26BD _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 26C2 _ A1, 00000158(d)
        mov     dword [mmy], eax                        ; 26C7 _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 26CC _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 26CF _ A3, 00000290(d)
?_128:  mov     eax, dword [ebp-18H]                    ; 26D4 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 26D7 _ 8B. 40, 04
        sub     eax, 21                                 ; 26DA _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 26DD _ 3B. 45, E4
        jg      ?_129                                   ; 26E0 _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 26E2 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 26E5 _ 8B. 40, 04
        sub     eax, 5                                  ; 26E8 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 26EB _ 3B. 45, E4
        jle     ?_129                                   ; 26EE _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 26F0 _ 83. 7D, E0, 04
        jle     ?_129                                   ; 26F4 _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 26F6 _ 83. 7D, E0, 12
        jg      ?_129                                   ; 26FA _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 26FC _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 26FF _ 8B. 40, 20
        test    eax, eax                                ; 2702 _ 85. C0
        jz      ?_129                                   ; 2704 _ 74, 37
        call    io_cli                                  ; 2706 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 270B _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 270E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2712 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2715 _ 89. 04 24
        call    sheet_free                              ; 2718 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 271D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2722 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 2725 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2728 _ 8B. 40, 20
        mov     edx, kill_process                       ; 272B _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 2730 _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 2733 _ 89. 50, 4C
        call    io_sti                                  ; 2736 _ E8, FFFFFFFC(rel)
        jmp     ?_132                                   ; 273B _ EB, 12

?_129:  jmp     ?_132                                   ; 273D _ EB, 10

?_130:  sub     dword [ebp-0CH], 1                      ; 273F _ 83. 6D, F4, 01
?_131:  cmp     dword [ebp-0CH], 0                      ; 2743 _ 83. 7D, F4, 00
        jg      ?_127                                   ; 2747 _ 0F 8F, FFFFFE98
        jmp     ?_135                                   ; 274D _ EB, 7D

?_132:  jmp     ?_135                                   ; 274F _ EB, 7B

?_133:  mov     edx, dword [mx]                         ; 2751 _ 8B. 15, 00000154(d)
        mov     eax, dword [mmx]                        ; 2757 _ A1, 00000118(d)
        sub     edx, eax                                ; 275C _ 29. C2
        mov     eax, edx                                ; 275E _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2760 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2763 _ 8B. 15, 00000158(d)
        mov     eax, dword [mmy]                        ; 2769 _ A1, 0000011C(d)
        sub     edx, eax                                ; 276E _ 29. C2
        mov     eax, edx                                ; 2770 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2772 _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 2775 _ A1, 00000290(d)
        mov     edx, dword [eax+10H]                    ; 277A _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 277D _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 2780 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 2783 _ A1, 00000290(d)
        mov     edx, dword [eax+0CH]                    ; 2788 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 278B _ 8B. 45, E4
        add     edx, eax                                ; 278E _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 2790 _ A1, 00000290(d)
        mov     dword [esp+0CH], ecx                    ; 2795 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2799 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 279D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 27A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 27A4 _ 89. 04 24
        call    sheet_slide                             ; 27A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 27AC _ A1, 00000154(d)
        mov     dword [mmx], eax                        ; 27B1 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 27B6 _ A1, 00000158(d)
        mov     dword [mmy], eax                        ; 27BB _ A3, 0000011C(d)
        jmp     ?_135                                   ; 27C0 _ EB, 0A

?_134:  mov     dword [mmx], -1                         ; 27C2 _ C7. 05, 00000118(d), FFFFFFFF
?_135:  leave                                           ; 27CC _ C9
        ret                                             ; 27CD _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 27CE _ 55
        mov     ebp, esp                                ; 27CF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 27D1 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 27D4 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 27DA _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 27DD _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 27E3 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 27E6 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 27EC _ 5D
        ret                                             ; 27ED _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 27EE _ 55
        mov     ebp, esp                                ; 27EF _ 89. E5
        push    ebx                                     ; 27F1 _ 53
        sub     esp, 52                                 ; 27F2 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 27F5 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 27F8 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 27FB _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 27FE _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2801 _ C7. 45, F0, 00000000
        jmp     ?_137                                   ; 2808 _ EB, 4B

?_136:  mov     eax, dword [ebp+1CH]                    ; 280A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 280D _ 0F B6. 00
        movzx   eax, al                                 ; 2810 _ 0F B6. C0
        shl     eax, 4                                  ; 2813 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2816 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 281C _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2820 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2823 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2826 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2829 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 282B _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 282F _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 2833 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 2836 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 283A _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 283D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2841 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2845 _ 89. 04 24
        call    showFont8                               ; 2848 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 284D _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2851 _ 83. 45, 1C, 01
?_137:  mov     eax, dword [ebp+1CH]                    ; 2855 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2858 _ 0F B6. 00
        test    al, al                                  ; 285B _ 84. C0
        jnz     ?_136                                   ; 285D _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 285F _ 8B. 45, 14
        add     eax, 16                                 ; 2862 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2865 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 2869 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 286C _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2870 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2873 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2877 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 287A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 287E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2881 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2885 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2888 _ 89. 04 24
        call    sheet_refresh                           ; 288B _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2890 _ 83. C4, 34
        pop     ebx                                     ; 2893 _ 5B
        pop     ebp                                     ; 2894 _ 5D
        ret                                             ; 2895 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2896 _ 55
        mov     ebp, esp                                ; 2897 _ 89. E5
        sub     esp, 24                                 ; 2899 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.2053          ; 289C _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 28A4 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 28AC _ C7. 04 24, 00000000
        call    set_palette                             ; 28B3 _ E8, FFFFFFFC(rel)
        nop                                             ; 28B8 _ 90
        leave                                           ; 28B9 _ C9
        ret                                             ; 28BA _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 28BB _ 55
        mov     ebp, esp                                ; 28BC _ 89. E5
        sub     esp, 40                                 ; 28BE _ 83. EC, 28
        call    io_load_eflags                          ; 28C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 28C6 _ 89. 45, F0
        call    io_cli                                  ; 28C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 28CE _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 28D1 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 28D5 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 28DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 28E1 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 28E4 _ 89. 45, F4
        jmp     ?_139                                   ; 28E7 _ EB, 62

?_138:  mov     eax, dword [ebp+10H]                    ; 28E9 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 28EC _ 0F B6. 00
        shr     al, 2                                   ; 28EF _ C0. E8, 02
        movzx   eax, al                                 ; 28F2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 28F5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 28F9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2900 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2905 _ 8B. 45, 10
        add     eax, 1                                  ; 2908 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 290B _ 0F B6. 00
        shr     al, 2                                   ; 290E _ C0. E8, 02
        movzx   eax, al                                 ; 2911 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2914 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2918 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 291F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2924 _ 8B. 45, 10
        add     eax, 2                                  ; 2927 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 292A _ 0F B6. 00
        shr     al, 2                                   ; 292D _ C0. E8, 02
        movzx   eax, al                                 ; 2930 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2933 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2937 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 293E _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 2943 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 2947 _ 83. 45, F4, 01
?_139:  mov     eax, dword [ebp-0CH]                    ; 294B _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 294E _ 3B. 45, 0C
        jle     ?_138                                   ; 2951 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 2953 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2956 _ 89. 04 24
        call    io_store_eflags                         ; 2959 _ E8, FFFFFFFC(rel)
        nop                                             ; 295E _ 90
        leave                                           ; 295F _ C9
        ret                                             ; 2960 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2961 _ 55
        mov     ebp, esp                                ; 2962 _ 89. E5
        sub     esp, 20                                 ; 2964 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2967 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 296A _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 296D _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2970 _ 89. 45, F8
        jmp     ?_143                                   ; 2973 _ EB, 33

?_140:  mov     eax, dword [ebp+14H]                    ; 2975 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 2978 _ 89. 45, FC
        jmp     ?_142                                   ; 297B _ EB, 1F

?_141:  mov     eax, dword [ebp-8H]                     ; 297D _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2980 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2984 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2986 _ 8B. 45, FC
        add     eax, edx                                ; 2989 _ 01. D0
        mov     edx, eax                                ; 298B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 298D _ 8B. 45, 08
        add     edx, eax                                ; 2990 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2992 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2996 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2998 _ 83. 45, FC, 01
?_142:  mov     eax, dword [ebp-4H]                     ; 299C _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 299F _ 3B. 45, 1C
        jle     ?_141                                   ; 29A2 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 29A4 _ 83. 45, F8, 01
?_143:  mov     eax, dword [ebp-8H]                     ; 29A8 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 29AB _ 3B. 45, 20
        jle     ?_140                                   ; 29AE _ 7E, C5
        leave                                           ; 29B0 _ C9
        ret                                             ; 29B1 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 29B2 _ 55
        mov     ebp, esp                                ; 29B3 _ 89. E5
        sub     esp, 20                                 ; 29B5 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 29B8 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 29BB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 29BE _ C7. 45, FC, 00000000
        jmp     ?_153                                   ; 29C5 _ E9, 0000016C

?_144:  mov     edx, dword [ebp-4H]                     ; 29CA _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 29CD _ 8B. 45, 1C
        add     eax, edx                                ; 29D0 _ 01. D0
        movzx   eax, byte [eax]                         ; 29D2 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 29D5 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 29D8 _ 80. 7D, FB, 00
        jns     ?_145                                   ; 29DC _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 29DE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 29E1 _ 8B. 55, 14
        add     eax, edx                                ; 29E4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 29E6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 29EA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 29EC _ 8B. 45, 10
        add     eax, edx                                ; 29EF _ 01. D0
        mov     edx, eax                                ; 29F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 29F3 _ 8B. 45, 08
        add     edx, eax                                ; 29F6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 29F8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 29FC _ 88. 02
?_145:  movsx   eax, byte [ebp-5H]                      ; 29FE _ 0F BE. 45, FB
        and     eax, 40H                                ; 2A02 _ 83. E0, 40
        test    eax, eax                                ; 2A05 _ 85. C0
        jz      ?_146                                   ; 2A07 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2A09 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2A0C _ 8B. 55, 14
        add     eax, edx                                ; 2A0F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2A11 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2A15 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2A17 _ 8B. 45, 10
        add     eax, edx                                ; 2A1A _ 01. D0
        lea     edx, [eax+1H]                           ; 2A1C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A1F _ 8B. 45, 08
        add     edx, eax                                ; 2A22 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2A24 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2A28 _ 88. 02
?_146:  movsx   eax, byte [ebp-5H]                      ; 2A2A _ 0F BE. 45, FB
        and     eax, 20H                                ; 2A2E _ 83. E0, 20
        test    eax, eax                                ; 2A31 _ 85. C0
        jz      ?_147                                   ; 2A33 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2A35 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2A38 _ 8B. 55, 14
        add     eax, edx                                ; 2A3B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2A3D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2A41 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2A43 _ 8B. 45, 10
        add     eax, edx                                ; 2A46 _ 01. D0
        lea     edx, [eax+2H]                           ; 2A48 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2A4B _ 8B. 45, 08
        add     edx, eax                                ; 2A4E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2A50 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2A54 _ 88. 02
?_147:  movsx   eax, byte [ebp-5H]                      ; 2A56 _ 0F BE. 45, FB
        and     eax, 10H                                ; 2A5A _ 83. E0, 10
        test    eax, eax                                ; 2A5D _ 85. C0
        jz      ?_148                                   ; 2A5F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2A61 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2A64 _ 8B. 55, 14
        add     eax, edx                                ; 2A67 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2A69 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2A6D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2A6F _ 8B. 45, 10
        add     eax, edx                                ; 2A72 _ 01. D0
        lea     edx, [eax+3H]                           ; 2A74 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 2A77 _ 8B. 45, 08
        add     edx, eax                                ; 2A7A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2A7C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2A80 _ 88. 02
?_148:  movsx   eax, byte [ebp-5H]                      ; 2A82 _ 0F BE. 45, FB
        and     eax, 08H                                ; 2A86 _ 83. E0, 08
        test    eax, eax                                ; 2A89 _ 85. C0
        jz      ?_149                                   ; 2A8B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2A8D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2A90 _ 8B. 55, 14
        add     eax, edx                                ; 2A93 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2A95 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2A99 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2A9B _ 8B. 45, 10
        add     eax, edx                                ; 2A9E _ 01. D0
        lea     edx, [eax+4H]                           ; 2AA0 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2AA3 _ 8B. 45, 08
        add     edx, eax                                ; 2AA6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2AA8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2AAC _ 88. 02
?_149:  movsx   eax, byte [ebp-5H]                      ; 2AAE _ 0F BE. 45, FB
        and     eax, 04H                                ; 2AB2 _ 83. E0, 04
        test    eax, eax                                ; 2AB5 _ 85. C0
        jz      ?_150                                   ; 2AB7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2AB9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2ABC _ 8B. 55, 14
        add     eax, edx                                ; 2ABF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2AC1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2AC5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2AC7 _ 8B. 45, 10
        add     eax, edx                                ; 2ACA _ 01. D0
        lea     edx, [eax+5H]                           ; 2ACC _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 2ACF _ 8B. 45, 08
        add     edx, eax                                ; 2AD2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2AD4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2AD8 _ 88. 02
?_150:  movsx   eax, byte [ebp-5H]                      ; 2ADA _ 0F BE. 45, FB
        and     eax, 02H                                ; 2ADE _ 83. E0, 02
        test    eax, eax                                ; 2AE1 _ 85. C0
        jz      ?_151                                   ; 2AE3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2AE5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2AE8 _ 8B. 55, 14
        add     eax, edx                                ; 2AEB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2AED _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2AF1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2AF3 _ 8B. 45, 10
        add     eax, edx                                ; 2AF6 _ 01. D0
        lea     edx, [eax+6H]                           ; 2AF8 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 2AFB _ 8B. 45, 08
        add     edx, eax                                ; 2AFE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2B00 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2B04 _ 88. 02
?_151:  movsx   eax, byte [ebp-5H]                      ; 2B06 _ 0F BE. 45, FB
        and     eax, 01H                                ; 2B0A _ 83. E0, 01
        test    eax, eax                                ; 2B0D _ 85. C0
        jz      ?_152                                   ; 2B0F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2B11 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2B14 _ 8B. 55, 14
        add     eax, edx                                ; 2B17 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2B19 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2B1D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2B1F _ 8B. 45, 10
        add     eax, edx                                ; 2B22 _ 01. D0
        lea     edx, [eax+7H]                           ; 2B24 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 2B27 _ 8B. 45, 08
        add     edx, eax                                ; 2B2A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2B2C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2B30 _ 88. 02
?_152:  add     dword [ebp-4H], 1                       ; 2B32 _ 83. 45, FC, 01
?_153:  cmp     dword [ebp-4H], 15                      ; 2B36 _ 83. 7D, FC, 0F
        jle     ?_144                                   ; 2B3A _ 0F 8E, FFFFFE8A
        leave                                           ; 2B40 _ C9
        ret                                             ; 2B41 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 2B42 _ 55
        mov     ebp, esp                                ; 2B43 _ 89. E5
        sub     esp, 20                                 ; 2B45 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2B48 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 2B4B _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 2B4E _ C7. 45, F8, 00000000
        jmp     ?_160                                   ; 2B55 _ E9, 000000B1

?_154:  mov     dword [ebp-4H], 0                       ; 2B5A _ C7. 45, FC, 00000000
        jmp     ?_159                                   ; 2B61 _ E9, 00000097

?_155:  mov     eax, dword [ebp-8H]                     ; 2B66 _ 8B. 45, F8
        shl     eax, 4                                  ; 2B69 _ C1. E0, 04
        mov     edx, eax                                ; 2B6C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B6E _ 8B. 45, FC
        add     eax, edx                                ; 2B71 _ 01. D0
        add     eax, cursor.2100                        ; 2B73 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2B78 _ 0F B6. 00
        cmp     al, 42                                  ; 2B7B _ 3C, 2A
        jnz     ?_156                                   ; 2B7D _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2B7F _ 8B. 45, F8
        shl     eax, 4                                  ; 2B82 _ C1. E0, 04
        mov     edx, eax                                ; 2B85 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B87 _ 8B. 45, FC
        add     eax, edx                                ; 2B8A _ 01. D0
        mov     edx, eax                                ; 2B8C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B8E _ 8B. 45, 08
        add     eax, edx                                ; 2B91 _ 01. D0
        mov     byte [eax], 0                           ; 2B93 _ C6. 00, 00
?_156:  mov     eax, dword [ebp-8H]                     ; 2B96 _ 8B. 45, F8
        shl     eax, 4                                  ; 2B99 _ C1. E0, 04
        mov     edx, eax                                ; 2B9C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B9E _ 8B. 45, FC
        add     eax, edx                                ; 2BA1 _ 01. D0
        add     eax, cursor.2100                        ; 2BA3 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2BA8 _ 0F B6. 00
        cmp     al, 79                                  ; 2BAB _ 3C, 4F
        jnz     ?_157                                   ; 2BAD _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2BAF _ 8B. 45, F8
        shl     eax, 4                                  ; 2BB2 _ C1. E0, 04
        mov     edx, eax                                ; 2BB5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2BB7 _ 8B. 45, FC
        add     eax, edx                                ; 2BBA _ 01. D0
        mov     edx, eax                                ; 2BBC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BBE _ 8B. 45, 08
        add     eax, edx                                ; 2BC1 _ 01. D0
        mov     byte [eax], 7                           ; 2BC3 _ C6. 00, 07
?_157:  mov     eax, dword [ebp-8H]                     ; 2BC6 _ 8B. 45, F8
        shl     eax, 4                                  ; 2BC9 _ C1. E0, 04
        mov     edx, eax                                ; 2BCC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2BCE _ 8B. 45, FC
        add     eax, edx                                ; 2BD1 _ 01. D0
        add     eax, cursor.2100                        ; 2BD3 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2BD8 _ 0F B6. 00
        cmp     al, 46                                  ; 2BDB _ 3C, 2E
        jnz     ?_158                                   ; 2BDD _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 2BDF _ 8B. 45, F8
        shl     eax, 4                                  ; 2BE2 _ C1. E0, 04
        mov     edx, eax                                ; 2BE5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2BE7 _ 8B. 45, FC
        add     eax, edx                                ; 2BEA _ 01. D0
        mov     edx, eax                                ; 2BEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BEE _ 8B. 45, 08
        add     edx, eax                                ; 2BF1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2BF3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2BF7 _ 88. 02
?_158:  add     dword [ebp-4H], 1                       ; 2BF9 _ 83. 45, FC, 01
?_159:  cmp     dword [ebp-4H], 15                      ; 2BFD _ 83. 7D, FC, 0F
        jle     ?_155                                   ; 2C01 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 2C07 _ 83. 45, F8, 01
?_160:  cmp     dword [ebp-8H], 15                      ; 2C0B _ 83. 7D, F8, 0F
        jle     ?_154                                   ; 2C0F _ 0F 8E, FFFFFF45
        leave                                           ; 2C15 _ C9
        ret                                             ; 2C16 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 2C17 _ 55
        mov     ebp, esp                                ; 2C18 _ 89. E5
        sub     esp, 16                                 ; 2C1A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2C1D _ C7. 45, F8, 00000000
        jmp     ?_164                                   ; 2C24 _ EB, 50

?_161:  mov     dword [ebp-4H], 0                       ; 2C26 _ C7. 45, FC, 00000000
        jmp     ?_163                                   ; 2C2D _ EB, 3B

?_162:  mov     eax, dword [ebp-8H]                     ; 2C2F _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 2C32 _ 8B. 55, 1C
        add     eax, edx                                ; 2C35 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2C37 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 2C3B _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 2C3E _ 8B. 4D, 18
        add     edx, ecx                                ; 2C41 _ 01. CA
        add     eax, edx                                ; 2C43 _ 01. D0
        mov     edx, eax                                ; 2C45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C47 _ 8B. 45, 08
        add     edx, eax                                ; 2C4A _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 2C4C _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2C4F _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2C53 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2C55 _ 8B. 45, FC
        add     eax, ecx                                ; 2C58 _ 01. C8
        mov     ecx, eax                                ; 2C5A _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 2C5C _ 8B. 45, 20
        add     eax, ecx                                ; 2C5F _ 01. C8
        movzx   eax, byte [eax]                         ; 2C61 _ 0F B6. 00
        mov     byte [edx], al                          ; 2C64 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2C66 _ 83. 45, FC, 01
?_163:  mov     eax, dword [ebp-4H]                     ; 2C6A _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 2C6D _ 3B. 45, 10
        jl      ?_162                                   ; 2C70 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2C72 _ 83. 45, F8, 01
?_164:  mov     eax, dword [ebp-8H]                     ; 2C76 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 2C79 _ 3B. 45, 14
        jl      ?_161                                   ; 2C7C _ 7C, A8
        leave                                           ; 2C7E _ C9
        ret                                             ; 2C7F _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2C80 _ 55
        mov     ebp, esp                                ; 2C81 _ 89. E5
        sub     esp, 40                                 ; 2C83 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 2C86 _ A1, 00000024(d)
        mov     dword [ebp-0CH], eax                    ; 2C8B _ 89. 45, F4
        movzx   eax, word [?_370]                       ; 2C8E _ 0F B7. 05, 00000028(d)
        cwde                                            ; 2C95 _ 98
        mov     dword [ebp-10H], eax                    ; 2C96 _ 89. 45, F0
        movzx   eax, word [?_371]                       ; 2C99 _ 0F B7. 05, 0000002A(d)
        cwde                                            ; 2CA0 _ 98
        mov     dword [ebp-14H], eax                    ; 2CA1 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 2CA4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2CAC _ C7. 04 24, 00000020
        call    io_out8                                 ; 2CB3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 2CB8 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 2CBC _ C7. 04 24, 00000060
        call    io_in8                                  ; 2CC3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 2CC8 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 2CCB _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 2CCF _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2CD3 _ C7. 04 24, 0000002C(d)
        call    fifo8_put                               ; 2CDA _ E8, FFFFFFFC(rel)
        nop                                             ; 2CDF _ 90
        leave                                           ; 2CE0 _ C9
        ret                                             ; 2CE1 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2CE2 _ 55
        mov     ebp, esp                                ; 2CE3 _ 89. E5
        sub     esp, 4                                  ; 2CE5 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2CE8 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2CEB _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2CEE _ 80. 7D, FC, 09
        jle     ?_165                                   ; 2CF2 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2CF4 _ 0F B6. 45, FC
        add     eax, 55                                 ; 2CF8 _ 83. C0, 37
        jmp     ?_166                                   ; 2CFB _ EB, 07

?_165:  movzx   eax, byte [ebp-4H]                      ; 2CFD _ 0F B6. 45, FC
        add     eax, 48                                 ; 2D01 _ 83. C0, 30
?_166:  leave                                           ; 2D04 _ C9
        ret                                             ; 2D05 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2D06 _ 55
        mov     ebp, esp                                ; 2D07 _ 89. E5
        sub     esp, 24                                 ; 2D09 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2D0C _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2D0F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2D12 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2D19 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2D1D _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2D20 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2D23 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2D27 _ 89. 04 24
        call    charToHexVal                            ; 2D2A _ E8, FFFFFFFC(rel)
        mov     byte [?_363], al                        ; 2D2F _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 2D34 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2D38 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2D3B _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2D3E _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2D42 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2D45 _ 89. 04 24
        call    charToHexVal                            ; 2D48 _ E8, FFFFFFFC(rel)
        mov     byte [?_362], al                        ; 2D4D _ A2, 00000112(d)
        mov     eax, keyval                             ; 2D52 _ B8, 00000110(d)
        leave                                           ; 2D57 _ C9
        ret                                             ; 2D58 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2D59 _ 55
        mov     ebp, esp                                ; 2D5A _ 89. E5
        sub     esp, 16                                 ; 2D5C _ 83. EC, 10
        mov     byte [str.2148], 48                     ; 2D5F _ C6. 05, 000003B4(d), 30
        mov     byte [?_376], 88                        ; 2D66 _ C6. 05, 000003B5(d), 58
        mov     byte [?_377], 0                         ; 2D6D _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 2D74 _ C7. 45, FC, 00000002
        jmp     ?_168                                   ; 2D7B _ EB, 0F

?_167:  mov     eax, dword [ebp-4H]                     ; 2D7D _ 8B. 45, FC
        add     eax, str.2148                           ; 2D80 _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 2D85 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 2D88 _ 83. 45, FC, 01
?_168:  cmp     dword [ebp-4H], 9                       ; 2D8C _ 83. 7D, FC, 09
        jle     ?_167                                   ; 2D90 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2D92 _ C7. 45, F8, 00000009
        jmp     ?_172                                   ; 2D99 _ EB, 40

?_169:  mov     eax, dword [ebp+8H]                     ; 2D9B _ 8B. 45, 08
        and     eax, 0FH                                ; 2D9E _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2DA1 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2DA4 _ 8B. 45, 08
        shr     eax, 4                                  ; 2DA7 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2DAA _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 2DAD _ 83. 7D, F4, 09
        jle     ?_170                                   ; 2DB1 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 2DB3 _ 8B. 45, F4
        add     eax, 55                                 ; 2DB6 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2DB9 _ 8B. 55, F8
        add     edx, str.2148                           ; 2DBC _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2DC2 _ 88. 02
        jmp     ?_171                                   ; 2DC4 _ EB, 11

?_170:  mov     eax, dword [ebp-0CH]                    ; 2DC6 _ 8B. 45, F4
        add     eax, 48                                 ; 2DC9 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2DCC _ 8B. 55, F8
        add     edx, str.2148                           ; 2DCF _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2DD5 _ 88. 02
?_171:  sub     dword [ebp-8H], 1                       ; 2DD7 _ 83. 6D, F8, 01
?_172:  cmp     dword [ebp-8H], 1                       ; 2DDB _ 83. 7D, F8, 01
        jle     ?_173                                   ; 2DDF _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2DE1 _ 83. 7D, 08, 00
        jnz     ?_169                                   ; 2DE5 _ 75, B4
?_173:  mov     eax, str.2148                           ; 2DE7 _ B8, 000003B4(d)
        leave                                           ; 2DEC _ C9
        ret                                             ; 2DED _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2DEE _ 55
        mov     ebp, esp                                ; 2DEF _ 89. E5
        sub     esp, 24                                 ; 2DF1 _ 83. EC, 18
?_174:  mov     dword [esp], 100                        ; 2DF4 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2DFB _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2E00 _ 83. E0, 02
        test    eax, eax                                ; 2E03 _ 85. C0
        jnz     ?_175                                   ; 2E05 _ 75, 02
        jmp     ?_176                                   ; 2E07 _ EB, 02

?_175:  jmp     ?_174                                   ; 2E09 _ EB, E9

?_176:  leave                                           ; 2E0B _ C9
        ret                                             ; 2E0C _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2E0D _ 55
        mov     ebp, esp                                ; 2E0E _ 89. E5
        sub     esp, 24                                 ; 2E10 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2E13 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2E18 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2E20 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2E27 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2E2C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2E31 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2E39 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2E40 _ E8, FFFFFFFC(rel)
        nop                                             ; 2E45 _ 90
        leave                                           ; 2E46 _ C9
        ret                                             ; 2E47 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2E48 _ 55
        mov     ebp, esp                                ; 2E49 _ 89. E5
        sub     esp, 24                                 ; 2E4B _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2E4E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2E53 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2E5B _ C7. 04 24, 00000064
        call    io_out8                                 ; 2E62 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2E67 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2E6C _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2E74 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2E7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2E80 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2E83 _ C6. 40, 03, 00
        nop                                             ; 2E87 _ 90
        leave                                           ; 2E88 _ C9
        ret                                             ; 2E89 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 2E8A _ 55
        mov     ebp, esp                                ; 2E8B _ 89. E5
        sub     esp, 40                                 ; 2E8D _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2E90 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2E98 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2E9F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2EA4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2EAC _ C7. 04 24, 00000020
        call    io_out8                                 ; 2EB3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2EB8 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2EBF _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2EC4 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2EC7 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2ECB _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2ECF _ C7. 04 24, 00000048(d)
        call    fifo8_put                               ; 2ED6 _ E8, FFFFFFFC(rel)
        leave                                           ; 2EDB _ C9
        ret                                             ; 2EDC _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2EDD _ 55
        mov     ebp, esp                                ; 2EDE _ 89. E5
        sub     esp, 4                                  ; 2EE0 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2EE3 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2EE6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2EE9 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2EEC _ 0F B6. 40, 03
        test    al, al                                  ; 2EF0 _ 84. C0
        jnz     ?_178                                   ; 2EF2 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2EF4 _ 80. 7D, FC, FA
        jnz     ?_177                                   ; 2EF8 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2EFA _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2EFD _ C6. 40, 03, 01
?_177:  mov     eax, 0                                  ; 2F01 _ B8, 00000000
        jmp     ?_185                                   ; 2F06 _ E9, 0000010F

?_178:  mov     eax, dword [ebp+8H]                     ; 2F0B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2F0E _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2F12 _ 3C, 01
        jnz     ?_180                                   ; 2F14 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2F16 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2F1A _ 25, 000000C8
        cmp     eax, 8                                  ; 2F1F _ 83. F8, 08
        jnz     ?_179                                   ; 2F22 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2F24 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2F27 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2F2B _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2F2D _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2F30 _ C6. 40, 03, 02
?_179:  mov     eax, 0                                  ; 2F34 _ B8, 00000000
        jmp     ?_185                                   ; 2F39 _ E9, 000000DC

?_180:  mov     eax, dword [ebp+8H]                     ; 2F3E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2F41 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2F45 _ 3C, 02
        jnz     ?_181                                   ; 2F47 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2F49 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2F4C _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2F50 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F53 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2F56 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2F5A _ B8, 00000000
        jmp     ?_185                                   ; 2F5F _ E9, 000000B6

?_181:  mov     eax, dword [ebp+8H]                     ; 2F64 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2F67 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2F6B _ 3C, 03
        jne     ?_184                                   ; 2F6D _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2F73 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2F76 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2F7A _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2F7D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2F80 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2F84 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2F87 _ 0F B6. 00
        movzx   eax, al                                 ; 2F8A _ 0F B6. C0
        and     eax, 07H                                ; 2F8D _ 83. E0, 07
        mov     edx, eax                                ; 2F90 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F92 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2F95 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2F98 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2F9B _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2F9F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2FA2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2FA5 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2FA8 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2FAB _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2FAF _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2FB2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2FB5 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2FB8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2FBB _ 0F B6. 00
        movzx   eax, al                                 ; 2FBE _ 0F B6. C0
        and     eax, 10H                                ; 2FC1 _ 83. E0, 10
        test    eax, eax                                ; 2FC4 _ 85. C0
        jz      ?_182                                   ; 2FC6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2FC8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2FCB _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2FCE _ 0D, FFFFFF00
        mov     edx, eax                                ; 2FD3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2FD5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2FD8 _ 89. 50, 04
?_182:  mov     eax, dword [ebp+8H]                     ; 2FDB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2FDE _ 0F B6. 00
        movzx   eax, al                                 ; 2FE1 _ 0F B6. C0
        and     eax, 20H                                ; 2FE4 _ 83. E0, 20
        test    eax, eax                                ; 2FE7 _ 85. C0
        jz      ?_183                                   ; 2FE9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2FEB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FEE _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2FF1 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2FF6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2FF8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2FFB _ 89. 50, 08
?_183:  mov     eax, dword [ebp+8H]                     ; 2FFE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3001 _ 8B. 40, 08
        neg     eax                                     ; 3004 _ F7. D8
        mov     edx, eax                                ; 3006 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3008 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 300B _ 89. 50, 08
        mov     eax, 1                                  ; 300E _ B8, 00000001
        jmp     ?_185                                   ; 3013 _ EB, 05

?_184:  mov     eax, 4294967295                         ; 3015 _ B8, FFFFFFFF
?_185:  leave                                           ; 301A _ C9
        ret                                             ; 301B _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 301C _ 55
        mov     ebp, esp                                ; 301D _ 89. E5
        sub     esp, 72                                 ; 301F _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3022 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3029 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3030 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3037 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 303E _ 8B. 15, 00000160(d)
        mov     eax, dword [ebp+0CH]                    ; 3044 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3047 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 3049 _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 304D _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3050 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3054 _ 89. 04 24
        call    init_screen8                            ; 3057 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 305C _ 8B. 45, 20
        movsx   eax, al                                 ; 305F _ 0F BE. C0
        mov     dword [esp+14H], ?_353                  ; 3062 _ C7. 44 24, 14, 0000005B(d)
        mov     dword [esp+10H], eax                    ; 306A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 306E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3071 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3075 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3078 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 307C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 307F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3083 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3086 _ 89. 04 24
        call    showString                              ; 3089 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 308E _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3091 _ 89. 04 24
        call    intToHexStr                             ; 3094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3099 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 309C _ 8B. 45, 20
        movsx   eax, al                                 ; 309F _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 30A2 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 30A5 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 30A9 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 30AD _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 30B0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 30B4 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 30B7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 30BB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 30BE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30C2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30C5 _ 89. 04 24
        call    showString                              ; 30C8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 30CD _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 30D1 _ 8B. 45, 20
        movsx   eax, al                                 ; 30D4 _ 0F BE. C0
        mov     dword [esp+14H], ?_354                  ; 30D7 _ C7. 44 24, 14, 00000065(d)
        mov     dword [esp+10H], eax                    ; 30DF _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 30E3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 30E6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 30EA _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 30ED _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 30F1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 30F4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30F8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30FB _ 89. 04 24
        call    showString                              ; 30FE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3103 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3106 _ 8B. 00
        mov     dword [esp], eax                        ; 3108 _ 89. 04 24
        call    intToHexStr                             ; 310B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3110 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3113 _ 8B. 45, 20
        movsx   eax, al                                 ; 3116 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 3119 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 311C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3120 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3124 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3127 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 312B _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 312E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3132 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3135 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3139 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 313C _ 89. 04 24
        call    showString                              ; 313F _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3144 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3148 _ 8B. 45, 20
        movsx   eax, al                                 ; 314B _ 0F BE. C0
        mov     dword [esp+14H], ?_355                  ; 314E _ C7. 44 24, 14, 00000071(d)
        mov     dword [esp+10H], eax                    ; 3156 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 315A _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 315D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3161 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3164 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3168 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 316B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 316F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3172 _ 89. 04 24
        call    showString                              ; 3175 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 317A _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 317D _ 8B. 40, 04
        mov     dword [esp], eax                        ; 3180 _ 89. 04 24
        call    intToHexStr                             ; 3183 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 3188 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 318B _ 8B. 45, 20
        movsx   eax, al                                 ; 318E _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 3191 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 3194 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3198 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 319C _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 319F _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 31A3 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 31A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 31AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 31AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31B4 _ 89. 04 24
        call    showString                              ; 31B7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 31BC _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 31C0 _ 8B. 45, 20
        movsx   eax, al                                 ; 31C3 _ 0F BE. C0
        mov     dword [esp+14H], ?_356                  ; 31C6 _ C7. 44 24, 14, 0000007D(d)
        mov     dword [esp+10H], eax                    ; 31CE _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 31D2 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 31D5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 31D9 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 31DC _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 31E0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 31E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31EA _ 89. 04 24
        call    showString                              ; 31ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 31F2 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 31F5 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 31F8 _ 89. 04 24
        call    intToHexStr                             ; 31FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 3200 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3203 _ 8B. 45, 20
        movsx   eax, al                                 ; 3206 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 3209 _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 320C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3210 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3214 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3217 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 321B _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 321E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3222 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3225 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3229 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 322C _ 89. 04 24
        call    showString                              ; 322F _ E8, FFFFFFFC(rel)
        leave                                           ; 3234 _ C9
        ret                                             ; 3235 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3236 _ 55
        mov     ebp, esp                                ; 3237 _ 89. E5
        sub     esp, 56                                 ; 3239 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 323C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 323F _ 89. 04 24
        call    sheet_alloc                             ; 3242 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3247 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 324A _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 324F _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3257 _ 89. 04 24
        call    memman_alloc_4k                         ; 325A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 325F _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3262 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 326A _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3272 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 327A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 327D _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 3281 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3284 _ 89. 04 24
        call    sheet_setbuf                            ; 3287 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 328C _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 3294 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3297 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 329B _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 329E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32A5 _ 89. 04 24
        call    make_window8                            ; 32A8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 32AD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 32B5 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 32BD _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 32C5 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 32CD _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 32D5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 32D8 _ 89. 04 24
        call    make_textbox8                           ; 32DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 32E0 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 32E8 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 32F0 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 32F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32F7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32FA _ 89. 04 24
        call    sheet_slide                             ; 32FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 3302 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 330A _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 330D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3311 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3314 _ 89. 04 24
        call    sheet_updown                            ; 3317 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 331C _ 8B. 45, F4
        leave                                           ; 331F _ C9
        ret                                             ; 3320 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3321 _ 55
        mov     ebp, esp                                ; 3322 _ 89. E5
        push    ebx                                     ; 3324 _ 53
        sub     esp, 52                                 ; 3325 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3328 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 332B _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 332E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3331 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3334 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3337 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 333A _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 333D _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3340 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3343 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3346 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3349 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 334B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 3353 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3357 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 335F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3367 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 336F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3372 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3376 _ 89. 04 24
        call    boxfill8                                ; 3379 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 337E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3381 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3384 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3387 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 3389 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3391 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 3395 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 339D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 33A5 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 33AD _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 33B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 33B4 _ 89. 04 24
        call    boxfill8                                ; 33B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 33BC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 33BF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 33C2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 33C5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 33C7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 33CB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 33D3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 33DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 33E3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 33EB _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 33EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 33F2 _ 89. 04 24
        call    boxfill8                                ; 33F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 33FA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 33FD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3400 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3403 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3405 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 3409 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 3411 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3419 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3421 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3429 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 342C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3430 _ 89. 04 24
        call    boxfill8                                ; 3433 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3438 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 343B _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 343E _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3441 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3444 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3447 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 344A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 344D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 344F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3453 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3457 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 345F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3463 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 346B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 346E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3472 _ 89. 04 24
        call    boxfill8                                ; 3475 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 347A _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 347D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3480 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3483 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3486 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3489 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 348C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 348F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3491 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3495 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 3499 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 34A1 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 34A5 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 34AD _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 34B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 34B4 _ 89. 04 24
        call    boxfill8                                ; 34B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 34BC _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 34BF _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 34C2 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 34C5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 34C8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 34CB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 34CD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 34D1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 34D5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 34DD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 34E5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 34ED _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 34F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 34F4 _ 89. 04 24
        call    boxfill8                                ; 34F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 34FC _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 34FF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3502 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3505 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3507 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 350F _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 3513 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 351B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 3523 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 352B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 352E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3532 _ 89. 04 24
        call    boxfill8                                ; 3535 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 353A _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 353D _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3540 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3543 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3546 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3549 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 354C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 354F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3551 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3555 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3559 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 355D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 3565 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 356D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3570 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3574 _ 89. 04 24
        call    boxfill8                                ; 3577 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 357C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 357F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3582 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3585 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3588 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 358B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 358E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3591 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3593 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3597 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 359B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 359F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 35A7 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 35AF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 35B2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35B6 _ 89. 04 24
        call    boxfill8                                ; 35B9 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 35BE _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 35C2 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 35C6 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 35C9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 35CD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 35D0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35D4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35D7 _ 89. 04 24
        call    make_wtitle8                            ; 35DA _ E8, FFFFFFFC(rel)
        nop                                             ; 35DF _ 90
        add     esp, 52                                 ; 35E0 _ 83. C4, 34
        pop     ebx                                     ; 35E3 _ 5B
        pop     ebp                                     ; 35E4 _ 5D
        ret                                             ; 35E5 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 35E6 _ 55
        mov     ebp, esp                                ; 35E7 _ 89. E5
        push    ebx                                     ; 35E9 _ 53
        sub     esp, 52                                 ; 35EA _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 35ED _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 35F0 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 35F3 _ 80. 7D, E4, 00
        jz      ?_186                                   ; 35F7 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 35F9 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 35FD _ C6. 45, ED, 0C
        jmp     ?_187                                   ; 3601 _ EB, 08

?_186:  mov     byte [ebp-12H], 8                       ; 3603 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 3607 _ C6. 45, ED, 0F
?_187:  mov     eax, dword [ebp+0CH]                    ; 360B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 360E _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3611 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 3614 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3618 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 361B _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 361E _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3621 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3624 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3626 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 362E _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 3632 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 363A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 3642 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3646 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 364A _ 89. 04 24
        call    boxfill8                                ; 364D _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 3652 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 3656 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 3659 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 365D _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3661 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 3669 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3671 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3674 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3678 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 367B _ 89. 04 24
        call    showString                              ; 367E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3683 _ C7. 45, F0, 00000000
        jmp     ?_195                                   ; 368A _ E9, 00000083

?_188:  mov     dword [ebp-0CH], 0                      ; 368F _ C7. 45, F4, 00000000
        jmp     ?_194                                   ; 3696 _ EB, 70

?_189:  mov     eax, dword [ebp-10H]                    ; 3698 _ 8B. 45, F0
        shl     eax, 4                                  ; 369B _ C1. E0, 04
        mov     edx, eax                                ; 369E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36A0 _ 8B. 45, F4
        add     eax, edx                                ; 36A3 _ 01. D0
        add     eax, closebtn.2219                      ; 36A5 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 36AA _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 36AD _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 36B0 _ 80. 7D, EF, 40
        jnz     ?_190                                   ; 36B4 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 36B6 _ C6. 45, EF, 00
        jmp     ?_193                                   ; 36BA _ EB, 1C

?_190:  cmp     byte [ebp-11H], 36                      ; 36BC _ 80. 7D, EF, 24
        jnz     ?_191                                   ; 36C0 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 36C2 _ C6. 45, EF, 0F
        jmp     ?_193                                   ; 36C6 _ EB, 10

?_191:  cmp     byte [ebp-11H], 81                      ; 36C8 _ 80. 7D, EF, 51
        jnz     ?_192                                   ; 36CC _ 75, 06
        mov     byte [ebp-11H], 8                       ; 36CE _ C6. 45, EF, 08
        jmp     ?_193                                   ; 36D2 _ EB, 04

?_192:  mov     byte [ebp-11H], 7                       ; 36D4 _ C6. 45, EF, 07
?_193:  mov     eax, dword [ebp+0CH]                    ; 36D8 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 36DB _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 36DD _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 36E0 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 36E3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 36E6 _ 8B. 40, 04
        imul    ecx, eax                                ; 36E9 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 36EC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 36EF _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 36F2 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 36F5 _ 8B. 45, F4
        add     eax, ebx                                ; 36F8 _ 01. D8
        add     eax, ecx                                ; 36FA _ 01. C8
        add     edx, eax                                ; 36FC _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 36FE _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3702 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3704 _ 83. 45, F4, 01
?_194:  cmp     dword [ebp-0CH], 15                     ; 3708 _ 83. 7D, F4, 0F
        jle     ?_189                                   ; 370C _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 370E _ 83. 45, F0, 01
?_195:  cmp     dword [ebp-10H], 13                     ; 3712 _ 83. 7D, F0, 0D
        jle     ?_188                                   ; 3716 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 371C _ 83. C4, 34
        pop     ebx                                     ; 371F _ 5B
        pop     ebp                                     ; 3720 _ 5D
        ret                                             ; 3721 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3722 _ 55
        mov     ebp, esp                                ; 3723 _ 89. E5
        push    edi                                     ; 3725 _ 57
        push    esi                                     ; 3726 _ 56
        push    ebx                                     ; 3727 _ 53
        sub     esp, 44                                 ; 3728 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 372B _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 372E _ 8B. 55, 0C
        add     eax, edx                                ; 3731 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3733 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 3736 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 3739 _ 8B. 55, 10
        add     eax, edx                                ; 373C _ 01. D0
        mov     dword [ebp-14H], eax                    ; 373E _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3741 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3744 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3747 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 374A _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 374D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3750 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3753 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3756 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3759 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 375C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 375F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3762 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3764 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3768 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 376C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3770 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3774 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 377C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3780 _ 89. 04 24
        call    boxfill8                                ; 3783 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3788 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 378B _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 378E _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3791 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3794 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3797 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 379A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 379D _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 37A0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 37A3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 37A6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37A9 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 37AB _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 37AF _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 37B3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 37B7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 37BB _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 37C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 37C7 _ 89. 04 24
        call    boxfill8                                ; 37CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 37CF _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 37D2 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 37D5 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 37D8 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 37DB _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 37DE _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 37E1 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 37E4 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 37E7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 37EA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 37ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F0 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 37F2 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 37F6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 37FA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 37FE _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3802 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 380A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 380E _ 89. 04 24
        call    boxfill8                                ; 3811 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3816 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3819 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 381C _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 381F _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3822 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3825 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3828 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 382B _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 382E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3831 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3834 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3837 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3839 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 383D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3841 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3845 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3849 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 3851 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3855 _ 89. 04 24
        call    boxfill8                                ; 3858 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 385D _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3860 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3863 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3866 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3869 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 386C _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 386F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3872 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3875 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3878 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 387A _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 387E _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3881 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3885 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3889 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 388D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3895 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3899 _ 89. 04 24
        call    boxfill8                                ; 389C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 38A1 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 38A4 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 38A7 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 38AA _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 38AD _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 38B0 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 38B3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 38B6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 38B9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38BC _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 38BE _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 38C1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 38C5 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 38C9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 38CD _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 38D1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 38D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 38DD _ 89. 04 24
        call    boxfill8                                ; 38E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 38E5 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 38E8 _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 38EB _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 38EE _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 38F1 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 38F4 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 38F7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 38FA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 38FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3900 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3902 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3906 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3909 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 390D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3911 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 3915 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 391D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3921 _ 89. 04 24
        call    boxfill8                                ; 3924 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3929 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 392C _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 392F _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3932 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3935 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3938 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 393B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 393E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3941 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3944 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3947 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 394A _ 8B. 00
        mov     dword [esp+18H], edi                    ; 394C _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3950 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3954 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3958 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 395C _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3964 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3968 _ 89. 04 24
        call    boxfill8                                ; 396B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3970 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3973 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 3976 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 3979 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 397C _ 8B. 45, 1C
        movzx   ecx, al                                 ; 397F _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3982 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3985 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3988 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 398B _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 398D _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3990 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3994 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 3997 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 399B _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 399F _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 39A3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 39A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39AB _ 89. 04 24
        call    boxfill8                                ; 39AE _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 39B3 _ 83. C4, 2C
        pop     ebx                                     ; 39B6 _ 5B
        pop     esi                                     ; 39B7 _ 5E
        pop     edi                                     ; 39B8 _ 5F
        pop     ebp                                     ; 39B9 _ 5D
        ret                                             ; 39BA _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 39BB _ 55
        mov     ebp, esp                                ; 39BC _ 89. E5
        sub     esp, 56                                 ; 39BE _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 39C1 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 39C8 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 39CD _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 39D5 _ 89. 04 24
        call    memman_alloc                            ; 39D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 39DD _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 39E0 _ 8B. 45, E4
        add     eax, 12                                 ; 39E3 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 39E6 _ C6. 00, 00
        jmp     ?_206                                   ; 39E9 _ E9, 0000011E

?_196:  mov     dword [ebp-10H], 0                      ; 39EE _ C7. 45, F0, 00000000
        jmp     ?_199                                   ; 39F5 _ EB, 2C

?_197:  mov     edx, dword [ebp-0CH]                    ; 39F7 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 39FA _ 8B. 45, F0
        add     eax, edx                                ; 39FD _ 01. D0
        movzx   eax, byte [eax]                         ; 39FF _ 0F B6. 00
        test    al, al                                  ; 3A02 _ 84. C0
        jz      ?_198                                   ; 3A04 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 3A06 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3A09 _ 8B. 45, E4
        add     edx, eax                                ; 3A0C _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3A0E _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 3A11 _ 8B. 45, F0
        add     eax, ecx                                ; 3A14 _ 01. C8
        movzx   eax, byte [eax]                         ; 3A16 _ 0F B6. 00
        mov     byte [edx], al                          ; 3A19 _ 88. 02
        add     dword [ebp-10H], 1                      ; 3A1B _ 83. 45, F0, 01
        jmp     ?_199                                   ; 3A1F _ EB, 02

?_198:  jmp     ?_200                                   ; 3A21 _ EB, 06

?_199:  cmp     dword [ebp-10H], 7                      ; 3A23 _ 83. 7D, F0, 07
        jle     ?_197                                   ; 3A27 _ 7E, CE
?_200:  mov     dword [ebp-14H], 0                      ; 3A29 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3A30 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3A33 _ 8B. 45, E4
        add     eax, edx                                ; 3A36 _ 01. D0
        mov     byte [eax], 46                          ; 3A38 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 3A3B _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3A3F _ C7. 45, EC, 00000000
        jmp     ?_202                                   ; 3A46 _ EB, 1E

?_201:  mov     edx, dword [ebp-10H]                    ; 3A48 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3A4B _ 8B. 45, E4
        add     edx, eax                                ; 3A4E _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3A50 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 3A53 _ 8B. 45, EC
        add     eax, ecx                                ; 3A56 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 3A58 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3A5C _ 88. 02
        add     dword [ebp-10H], 1                      ; 3A5E _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3A62 _ 83. 45, EC, 01
?_202:  cmp     dword [ebp-14H], 2                      ; 3A66 _ 83. 7D, EC, 02
        jle     ?_201                                   ; 3A6A _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3A6C _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3A6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A76 _ 89. 04 24
        call    strcmp                                  ; 3A79 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3A7E _ 83. F8, 01
        jne     ?_205                                   ; 3A81 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 3A87 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 3A8A _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3A8D _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3A92 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A96 _ 89. 04 24
        call    memman_alloc_4k                         ; 3A99 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3A9E _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3AA0 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3AA3 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3AA5 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3AA8 _ 8B. 40, 1C
        mov     edx, eax                                ; 3AAB _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3AAD _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3AB0 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 3AB3 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 3ABA _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 3ABD _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3AC1 _ 0F B7. C0
        shl     eax, 9                                  ; 3AC4 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 3AC7 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 3ACA _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3ACD _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3AD0 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3AD3 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 3ADA _ C7. 45, E8, 00000000
        jmp     ?_204                                   ; 3AE1 _ EB, 1B

?_203:  mov     eax, dword [ebp+0CH]                    ; 3AE3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3AE6 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 3AE8 _ 8B. 45, E8
        add     edx, eax                                ; 3AEB _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 3AED _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 3AF0 _ 8B. 45, E0
        add     eax, ecx                                ; 3AF3 _ 01. C8
        movzx   eax, byte [eax]                         ; 3AF5 _ 0F B6. 00
        mov     byte [edx], al                          ; 3AF8 _ 88. 02
        add     dword [ebp-18H], 1                      ; 3AFA _ 83. 45, E8, 01
?_204:  mov     eax, dword [ebp-18H]                    ; 3AFE _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 3B01 _ 3B. 45, DC
        jl      ?_203                                   ; 3B04 _ 7C, DD
        jmp     ?_207                                   ; 3B06 _ EB, 12

?_205:  add     dword [ebp-0CH], 32                     ; 3B08 _ 83. 45, F4, 20
?_206:  mov     eax, dword [ebp-0CH]                    ; 3B0C _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 3B0F _ 0F B6. 00
        test    al, al                                  ; 3B12 _ 84. C0
        jne     ?_196                                   ; 3B14 _ 0F 85, FFFFFED4
?_207:  mov     edx, dword [ebp-1CH]                    ; 3B1A _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 3B1D _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 3B22 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 3B2A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B2E _ 89. 04 24
        call    memman_free                             ; 3B31 _ E8, FFFFFFFC(rel)
        leave                                           ; 3B36 _ C9
        ret                                             ; 3B37 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 3B38 _ 55
        mov     ebp, esp                                ; 3B39 _ 89. E5
        sub     esp, 40                                 ; 3B3B _ 83. EC, 28
        mov     dword [?_364], 8                        ; 3B3E _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_357                      ; 3B48 _ C7. 04 24, 00000089(d)
        call    cons_putstr                             ; 3B4F _ E8, FFFFFFFC(rel)
        mov     dword [?_364], 8                        ; 3B54 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_365]                      ; 3B5E _ A1, 00000014(d)
        add     eax, 16                                 ; 3B63 _ 83. C0, 10
        mov     dword [?_365], eax                      ; 3B66 _ A3, 00000014(d)
        mov     dword [esp], ?_358                      ; 3B6B _ C7. 04 24, 00000090(d)
        call    cons_putstr                             ; 3B72 _ E8, FFFFFFFC(rel)
        mov     dword [?_364], 8                        ; 3B77 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_365]                      ; 3B81 _ A1, 00000014(d)
        add     eax, 16                                 ; 3B86 _ 83. C0, 10
        mov     dword [?_365], eax                      ; 3B89 _ A3, 00000014(d)
        mov     eax, dword [ebp+8H]                     ; 3B8E _ 8B. 45, 08
        add     eax, 44                                 ; 3B91 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3B94 _ 8B. 00
        mov     dword [esp], eax                        ; 3B96 _ 89. 04 24
        call    intToHexStr                             ; 3B99 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3B9E _ 89. 45, F4
        mov     dword [esp], ?_359                      ; 3BA1 _ C7. 04 24, 000000A0(d)
        call    cons_putstr                             ; 3BA8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3BAD _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3BB0 _ 89. 04 24
        call    cons_putstr                             ; 3BB3 _ E8, FFFFFFFC(rel)
        mov     dword [?_364], 8                        ; 3BB8 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_365]                      ; 3BC2 _ A1, 00000014(d)
        add     eax, 16                                 ; 3BC7 _ 83. C0, 10
        mov     dword [?_365], eax                      ; 3BCA _ A3, 00000014(d)
        call    task_now                                ; 3BCF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3BD4 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3BD7 _ 8B. 45, F0
        add     eax, 48                                 ; 3BDA _ 83. C0, 30
        leave                                           ; 3BDD _ C9
        ret                                             ; 3BDE _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3BDF _ 55
        mov     ebp, esp                                ; 3BE0 _ 89. E5
        sub     esp, 40                                 ; 3BE2 _ 83. EC, 28
        mov     dword [?_364], 8                        ; 3BE5 _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_360                      ; 3BEF _ C7. 04 24, 000000A7(d)
        call    cons_putstr                             ; 3BF6 _ E8, FFFFFFFC(rel)
        mov     dword [?_364], 8                        ; 3BFB _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_365]                      ; 3C05 _ A1, 00000014(d)
        add     eax, 16                                 ; 3C0A _ 83. C0, 10
        mov     dword [?_365], eax                      ; 3C0D _ A3, 00000014(d)
        mov     dword [esp], ?_361                      ; 3C12 _ C7. 04 24, 000000AF(d)
        call    cons_putstr                             ; 3C19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_365]                      ; 3C1E _ A1, 00000014(d)
        add     eax, 16                                 ; 3C23 _ 83. C0, 10
        mov     dword [?_365], eax                      ; 3C26 _ A3, 00000014(d)
        mov     dword [?_364], 8                        ; 3C2B _ C7. 05, 00000010(d), 00000008
        call    task_now                                ; 3C35 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3C3A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3C3D _ 8B. 45, F4
        add     eax, 48                                 ; 3C40 _ 83. C0, 30
        leave                                           ; 3C43 _ C9
        ret                                             ; 3C44 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 3C45 _ 55
        mov     ebp, esp                                ; 3C46 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3C48 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3C4B _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3C51 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3C54 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3C5B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3C5E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3C65 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3C68 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3C6F _ 5D
        ret                                             ; 3C70 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3C71 _ 55
        mov     ebp, esp                                ; 3C72 _ 89. E5
        sub     esp, 16                                 ; 3C74 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3C77 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3C7E _ C7. 45, F8, 00000000
        jmp     ?_209                                   ; 3C85 _ EB, 14

?_208:  mov     eax, dword [ebp+8H]                     ; 3C87 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3C8A _ 8B. 55, F8
        add     edx, 2                                  ; 3C8D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3C90 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3C94 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3C97 _ 83. 45, F8, 01
?_209:  mov     eax, dword [ebp+8H]                     ; 3C9B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C9E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3CA0 _ 3B. 45, F8
        ja      ?_208                                   ; 3CA3 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3CA5 _ 8B. 45, FC
        leave                                           ; 3CA8 _ C9
        ret                                             ; 3CA9 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3CAA _ 55
        mov     ebp, esp                                ; 3CAB _ 89. E5
        sub     esp, 16                                 ; 3CAD _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3CB0 _ C7. 45, F8, 00000000
        jmp     ?_213                                   ; 3CB7 _ E9, 00000085

?_210:  mov     eax, dword [ebp+8H]                     ; 3CBC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3CBF _ 8B. 55, F8
        add     edx, 2                                  ; 3CC2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3CC5 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3CC9 _ 3B. 45, 0C
        jc      ?_212                                   ; 3CCC _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3CCE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3CD1 _ 8B. 55, F8
        add     edx, 2                                  ; 3CD4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3CD7 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3CDA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3CDD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3CE0 _ 8B. 55, F8
        add     edx, 2                                  ; 3CE3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3CE6 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3CE9 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3CEC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3CEF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3CF2 _ 8B. 55, F8
        add     edx, 2                                  ; 3CF5 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3CF8 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3CFB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3CFE _ 8B. 55, F8
        add     edx, 2                                  ; 3D01 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3D04 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3D08 _ 2B. 45, 0C
        mov     edx, eax                                ; 3D0B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3D0D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3D10 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3D13 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3D16 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3D1A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3D1D _ 8B. 55, F8
        add     edx, 2                                  ; 3D20 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3D23 _ 8B. 44 D0, 04
        test    eax, eax                                ; 3D27 _ 85. C0
        jnz     ?_211                                   ; 3D29 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3D2B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D2E _ 8B. 00
        lea     edx, [eax-1H]                           ; 3D30 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3D33 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3D36 _ 89. 10
?_211:  mov     eax, dword [ebp-4H]                     ; 3D38 _ 8B. 45, FC
        jmp     ?_214                                   ; 3D3B _ EB, 17

?_212:  add     dword [ebp-8H], 1                       ; 3D3D _ 83. 45, F8, 01
?_213:  mov     eax, dword [ebp+8H]                     ; 3D41 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D44 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3D46 _ 3B. 45, F8
        ja      ?_210                                   ; 3D49 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3D4F _ B8, 00000000
?_214:  leave                                           ; 3D54 _ C9
        ret                                             ; 3D55 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3D56 _ 55
        mov     ebp, esp                                ; 3D57 _ 89. E5
        push    ebx                                     ; 3D59 _ 53
        sub     esp, 16                                 ; 3D5A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3D5D _ C7. 45, F4, 00000000
        jmp     ?_217                                   ; 3D64 _ EB, 17

?_215:  mov     eax, dword [ebp+8H]                     ; 3D66 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3D69 _ 8B. 55, F4
        add     edx, 2                                  ; 3D6C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3D6F _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3D72 _ 3B. 45, 0C
        jbe     ?_216                                   ; 3D75 _ 76, 02
        jmp     ?_218                                   ; 3D77 _ EB, 0E

?_216:  add     dword [ebp-0CH], 1                      ; 3D79 _ 83. 45, F4, 01
?_217:  mov     eax, dword [ebp+8H]                     ; 3D7D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D80 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3D82 _ 3B. 45, F4
        jg      ?_215                                   ; 3D85 _ 7F, DF
?_218:  cmp     dword [ebp-0CH], 0                      ; 3D87 _ 83. 7D, F4, 00
        jle     ?_220                                   ; 3D8B _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3D91 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3D94 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3D97 _ 8B. 45, 08
        add     edx, 2                                  ; 3D9A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3D9D _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3DA0 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3DA3 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3DA6 _ 8B. 45, 08
        add     ecx, 2                                  ; 3DA9 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3DAC _ 8B. 44 C8, 04
        add     eax, edx                                ; 3DB0 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3DB2 _ 3B. 45, 0C
        jne     ?_220                                   ; 3DB5 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3DBB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3DBE _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3DC1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3DC4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3DC7 _ 8B. 45, 08
        add     edx, 2                                  ; 3DCA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3DCD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3DD1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3DD4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3DD7 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3DDA _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3DDD _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3DE1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3DE4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3DE6 _ 3B. 45, F4
        jle     ?_219                                   ; 3DE9 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3DEB _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3DEE _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3DF1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3DF4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3DF7 _ 8B. 55, F4
        add     edx, 2                                  ; 3DFA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3DFD _ 8B. 04 D0
        cmp     ecx, eax                                ; 3E00 _ 39. C1
        jnz     ?_219                                   ; 3E02 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3E04 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3E07 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3E0A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3E0D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3E10 _ 8B. 45, 08
        add     edx, 2                                  ; 3E13 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3E16 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3E1A _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3E1D _ 8B. 4D, F4
        add     ecx, 2                                  ; 3E20 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3E23 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3E27 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3E2A _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3E2D _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3E30 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3E34 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E37 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3E39 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3E3C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3E3F _ 89. 10
?_219:  mov     eax, 0                                  ; 3E41 _ B8, 00000000
        jmp     ?_226                                   ; 3E46 _ E9, 0000011C

?_220:  mov     eax, dword [ebp+8H]                     ; 3E4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E4E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3E50 _ 3B. 45, F4
        jle     ?_221                                   ; 3E53 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3E55 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3E58 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3E5B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3E5E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3E61 _ 8B. 55, F4
        add     edx, 2                                  ; 3E64 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3E67 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3E6A _ 39. C1
        jnz     ?_221                                   ; 3E6C _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3E6E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3E71 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3E74 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3E77 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3E7A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3E7D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3E80 _ 8B. 55, F4
        add     edx, 2                                  ; 3E83 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3E86 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3E8A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3E8D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3E90 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3E93 _ 8B. 55, F4
        add     edx, 2                                  ; 3E96 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3E99 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3E9D _ B8, 00000000
        jmp     ?_226                                   ; 3EA2 _ E9, 000000C0

?_221:  mov     eax, dword [ebp+8H]                     ; 3EA7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EAA _ 8B. 00
        cmp     eax, 4095                               ; 3EAC _ 3D, 00000FFF
        jg      ?_225                                   ; 3EB1 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3EB7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EBA _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3EBC _ 89. 45, F8
        jmp     ?_223                                   ; 3EBF _ EB, 28

?_222:  mov     eax, dword [ebp-8H]                     ; 3EC1 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3EC4 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3EC7 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3ECA _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3ECD _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3ED0 _ 8B. 45, 08
        add     edx, 2                                  ; 3ED3 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3ED6 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3ED9 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3EDB _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3EDE _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3EE1 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3EE5 _ 83. 6D, F8, 01
?_223:  mov     eax, dword [ebp-8H]                     ; 3EE9 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3EEC _ 3B. 45, F4
        jg      ?_222                                   ; 3EEF _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3EF1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EF4 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3EF6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3EF9 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3EFC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3EFE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F01 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F04 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F07 _ 8B. 00
        cmp     edx, eax                                ; 3F09 _ 39. C2
        jge     ?_224                                   ; 3F0B _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3F0D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3F10 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3F12 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3F15 _ 89. 50, 04
?_224:  mov     eax, dword [ebp+8H]                     ; 3F18 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3F1B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3F1E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3F21 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3F24 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3F27 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3F2A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3F2D _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3F30 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3F33 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3F37 _ B8, 00000000
        jmp     ?_226                                   ; 3F3C _ EB, 29

?_225:  mov     eax, dword [ebp+8H]                     ; 3F3E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F41 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3F44 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F47 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3F4A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3F4D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3F50 _ 8B. 40, 08
        mov     edx, eax                                ; 3F53 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3F55 _ 8B. 45, 10
        add     eax, edx                                ; 3F58 _ 01. D0
        mov     edx, eax                                ; 3F5A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F5C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3F5F _ 89. 50, 08
        mov     eax, 4294967295                         ; 3F62 _ B8, FFFFFFFF
?_226:  add     esp, 16                                 ; 3F67 _ 83. C4, 10
        pop     ebx                                     ; 3F6A _ 5B
        pop     ebp                                     ; 3F6B _ 5D
        ret                                             ; 3F6C _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3F6D _ 55
        mov     ebp, esp                                ; 3F6E _ 89. E5
        sub     esp, 24                                 ; 3F70 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3F73 _ 8B. 45, 0C
        add     eax, 4095                               ; 3F76 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3F7B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3F80 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F83 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F8D _ 89. 04 24
        call    memman_alloc                            ; 3F90 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3F95 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3F98 _ 8B. 45, FC
        leave                                           ; 3F9B _ C9
        ret                                             ; 3F9C _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3F9D _ 55
        mov     ebp, esp                                ; 3F9E _ 89. E5
        sub     esp, 28                                 ; 3FA0 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3FA3 _ 8B. 45, 10
        add     eax, 4095                               ; 3FA6 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3FAB _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3FB0 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3FB3 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3FB6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3FBA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3FBD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FC1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FC4 _ 89. 04 24
        call    memman_free                             ; 3FC7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3FCC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3FCF _ 8B. 45, FC
        leave                                           ; 3FD2 _ C9
        ret                                             ; 3FD3 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 3FD4 _ 55
        mov     ebp, esp                                ; 3FD5 _ 89. E5
        sub     esp, 40                                 ; 3FD7 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 3FDA _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 3FE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FE5 _ 89. 04 24
        call    memman_alloc_4k                         ; 3FE8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3FED _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3FF0 _ 83. 7D, F4, 00
        jnz     ?_227                                   ; 3FF4 _ 75, 0A
        mov     eax, 0                                  ; 3FF6 _ B8, 00000000
        jmp     ?_231                                   ; 3FFB _ E9, 000000A3

?_227:  mov     eax, dword [ebp+10H]                    ; 4000 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4003 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 4007 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 400B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 400E _ 89. 04 24
        call    memman_alloc_4k                         ; 4011 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4016 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4018 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 401B _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 401E _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4021 _ 8B. 40, 04
        test    eax, eax                                ; 4024 _ 85. C0
        jnz     ?_228                                   ; 4026 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 4028 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 402B _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4033 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4037 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 403A _ 89. 04 24
        call    memman_free_4k                          ; 403D _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4042 _ B8, 00000000
        jmp     ?_231                                   ; 4047 _ EB, 5A

?_228:  mov     eax, dword [ebp-0CH]                    ; 4049 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 404C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 404F _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4051 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4054 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4057 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 405A _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 405D _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4060 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4063 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4066 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 406D _ C7. 45, F0, 00000000
        jmp     ?_230                                   ; 4074 _ EB, 21

?_229:  mov     ecx, dword [ebp-0CH]                    ; 4076 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4079 _ 8B. 55, F0
        mov     eax, edx                                ; 407C _ 89. D0
        shl     eax, 3                                  ; 407E _ C1. E0, 03
        add     eax, edx                                ; 4081 _ 01. D0
        shl     eax, 2                                  ; 4083 _ C1. E0, 02
        add     eax, ecx                                ; 4086 _ 01. C8
        add     eax, 1072                               ; 4088 _ 05, 00000430
        mov     dword [eax], 0                          ; 408D _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4093 _ 83. 45, F0, 01
?_230:  cmp     dword [ebp-10H], 255                    ; 4097 _ 81. 7D, F0, 000000FF
        jle     ?_229                                   ; 409E _ 7E, D6
        mov     eax, dword [ebp-0CH]                    ; 40A0 _ 8B. 45, F4
?_231:  leave                                           ; 40A3 _ C9
        ret                                             ; 40A4 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 40A5 _ 55
        mov     ebp, esp                                ; 40A6 _ 89. E5
        sub     esp, 24                                 ; 40A8 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 40AB _ C7. 45, F0, 00000000
        jmp     ?_234                                   ; 40B2 _ EB, 73

?_232:  mov     ecx, dword [ebp+8H]                     ; 40B4 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 40B7 _ 8B. 55, F0
        mov     eax, edx                                ; 40BA _ 89. D0
        shl     eax, 3                                  ; 40BC _ C1. E0, 03
        add     eax, edx                                ; 40BF _ 01. D0
        shl     eax, 2                                  ; 40C1 _ C1. E0, 02
        add     eax, ecx                                ; 40C4 _ 01. C8
        add     eax, 1072                               ; 40C6 _ 05, 00000430
        mov     eax, dword [eax]                        ; 40CB _ 8B. 00
        test    eax, eax                                ; 40CD _ 85. C0
        jnz     ?_233                                   ; 40CF _ 75, 52
        mov     edx, dword [ebp-10H]                    ; 40D1 _ 8B. 55, F0
        mov     eax, edx                                ; 40D4 _ 89. D0
        shl     eax, 3                                  ; 40D6 _ C1. E0, 03
        add     eax, edx                                ; 40D9 _ 01. D0
        shl     eax, 2                                  ; 40DB _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 40DE _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 40E4 _ 8B. 45, 08
        add     eax, edx                                ; 40E7 _ 01. D0
        add     eax, 4                                  ; 40E9 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 40EC _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 40EF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 40F2 _ 8B. 55, F0
        lea     ecx, [edx+4H]                           ; 40F5 _ 8D. 4A, 04
        mov     edx, dword [ebp-0CH]                    ; 40F8 _ 8B. 55, F4
        mov     dword [eax+ecx*4+4H], edx               ; 40FB _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 40FF _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4102 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4109 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 410C _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 4113 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 4118 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 411B _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 411E _ 8B. 45, F4
        jmp     ?_235                                   ; 4121 _ EB, 12

?_233:  add     dword [ebp-10H], 1                      ; 4123 _ 83. 45, F0, 01
?_234:  cmp     dword [ebp-10H], 255                    ; 4127 _ 81. 7D, F0, 000000FF
        jle     ?_232                                   ; 412E _ 7E, 84
        mov     eax, 0                                  ; 4130 _ B8, 00000000
?_235:  leave                                           ; 4135 _ C9
        ret                                             ; 4136 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 4137 _ 55
        mov     ebp, esp                                ; 4138 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 413A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 413D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4140 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4142 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4145 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 4148 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 414B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 414E _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4151 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4154 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4157 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 415A _ 89. 50, 14
        nop                                             ; 415D _ 90
        pop     ebp                                     ; 415E _ 5D
        ret                                             ; 415F _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4160 _ 55
        mov     ebp, esp                                ; 4161 _ 89. E5
        push    edi                                     ; 4163 _ 57
        push    esi                                     ; 4164 _ 56
        push    ebx                                     ; 4165 _ 53
        sub     esp, 60                                 ; 4166 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 4169 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 416C _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 416F _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4172 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4175 _ 8B. 40, 10
        add     eax, 1                                  ; 4178 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 417B _ 3B. 45, 10
        jge     ?_236                                   ; 417E _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4180 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4183 _ 8B. 40, 10
        add     eax, 1                                  ; 4186 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 4189 _ 89. 45, 10
?_236:  cmp     dword [ebp+10H], -1                     ; 418C _ 83. 7D, 10, FF
        jge     ?_237                                   ; 4190 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4192 _ C7. 45, 10, FFFFFFFF
?_237:  mov     eax, dword [ebp+0CH]                    ; 4199 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 419C _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 419F _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 41A2 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 41A5 _ 3B. 45, 10
        jle     ?_244                                   ; 41A8 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 41AE _ 83. 7D, 10, 00
        js      ?_240                                   ; 41B2 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 41B8 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 41BB _ 89. 45, E0
        jmp     ?_239                                   ; 41BE _ EB, 34

?_238:  mov     eax, dword [ebp-20H]                    ; 41C0 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 41C3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 41C6 _ 8B. 45, 08
        add     edx, 4                                  ; 41C9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 41CC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 41D0 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 41D3 _ 8B. 4D, E0
        add     ecx, 4                                  ; 41D6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 41D9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 41DD _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 41E0 _ 8B. 55, E0
        add     edx, 4                                  ; 41E3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 41E6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 41EA _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 41ED _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 41F0 _ 83. 6D, E0, 01
?_239:  mov     eax, dword [ebp-20H]                    ; 41F4 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 41F7 _ 3B. 45, 10
        jg      ?_238                                   ; 41FA _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 41FC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 41FF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4202 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4205 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4208 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 420C _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 420F _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4212 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4215 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4218 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 421B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 421E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4221 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4224 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4227 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 422A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 422D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4230 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4233 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4236 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4239 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 423C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4240 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4244 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4248 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 424C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4250 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4253 _ 89. 04 24
        call    sheet_refreshmap                        ; 4256 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 425B _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 425E _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4261 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4264 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4267 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 426A _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 426D _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4270 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4273 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4276 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4279 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 427C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 427F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4282 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4285 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4288 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 428B _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 428E _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4292 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4296 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 429A _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 429E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 42A2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42A6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42A9 _ 89. 04 24
        call    sheet_refreshsub                        ; 42AC _ E8, FFFFFFFC(rel)
        jmp     ?_251                                   ; 42B1 _ E9, 0000027D

?_240:  mov     eax, dword [ebp+8H]                     ; 42B6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 42B9 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 42BC _ 3B. 45, E4
        jle     ?_243                                   ; 42BF _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 42C1 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 42C4 _ 89. 45, E0
        jmp     ?_242                                   ; 42C7 _ EB, 34

?_241:  mov     eax, dword [ebp-20H]                    ; 42C9 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 42CC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 42CF _ 8B. 45, 08
        add     edx, 4                                  ; 42D2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 42D5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 42D9 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 42DC _ 8B. 4D, E0
        add     ecx, 4                                  ; 42DF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 42E2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 42E6 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 42E9 _ 8B. 55, E0
        add     edx, 4                                  ; 42EC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 42EF _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 42F3 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 42F6 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 42F9 _ 83. 45, E0, 01
?_242:  mov     eax, dword [ebp+8H]                     ; 42FD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4300 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 4303 _ 3B. 45, E0
        jg      ?_241                                   ; 4306 _ 7F, C1
?_243:  mov     eax, dword [ebp+8H]                     ; 4308 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 430B _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 430E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4311 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4314 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4317 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 431A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 431D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4320 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4323 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4326 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4329 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 432C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 432F _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4332 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4335 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4338 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 433B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 433E _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 4341 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4349 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 434D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4351 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4355 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4359 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 435C _ 89. 04 24
        call    sheet_refreshmap                        ; 435F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4364 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4367 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 436A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 436D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4370 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4373 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4376 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4379 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 437C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 437F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4382 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4385 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4388 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 438B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 438E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4391 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4394 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4398 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 43A0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 43A4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 43A8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 43AC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 43B0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 43B3 _ 89. 04 24
        call    sheet_refreshsub                        ; 43B6 _ E8, FFFFFFFC(rel)
        jmp     ?_251                                   ; 43BB _ E9, 00000173

?_244:  mov     eax, dword [ebp-1CH]                    ; 43C0 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 43C3 _ 3B. 45, 10
        jge     ?_251                                   ; 43C6 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 43CC _ 83. 7D, E4, 00
        js      ?_247                                   ; 43D0 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 43D2 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 43D5 _ 89. 45, E0
        jmp     ?_246                                   ; 43D8 _ EB, 34

?_245:  mov     eax, dword [ebp-20H]                    ; 43DA _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 43DD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 43E0 _ 8B. 45, 08
        add     edx, 4                                  ; 43E3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 43E6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 43EA _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 43ED _ 8B. 4D, E0
        add     ecx, 4                                  ; 43F0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 43F3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 43F7 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 43FA _ 8B. 55, E0
        add     edx, 4                                  ; 43FD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4400 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4404 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4407 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 440A _ 83. 45, E0, 01
?_246:  mov     eax, dword [ebp-20H]                    ; 440E _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4411 _ 3B. 45, 10
        jl      ?_245                                   ; 4414 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4416 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4419 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 441C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 441F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4422 _ 89. 54 88, 04
        jmp     ?_250                                   ; 4426 _ EB, 6C

?_247:  mov     eax, dword [ebp+8H]                     ; 4428 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 442B _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 442E _ 89. 45, E0
        jmp     ?_249                                   ; 4431 _ EB, 3A

?_248:  mov     eax, dword [ebp-20H]                    ; 4433 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 4436 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4439 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 443C _ 8B. 55, E0
        add     edx, 4                                  ; 443F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4442 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4446 _ 8B. 45, 08
        add     ecx, 4                                  ; 4449 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 444C _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 4450 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4453 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4456 _ 8B. 45, 08
        add     edx, 4                                  ; 4459 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 445C _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4460 _ 8B. 55, E0
        add     edx, 1                                  ; 4463 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4466 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4469 _ 83. 6D, E0, 01
?_249:  mov     eax, dword [ebp-20H]                    ; 446D _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4470 _ 3B. 45, 10
        jge     ?_248                                   ; 4473 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4475 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4478 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 447B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 447E _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4481 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4485 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4488 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 448B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 448E _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4491 _ 89. 50, 10
?_250:  mov     eax, dword [ebp+0CH]                    ; 4494 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4497 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 449A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 449D _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 44A0 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 44A3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 44A6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 44A9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 44AC _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 44AF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 44B2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 44B5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 44B8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 44BB _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 44BE _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 44C1 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 44C5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 44C9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 44CD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 44D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 44D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 44D8 _ 89. 04 24
        call    sheet_refreshmap                        ; 44DB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 44E0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 44E3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 44E6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 44E9 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 44EC _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 44EF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 44F2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 44F5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 44F8 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 44FB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 44FE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4501 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4504 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4507 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 450A _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 450D _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 4511 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4514 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4518 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 451C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4520 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4524 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4528 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 452B _ 89. 04 24
        call    sheet_refreshsub                        ; 452E _ E8, FFFFFFFC(rel)
?_251:  add     esp, 60                                 ; 4533 _ 83. C4, 3C
        pop     ebx                                     ; 4536 _ 5B
        pop     esi                                     ; 4537 _ 5E
        pop     edi                                     ; 4538 _ 5F
        pop     ebp                                     ; 4539 _ 5D
        ret                                             ; 453A _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 453B _ 55
        mov     ebp, esp                                ; 453C _ 89. E5
        push    edi                                     ; 453E _ 57
        push    esi                                     ; 453F _ 56
        push    ebx                                     ; 4540 _ 53
        sub     esp, 44                                 ; 4541 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 4544 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4547 _ 8B. 40, 18
        test    eax, eax                                ; 454A _ 85. C0
        js      ?_252                                   ; 454C _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 454E _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 4551 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4554 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4557 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 455A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 455D _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4560 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4563 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4566 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4569 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 456C _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 456F _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4572 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4575 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4578 _ 8B. 45, 14
        add     edx, eax                                ; 457B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 457D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4580 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4583 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4586 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4589 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 458C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4590 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4594 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4598 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 459C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 45A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 45A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 45A7 _ 89. 04 24
        call    sheet_refreshsub                        ; 45AA _ E8, FFFFFFFC(rel)
?_252:  mov     eax, 0                                  ; 45AF _ B8, 00000000
        add     esp, 44                                 ; 45B4 _ 83. C4, 2C
        pop     ebx                                     ; 45B7 _ 5B
        pop     esi                                     ; 45B8 _ 5E
        pop     edi                                     ; 45B9 _ 5F
        pop     ebp                                     ; 45BA _ 5D
        ret                                             ; 45BB _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 45BC _ 55
        mov     ebp, esp                                ; 45BD _ 89. E5
        push    esi                                     ; 45BF _ 56
        push    ebx                                     ; 45C0 _ 53
        sub     esp, 48                                 ; 45C1 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 45C4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 45C7 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 45CA _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 45CD _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 45D0 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 45D3 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 45D6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 45D9 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 45DC _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 45DF _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 45E2 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 45E5 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 45E8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 45EB _ 8B. 40, 18
        test    eax, eax                                ; 45EE _ 85. C0
        js      ?_253                                   ; 45F0 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 45F6 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 45F9 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 45FC _ 8B. 45, F4
        add     edx, eax                                ; 45FF _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4601 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4604 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4607 _ 8B. 45, F0
        add     eax, ecx                                ; 460A _ 01. C8
        mov     dword [esp+14H], 0                      ; 460C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4614 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4618 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 461C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 461F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4623 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4626 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 462A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 462D _ 89. 04 24
        call    sheet_refreshmap                        ; 4630 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4635 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4638 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 463B _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 463E _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4641 _ 8B. 55, 14
        add     ecx, edx                                ; 4644 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4646 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4649 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 464C _ 8B. 55, 10
        add     edx, ebx                                ; 464F _ 01. DA
        mov     dword [esp+14H], eax                    ; 4651 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4655 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4659 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 465D _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4660 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4664 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4667 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 466B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 466E _ 89. 04 24
        call    sheet_refreshmap                        ; 4671 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4676 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4679 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 467C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 467F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4682 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4685 _ 8B. 45, F4
        add     edx, eax                                ; 4688 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 468A _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 468D _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4690 _ 8B. 45, F0
        add     eax, ebx                                ; 4693 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4695 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 4699 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 46A1 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 46A5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 46A9 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 46AC _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 46B0 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 46B3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 46B7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 46BA _ 89. 04 24
        call    sheet_refreshsub                        ; 46BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 46C2 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 46C5 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 46C8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 46CB _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 46CE _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 46D1 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 46D4 _ 8B. 4D, 14
        add     ebx, ecx                                ; 46D7 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 46D9 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 46DC _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 46DF _ 8B. 4D, 10
        add     ecx, esi                                ; 46E2 _ 01. F1
        mov     dword [esp+18H], edx                    ; 46E4 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 46E8 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 46EC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 46F0 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 46F4 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 46F7 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 46FB _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 46FE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4702 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4705 _ 89. 04 24
        call    sheet_refreshsub                        ; 4708 _ E8, FFFFFFFC(rel)
?_253:  add     esp, 48                                 ; 470D _ 83. C4, 30
        pop     ebx                                     ; 4710 _ 5B
        pop     esi                                     ; 4711 _ 5E
        pop     ebp                                     ; 4712 _ 5D
        ret                                             ; 4713 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 4714 _ 55
        mov     ebp, esp                                ; 4715 _ 89. E5
        sub     esp, 48                                 ; 4717 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 471A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 471D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 471F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4722 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4725 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4728 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 472B _ 83. 7D, 0C, 00
        jns     ?_254                                   ; 472F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4731 _ C7. 45, 0C, 00000000
?_254:  cmp     dword [ebp+10H], 8                      ; 4738 _ 83. 7D, 10, 08
        jg      ?_255                                   ; 473C _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 473E _ C7. 45, 10, 00000000
?_255:  mov     eax, dword [ebp+8H]                     ; 4745 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4748 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 474B _ 3B. 45, 14
        jge     ?_256                                   ; 474E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4750 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4753 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4756 _ 89. 45, 14
?_256:  mov     eax, dword [ebp+8H]                     ; 4759 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 475C _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 475F _ 3B. 45, 18
        jge     ?_257                                   ; 4762 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4764 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4767 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 476A _ 89. 45, 18
?_257:  mov     eax, dword [ebp+1CH]                    ; 476D _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4770 _ 89. 45, DC
        jmp     ?_264                                   ; 4773 _ E9, 0000011F

?_258:  mov     eax, dword [ebp+8H]                     ; 4778 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 477B _ 8B. 55, DC
        add     edx, 4                                  ; 477E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4781 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4785 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4788 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 478B _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 478D _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4790 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4793 _ 8B. 45, 08
        add     eax, 1044                               ; 4796 _ 05, 00000414
        sub     edx, eax                                ; 479B _ 29. C2
        mov     eax, edx                                ; 479D _ 89. D0
        sar     eax, 2                                  ; 479F _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 47A2 _ 69. C0, 38E38E39
        mov     byte [ebp-26H], al                      ; 47A8 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 47AB _ C7. 45, E4, 00000000
        jmp     ?_263                                   ; 47B2 _ E9, 000000CD

?_259:  mov     eax, dword [ebp-10H]                    ; 47B7 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 47BA _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 47BD _ 8B. 45, E4
        add     eax, edx                                ; 47C0 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 47C2 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 47C5 _ C7. 45, E0, 00000000
        jmp     ?_262                                   ; 47CC _ E9, 000000A0

?_260:  mov     eax, dword [ebp-10H]                    ; 47D1 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 47D4 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 47D7 _ 8B. 45, E0
        add     eax, edx                                ; 47DA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 47DC _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 47DF _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 47E2 _ 3B. 45, FC
        jg      ?_261                                   ; 47E5 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 47EB _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 47EE _ 3B. 45, 14
        jge     ?_261                                   ; 47F1 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 47F3 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 47F6 _ 3B. 45, F8
        jg      ?_261                                   ; 47F9 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 47FB _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 47FE _ 3B. 45, 18
        jge     ?_261                                   ; 4801 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 4803 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4806 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4809 _ 0F AF. 45, E4
        mov     edx, eax                                ; 480D _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 480F _ 8B. 45, E0
        add     eax, edx                                ; 4812 _ 01. D0
        mov     edx, eax                                ; 4814 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4816 _ 8B. 45, F4
        add     eax, edx                                ; 4819 _ 01. D0
        movzx   eax, byte [eax]                         ; 481B _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 481E _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 4821 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4824 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4827 _ 0F AF. 45, F8
        mov     edx, eax                                ; 482B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 482D _ 8B. 45, FC
        add     eax, edx                                ; 4830 _ 01. D0
        mov     edx, eax                                ; 4832 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4834 _ 8B. 45, EC
        add     eax, edx                                ; 4837 _ 01. D0
        movzx   eax, byte [eax]                         ; 4839 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 483C _ 3A. 45, DA
        jnz     ?_261                                   ; 483F _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 4841 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 4845 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4848 _ 8B. 40, 14
        cmp     edx, eax                                ; 484B _ 39. C2
        jz      ?_261                                   ; 484D _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 484F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4852 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4855 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4859 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 485B _ 8B. 45, FC
        add     eax, edx                                ; 485E _ 01. D0
        mov     edx, eax                                ; 4860 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4862 _ 8B. 45, E8
        add     edx, eax                                ; 4865 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 4867 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 486B _ 88. 02
?_261:  add     dword [ebp-20H], 1                      ; 486D _ 83. 45, E0, 01
?_262:  mov     eax, dword [ebp-10H]                    ; 4871 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4874 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4877 _ 3B. 45, E0
        jg      ?_260                                   ; 487A _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4880 _ 83. 45, E4, 01
?_263:  mov     eax, dword [ebp-10H]                    ; 4884 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4887 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 488A _ 3B. 45, E4
        jg      ?_259                                   ; 488D _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4893 _ 83. 45, DC, 01
?_264:  mov     eax, dword [ebp-24H]                    ; 4897 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 489A _ 3B. 45, 20
        jle     ?_258                                   ; 489D _ 0F 8E, FFFFFED5
        leave                                           ; 48A3 _ C9
        ret                                             ; 48A4 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 48A5 _ 55
        mov     ebp, esp                                ; 48A6 _ 89. E5
        sub     esp, 64                                 ; 48A8 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 48AB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 48AE _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 48B1 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 48B4 _ 83. 7D, 0C, 00
        jns     ?_265                                   ; 48B8 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 48BA _ C7. 45, 0C, 00000000
?_265:  cmp     dword [ebp+10H], 0                      ; 48C1 _ 83. 7D, 10, 00
        jns     ?_266                                   ; 48C5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 48C7 _ C7. 45, 10, 00000000
?_266:  mov     eax, dword [ebp+8H]                     ; 48CE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 48D1 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 48D4 _ 3B. 45, 14
        jge     ?_267                                   ; 48D7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 48D9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 48DC _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 48DF _ 89. 45, 14
?_267:  mov     eax, dword [ebp+8H]                     ; 48E2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 48E5 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 48E8 _ 3B. 45, 18
        jge     ?_268                                   ; 48EB _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 48ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 48F0 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 48F3 _ 89. 45, 18
?_268:  mov     eax, dword [ebp+1CH]                    ; 48F6 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 48F9 _ 89. 45, D0
        jmp     ?_279                                   ; 48FC _ E9, 00000147

?_269:  mov     eax, dword [ebp+8H]                     ; 4901 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4904 _ 8B. 55, D0
        add     edx, 4                                  ; 4907 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 490A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 490E _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4911 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4914 _ 8B. 45, 08
        add     eax, 1044                               ; 4917 _ 05, 00000414
        sub     edx, eax                                ; 491C _ 29. C2
        mov     eax, edx                                ; 491E _ 89. D0
        sar     eax, 2                                  ; 4920 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4923 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4929 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 492C _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 492F _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4931 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4934 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4937 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 493A _ 8B. 55, 0C
        sub     edx, eax                                ; 493D _ 29. C2
        mov     eax, edx                                ; 493F _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4941 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4944 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4947 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 494A _ 8B. 55, 10
        sub     edx, eax                                ; 494D _ 29. C2
        mov     eax, edx                                ; 494F _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4951 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4954 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4957 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 495A _ 8B. 55, 14
        sub     edx, eax                                ; 495D _ 29. C2
        mov     eax, edx                                ; 495F _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4961 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 4964 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4967 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 496A _ 8B. 55, 18
        sub     edx, eax                                ; 496D _ 29. C2
        mov     eax, edx                                ; 496F _ 89. D0
        mov     dword [ebp-18H], eax                    ; 4971 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 4974 _ 83. 7D, DC, 00
        jns     ?_270                                   ; 4978 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 497A _ C7. 45, DC, 00000000
?_270:  cmp     dword [ebp-20H], 0                      ; 4981 _ 83. 7D, E0, 00
        jns     ?_271                                   ; 4985 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4987 _ C7. 45, E0, 00000000
?_271:  mov     eax, dword [ebp-10H]                    ; 498E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4991 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4994 _ 3B. 45, E4
        jge     ?_272                                   ; 4997 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4999 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 499C _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 499F _ 89. 45, E4
?_272:  mov     eax, dword [ebp-10H]                    ; 49A2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 49A5 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 49A8 _ 3B. 45, E8
        jge     ?_273                                   ; 49AB _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 49AD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 49B0 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 49B3 _ 89. 45, E8
?_273:  mov     eax, dword [ebp-20H]                    ; 49B6 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 49B9 _ 89. 45, D8
        jmp     ?_278                                   ; 49BC _ EB, 7A

?_274:  mov     eax, dword [ebp-10H]                    ; 49BE _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 49C1 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 49C4 _ 8B. 45, D8
        add     eax, edx                                ; 49C7 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 49C9 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 49CC _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 49CF _ 89. 45, D4
        jmp     ?_277                                   ; 49D2 _ EB, 58

?_275:  mov     eax, dword [ebp-10H]                    ; 49D4 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 49D7 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 49DA _ 8B. 45, D4
        add     eax, edx                                ; 49DD _ 01. D0
        mov     dword [ebp-4H], eax                     ; 49DF _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 49E2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 49E5 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 49E8 _ 0F AF. 45, D8
        mov     edx, eax                                ; 49EC _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 49EE _ 8B. 45, D4
        add     eax, edx                                ; 49F1 _ 01. D0
        mov     edx, eax                                ; 49F3 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 49F5 _ 8B. 45, F4
        add     eax, edx                                ; 49F8 _ 01. D0
        movzx   eax, byte [eax]                         ; 49FA _ 0F B6. 00
        movzx   edx, al                                 ; 49FD _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4A00 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4A03 _ 8B. 40, 14
        cmp     edx, eax                                ; 4A06 _ 39. C2
        jz      ?_276                                   ; 4A08 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4A0A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A0D _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4A10 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4A14 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4A16 _ 8B. 45, FC
        add     eax, edx                                ; 4A19 _ 01. D0
        mov     edx, eax                                ; 4A1B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4A1D _ 8B. 45, EC
        add     edx, eax                                ; 4A20 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 4A22 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 4A26 _ 88. 02
?_276:  add     dword [ebp-2CH], 1                      ; 4A28 _ 83. 45, D4, 01
?_277:  mov     eax, dword [ebp-2CH]                    ; 4A2C _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 4A2F _ 3B. 45, E4
        jl      ?_275                                   ; 4A32 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 4A34 _ 83. 45, D8, 01
?_278:  mov     eax, dword [ebp-28H]                    ; 4A38 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 4A3B _ 3B. 45, E8
        jl      ?_274                                   ; 4A3E _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 4A44 _ 83. 45, D0, 01
?_279:  mov     eax, dword [ebp+8H]                     ; 4A48 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A4B _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 4A4E _ 3B. 45, D0
        jge     ?_269                                   ; 4A51 _ 0F 8D, FFFFFEAA
        nop                                             ; 4A57 _ 90
        leave                                           ; 4A58 _ C9
        ret                                             ; 4A59 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 4A5A _ 55
        mov     ebp, esp                                ; 4A5B _ 89. E5
        sub     esp, 24                                 ; 4A5D _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4A60 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4A63 _ 8B. 40, 18
        test    eax, eax                                ; 4A66 _ 85. C0
        js      ?_280                                   ; 4A68 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 4A6A _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 4A72 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4A75 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4A79 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4A7C _ 89. 04 24
        call    sheet_updown                            ; 4A7F _ E8, FFFFFFFC(rel)
?_280:  mov     eax, dword [ebp+0CH]                    ; 4A84 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 4A87 _ C7. 40, 1C, 00000000
        nop                                             ; 4A8E _ 90
        leave                                           ; 4A8F _ C9
        ret                                             ; 4A90 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 4A91 _ 55
        mov     ebp, esp                                ; 4A92 _ 89. E5
        sub     esp, 40                                 ; 4A94 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 4A97 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4A9F _ C7. 04 24, 00000043
        call    io_out8                                 ; 4AA6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 4AAB _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4AB3 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4ABA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4ABF _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4AC7 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4ACE _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4AD3 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4ADD _ C7. 45, F4, 00000000
        jmp     ?_282                                   ; 4AE4 _ EB, 28

?_281:  mov     eax, dword [ebp-0CH]                    ; 4AE6 _ 8B. 45, F4
        shl     eax, 4                                  ; 4AE9 _ C1. E0, 04
        add     eax, timerctl                           ; 4AEC _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 4AF1 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4AF8 _ 8B. 45, F4
        shl     eax, 4                                  ; 4AFB _ C1. E0, 04
        add     eax, timerctl                           ; 4AFE _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 4B03 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 4B0A _ 83. 45, F4, 01
?_282:  cmp     dword [ebp-0CH], 499                    ; 4B0E _ 81. 7D, F4, 000001F3
        jle     ?_281                                   ; 4B15 _ 7E, CF
        leave                                           ; 4B17 _ C9
        ret                                             ; 4B18 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4B19 _ 55
        mov     ebp, esp                                ; 4B1A _ 89. E5
        sub     esp, 16                                 ; 4B1C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4B1F _ C7. 45, FC, 00000000
        jmp     ?_285                                   ; 4B26 _ EB, 38

?_283:  mov     eax, dword [ebp-4H]                     ; 4B28 _ 8B. 45, FC
        shl     eax, 4                                  ; 4B2B _ C1. E0, 04
        add     eax, timerctl                           ; 4B2E _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4B33 _ 8B. 40, 08
        test    eax, eax                                ; 4B36 _ 85. C0
        jnz     ?_284                                   ; 4B38 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 4B3A _ 8B. 45, FC
        shl     eax, 4                                  ; 4B3D _ C1. E0, 04
        add     eax, timerctl                           ; 4B40 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4B45 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 4B4C _ 8B. 45, FC
        shl     eax, 4                                  ; 4B4F _ C1. E0, 04
        add     eax, timerctl                           ; 4B52 _ 05, 000003C0(d)
        add     eax, 4                                  ; 4B57 _ 83. C0, 04
        jmp     ?_286                                   ; 4B5A _ EB, 12

?_284:  add     dword [ebp-4H], 1                       ; 4B5C _ 83. 45, FC, 01
?_285:  cmp     dword [ebp-4H], 499                     ; 4B60 _ 81. 7D, FC, 000001F3
        jle     ?_283                                   ; 4B67 _ 7E, BF
        mov     eax, 0                                  ; 4B69 _ B8, 00000000
?_286:  leave                                           ; 4B6E _ C9
        ret                                             ; 4B6F _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4B70 _ 55
        mov     ebp, esp                                ; 4B71 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4B73 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4B76 _ C7. 40, 04, 00000000
        nop                                             ; 4B7D _ 90
        pop     ebp                                     ; 4B7E _ 5D
        ret                                             ; 4B7F _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4B80 _ 55
        mov     ebp, esp                                ; 4B81 _ 89. E5
        sub     esp, 4                                  ; 4B83 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4B86 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4B89 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4B8C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4B8F _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4B92 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4B95 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4B98 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4B9C _ 88. 50, 0C
        nop                                             ; 4B9F _ 90
        leave                                           ; 4BA0 _ C9
        ret                                             ; 4BA1 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4BA2 _ 55
        mov     ebp, esp                                ; 4BA3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4BA5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4BA8 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4BAB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4BAD _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4BB0 _ C7. 40, 04, 00000002
        nop                                             ; 4BB7 _ 90
        pop     ebp                                     ; 4BB8 _ 5D
        ret                                             ; 4BB9 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 4BBA _ 55
        mov     ebp, esp                                ; 4BBB _ 89. E5
        sub     esp, 40                                 ; 4BBD _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4BC0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 4BC8 _ C7. 04 24, 00000020
        call    io_out8                                 ; 4BCF _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4BD4 _ A1, 000003C0(d)
        add     eax, 1                                  ; 4BD9 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 4BDC _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 4BE1 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4BE5 _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 4BEC _ E9, 000000B0

?_287:  mov     eax, dword [ebp-0CH]                    ; 4BF1 _ 8B. 45, F4
        shl     eax, 4                                  ; 4BF4 _ C1. E0, 04
        add     eax, timerctl                           ; 4BF7 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4BFC _ 8B. 40, 08
        cmp     eax, 2                                  ; 4BFF _ 83. F8, 02
        jne     ?_288                                   ; 4C02 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 4C08 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C0B _ C1. E0, 04
        add     eax, timerctl                           ; 4C0E _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4C13 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4C16 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 4C19 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C1C _ C1. E0, 04
        add     eax, timerctl                           ; 4C1F _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 4C24 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4C27 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C2A _ C1. E0, 04
        add     eax, timerctl                           ; 4C2D _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4C32 _ 8B. 40, 04
        test    eax, eax                                ; 4C35 _ 85. C0
        jnz     ?_288                                   ; 4C37 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4C39 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C3C _ C1. E0, 04
        add     eax, timerctl                           ; 4C3F _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4C44 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4C4B _ 8B. 45, F4
        shl     eax, 4                                  ; 4C4E _ C1. E0, 04
        add     eax, timerctl                           ; 4C51 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 4C56 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4C5A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4C5D _ 8B. 45, F4
        shl     eax, 4                                  ; 4C60 _ C1. E0, 04
        add     eax, timerctl                           ; 4C63 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 4C68 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4C6B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4C6F _ 89. 04 24
        call    fifo8_put                               ; 4C72 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4C77 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C7A _ C1. E0, 04
        add     eax, timerctl                           ; 4C7D _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 4C82 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4C85 _ A1, 00000000(d)
        cmp     edx, eax                                ; 4C8A _ 39. C2
        jnz     ?_288                                   ; 4C8C _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4C8E _ C6. 45, F3, 01
?_288:  cmp     byte [ebp-0DH], 0                       ; 4C92 _ 80. 7D, F3, 00
        jz      ?_289                                   ; 4C96 _ 74, 05
        call    task_switch                             ; 4C98 _ E8, FFFFFFFC(rel)
?_289:  add     dword [ebp-0CH], 1                      ; 4C9D _ 83. 45, F4, 01
?_290:  cmp     dword [ebp-0CH], 499                    ; 4CA1 _ 81. 7D, F4, 000001F3
        jle     ?_287                                   ; 4CA8 _ 0F 8E, FFFFFF43
        nop                                             ; 4CAE _ 90
        leave                                           ; 4CAF _ C9
        ret                                             ; 4CB0 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4CB1 _ 55
        mov     ebp, esp                                ; 4CB2 _ 89. E5
        mov     eax, timerctl                           ; 4CB4 _ B8, 000003C0(d)
        pop     ebp                                     ; 4CB9 _ 5D
        ret                                             ; 4CBA _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 4CBB _ 55
        mov     ebp, esp                                ; 4CBC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4CBE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4CC1 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4CC4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4CC7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4CCA _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4CCD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4CCF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4CD2 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4CD5 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4CD8 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 4CDB _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4CE2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4CE5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4CEC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4CEF _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4CF6 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4CF9 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 4CFC _ 89. 50, 18
        nop                                             ; 4CFF _ 90
        pop     ebp                                     ; 4D00 _ 5D
        ret                                             ; 4D01 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4D02 _ 55
        mov     ebp, esp                                ; 4D03 _ 89. E5
        sub     esp, 24                                 ; 4D05 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4D08 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 4D0B _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 4D0E _ 83. 7D, 08, 00
        jnz     ?_291                                   ; 4D12 _ 75, 0A
        mov     eax, 4294967295                         ; 4D14 _ B8, FFFFFFFF
        jmp     ?_295                                   ; 4D19 _ E9, 000000AB

?_291:  mov     eax, dword [ebp+8H]                     ; 4D1E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D21 _ 8B. 40, 10
        test    eax, eax                                ; 4D24 _ 85. C0
        jnz     ?_292                                   ; 4D26 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 4D28 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 4D2B _ 8B. 40, 14
        or      eax, 01H                                ; 4D2E _ 83. C8, 01
        mov     edx, eax                                ; 4D31 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4D33 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 4D36 _ 89. 50, 14
        mov     eax, 4294967295                         ; 4D39 _ B8, FFFFFFFF
        jmp     ?_295                                   ; 4D3E _ E9, 00000086

?_292:  mov     eax, dword [ebp+8H]                     ; 4D43 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4D46 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4D48 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D4B _ 8B. 40, 04
        add     edx, eax                                ; 4D4E _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 4D50 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 4D54 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 4D56 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D59 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4D5C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4D5F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4D62 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4D65 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4D68 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4D6B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4D6E _ 8B. 40, 0C
        cmp     edx, eax                                ; 4D71 _ 39. C2
        jnz     ?_293                                   ; 4D73 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4D75 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4D78 _ C7. 40, 04, 00000000
?_293:  mov     eax, dword [ebp+8H]                     ; 4D7F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D82 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4D85 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D88 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4D8B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4D8E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4D91 _ 8B. 40, 18
        test    eax, eax                                ; 4D94 _ 85. C0
        jz      ?_294                                   ; 4D96 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 4D98 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4D9B _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 4D9E _ 8B. 40, 04
        cmp     eax, 2                                  ; 4DA1 _ 83. F8, 02
        jz      ?_294                                   ; 4DA4 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4DA6 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4DA9 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 4DAC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 4DB4 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 4DBC _ 89. 04 24
        call    task_run                                ; 4DBF _ E8, FFFFFFFC(rel)
?_294:  mov     eax, 0                                  ; 4DC4 _ B8, 00000000
?_295:  leave                                           ; 4DC9 _ C9
        ret                                             ; 4DCA _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 4DCB _ 55
        mov     ebp, esp                                ; 4DCC _ 89. E5
        sub     esp, 16                                 ; 4DCE _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4DD1 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4DD4 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4DD7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4DDA _ 8B. 40, 0C
        cmp     edx, eax                                ; 4DDD _ 39. C2
        jnz     ?_296                                   ; 4DDF _ 75, 07
        mov     eax, 4294967295                         ; 4DE1 _ B8, FFFFFFFF
        jmp     ?_298                                   ; 4DE6 _ EB, 51

?_296:  mov     eax, dword [ebp+8H]                     ; 4DE8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4DEB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4DED _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4DF0 _ 8B. 40, 08
        add     eax, edx                                ; 4DF3 _ 01. D0
        movzx   eax, byte [eax]                         ; 4DF5 _ 0F B6. 00
        movzx   eax, al                                 ; 4DF8 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 4DFB _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4DFE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4E01 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4E04 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E07 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4E0A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4E0D _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4E10 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4E13 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4E16 _ 8B. 40, 0C
        cmp     edx, eax                                ; 4E19 _ 39. C2
        jnz     ?_297                                   ; 4E1B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4E1D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4E20 _ C7. 40, 08, 00000000
?_297:  mov     eax, dword [ebp+8H]                     ; 4E27 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E2A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4E2D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E30 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4E33 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4E36 _ 8B. 45, FC
?_298:  leave                                           ; 4E39 _ C9
        ret                                             ; 4E3A _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 4E3B _ 55
        mov     ebp, esp                                ; 4E3C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4E3E _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4E41 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4E44 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E47 _ 8B. 40, 10
        sub     edx, eax                                ; 4E4A _ 29. C2
        mov     eax, edx                                ; 4E4C _ 89. D0
        pop     ebp                                     ; 4E4E _ 5D
        ret                                             ; 4E4F _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 4E50 _ 55
        mov     ebp, esp                                ; 4E51 _ 89. E5
        sub     esp, 16                                 ; 4E53 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 4E56 _ 83. 7D, 08, 00
        jz      ?_299                                   ; 4E5A _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 4E5C _ 83. 7D, 0C, 00
        jnz     ?_300                                   ; 4E60 _ 75, 0A
?_299:  mov     eax, 0                                  ; 4E62 _ B8, 00000000
        jmp     ?_307                                   ; 4E67 _ E9, 0000009B

?_300:  mov     dword [ebp-4H], 0                       ; 4E6C _ C7. 45, FC, 00000000
        jmp     ?_303                                   ; 4E73 _ EB, 25

?_301:  mov     edx, dword [ebp-4H]                     ; 4E75 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4E78 _ 8B. 45, 08
        add     eax, edx                                ; 4E7B _ 01. D0
        movzx   edx, byte [eax]                         ; 4E7D _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 4E80 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 4E83 _ 8B. 45, 0C
        add     eax, ecx                                ; 4E86 _ 01. C8
        movzx   eax, byte [eax]                         ; 4E88 _ 0F B6. 00
        cmp     dl, al                                  ; 4E8B _ 38. C2
        jz      ?_302                                   ; 4E8D _ 74, 07
        mov     eax, 0                                  ; 4E8F _ B8, 00000000
        jmp     ?_307                                   ; 4E94 _ EB, 71

?_302:  add     dword [ebp-4H], 1                       ; 4E96 _ 83. 45, FC, 01
?_303:  mov     edx, dword [ebp-4H]                     ; 4E9A _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4E9D _ 8B. 45, 08
        add     eax, edx                                ; 4EA0 _ 01. D0
        movzx   eax, byte [eax]                         ; 4EA2 _ 0F B6. 00
        test    al, al                                  ; 4EA5 _ 84. C0
        jz      ?_304                                   ; 4EA7 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 4EA9 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4EAC _ 8B. 45, 0C
        add     eax, edx                                ; 4EAF _ 01. D0
        movzx   eax, byte [eax]                         ; 4EB1 _ 0F B6. 00
        test    al, al                                  ; 4EB4 _ 84. C0
        jnz     ?_301                                   ; 4EB6 _ 75, BD
?_304:  mov     edx, dword [ebp-4H]                     ; 4EB8 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4EBB _ 8B. 45, 08
        add     eax, edx                                ; 4EBE _ 01. D0
        movzx   eax, byte [eax]                         ; 4EC0 _ 0F B6. 00
        test    al, al                                  ; 4EC3 _ 84. C0
        jnz     ?_305                                   ; 4EC5 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 4EC7 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4ECA _ 8B. 45, 0C
        add     eax, edx                                ; 4ECD _ 01. D0
        movzx   eax, byte [eax]                         ; 4ECF _ 0F B6. 00
        test    al, al                                  ; 4ED2 _ 84. C0
        jz      ?_305                                   ; 4ED4 _ 74, 07
        mov     eax, 0                                  ; 4ED6 _ B8, 00000000
        jmp     ?_307                                   ; 4EDB _ EB, 2A

?_305:  mov     edx, dword [ebp-4H]                     ; 4EDD _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4EE0 _ 8B. 45, 08
        add     eax, edx                                ; 4EE3 _ 01. D0
        movzx   eax, byte [eax]                         ; 4EE5 _ 0F B6. 00
        test    al, al                                  ; 4EE8 _ 84. C0
        jz      ?_306                                   ; 4EEA _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 4EEC _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4EEF _ 8B. 45, 0C
        add     eax, edx                                ; 4EF2 _ 01. D0
        movzx   eax, byte [eax]                         ; 4EF4 _ 0F B6. 00
        test    al, al                                  ; 4EF7 _ 84. C0
        jz      ?_306                                   ; 4EF9 _ 74, 07
        mov     eax, 0                                  ; 4EFB _ B8, 00000000
        jmp     ?_307                                   ; 4F00 _ EB, 05

?_306:  mov     eax, 1                                  ; 4F02 _ B8, 00000001
?_307:  leave                                           ; 4F07 _ C9
        ret                                             ; 4F08 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 4F09 _ 55
        mov     ebp, esp                                ; 4F0A _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 4F0C _ 81. 7D, 0C, 000FFFFF
        jbe     ?_308                                   ; 4F13 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4F15 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 4F1C _ 8B. 45, 0C
        shr     eax, 12                                 ; 4F1F _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4F22 _ 89. 45, 0C
?_308:  mov     eax, dword [ebp+0CH]                    ; 4F25 _ 8B. 45, 0C
        mov     edx, eax                                ; 4F28 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F2A _ 8B. 45, 08
        mov     word [eax], dx                          ; 4F2D _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4F30 _ 8B. 45, 10
        mov     edx, eax                                ; 4F33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F35 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4F38 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4F3C _ 8B. 45, 10
        sar     eax, 16                                 ; 4F3F _ C1. F8, 10
        mov     edx, eax                                ; 4F42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F44 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4F47 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4F4A _ 8B. 45, 14
        mov     edx, eax                                ; 4F4D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F4F _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 4F52 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 4F55 _ 8B. 45, 0C
        shr     eax, 16                                 ; 4F58 _ C1. E8, 10
        and     eax, 0FH                                ; 4F5B _ 83. E0, 0F
        mov     edx, eax                                ; 4F5E _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4F60 _ 8B. 45, 14
        sar     eax, 8                                  ; 4F63 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4F66 _ 83. E0, F0
        or      eax, edx                                ; 4F69 _ 09. D0
        mov     edx, eax                                ; 4F6B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F6D _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4F70 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 4F73 _ 8B. 45, 10
        shr     eax, 24                                 ; 4F76 _ C1. E8, 18
        mov     edx, eax                                ; 4F79 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4F7B _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4F7E _ 88. 50, 07
        nop                                             ; 4F81 _ 90
        pop     ebp                                     ; 4F82 _ 5D
        ret                                             ; 4F83 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 4F84 _ 55
        mov     ebp, esp                                ; 4F85 _ 89. E5
        mov     eax, dword [taskctl]                    ; 4F87 _ A1, 00002308(d)
        pop     ebp                                     ; 4F8C _ 5D
        ret                                             ; 4F8D _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 4F8E _ 55
        mov     ebp, esp                                ; 4F8F _ 89. E5
        sub     esp, 16                                 ; 4F91 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4F94 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 4F9A _ 8B. 55, 08
        mov     eax, edx                                ; 4F9D _ 89. D0
        shl     eax, 2                                  ; 4F9F _ C1. E0, 02
        add     eax, edx                                ; 4FA2 _ 01. D0
        shl     eax, 2                                  ; 4FA4 _ C1. E0, 02
        add     eax, ecx                                ; 4FA7 _ 01. C8
        add     eax, 8                                  ; 4FA9 _ 83. C0, 08
        mov     dword [eax], 0                          ; 4FAC _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4FB2 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 4FB8 _ 8B. 55, 08
        mov     eax, edx                                ; 4FBB _ 89. D0
        shl     eax, 2                                  ; 4FBD _ C1. E0, 02
        add     eax, edx                                ; 4FC0 _ 01. D0
        shl     eax, 2                                  ; 4FC2 _ C1. E0, 02
        add     eax, ecx                                ; 4FC5 _ 01. C8
        add     eax, 12                                 ; 4FC7 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4FCA _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4FD0 _ C7. 45, FC, 00000000
        jmp     ?_310                                   ; 4FD7 _ EB, 21

?_309:  mov     ecx, dword [taskctl]                    ; 4FD9 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 4FDF _ 8B. 55, FC
        mov     eax, edx                                ; 4FE2 _ 89. D0
        add     eax, eax                                ; 4FE4 _ 01. C0
        add     eax, edx                                ; 4FE6 _ 01. D0
        shl     eax, 3                                  ; 4FE8 _ C1. E0, 03
        add     eax, ecx                                ; 4FEB _ 01. C8
        add     eax, 16                                 ; 4FED _ 83. C0, 10
        mov     dword [eax], 0                          ; 4FF0 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4FF6 _ 83. 45, FC, 01
?_310:  cmp     dword [ebp-4H], 2                       ; 4FFA _ 83. 7D, FC, 02
        jle     ?_309                                   ; 4FFE _ 7E, D9
        leave                                           ; 5000 _ C9
        ret                                             ; 5001 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5002 _ 55
        mov     ebp, esp                                ; 5003 _ 89. E5
        sub     esp, 40                                 ; 5005 _ 83. EC, 28
        call    get_addr_gdt                            ; 5008 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 500D _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 5010 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 5018 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 501B _ 89. 04 24
        call    memman_alloc_4k                         ; 501E _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5023 _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 5028 _ C7. 45, EC, 00000000
        jmp     ?_312                                   ; 502F _ E9, 00000085

?_311:  mov     edx, dword [taskctl]                    ; 5034 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 503A _ 8B. 45, EC
        imul    eax, eax, 148                           ; 503D _ 69. C0, 00000094
        add     eax, edx                                ; 5043 _ 01. D0
        add     eax, 72                                 ; 5045 _ 83. C0, 48
        mov     dword [eax], 0                          ; 5048 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 504E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 5054 _ 8B. 45, EC
        add     eax, 7                                  ; 5057 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 505A _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5061 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 5064 _ 69. C0, 00000094
        add     eax, ecx                                ; 506A _ 01. C8
        add     eax, 68                                 ; 506C _ 83. C0, 44
        mov     dword [eax], edx                        ; 506F _ 89. 10
        mov     eax, dword [taskctl]                    ; 5071 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 5076 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 5079 _ 69. D2, 00000094
        add     edx, 96                                 ; 507F _ 83. C2, 60
        add     eax, edx                                ; 5082 _ 01. D0
        add     eax, 16                                 ; 5084 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 5087 _ 8B. 55, EC
        add     edx, 7                                  ; 508A _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 508D _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5094 _ 8B. 55, F0
        add     edx, ecx                                ; 5097 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 5099 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 50A1 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 50A5 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 50AD _ 89. 14 24
        call    set_segmdesc                            ; 50B0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 50B5 _ 83. 45, EC, 01
?_312:  cmp     dword [ebp-14H], 4                      ; 50B9 _ 83. 7D, EC, 04
        jle     ?_311                                   ; 50BD _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 50C3 _ C7. 45, EC, 00000000
        jmp     ?_314                                   ; 50CA _ EB, 0F

?_313:  mov     eax, dword [ebp-14H]                    ; 50CC _ 8B. 45, EC
        mov     dword [esp], eax                        ; 50CF _ 89. 04 24
        call    init_task_level                         ; 50D2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 50D7 _ 83. 45, EC, 01
?_314:  cmp     dword [ebp-14H], 2                      ; 50DB _ 83. 7D, EC, 02
        jle     ?_313                                   ; 50DF _ 7E, EB
        call    task_alloc                              ; 50E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 50E6 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 50E9 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 50EC _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 50F3 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 50F6 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 50FD _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 5100 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5107 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 510A _ 89. 04 24
        call    task_add                                ; 510D _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 5112 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5117 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 511A _ 8B. 00
        mov     dword [esp], eax                        ; 511C _ 89. 04 24
        call    load_tr                                 ; 511F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 5124 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5129 _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 512E _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5131 _ 8B. 40, 08
        mov     edx, eax                                ; 5134 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5136 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 513B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 513F _ 89. 04 24
        call    timer_settime                           ; 5142 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5147 _ 8B. 45, F4
        leave                                           ; 514A _ C9
        ret                                             ; 514B _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 514C _ 55
        mov     ebp, esp                                ; 514D _ 89. E5
        sub     esp, 16                                 ; 514F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5152 _ C7. 45, F8, 00000000
        jmp     ?_317                                   ; 5159 _ E9, 00000100

?_315:  mov     edx, dword [taskctl]                    ; 515E _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 5164 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 5167 _ 69. C0, 00000094
        add     eax, edx                                ; 516D _ 01. D0
        add     eax, 72                                 ; 516F _ 83. C0, 48
        mov     eax, dword [eax]                        ; 5172 _ 8B. 00
        test    eax, eax                                ; 5174 _ 85. C0
        jne     ?_316                                   ; 5176 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 517C _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 5181 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 5184 _ 69. D2, 00000094
        add     edx, 64                                 ; 518A _ 83. C2, 40
        add     eax, edx                                ; 518D _ 01. D0
        add     eax, 4                                  ; 518F _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 5192 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5195 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5198 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 519F _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 51A2 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 51A9 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 51AC _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 51B3 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 51B6 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 51BD _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 51C0 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 51C7 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 51CA _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 51D1 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 51D4 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 51DB _ 8B. 45, F8
        add     eax, 1                                  ; 51DE _ 83. C0, 01
        shl     eax, 9                                  ; 51E1 _ C1. E0, 09
        mov     edx, eax                                ; 51E4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 51E6 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 51E9 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 51EC _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 51EF _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 51F6 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 51F9 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 5200 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5203 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 520A _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 520D _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5217 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 521A _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5224 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5227 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 5231 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5234 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 523B _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 523E _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5248 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 524B _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5255 _ 8B. 45, FC
        jmp     ?_318                                   ; 5258 _ EB, 13

?_316:  add     dword [ebp-8H], 1                       ; 525A _ 83. 45, F8, 01
?_317:  cmp     dword [ebp-8H], 4                       ; 525E _ 83. 7D, F8, 04
        jle     ?_315                                   ; 5262 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 5268 _ B8, 00000000
?_318:  leave                                           ; 526D _ C9
        ret                                             ; 526E _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 526F _ 55
        mov     ebp, esp                                ; 5270 _ 89. E5
        sub     esp, 24                                 ; 5272 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5275 _ 83. 7D, 0C, 00
        jns     ?_319                                   ; 5279 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 527B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 527E _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5281 _ 89. 45, 0C
?_319:  cmp     dword [ebp+10H], 0                      ; 5284 _ 83. 7D, 10, 00
        jle     ?_320                                   ; 5288 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 528A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 528D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5290 _ 89. 50, 08
?_320:  mov     eax, dword [ebp+8H]                     ; 5293 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5296 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5299 _ 83. F8, 02
        jnz     ?_321                                   ; 529C _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 529E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 52A1 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 52A4 _ 3B. 45, 0C
        jz      ?_321                                   ; 52A7 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 52A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 52AC _ 89. 04 24
        call    task_remove                             ; 52AF _ E8, FFFFFFFC(rel)
?_321:  mov     eax, dword [ebp+8H]                     ; 52B4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 52B7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 52BA _ 83. F8, 02
        jz      ?_322                                   ; 52BD _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 52BF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 52C2 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 52C5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 52C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 52CB _ 89. 04 24
        call    task_add                                ; 52CE _ E8, FFFFFFFC(rel)
?_322:  mov     eax, dword [taskctl]                    ; 52D3 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 52D8 _ C7. 40, 04, 00000001
        nop                                             ; 52DF _ 90
        leave                                           ; 52E0 _ C9
        ret                                             ; 52E1 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 52E2 _ 55
        mov     ebp, esp                                ; 52E3 _ 89. E5
        sub     esp, 40                                 ; 52E5 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 52E8 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 52EE _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 52F3 _ 8B. 10
        mov     eax, edx                                ; 52F5 _ 89. D0
        shl     eax, 2                                  ; 52F7 _ C1. E0, 02
        add     eax, edx                                ; 52FA _ 01. D0
        shl     eax, 2                                  ; 52FC _ C1. E0, 02
        add     eax, ecx                                ; 52FF _ 01. C8
        add     eax, 8                                  ; 5301 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5304 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5307 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 530A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 530D _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5310 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5314 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5317 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 531A _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 531D _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5320 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5323 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5326 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5329 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 532C _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 532F _ 8B. 00
        cmp     edx, eax                                ; 5331 _ 39. C2
        jnz     ?_323                                   ; 5333 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5335 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5338 _ C7. 40, 04, 00000000
?_323:  mov     eax, dword [taskctl]                    ; 533F _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 5344 _ 8B. 40, 04
        test    eax, eax                                ; 5347 _ 85. C0
        jz      ?_324                                   ; 5349 _ 74, 24
        call    task_switchsub                          ; 534B _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5350 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5356 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 535B _ 8B. 10
        mov     eax, edx                                ; 535D _ 89. D0
        shl     eax, 2                                  ; 535F _ C1. E0, 02
        add     eax, edx                                ; 5362 _ 01. D0
        shl     eax, 2                                  ; 5364 _ C1. E0, 02
        add     eax, ecx                                ; 5367 _ 01. C8
        add     eax, 8                                  ; 5369 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 536C _ 89. 45, EC
?_324:  mov     eax, dword [ebp-14H]                    ; 536F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5372 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5375 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5378 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 537C _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 537F _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5382 _ 8B. 40, 08
        mov     edx, eax                                ; 5385 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5387 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 538C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5390 _ 89. 04 24
        call    timer_settime                           ; 5393 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5398 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 539B _ 3B. 45, F0
        jz      ?_325                                   ; 539E _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 53A0 _ 83. 7D, F4, 00
        jz      ?_325                                   ; 53A4 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 53A6 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 53A9 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 53AB _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 53AF _ C7. 04 24, 00000000
        call    farjmp                                  ; 53B6 _ E8, FFFFFFFC(rel)
?_325:  nop                                             ; 53BB _ 90
        leave                                           ; 53BC _ C9
        ret                                             ; 53BD _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 53BE _ 55
        mov     ebp, esp                                ; 53BF _ 89. E5
        sub     esp, 40                                 ; 53C1 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 53C4 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 53CB _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 53D2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 53D5 _ 8B. 40, 04
        cmp     eax, 2                                  ; 53D8 _ 83. F8, 02
        jnz     ?_326                                   ; 53DB _ 75, 51
        call    task_now                                ; 53DD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 53E2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 53E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 53E8 _ 89. 04 24
        call    task_remove                             ; 53EB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 53F0 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 53F7 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 53FA _ 3B. 45, F4
        jnz     ?_326                                   ; 53FD _ 75, 2F
        call    task_switchsub                          ; 53FF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5404 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5409 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 540C _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5413 _ 83. 7D, F4, 00
        jz      ?_326                                   ; 5417 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5419 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 541C _ 8B. 00
        mov     dword [esp+4H], eax                     ; 541E _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5422 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5429 _ E8, FFFFFFFC(rel)
?_326:  mov     eax, dword [ebp-10H]                    ; 542E _ 8B. 45, F0
        leave                                           ; 5431 _ C9
        ret                                             ; 5432 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5433 _ 55
        mov     ebp, esp                                ; 5434 _ 89. E5
        sub     esp, 16                                 ; 5436 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5439 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 543F _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5444 _ 8B. 10
        mov     eax, edx                                ; 5446 _ 89. D0
        shl     eax, 2                                  ; 5448 _ C1. E0, 02
        add     eax, edx                                ; 544B _ 01. D0
        shl     eax, 2                                  ; 544D _ C1. E0, 02
        add     eax, ecx                                ; 5450 _ 01. C8
        add     eax, 8                                  ; 5452 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5455 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5458 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 545B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 545E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5461 _ 8B. 44 90, 08
        leave                                           ; 5465 _ C9
        ret                                             ; 5466 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5467 _ 55
        mov     ebp, esp                                ; 5468 _ 89. E5
        sub     esp, 16                                 ; 546A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 546D _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5473 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5476 _ 8B. 50, 0C
        mov     eax, edx                                ; 5479 _ 89. D0
        shl     eax, 2                                  ; 547B _ C1. E0, 02
        add     eax, edx                                ; 547E _ 01. D0
        shl     eax, 2                                  ; 5480 _ C1. E0, 02
        add     eax, ecx                                ; 5483 _ 01. C8
        add     eax, 8                                  ; 5485 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5488 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 548B _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 548E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5490 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5493 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5496 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 549A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 549D _ 8B. 00
        lea     edx, [eax+1H]                           ; 549F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 54A2 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 54A5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 54A7 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 54AA _ C7. 40, 04, 00000002
        nop                                             ; 54B1 _ 90
        leave                                           ; 54B2 _ C9
        ret                                             ; 54B3 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 54B4 _ 55
        mov     ebp, esp                                ; 54B5 _ 89. E5
        sub     esp, 16                                 ; 54B7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 54BA _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 54C0 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 54C3 _ 8B. 50, 0C
        mov     eax, edx                                ; 54C6 _ 89. D0
        shl     eax, 2                                  ; 54C8 _ C1. E0, 02
        add     eax, edx                                ; 54CB _ 01. D0
        shl     eax, 2                                  ; 54CD _ C1. E0, 02
        add     eax, ecx                                ; 54D0 _ 01. C8
        add     eax, 8                                  ; 54D2 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 54D5 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 54D8 _ C7. 45, F8, 00000000
        jmp     ?_329                                   ; 54DF _ EB, 23

?_327:  mov     eax, dword [ebp-4H]                     ; 54E1 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 54E4 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 54E7 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 54EB _ 3B. 45, 08
        jnz     ?_328                                   ; 54EE _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 54F0 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 54F3 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 54F6 _ C7. 44 90, 08, 00000000
        jmp     ?_330                                   ; 54FE _ EB, 0E

?_328:  add     dword [ebp-8H], 1                       ; 5500 _ 83. 45, F8, 01
?_329:  mov     eax, dword [ebp-4H]                     ; 5504 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5507 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5509 _ 3B. 45, F8
        jg      ?_327                                   ; 550C _ 7F, D3
?_330:  mov     eax, dword [ebp-4H]                     ; 550E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5511 _ 8B. 00
        lea     edx, [eax-1H]                           ; 5513 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5516 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5519 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 551B _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 551E _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5521 _ 3B. 45, F8
        jle     ?_331                                   ; 5524 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 5526 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5529 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 552C _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 552F _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5532 _ 89. 50, 04
?_331:  mov     eax, dword [ebp-4H]                     ; 5535 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5538 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 553B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 553E _ 8B. 00
        cmp     edx, eax                                ; 5540 _ 39. C2
        jl      ?_332                                   ; 5542 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5544 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5547 _ C7. 40, 04, 00000000
?_332:  mov     eax, dword [ebp+8H]                     ; 554E _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5551 _ C7. 40, 04, 00000001
        jmp     ?_334                                   ; 5558 _ EB, 1B

?_333:  mov     eax, dword [ebp-8H]                     ; 555A _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 555D _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5560 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5563 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5567 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 556A _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 556D _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5571 _ 83. 45, F8, 01
?_334:  mov     eax, dword [ebp-4H]                     ; 5575 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5578 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 557A _ 3B. 45, F8
        jg      ?_333                                   ; 557D _ 7F, DB
        nop                                             ; 557F _ 90
        leave                                           ; 5580 _ C9
        ret                                             ; 5581 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5582 _ 55
        mov     ebp, esp                                ; 5583 _ 89. E5
        sub     esp, 16                                 ; 5585 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5588 _ C7. 45, FC, 00000000
        jmp     ?_337                                   ; 558F _ EB, 24

?_335:  mov     ecx, dword [taskctl]                    ; 5591 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5597 _ 8B. 55, FC
        mov     eax, edx                                ; 559A _ 89. D0
        shl     eax, 2                                  ; 559C _ C1. E0, 02
        add     eax, edx                                ; 559F _ 01. D0
        shl     eax, 2                                  ; 55A1 _ C1. E0, 02
        add     eax, ecx                                ; 55A4 _ 01. C8
        add     eax, 8                                  ; 55A6 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 55A9 _ 8B. 00
        test    eax, eax                                ; 55AB _ 85. C0
        jle     ?_336                                   ; 55AD _ 7E, 02
        jmp     ?_338                                   ; 55AF _ EB, 0A

?_336:  add     dword [ebp-4H], 1                       ; 55B1 _ 83. 45, FC, 01
?_337:  cmp     dword [ebp-4H], 2                       ; 55B5 _ 83. 7D, FC, 02
        jle     ?_335                                   ; 55B9 _ 7E, D6
?_338:  mov     eax, dword [taskctl]                    ; 55BB _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 55C0 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 55C3 _ 89. 10
        mov     eax, dword [taskctl]                    ; 55C5 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 55CA _ C7. 40, 04, 00000000
        leave                                           ; 55D1 _ C9
        ret                                             ; 55D2 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 55D3 _ 55
        mov     ebp, esp                                ; 55D4 _ 89. E5
        sub     esp, 24                                 ; 55D6 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 55D9 _ 8B. 45, 10
        movzx   eax, al                                 ; 55DC _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 55DF _ 8B. 55, 0C
        add     edx, 16                                 ; 55E2 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 55E5 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 55E9 _ 89. 14 24
        call    fifo8_put                               ; 55EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 55F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 55F4 _ 89. 04 24
        call    task_sleep                              ; 55F7 _ E8, FFFFFFFC(rel)
        leave                                           ; 55FC _ C9
        ret                                             ; 55FD _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_339:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_340:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_341:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_342:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_343:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_344:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_345:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_346:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_347:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_348:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 003A _ keyboard
        db 20H, 72H, 65H, 63H, 65H, 69H, 76H, 65H       ; 0042 _  receive
        db 00H                                          ; 004A _ .

?_349:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 004B _ mem.

?_350:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 004F _ cls.

?_351:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0053 _ hlt.

?_352:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0057 _ dir.

?_353:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 005B _ page is:
        db 20H, 00H                                     ; 0063 _  .

?_354:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0065 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 006D _ L: .

?_355:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0071 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0079 _ H: .

?_356:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 007D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0085 _ w: .

?_357:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0089 _ INT OC.

?_358:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 0090 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0098 _ ception.

?_359:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00A0 _ EIP = .

?_360:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00A7 _ INT 0D .

?_361:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00AF _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00B7 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00BF _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00C7 _ ion.


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 0080 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 0088 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 0090 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 0098 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00A0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00A8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00B0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00C8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00D0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 00F0 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 00F8 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0110 _ 0X

?_362:  db 00H                                          ; 0112 _ .

?_363:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0120 _ 29 0 
        dd 00000000H, 00000000H                         ; 0128 _ 0 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2053:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0140 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2100:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01C0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01D0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01E0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01F0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 0210 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0220 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0230 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0240 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0250 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0260 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0268 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0270 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0278 _ ........

closebtn.2219:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0280 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0288 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0290 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0298 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02B0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02B8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02C0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02E0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02F0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02F8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0310 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0318 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0320 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0330 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0340 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0348 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0350 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0358 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

g_hlt:                                                  ; dword
        resd    1                                       ; 0000

key_shift:                                              ; dword
        resd    1                                       ; 0004

caps_lock:                                              ; dword
        resd    1                                       ; 0008

g_Console:                                              ; byte
        resd    1                                       ; 000C

?_364:  resd    1                                       ; 0010

?_365:  resd    1                                       ; 0014

?_366:  resd    1                                       ; 0018

?_367:  resb    1                                       ; 001C

?_368:  resb    3                                       ; 001D

?_369:  resd    1                                       ; 0020

bootInfo:                                               ; qword
        resb    4                                       ; 0024

?_370:  resw    1                                       ; 0028

?_371:  resw    1                                       ; 002A

keyinfo:                                                ; byte
        resb    24                                      ; 002C

?_372:  resd    1                                       ; 0044

mouseinfo:                                              ; byte
        resb    56                                      ; 0048

keybuf:                                                 ; yword
        resb    32                                      ; 0080

mousebuf:                                               ; byte
        resb    128                                     ; 00A0

mdec:                                                   ; oword
        resb    12                                      ; 0120

?_373:  resd    1                                       ; 012C

timerinfo:                                              ; byte
        resb    28                                      ; 0130

timerbuf: resq  1                                       ; 014C

mx:     resd    1                                       ; 0154

my:     resd    1                                       ; 0158

xsize:  resd    1                                       ; 015C

ysize:  resd    1                                       ; 0160

buf_back: resd  7                                       ; 0164

buf_mouse:                                              ; byte
        resb    256                                     ; 0180

shtMsgBox:                                              ; dword
        resd    1                                       ; 0280

shtctl: resd    1                                       ; 0284

sht_back: resd  1                                       ; 0288

sht_mouse:                                              ; dword
        resd    1                                       ; 028C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0290

task_cons:                                              ; dword
        resd    1                                       ; 0294

task_main:                                              ; dword
        resd    1                                       ; 0298

buffer:                                                 ; byte
        resd    1                                       ; 029C

?_374:  resd    1                                       ; 02A0

?_375:  resd    1                                       ; 02A4

task_a.1806:                                            ; dword
        resd    6                                       ; 02A8

tss_a.1805:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1804:                                             ; byte
        resb    104                                     ; 0340

task_b.1794:                                            ; byte
        resb    12                                      ; 03A8

str.2148:                                               ; byte
        resb    1                                       ; 03B4

?_376:  resb    9                                       ; 03B5

?_377:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


