; Disassembly of file: ckernel.o
; Mon Mar 23 18:37:17 2020
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
        movzx   eax, word [?_361]                       ; 001E _ 0F B7. 05, 00000028(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000015C(d)
        movzx   eax, word [?_362]                       ; 002B _ 0F B7. 05, 0000002A(d)
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
        mov     dword [esp+4H], ?_330                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1802], eax                ; 039B _ A3, 000002A4(d)
        mov     eax, dword [task_a.1802]                ; 03A0 _ A1, 000002A4(d)
        mov     dword [?_363], eax                      ; 03A5 _ A3, 00000044(d)
        mov     eax, dword [task_a.1802]                ; 03AA _ A1, 000002A4(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000294(d)
        mov     eax, dword [task_a.1802]                ; 03B4 _ A1, 000002A4(d)
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
        jmp     ?_009                                   ; 043D _ E9, 0000037E

?_002:  mov     dword [esp], keyinfo                    ; 0442 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0449 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 044E _ 85. C0
        je      ?_008                                   ; 0450 _ 0F 84, 00000339
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
        mov     eax, dword [task_cons]                  ; 0488 _ A1, 00000290(d)
        mov     eax, dword [eax+34H]                    ; 048D _ 8B. 40, 34
        test    eax, eax                                ; 0490 _ 85. C0
        jz      ?_003                                   ; 0492 _ 74, 2E
        mov     dword [esp], ?_331                      ; 0494 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 049B _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 04A0 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 04A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 04AA _ 89. 45, B0
        mov     eax, dword [task_cons]                  ; 04AD _ A1, 00000290(d)
        mov     edx, kill_process                       ; 04B2 _ BA, 00000000(d)
        sub     edx, dword [ebp-50H]                    ; 04B7 _ 2B. 55, B0
        mov     dword [eax+4CH], edx                    ; 04BA _ 89. 50, 4C
        call    io_sti                                  ; 04BD _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-38H], 15                     ; 04C2 _ 83. 7D, C8, 0F
        jne     ?_006                                   ; 04C6 _ 0F 85, 0000019A
        mov     dword [ebp-18H], -1                     ; 04CC _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 04D3 _ 83. 7D, EC, 00
        jne     ?_004                                   ; 04D7 _ 0F 85, 00000089
        mov     dword [ebp-14H], 1                      ; 04DD _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 04E4 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 04EA _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 04EF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_332                   ; 04F7 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 04FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0503 _ 89. 04 24
        call    make_wtitle8                            ; 0506 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 050B _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 0510 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_333                   ; 0518 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 0520 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0523 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0527 _ 89. 04 24
        call    make_wtitle8                            ; 052A _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 052F _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0535 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 053A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0542 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 054A _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 054D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0551 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0555 _ 89. 04 24
        call    set_cursor                              ; 0558 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 87                     ; 055D _ C7. 45, E8, 00000057
        jmp     ?_005                                   ; 0564 _ EB, 71

?_004:  mov     dword [ebp-14H], 0                      ; 0566 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 056D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0573 _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 0578 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_332                   ; 0580 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0588 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 058C _ 89. 04 24
        call    make_wtitle8                            ; 058F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0594 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 0599 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_333                   ; 05A1 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 05A9 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 05AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05B0 _ 89. 04 24
        call    make_wtitle8                            ; 05B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_cons]                  ; 05B8 _ A1, 00000290(d)
        add     eax, 16                                 ; 05BD _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 05C0 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05C8 _ 89. 04 24
        call    fifo8_put                               ; 05CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 88                     ; 05D0 _ C7. 45, E8, 00000058
?_005:  mov     eax, dword [shtMsgBox]                  ; 05D7 _ A1, 00000280(d)
        mov     ecx, dword [eax+4H]                     ; 05DC _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 05DF _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 05E5 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 05EA _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 05F2 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 05F6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05FE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0606 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 060A _ 89. 04 24
        call    sheet_refresh                           ; 060D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0612 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0615 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0618 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 061D _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], edx                    ; 0625 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0629 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0631 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-34H]                    ; 0639 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 063C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0640 _ 89. 04 24
        call    sheet_refresh                           ; 0643 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_cons]                  ; 0648 _ 8B. 15, 00000290(d)
        mov     eax, dword [task_a.1802]                ; 064E _ A1, 000002A4(d)
        mov     ecx, dword [ebp-18H]                    ; 0653 _ 8B. 4D, E8
        mov     dword [esp+8H], ecx                     ; 0656 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 065E _ 89. 04 24
        call    send_message                            ; 0661 _ E8, FFFFFFFC(rel)
?_006:  cmp     dword [ebp-14H], 0                      ; 0666 _ 83. 7D, EC, 00
        jne     ?_007                                   ; 066A _ 0F 85, 000000D6
        mov     eax, dword [ebp-38H]                    ; 0670 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0673 _ 89. 04 24
        call    transferScanCode                        ; 0676 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 067B _ 84. C0
        je      ?_009                                   ; 067D _ 0F 84, 0000013D
        cmp     dword [ebp-0CH], 143                    ; 0683 _ 81. 7D, F4, 0000008F
        jg      ?_009                                   ; 068A _ 0F 8F, 00000130
        mov     edx, dword [shtMsgBox]                  ; 0690 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0696 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 069B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 06A3 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06AB _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06AE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06B2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B6 _ 89. 04 24
        call    set_cursor                              ; 06B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-38H]                    ; 06BE _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06C1 _ 89. 04 24
        call    transferScanCode                        ; 06C4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 06C9 _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06CC _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06D0 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 06D3 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 06D7 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06DD _ A1, 00000284(d)
        lea     ecx, [ebp-66H]                          ; 06E2 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 06E5 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 06E9 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 06F1 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06F9 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06FC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0700 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0704 _ 89. 04 24
        call    showString                              ; 0707 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 070C _ 83. 45, F4, 08
        mov     dword [ebp-48H], 1                      ; 0710 _ C7. 45, B8, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0717 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 071D _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0722 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0725 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0729 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0731 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0734 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0738 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 073C _ 89. 04 24
        call    set_cursor                              ; 073F _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0744 _ EB, 7A

?_007:  mov     eax, dword [ebp-38H]                    ; 0746 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0749 _ 89. 04 24
        call    isSpecialKey                            ; 074C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0751 _ 85. C0
        jnz     ?_009                                   ; 0753 _ 75, 6B
        mov     eax, dword [ebp-38H]                    ; 0755 _ 8B. 45, C8
        movzx   eax, al                                 ; 0758 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 075B _ 8B. 15, 00000290(d)
        add     edx, 16                                 ; 0761 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0764 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0768 _ 89. 14 24
        call    fifo8_put                               ; 076B _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0770 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0777 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 077C _ 85. C0
        jnz     ?_009                                   ; 077E _ 75, 40
        mov     eax, dword [task_a.1802]                ; 0780 _ A1, 000002A4(d)
        mov     dword [esp], eax                        ; 0785 _ 89. 04 24
        call    task_sleep                              ; 0788 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 078D _ EB, 31

?_008:  mov     dword [esp], mouseinfo                  ; 078F _ C7. 04 24, 00000048(d)
        call    fifo8_status                            ; 0796 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 079B _ 85. C0
        jz      ?_009                                   ; 079D _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 079F _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 07A5 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 07AB _ A1, 00000284(d)
        mov     dword [esp+8H], ecx                     ; 07B0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07B8 _ 89. 04 24
        call    show_mouse_info                         ; 07BB _ E8, FFFFFFFC(rel)
?_009:  mov     dword [esp], timerinfo                  ; 07C0 _ C7. 04 24, 00000130(d)
        call    fifo8_status                            ; 07C7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07CC _ 85. C0
        je      ?_013                                   ; 07CE _ 0F 84, 000000DB
        call    io_sti                                  ; 07D4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 07D9 _ C7. 04 24, 00000130(d)
        call    fifo8_get                               ; 07E0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 07E5 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 07E8 _ 83. 7D, A8, 00
        jz      ?_010                                   ; 07EC _ 74, 24
        mov     dword [esp+8H], 0                       ; 07EE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 07F6 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 07FE _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0801 _ 89. 04 24
        call    timer_init                              ; 0804 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0809 _ C7. 45, F0, 00000000
        jmp     ?_011                                   ; 0810 _ EB, 22

?_010:  mov     dword [esp+8H], 1                       ; 0812 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 081A _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 0822 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0825 _ 89. 04 24
        call    timer_init                              ; 0828 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 082D _ C7. 45, F0, 00000007
?_011:  mov     dword [esp+4H], 50                      ; 0834 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 083C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 083F _ 89. 04 24
        call    timer_settime                           ; 0842 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0847 _ 83. 7D, EC, 00
        jnz     ?_012                                   ; 084B _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 084D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0853 _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0858 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 085B _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 085F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0867 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 086A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 086E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0872 _ 89. 04 24
        call    set_cursor                              ; 0875 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 087A _ EB, 33

?_012:  mov     edx, dword [shtMsgBox]                  ; 087C _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0882 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 0887 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 088F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0897 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 089A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A2 _ 89. 04 24
        call    set_cursor                              ; 08A5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08AA _ E9, FFFFFB5B

?_013:  jmp     ?_001                                   ; 08AF _ E9, FFFFFB56
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 08B4 _ 55
        mov     ebp, esp                                ; 08B5 _ 89. E5
        push    esi                                     ; 08B7 _ 56
        push    ebx                                     ; 08B8 _ 53
        sub     esp, 32                                 ; 08B9 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 08BC _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 08BF _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 08C2 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 08C5 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 08C8 _ 8B. 45, 18
        movzx   ecx, al                                 ; 08CB _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 08CE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 08D1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 08D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 08D7 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 08D9 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 08DD _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 08E1 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 08E4 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 08E8 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 08EB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 08EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08F7 _ 89. 04 24
        call    boxfill8                                ; 08FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 08FF _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 0902 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 0905 _ 8B. 45, 10
        add     eax, 8                                  ; 0908 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 090B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 090F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0913 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0916 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 091A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 091D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0921 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0924 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0928 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 092B _ 89. 04 24
        call    sheet_refresh                           ; 092E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0933 _ 83. C4, 20
        pop     ebx                                     ; 0936 _ 5B
        pop     esi                                     ; 0937 _ 5E
        pop     ebp                                     ; 0938 _ 5D
        ret                                             ; 0939 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 093A _ 55
        mov     ebp, esp                                ; 093B _ 89. E5
        sub     esp, 24                                 ; 093D _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0940 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0943 _ 89. 04 24
        call    transferScanCode                        ; 0946 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 094B _ 83. 7D, 08, 3A
        jz      ?_014                                   ; 094F _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0951 _ 83. 7D, 08, 1D
        jz      ?_014                                   ; 0955 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0957 _ 81. 7D, 08, 000000BA
        jz      ?_014                                   ; 095E _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0960 _ 83. 7D, 08, 2A
        jz      ?_014                                   ; 0964 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0966 _ 83. 7D, 08, 36
        jz      ?_014                                   ; 096A _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 096C _ 81. 7D, 08, 000000AA
        jz      ?_014                                   ; 0973 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0975 _ 81. 7D, 08, 000000B6
        jnz     ?_015                                   ; 097C _ 75, 07
?_014:  mov     eax, 1                                  ; 097E _ B8, 00000001
        jmp     ?_016                                   ; 0983 _ EB, 05

?_015:  mov     eax, 0                                  ; 0985 _ B8, 00000000
?_016:  leave                                           ; 098A _ C9
        ret                                             ; 098B _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 098C _ 55
        mov     ebp, esp                                ; 098D _ 89. E5
        sub     esp, 16                                 ; 098F _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0992 _ 83. 7D, 08, 2A
        jnz     ?_017                                   ; 0996 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0998 _ A1, 00000000(d)
        or      eax, 01H                                ; 099D _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 09A0 _ A3, 00000000(d)
?_017:  cmp     dword [ebp+8H], 54                      ; 09A5 _ 83. 7D, 08, 36
        jnz     ?_018                                   ; 09A9 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09AB _ A1, 00000000(d)
        or      eax, 02H                                ; 09B0 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 09B3 _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 170                     ; 09B8 _ 81. 7D, 08, 000000AA
        jnz     ?_019                                   ; 09BF _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09C1 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 09C6 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 09C9 _ A3, 00000000(d)
?_019:  cmp     dword [ebp+8H], 182                     ; 09CE _ 81. 7D, 08, 000000B6
        jnz     ?_020                                   ; 09D5 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09D7 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 09DC _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 09DF _ A3, 00000000(d)
?_020:  cmp     dword [ebp+8H], 58                      ; 09E4 _ 83. 7D, 08, 3A
        jnz     ?_022                                   ; 09E8 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 09EA _ A1, 00000000(d)
        test    eax, eax                                ; 09EF _ 85. C0
        jnz     ?_021                                   ; 09F1 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 09F3 _ C7. 05, 00000000(d), 00000001
        jmp     ?_022                                   ; 09FD _ EB, 0A

?_021:  mov     dword [caps_lock], 0                    ; 09FF _ C7. 05, 00000000(d), 00000000
?_022:  cmp     dword [ebp+8H], 42                      ; 0A09 _ 83. 7D, 08, 2A
        jz      ?_023                                   ; 0A0D _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0A0F _ 83. 7D, 08, 36
        jz      ?_023                                   ; 0A13 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0A15 _ 81. 7D, 08, 000000AA
        jz      ?_023                                   ; 0A1C _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0A1E _ 81. 7D, 08, 000000B6
        jz      ?_023                                   ; 0A25 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0A27 _ 83. 7D, 08, 53
        jg      ?_023                                   ; 0A2B _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0A2D _ 83. 7D, 08, 3A
        jnz     ?_024                                   ; 0A31 _ 75, 0A
?_023:  mov     eax, 0                                  ; 0A33 _ B8, 00000000
        jmp     ?_029                                   ; 0A38 _ E9, 00000089

?_024:  mov     byte [ebp-1H], 0                        ; 0A3D _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0A41 _ A1, 00000000(d)
        test    eax, eax                                ; 0A46 _ 85. C0
        jnz     ?_026                                   ; 0A48 _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0A4A _ 83. 7D, 08, 53
        jg      ?_026                                   ; 0A4E _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0A50 _ 8B. 45, 08
        add     eax, keytable                           ; 0A53 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A58 _ 0F B6. 00
        test    al, al                                  ; 0A5B _ 84. C0
        jz      ?_026                                   ; 0A5D _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A5F _ 8B. 45, 08
        add     eax, keytable                           ; 0A62 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A67 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A6A _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A6D _ 80. 7D, FF, 40
        jle     ?_025                                   ; 0A71 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0A73 _ 80. 7D, FF, 5A
        jg      ?_025                                   ; 0A77 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0A79 _ A1, 00000000(d)
        test    eax, eax                                ; 0A7E _ 85. C0
        jnz     ?_025                                   ; 0A80 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0A82 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0A86 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0A89 _ 88. 45, FF
        jmp     ?_028                                   ; 0A8C _ EB, 34

?_025:  jmp     ?_028                                   ; 0A8E _ EB, 32

?_026:  mov     eax, dword [key_shift]                  ; 0A90 _ A1, 00000000(d)
        test    eax, eax                                ; 0A95 _ 85. C0
        jz      ?_027                                   ; 0A97 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0A99 _ 83. 7D, 08, 7F
        jg      ?_027                                   ; 0A9D _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0A9F _ 8B. 45, 08
        add     eax, keytable1                          ; 0AA2 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AA7 _ 0F B6. 00
        test    al, al                                  ; 0AAA _ 84. C0
        jz      ?_027                                   ; 0AAC _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0AAE _ 8B. 45, 08
        add     eax, keytable1                          ; 0AB1 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AB6 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0AB9 _ 88. 45, FF
        jmp     ?_028                                   ; 0ABC _ EB, 04

?_027:  mov     byte [ebp-1H], 0                        ; 0ABE _ C6. 45, FF, 00
?_028:  movzx   eax, byte [ebp-1H]                      ; 0AC2 _ 0F B6. 45, FF
?_029:  leave                                           ; 0AC6 _ C9
        ret                                             ; 0AC7 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0AC8 _ 55
        mov     ebp, esp                                ; 0AC9 _ 89. E5
        push    ebx                                     ; 0ACB _ 53
        sub     esp, 52                                 ; 0ACC _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0ACF _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 0AD4 _ 89. 04 24
        call    sheet_alloc                             ; 0AD7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0ADC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0ADF _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0AE4 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0AEC _ 89. 04 24
        call    memman_alloc_4k                         ; 0AEF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0AF4 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0AF7 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0AFF _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0B07 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0B0F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0B12 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0B16 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B19 _ 89. 04 24
        call    sheet_setbuf                            ; 0B1C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0B21 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 0B26 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_333                   ; 0B2E _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-0CH]                    ; 0B36 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0B39 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B3D _ 89. 04 24
        call    make_window8                            ; 0B40 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0B45 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0B4D _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0B55 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0B5D _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0B65 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0B6D _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B70 _ 89. 04 24
        call    make_textbox8                           ; 0B73 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0B78 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B7D _ 89. 45, EC
        call    get_code32_addr                         ; 0B80 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0B85 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0B88 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0B8B _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0B95 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0B98 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0BA2 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0BA7 _ 2B. 45, E8
        mov     edx, eax                                ; 0BAA _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BAC _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BAF _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BB2 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BB5 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BBC _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0BBF _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0BC6 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0BC9 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0BD0 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0BD3 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0BDD _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0BE0 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BEA _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0BED _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 0BF7 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0BFA _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 0BFD _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0C00 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C03 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C06 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C09 _ 8B. 40, 64
        add     eax, 4                                  ; 0C0C _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0C0F _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0C12 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0C14 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C17 _ 8B. 40, 64
        add     eax, 8                                  ; 0C1A _ 83. C0, 08
        mov     ebx, eax                                ; 0C1D _ 89. C3
        mov     eax, dword [memman]                     ; 0C1F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0C24 _ 89. 04 24
        call    memman_total                            ; 0C27 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0C2C _ 89. 03
        mov     dword [esp+8H], 5                       ; 0C2E _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0C36 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0C3E _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0C41 _ 89. 04 24
        call    task_run                                ; 0C44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C49 _ A1, 00000284(d)
        mov     dword [esp+0CH], 4                      ; 0C4E _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0C56 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0C5E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C61 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C65 _ 89. 04 24
        call    sheet_slide                             ; 0C68 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C6D _ A1, 00000284(d)
        mov     dword [esp+8H], 1                       ; 0C72 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0C7A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C7D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C81 _ 89. 04 24
        call    sheet_updown                            ; 0C84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0C89 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0C8C _ A3, 00000290(d)
        mov     eax, dword [ebp-0CH]                    ; 0C91 _ 8B. 45, F4
        add     esp, 52                                 ; 0C94 _ 83. C4, 34
        pop     ebx                                     ; 0C97 _ 5B
        pop     ebp                                     ; 0C98 _ 5D
        ret                                             ; 0C99 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0C9A _ 55
        mov     ebp, esp                                ; 0C9B _ 89. E5
        sub     esp, 24                                 ; 0C9D _ 83. EC, 18
        mov     edx, dword [g_Console]                  ; 0CA0 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 0CA6 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    cons_newline                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_356]                      ; 0CB7 _ A1, 00000014(d)
        add     eax, 16                                 ; 0CBC _ 83. C0, 10
        mov     dword [?_356], eax                      ; 0CBF _ A3, 00000014(d)
        mov     eax, dword [task_cons]                  ; 0CC4 _ A1, 00000290(d)
        add     eax, 48                                 ; 0CC9 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0CCC _ 89. 04 24
        call    asm_end_app                             ; 0CCF _ E8, FFFFFFFC(rel)
        leave                                           ; 0CD4 _ C9
        ret                                             ; 0CD5 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0CD6 _ 55
        mov     ebp, esp                                ; 0CD7 _ 89. E5
        push    ebx                                     ; 0CD9 _ 53
        sub     esp, 68                                 ; 0CDA _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 0CDD _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0CE4 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0CE9 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0CF1 _ 89. 04 24
        call    memman_alloc                            ; 0CF4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0CF9 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0CFC _ 8B. 45, E8
        add     eax, 12                                 ; 0CFF _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0D02 _ C6. 00, 00
        jmp     ?_037                                   ; 0D05 _ E9, 00000125

?_030:  mov     dword [ebp-10H], 0                      ; 0D0A _ C7. 45, F0, 00000000
        jmp     ?_033                                   ; 0D11 _ EB, 2C

?_031:  mov     edx, dword [ebp-0CH]                    ; 0D13 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0D16 _ 8B. 45, F0
        add     eax, edx                                ; 0D19 _ 01. D0
        movzx   eax, byte [eax]                         ; 0D1B _ 0F B6. 00
        test    al, al                                  ; 0D1E _ 84. C0
        jz      ?_032                                   ; 0D20 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0D22 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D25 _ 8B. 45, E8
        add     edx, eax                                ; 0D28 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D2A _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0D2D _ 8B. 45, F0
        add     eax, ecx                                ; 0D30 _ 01. C8
        movzx   eax, byte [eax]                         ; 0D32 _ 0F B6. 00
        mov     byte [edx], al                          ; 0D35 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D37 _ 83. 45, F0, 01
        jmp     ?_033                                   ; 0D3B _ EB, 02

?_032:  jmp     ?_034                                   ; 0D3D _ EB, 06

?_033:  cmp     dword [ebp-10H], 7                      ; 0D3F _ 83. 7D, F0, 07
        jle     ?_031                                   ; 0D43 _ 7E, CE
?_034:  mov     dword [ebp-14H], 0                      ; 0D45 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0D4C _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D4F _ 8B. 45, E8
        add     eax, edx                                ; 0D52 _ 01. D0
        mov     byte [eax], 46                          ; 0D54 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0D57 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0D5B _ C7. 45, EC, 00000000
        jmp     ?_036                                   ; 0D62 _ EB, 1E

?_035:  mov     edx, dword [ebp-10H]                    ; 0D64 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D67 _ 8B. 45, E8
        add     edx, eax                                ; 0D6A _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D6C _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0D6F _ 8B. 45, EC
        add     eax, ecx                                ; 0D72 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0D74 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0D78 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D7A _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0D7E _ 83. 45, EC, 01
?_036:  cmp     dword [ebp-14H], 2                      ; 0D82 _ 83. 7D, EC, 02
        jle     ?_035                                   ; 0D86 _ 7E, DC
        mov     ecx, dword [?_356]                      ; 0D88 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0D8E _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0D94 _ A1, 00000284(d)
        mov     ebx, dword [ebp-18H]                    ; 0D99 _ 8B. 5D, E8
        mov     dword [esp+14H], ebx                    ; 0D9C _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DA0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DA8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0DAC _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0DB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DB8 _ 89. 04 24
        call    showString                              ; 0DBB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 0DC0 _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0DC7 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0DCA _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0DCD _ 89. 04 24
        call    intToHexStr                             ; 0DD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0DD5 _ 89. 45, E0
        mov     ecx, dword [?_356]                      ; 0DD8 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0DDE _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0DE4 _ A1, 00000284(d)
        mov     ebx, dword [ebp-20H]                    ; 0DE9 _ 8B. 5D, E0
        mov     dword [esp+14H], ebx                    ; 0DEC _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DF0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DF8 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 0DFC _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 0DFF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0E03 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E07 _ 89. 04 24
        call    showString                              ; 0E0A _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 0E0F _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 0E15 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0E1A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E1E _ 89. 04 24
        call    cons_newline                            ; 0E21 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 0E26 _ A3, 00000014(d)
        add     dword [ebp-0CH], 32                     ; 0E2B _ 83. 45, F4, 20
?_037:  mov     eax, dword [ebp-0CH]                    ; 0E2F _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0E32 _ 0F B6. 00
        test    al, al                                  ; 0E35 _ 84. C0
        jne     ?_030                                   ; 0E37 _ 0F 85, FFFFFECD
        mov     edx, dword [ebp-18H]                    ; 0E3D _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 0E40 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 0E45 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 0E4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E51 _ 89. 04 24
        call    memman_free                             ; 0E54 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 0E59 _ 83. C4, 44
        pop     ebx                                     ; 0E5C _ 5B
        pop     ebp                                     ; 0E5D _ 5D
        ret                                             ; 0E5E _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0E5F _ 55
        mov     ebp, esp                                ; 0E60 _ 89. E5
        push    esi                                     ; 0E62 _ 56
        push    ebx                                     ; 0E63 _ 53
        sub     esp, 96                                 ; 0E64 _ 83. EC, 60
        mov     eax, dword [memman]                     ; 0E67 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0E6C _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0E74 _ 89. 04 24
        call    memman_alloc                            ; 0E77 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0E7C _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0E7F _ 8B. 45, DC
        add     eax, 12                                 ; 0E82 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0E85 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0E88 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0E8F _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0E96 _ C7. 45, F0, 00000005
        jmp     ?_040                                   ; 0E9D _ EB, 30

?_038:  mov     edx, dword [ebp-10H]                    ; 0E9F _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0EA2 _ 8B. 45, 08
        add     eax, edx                                ; 0EA5 _ 01. D0
        movzx   eax, byte [eax]                         ; 0EA7 _ 0F B6. 00
        test    al, al                                  ; 0EAA _ 84. C0
        jz      ?_039                                   ; 0EAC _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 0EAE _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0EB1 _ 8B. 45, DC
        add     edx, eax                                ; 0EB4 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0EB6 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        add     eax, ecx                                ; 0EBC _ 01. C8
        movzx   eax, byte [eax]                         ; 0EBE _ 0F B6. 00
        mov     byte [edx], al                          ; 0EC1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0EC3 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 0EC7 _ 83. 45, F0, 01
        jmp     ?_040                                   ; 0ECB _ EB, 02

?_039:  jmp     ?_041                                   ; 0ECD _ EB, 06

?_040:  cmp     dword [ebp-10H], 16                     ; 0ECF _ 83. 7D, F0, 10
        jle     ?_038                                   ; 0ED3 _ 7E, CA
?_041:  mov     edx, dword [ebp-0CH]                    ; 0ED5 _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0ED8 _ 8B. 45, DC
        add     eax, edx                                ; 0EDB _ 01. D0
        mov     byte [eax], 0                           ; 0EDD _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 0EE0 _ C7. 45, EC, 00013400
        jmp     ?_057                                   ; 0EE7 _ E9, 0000023D

?_042:  mov     byte [ebp-2DH], 0                       ; 0EEC _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 0EF0 _ C7. 45, E8, 00000000
        jmp     ?_045                                   ; 0EF7 _ EB, 2C

?_043:  mov     edx, dword [ebp-14H]                    ; 0EF9 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0EFC _ 8B. 45, E8
        add     eax, edx                                ; 0EFF _ 01. D0
        movzx   eax, byte [eax]                         ; 0F01 _ 0F B6. 00
        test    al, al                                  ; 0F04 _ 84. C0
        jz      ?_044                                   ; 0F06 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 0F08 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F0B _ 8B. 45, E8
        add     eax, edx                                ; 0F0E _ 01. D0
        movzx   eax, byte [eax]                         ; 0F10 _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 0F13 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F16 _ 8B. 55, E8
        add     edx, ecx                                ; 0F19 _ 01. CA
        mov     byte [edx], al                          ; 0F1B _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F1D _ 83. 45, E8, 01
        jmp     ?_045                                   ; 0F21 _ EB, 02

?_044:  jmp     ?_046                                   ; 0F23 _ EB, 06

?_045:  cmp     dword [ebp-18H], 7                      ; 0F25 _ 83. 7D, E8, 07
        jle     ?_043                                   ; 0F29 _ 7E, CE
?_046:  mov     dword [ebp-1CH], 0                      ; 0F2B _ C7. 45, E4, 00000000
        lea     edx, [ebp-39H]                          ; 0F32 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0F35 _ 8B. 45, E8
        add     eax, edx                                ; 0F38 _ 01. D0
        mov     byte [eax], 46                          ; 0F3A _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0F3D _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0F41 _ C7. 45, E4, 00000000
        jmp     ?_048                                   ; 0F48 _ EB, 1E

?_047:  mov     edx, dword [ebp-14H]                    ; 0F4A _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0F4D _ 8B. 45, E4
        add     eax, edx                                ; 0F50 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 0F52 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 0F56 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F59 _ 8B. 55, E8
        add     edx, ecx                                ; 0F5C _ 01. CA
        mov     byte [edx], al                          ; 0F5E _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F60 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0F64 _ 83. 45, E4, 01
?_048:  cmp     dword [ebp-1CH], 2                      ; 0F68 _ 83. 7D, E4, 02
        jle     ?_047                                   ; 0F6C _ 7E, DC
        lea     eax, [ebp-39H]                          ; 0F6E _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 0F71 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0F75 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0F78 _ 89. 04 24
        call    strcmp                                  ; 0F7B _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 0F80 _ 83. F8, 01
        jne     ?_056                                   ; 0F83 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 0F89 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-14H]                    ; 0F90 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 0F93 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 0F97 _ 0F B7. C0
        shl     eax, 9                                  ; 0F9A _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 0F9D _ 01. 45, D8
        mov     eax, dword [ebp-14H]                    ; 0FA0 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 0FA3 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 0FA6 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 0FA9 _ C7. 45, E0, 00000000
        mov     dword [?_355], 16                       ; 0FB0 _ C7. 05, 00000010(d), 00000010
        mov     dword [ebp-20H], 0                      ; 0FBA _ C7. 45, E0, 00000000
        jmp     ?_055                                   ; 0FC1 _ E9, 00000150

?_049:  mov     edx, dword [ebp-20H]                    ; 0FC6 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 0FC9 _ 8B. 45, D8
        add     eax, edx                                ; 0FCC _ 01. D0
        movzx   eax, byte [eax]                         ; 0FCE _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 0FD1 _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 0FD4 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 0FD8 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 0FDC _ 3C, 09
        jnz     ?_052                                   ; 0FDE _ 75, 7E
?_050:  mov     ebx, dword [?_356]                      ; 0FE0 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_355]                      ; 0FE6 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0FEC _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0FF2 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_334                  ; 0FF7 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 0FFF _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1007 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 100B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 100F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1013 _ 89. 04 24
        call    showString                              ; 1016 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_355]                      ; 101B _ A1, 00000010(d)
        add     eax, 8                                  ; 1020 _ 83. C0, 08
        mov     dword [?_355], eax                      ; 1023 _ A3, 00000010(d)
        mov     eax, dword [?_355]                      ; 1028 _ A1, 00000010(d)
        cmp     eax, 248                                ; 102D _ 3D, 000000F8
        jnz     ?_051                                   ; 1032 _ 75, 28
        mov     dword [?_355], 8                        ; 1034 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 103E _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 1044 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1049 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 104D _ 89. 04 24
        call    cons_newline                            ; 1050 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 1055 _ A3, 00000014(d)
        jmp     ?_050                                   ; 105A _ EB, 84

?_051:  jmp     ?_050                                   ; 105C _ EB, 82

?_052:  movzx   eax, byte [ebp-3BH]                     ; 105E _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1062 _ 3C, 0A
        jnz     ?_053                                   ; 1064 _ 75, 2B
        mov     dword [?_355], 8                        ; 1066 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 1070 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 1076 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 107B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107F _ 89. 04 24
        call    cons_newline                            ; 1082 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 1087 _ A3, 00000014(d)
        jmp     ?_054                                   ; 108C _ E9, 00000081

?_053:  movzx   eax, byte [ebp-3BH]                     ; 1091 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 1095 _ 3C, 0D
        jz      ?_054                                   ; 1097 _ 74, 79
        mov     ebx, dword [?_356]                      ; 1099 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_355]                      ; 109F _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 10A5 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 10AB _ A1, 00000284(d)
        lea     esi, [ebp-3BH]                          ; 10B0 _ 8D. 75, C5
        mov     dword [esp+14H], esi                    ; 10B3 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 10B7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 10BF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 10C3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10CB _ 89. 04 24
        call    showString                              ; 10CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_355]                      ; 10D3 _ A1, 00000010(d)
        add     eax, 8                                  ; 10D8 _ 83. C0, 08
        mov     dword [?_355], eax                      ; 10DB _ A3, 00000010(d)
        mov     eax, dword [?_355]                      ; 10E0 _ A1, 00000010(d)
        cmp     eax, 248                                ; 10E5 _ 3D, 000000F8
        jnz     ?_054                                   ; 10EA _ 75, 26
        mov     dword [?_355], 16                       ; 10EC _ C7. 05, 00000010(d), 00000010
        mov     edx, dword [g_Console]                  ; 10F6 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 10FC _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1101 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1105 _ 89. 04 24
        call    cons_newline                            ; 1108 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 110D _ A3, 00000014(d)
?_054:  add     dword [ebp-20H], 1                      ; 1112 _ 83. 45, E0, 01
?_055:  mov     eax, dword [ebp-20H]                    ; 1116 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 1119 _ 3B. 45, D4
        jl      ?_049                                   ; 111C _ 0F 8C, FFFFFEA4
        nop                                             ; 1122 _ 90
        jmp     ?_058                                   ; 1123 _ EB, 12

?_056:  add     dword [ebp-14H], 32                     ; 1125 _ 83. 45, EC, 20
?_057:  mov     eax, dword [ebp-14H]                    ; 1129 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 112C _ 0F B6. 00
        test    al, al                                  ; 112F _ 84. C0
        jne     ?_042                                   ; 1131 _ 0F 85, FFFFFDB5
?_058:  mov     edx, dword [g_Console]                  ; 1137 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 113D _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1142 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1146 _ 89. 04 24
        call    cons_newline                            ; 1149 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 114E _ A3, 00000014(d)
        mov     edx, dword [ebp-24H]                    ; 1153 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1156 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 115B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1163 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1167 _ 89. 04 24
        call    memman_free                             ; 116A _ E8, FFFFFFFC(rel)
        mov     dword [?_355], 16                       ; 116F _ C7. 05, 00000010(d), 00000010
        add     esp, 96                                 ; 1179 _ 83. C4, 60
        pop     ebx                                     ; 117C _ 5B
        pop     esi                                     ; 117D _ 5E
        pop     ebp                                     ; 117E _ 5D
        ret                                             ; 117F _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1180 _ 55
        mov     ebp, esp                                ; 1181 _ 89. E5
        push    ebx                                     ; 1183 _ 53
        sub     esp, 52                                 ; 1184 _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 1187 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 118A _ 8D. 90, 000003FF
        test    eax, eax                                ; 1190 _ 85. C0
        cmovs   eax, edx                                ; 1192 _ 0F 48. C2
        sar     eax, 10                                 ; 1195 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 1198 _ 89. 04 24
        call    intToHexStr                             ; 119B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 11A0 _ 89. 45, F4
        mov     ecx, dword [?_356]                      ; 11A3 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 11A9 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 11AF _ A1, 00000284(d)
        mov     dword [esp+14H], ?_335                  ; 11B4 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11BC _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11D4 _ 89. 04 24
        call    showString                              ; 11D7 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_356]                      ; 11DC _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 11E2 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 11E8 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 11ED _ 8B. 5D, F4
        mov     dword [esp+14H], ebx                    ; 11F0 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 11F4 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 1200 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1208 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 120C _ 89. 04 24
        call    showString                              ; 120F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_356]                      ; 1214 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 121A _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1220 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_336                  ; 1225 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 122D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1235 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1239 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1241 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1245 _ 89. 04 24
        call    showString                              ; 1248 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 124D _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_356]                      ; 1253 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 125C _ 89. 04 24
        call    cons_newline                            ; 125F _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 1264 _ A3, 00000014(d)
        add     esp, 52                                 ; 1269 _ 83. C4, 34
        pop     ebx                                     ; 126C _ 5B
        pop     ebp                                     ; 126D _ 5D
        ret                                             ; 126E _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 126F _ 55
        mov     ebp, esp                                ; 1270 _ 89. E5
        sub     esp, 56                                 ; 1272 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 1275 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 127C _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 1283 _ C7. 45, F0, 0000001C
        jmp     ?_062                                   ; 128A _ EB, 39

?_059:  mov     dword [ebp-0CH], 8                      ; 128C _ C7. 45, F4, 00000008
        jmp     ?_061                                   ; 1293 _ EB, 23

?_060:  mov     eax, dword [g_Console]                  ; 1295 _ A1, 0000000C(d)
        mov     edx, dword [eax]                        ; 129A _ 8B. 10
        mov     eax, dword [g_Console]                  ; 129C _ A1, 0000000C(d)
        mov     eax, dword [eax+4H]                     ; 12A1 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 12A4 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 12A8 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 12AA _ 8B. 45, F4
        add     eax, ecx                                ; 12AD _ 01. C8
        add     eax, edx                                ; 12AF _ 01. D0
        mov     byte [eax], 0                           ; 12B1 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 12B4 _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 247                    ; 12B8 _ 81. 7D, F4, 000000F7
        jle     ?_060                                   ; 12BF _ 7E, D4
        add     dword [ebp-10H], 1                      ; 12C1 _ 83. 45, F0, 01
?_062:  cmp     dword [ebp-10H], 155                    ; 12C5 _ 81. 7D, F0, 0000009B
        jle     ?_059                                   ; 12CC _ 7E, BE
        mov     edx, dword [g_Console]                  ; 12CE _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 12D4 _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 12D9 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 12E1 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 12E9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 12F1 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 12F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12FD _ 89. 04 24
        call    sheet_refresh                           ; 1300 _ E8, FFFFFFFC(rel)
        mov     dword [?_356], 28                       ; 1305 _ C7. 05, 00000014(d), 0000001C
        mov     edx, dword [g_Console]                  ; 130F _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1315 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_337                  ; 131A _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1322 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 132A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1332 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 133A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 133E _ 89. 04 24
        call    showString                              ; 1341 _ E8, FFFFFFFC(rel)
        leave                                           ; 1346 _ C9
        ret                                             ; 1347 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 1348 _ 55
        mov     ebp, esp                                ; 1349 _ 89. E5
        sub     esp, 56                                 ; 134B _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 134E _ C7. 44 24, 04, 00000298(d)
        mov     dword [esp], ?_338                      ; 1356 _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 135D _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1362 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1367 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 136A _ A1, 00000298(d)
        mov     edx, dword [ebp-0CH]                    ; 136F _ 8B. 55, F4
        add     edx, 88                                 ; 1372 _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 1375 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 137D _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 1381 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 1389 _ 89. 14 24
        call    set_segmdesc                            ; 138C _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1391 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 1396 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 139E _ 89. 04 24
        call    memman_alloc_4k                         ; 13A1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13A6 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 13A9 _ 8B. 45, F0
        mov     dword [?_365], eax                      ; 13AC _ A3, 0000029C(d)
        mov     eax, dword [ebp-10H]                    ; 13B1 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 13B4 _ 8B. 55, F4
        add     edx, 96                                 ; 13B7 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 13BA _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 13C2 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 13C6 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 13CE _ 89. 14 24
        call    set_segmdesc                            ; 13D1 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 13D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13DB _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 13DE _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 13E1 _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 13E8 _ 8B. 45, EC
        add     eax, 48                                 ; 13EB _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 13EE _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 13F2 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 13FA _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 1402 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 140A _ C7. 04 24, 00000000
        call    start_app                               ; 1411 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_366]                      ; 1416 _ A1, 000002A0(d)
        mov     ecx, eax                                ; 141B _ 89. C1
        mov     eax, dword [buffer]                     ; 141D _ A1, 00000298(d)
        mov     edx, eax                                ; 1422 _ 89. C2
        mov     eax, dword [memman]                     ; 1424 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1429 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 142D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1431 _ 89. 04 24
        call    memman_free_4k                          ; 1434 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1439 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 143C _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 1441 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1449 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 144D _ 89. 04 24
        call    memman_free_4k                          ; 1450 _ E8, FFFFFFFC(rel)
        leave                                           ; 1455 _ C9
        ret                                             ; 1456 _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 1457 _ 55
        mov     ebp, esp                                ; 1458 _ 89. E5
        push    ebx                                     ; 145A _ 53
        sub     esp, 84                                 ; 145B _ 83. EC, 54
        call    task_now                                ; 145E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1463 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1466 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 146D _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1474 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 147B _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1480 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 1488 _ 89. 04 24
        call    memman_alloc                            ; 148B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1490 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 1493 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1498 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 14A0 _ 89. 04 24
        call    memman_alloc                            ; 14A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14A8 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 14AE _ A3, 0000000C(d)
        mov     dword [?_355], 16                       ; 14B3 _ C7. 05, 00000010(d), 00000010
        mov     dword [?_356], 28                       ; 14BD _ C7. 05, 00000014(d), 0000001C
        mov     dword [?_357], -1                       ; 14C7 _ C7. 05, 00000018(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 14D1 _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 14D4 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 14D7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14DA _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 14DE _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 14E1 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 14E5 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 14ED _ 89. 14 24
        call    fifo8_init                              ; 14F0 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 14F5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 14FA _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 14FD _ 8B. 45, F0
        add     eax, 16                                 ; 1500 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1503 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 150B _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 150F _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1512 _ 89. 04 24
        call    timer_init                              ; 1515 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 151A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1522 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1525 _ 89. 04 24
        call    timer_settime                           ; 1528 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 152D _ 8B. 45, DC
        mov     dword [?_360], eax                      ; 1530 _ A3, 00000020(d)
        mov     eax, dword [shtctl]                     ; 1535 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_337                  ; 153A _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1542 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 154A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1552 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 155A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 155D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1561 _ 89. 04 24
        call    showString                              ; 1564 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1569 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 1570 _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 1577 _ C7. 45, D0, 00000000
?_063:  call    io_cli                                  ; 157E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1583 _ 8B. 45, F0
        add     eax, 16                                 ; 1586 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1589 _ 89. 04 24
        call    fifo8_status                            ; 158C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1591 _ 85. C0
        jnz     ?_064                                   ; 1593 _ 75, 0A
        call    io_sti                                  ; 1595 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 159A _ E9, 000003EF

?_064:  call    io_sti                                  ; 159F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15A4 _ 8B. 45, F0
        add     eax, 16                                 ; 15A7 _ 83. C0, 10
        mov     dword [esp], eax                        ; 15AA _ 89. 04 24
        call    fifo8_get                               ; 15AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15B2 _ 89. 45, CC
        cmp     dword [ebp-30H], 1                      ; 15B5 _ 83. 7D, D0, 01
        jnz     ?_065                                   ; 15B9 _ 75, 37
        mov     edx, dword [sht_back]                   ; 15BB _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 15C1 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_339                  ; 15C6 _ C7. 44 24, 14, 0000003A(d)
        mov     dword [esp+10H], 0                      ; 15CE _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 232                    ; 15D6 _ C7. 44 24, 0C, 000000E8
        mov     dword [esp+8H], 0                       ; 15DE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 15E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15EA _ 89. 04 24
        call    showString                              ; 15ED _ E8, FFFFFFFC(rel)
?_065:  cmp     dword [ebp-34H], 1                      ; 15F2 _ 83. 7D, CC, 01
        jg      ?_068                                   ; 15F6 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 15F8 _ 83. 7D, F4, 00
        js      ?_068                                   ; 15FC _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 15FE _ 83. 7D, CC, 00
        jz      ?_066                                   ; 1602 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1604 _ 8B. 45, F0
        add     eax, 16                                 ; 1607 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 160A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1612 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1616 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1619 _ 89. 04 24
        call    timer_init                              ; 161C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1621 _ C7. 45, F4, 00000007
        jmp     ?_067                                   ; 1628 _ EB, 24

?_066:  mov     eax, dword [ebp-10H]                    ; 162A _ 8B. 45, F0
        add     eax, 16                                 ; 162D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1630 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1638 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 163C _ 8B. 45, DC
        mov     dword [esp], eax                        ; 163F _ 89. 04 24
        call    timer_init                              ; 1642 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1647 _ C7. 45, F4, 00000000
?_067:  mov     dword [esp+4H], 50                      ; 164E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1656 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1659 _ 89. 04 24
        call    timer_settime                           ; 165C _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1661 _ E9, 000002EE

?_068:  cmp     dword [ebp-34H], 87                     ; 1666 _ 83. 7D, CC, 57
        jnz     ?_069                                   ; 166A _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 166C _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1673 _ 8B. 45, F0
        add     eax, 16                                 ; 1676 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1679 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1681 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1685 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1688 _ 89. 04 24
        call    timer_init                              ; 168B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1690 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1698 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 169B _ 89. 04 24
        call    timer_settime                           ; 169E _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 16A3 _ E9, 000002AC

?_069:  cmp     dword [ebp-34H], 88                     ; 16A8 _ 83. 7D, CC, 58
        jnz     ?_070                                   ; 16AC _ 75, 59
        mov     ecx, dword [?_356]                      ; 16AE _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_355]                      ; 16B4 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 16BA _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 16BF _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16C7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16CB _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16CF _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 16D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16D6 _ 89. 04 24
        call    set_cursor                              ; 16D9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 16DE _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 16E5 _ A1, 00000294(d)
        mov     dword [esp+8H], 0                       ; 16EA _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 16F2 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 16FA _ 89. 04 24
        call    task_run                                ; 16FD _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1702 _ E9, 0000024D

?_070:  cmp     dword [ebp-34H], 28                     ; 1707 _ 83. 7D, CC, 1C
        jne     ?_075                                   ; 170B _ 0F 85, 00000157
        mov     ecx, dword [?_356]                      ; 1711 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_355]                      ; 1717 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 171D _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1722 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 172A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 172E _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1732 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1735 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1739 _ 89. 04 24
        call    set_cursor                              ; 173C _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_355]                      ; 1741 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 1746 _ 8D. 50, 07
        test    eax, eax                                ; 1749 _ 85. C0
        cmovs   eax, edx                                ; 174B _ 0F 48. C2
        sar     eax, 3                                  ; 174E _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1751 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1754 _ 8B. 45, E0
        add     eax, edx                                ; 1757 _ 01. D0
        mov     byte [eax], 0                           ; 1759 _ C6. 00, 00
        mov     eax, dword [?_356]                      ; 175C _ A1, 00000014(d)
        mov     edx, dword [ebp+8H]                     ; 1761 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1764 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1768 _ 89. 04 24
        call    cons_newline                            ; 176B _ E8, FFFFFFFC(rel)
        mov     dword [?_356], eax                      ; 1770 _ A3, 00000014(d)
        mov     dword [?_355], 16                       ; 1775 _ C7. 05, 00000010(d), 00000010
        mov     dword [esp+4H], ?_340                   ; 177F _ C7. 44 24, 04, 0000004B(d)
        mov     eax, dword [ebp-20H]                    ; 1787 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 178A _ 89. 04 24
        call    strcmp                                  ; 178D _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1792 _ 83. F8, 01
        jnz     ?_071                                   ; 1795 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1797 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 179A _ 89. 04 24
        call    cmd_mem                                 ; 179D _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 17A2 _ E9, 000001AD

?_071:  mov     dword [esp+4H], ?_341                   ; 17A7 _ C7. 44 24, 04, 0000004F(d)
        mov     eax, dword [ebp-20H]                    ; 17AF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B2 _ 89. 04 24
        call    strcmp                                  ; 17B5 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17BA _ 83. F8, 01
        jnz     ?_072                                   ; 17BD _ 75, 0A
        call    cmd_cls                                 ; 17BF _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 17C4 _ E9, 0000018B

?_072:  mov     dword [esp+4H], ?_342                   ; 17C9 _ C7. 44 24, 04, 00000053(d)
        mov     eax, dword [ebp-20H]                    ; 17D1 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17D4 _ 89. 04 24
        call    strcmp                                  ; 17D7 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17DC _ 83. F8, 01
        jnz     ?_073                                   ; 17DF _ 75, 14
        mov     dword [g_hlt], 1                        ; 17E1 _ C7. 05, 00000000(d), 00000001
        call    cmd_hlt                                 ; 17EB _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 17F0 _ E9, 0000015F

?_073:  mov     dword [esp+4H], ?_343                   ; 17F5 _ C7. 44 24, 04, 00000057(d)
        mov     eax, dword [ebp-20H]                    ; 17FD _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1800 _ 89. 04 24
        call    strcmp                                  ; 1803 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1808 _ 83. F8, 01
        jnz     ?_074                                   ; 180B _ 75, 0A
        call    cmd_dir                                 ; 180D _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1812 _ E9, 0000013D

?_074:  mov     eax, dword [ebp-20H]                    ; 1817 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 181A _ 0F B6. 00
        cmp     al, 116                                 ; 181D _ 3C, 74
        jne     ?_077                                   ; 181F _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 1825 _ 8B. 45, E0
        add     eax, 1                                  ; 1828 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 182B _ 0F B6. 00
        cmp     al, 121                                 ; 182E _ 3C, 79
        jne     ?_077                                   ; 1830 _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 1836 _ 8B. 45, E0
        add     eax, 2                                  ; 1839 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 183C _ 0F B6. 00
        cmp     al, 112                                 ; 183F _ 3C, 70
        jne     ?_077                                   ; 1841 _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 1847 _ 8B. 45, E0
        add     eax, 3                                  ; 184A _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 184D _ 0F B6. 00
        cmp     al, 101                                 ; 1850 _ 3C, 65
        jne     ?_077                                   ; 1852 _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1858 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 185B _ 89. 04 24
        call    cmd_type                                ; 185E _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1863 _ E9, 000000EC

?_075:  cmp     dword [ebp-34H], 14                     ; 1868 _ 83. 7D, CC, 0E
        jnz     ?_076                                   ; 186C _ 75, 79
        mov     eax, dword [?_355]                      ; 186E _ A1, 00000010(d)
        cmp     eax, 8                                  ; 1873 _ 83. F8, 08
        jle     ?_076                                   ; 1876 _ 7E, 6F
        mov     ecx, dword [?_356]                      ; 1878 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_355]                      ; 187E _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 1884 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1889 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1891 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1895 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1899 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 189C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18A0 _ 89. 04 24
        call    set_cursor                              ; 18A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_355]                      ; 18A8 _ A1, 00000010(d)
        sub     eax, 8                                  ; 18AD _ 83. E8, 08
        mov     dword [?_355], eax                      ; 18B0 _ A3, 00000010(d)
        mov     ecx, dword [?_356]                      ; 18B5 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_355]                      ; 18BB _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 18C1 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 18C6 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 18CE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 18D2 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 18D6 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 18D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18DD _ 89. 04 24
        call    set_cursor                              ; 18E0 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 18E5 _ EB, 6D

?_076:  mov     eax, dword [ebp-34H]                    ; 18E7 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 18EA _ 89. 04 24
        call    transferScanCode                        ; 18ED _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 18F2 _ 88. 45, CB
        mov     eax, dword [?_355]                      ; 18F5 _ A1, 00000010(d)
        cmp     eax, 239                                ; 18FA _ 3D, 000000EF
        jg      ?_077                                   ; 18FF _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 1901 _ 80. 7D, CB, 00
        jz      ?_077                                   ; 1905 _ 74, 4D
        mov     eax, dword [?_355]                      ; 1907 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 190C _ 8D. 50, 07
        test    eax, eax                                ; 190F _ 85. C0
        cmovs   eax, edx                                ; 1911 _ 0F 48. C2
        sar     eax, 3                                  ; 1914 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1917 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 191A _ 8B. 45, E0
        add     edx, eax                                ; 191D _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 191F _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1923 _ 88. 02
        mov     eax, dword [?_355]                      ; 1925 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 192A _ 8D. 50, 07
        test    eax, eax                                ; 192D _ 85. C0
        cmovs   eax, edx                                ; 192F _ 0F 48. C2
        sar     eax, 3                                  ; 1932 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1935 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 1938 _ 8B. 45, E0
        add     eax, edx                                ; 193B _ 01. D0
        mov     byte [eax], 0                           ; 193D _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 1940 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1944 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 194C _ 89. 04 24
        call    cons_putchar                            ; 194F _ E8, FFFFFFFC(rel)
?_077:  cmp     dword [ebp-0CH], 0                      ; 1954 _ 83. 7D, F4, 00
        js      ?_078                                   ; 1958 _ 78, 34
        mov     ecx, dword [?_356]                      ; 195A _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_355]                      ; 1960 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 1966 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 196B _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 196E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1972 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1976 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 197A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 197D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1981 _ 89. 04 24
        call    set_cursor                              ; 1984 _ E8, FFFFFFFC(rel)
        jmp     ?_063                                   ; 1989 _ E9, FFFFFBF0

?_078:  jmp     ?_063                                   ; 198E _ E9, FFFFFBEB
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1993 _ 55
        mov     ebp, esp                                ; 1994 _ 89. E5
        sub     esp, 24                                 ; 1996 _ 83. EC, 18
        jmp     ?_080                                   ; 1999 _ EB, 1D

?_079:  mov     eax, dword [ebp+8H]                     ; 199B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 199E _ 0F B6. 00
        movsx   eax, al                                 ; 19A1 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 19A4 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 19AC _ 89. 04 24
        call    cons_putchar                            ; 19AF _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 19B4 _ 83. 45, 08, 01
?_080:  mov     eax, dword [ebp+8H]                     ; 19B8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 19BB _ 0F B6. 00
        test    al, al                                  ; 19BE _ 84. C0
        jnz     ?_079                                   ; 19C0 _ 75, D9
        nop                                             ; 19C2 _ 90
        leave                                           ; 19C3 _ C9
        ret                                             ; 19C4 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 19C5 _ 55
        mov     ebp, esp                                ; 19C6 _ 89. E5
        sub     esp, 32                                 ; 19C8 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 19CB _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 19CE _ 8B. 55, 14
        sub     edx, eax                                ; 19D1 _ 29. C2
        mov     eax, edx                                ; 19D3 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 19D5 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 19D8 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 19DB _ 8B. 55, 18
        sub     edx, eax                                ; 19DE _ 29. C2
        mov     eax, edx                                ; 19E0 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 19E2 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 19E5 _ 8B. 45, 0C
        shl     eax, 10                                 ; 19E8 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 19EB _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 19EE _ 8B. 45, 10
        shl     eax, 10                                 ; 19F1 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 19F4 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 19F7 _ 83. 7D, EC, 00
        jns     ?_081                                   ; 19FB _ 79, 03
        neg     dword [ebp-14H]                         ; 19FD _ F7. 5D, EC
?_081:  cmp     dword [ebp-18H], 0                      ; 1A00 _ 83. 7D, E8, 00
        jns     ?_082                                   ; 1A04 _ 79, 03
        neg     dword [ebp-18H]                         ; 1A06 _ F7. 5D, E8
?_082:  mov     eax, dword [ebp-14H]                    ; 1A09 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1A0C _ 3B. 45, E8
        jl      ?_086                                   ; 1A0F _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 1A11 _ 8B. 45, EC
        add     eax, 1                                  ; 1A14 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A17 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1A1A _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1A1D _ 3B. 45, 14
        jle     ?_083                                   ; 1A20 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1A22 _ C7. 45, EC, FFFFFC00
        jmp     ?_084                                   ; 1A29 _ EB, 07

?_083:  mov     dword [ebp-14H], 1024                   ; 1A2B _ C7. 45, EC, 00000400
?_084:  mov     eax, dword [ebp+10H]                    ; 1A32 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1A35 _ 3B. 45, 18
        jg      ?_085                                   ; 1A38 _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 1A3A _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A3D _ 8B. 55, 18
        sub     edx, eax                                ; 1A40 _ 29. C2
        mov     eax, edx                                ; 1A42 _ 89. D0
        add     eax, 1                                  ; 1A44 _ 83. C0, 01
        shl     eax, 10                                 ; 1A47 _ C1. E0, 0A
        cdq                                             ; 1A4A _ 99
        idiv    dword [ebp-10H]                         ; 1A4B _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A4E _ 89. 45, E8
        jmp     ?_090                                   ; 1A51 _ EB, 72

?_085:  mov     eax, dword [ebp+10H]                    ; 1A53 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A56 _ 8B. 55, 18
        sub     edx, eax                                ; 1A59 _ 29. C2
        mov     eax, edx                                ; 1A5B _ 89. D0
        sub     eax, 1                                  ; 1A5D _ 83. E8, 01
        shl     eax, 10                                 ; 1A60 _ C1. E0, 0A
        cdq                                             ; 1A63 _ 99
        idiv    dword [ebp-10H]                         ; 1A64 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A67 _ 89. 45, E8
        jmp     ?_090                                   ; 1A6A _ EB, 59

?_086:  mov     eax, dword [ebp-18H]                    ; 1A6C _ 8B. 45, E8
        add     eax, 1                                  ; 1A6F _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A72 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1A75 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1A78 _ 3B. 45, 18
        jle     ?_087                                   ; 1A7B _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1A7D _ C7. 45, E8, FFFFFC00
        jmp     ?_088                                   ; 1A84 _ EB, 07

?_087:  mov     dword [ebp-18H], 1024                   ; 1A86 _ C7. 45, E8, 00000400
?_088:  mov     eax, dword [ebp+0CH]                    ; 1A8D _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1A90 _ 3B. 45, 14
        jg      ?_089                                   ; 1A93 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1A95 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1A98 _ 8B. 55, 14
        sub     edx, eax                                ; 1A9B _ 29. C2
        mov     eax, edx                                ; 1A9D _ 89. D0
        add     eax, 1                                  ; 1A9F _ 83. C0, 01
        shl     eax, 10                                 ; 1AA2 _ C1. E0, 0A
        cdq                                             ; 1AA5 _ 99
        idiv    dword [ebp-10H]                         ; 1AA6 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AA9 _ 89. 45, EC
        jmp     ?_090                                   ; 1AAC _ EB, 17

?_089:  mov     eax, dword [ebp+0CH]                    ; 1AAE _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1AB1 _ 8B. 55, 14
        sub     edx, eax                                ; 1AB4 _ 29. C2
        mov     eax, edx                                ; 1AB6 _ 89. D0
        sub     eax, 1                                  ; 1AB8 _ 83. E8, 01
        shl     eax, 10                                 ; 1ABB _ C1. E0, 0A
        cdq                                             ; 1ABE _ 99
        idiv    dword [ebp-10H]                         ; 1ABF _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AC2 _ 89. 45, EC
?_090:  mov     dword [ebp-4H], 0                       ; 1AC5 _ C7. 45, FC, 00000000
        jmp     ?_092                                   ; 1ACC _ EB, 35

?_091:  mov     eax, dword [ebp+8H]                     ; 1ACE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AD1 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1AD3 _ 8B. 45, F4
        sar     eax, 10                                 ; 1AD6 _ C1. F8, 0A
        mov     ecx, eax                                ; 1AD9 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1ADB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1ADE _ 8B. 40, 04
        imul    eax, ecx                                ; 1AE1 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1AE4 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1AE7 _ C1. F9, 0A
        add     eax, ecx                                ; 1AEA _ 01. C8
        add     edx, eax                                ; 1AEC _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1AEE _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1AF1 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1AF3 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1AF6 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1AF9 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1AFC _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1AFF _ 83. 45, FC, 01
?_092:  mov     eax, dword [ebp-4H]                     ; 1B03 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1B06 _ 3B. 45, F0
        jl      ?_091                                   ; 1B09 _ 7C, C3
        leave                                           ; 1B0B _ C9
        ret                                             ; 1B0C _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1B0D _ 55
        mov     ebp, esp                                ; 1B0E _ 89. E5
        sub     esp, 40                                 ; 1B10 _ 83. EC, 28
        mov     eax, dword [?_360]                      ; 1B13 _ A1, 00000020(d)
        mov     dword [ebp-0CH], eax                    ; 1B18 _ 89. 45, F4
?_093:  mov     eax, dword [ebp+8H]                     ; 1B1B _ 8B. 45, 08
        add     eax, 16                                 ; 1B1E _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B21 _ 89. 04 24
        call    fifo8_status                            ; 1B24 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1B29 _ 85. C0
        jnz     ?_095                                   ; 1B2B _ 75, 23
        cmp     dword [ebp+0CH], 0                      ; 1B2D _ 83. 7D, 0C, 00
        jz      ?_094                                   ; 1B31 _ 74, 05
        jmp     ?_098                                   ; 1B33 _ E9, 00000085

?_094:  call    io_sti                                  ; 1B38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1B3D _ 8B. 45, 10
        add     eax, 28                                 ; 1B40 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1B43 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1B49 _ B8, 00000000
        jmp     ?_099                                   ; 1B4E _ EB, 72

?_095:  mov     eax, dword [ebp+8H]                     ; 1B50 _ 8B. 45, 08
        add     eax, 16                                 ; 1B53 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B56 _ 89. 04 24
        call    fifo8_get                               ; 1B59 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1B5E _ 89. 45, F0
        cmp     dword [ebp-10H], 1                      ; 1B61 _ 83. 7D, F0, 01
        jg      ?_096                                   ; 1B65 _ 7F, 32
        mov     eax, dword [ebp+8H]                     ; 1B67 _ 8B. 45, 08
        add     eax, 16                                 ; 1B6A _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B6D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1B75 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1B79 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1B7C _ 89. 04 24
        call    timer_init                              ; 1B7F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1B84 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CH]                    ; 1B8C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1B8F _ 89. 04 24
        call    timer_settime                           ; 1B92 _ E8, FFFFFFFC(rel)
        jmp     ?_098                                   ; 1B97 _ EB, 24

?_096:  cmp     dword [ebp-10H], 2                      ; 1B99 _ 83. 7D, F0, 02
        jnz     ?_097                                   ; 1B9D _ 75, 0C
        mov     dword [?_357], 7                        ; 1B9F _ C7. 05, 00000018(d), 00000007
        jmp     ?_098                                   ; 1BA9 _ EB, 12

?_097:  mov     eax, dword [ebp+10H]                    ; 1BAB _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1BAE _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 1BB1 _ 8B. 45, F0
        mov     dword [edx], eax                        ; 1BB4 _ 89. 02
        mov     eax, 0                                  ; 1BB6 _ B8, 00000000
        jmp     ?_099                                   ; 1BBB _ EB, 05

?_098:  jmp     ?_093                                   ; 1BBD _ E9, FFFFFF59

?_099:  leave                                           ; 1BC2 _ C9
        ret                                             ; 1BC3 _ C3
; handle_keyboard End of function

kernel_api:; Function begin
        push    ebp                                     ; 1BC4 _ 55
        mov     ebp, esp                                ; 1BC5 _ 89. E5
        push    esi                                     ; 1BC7 _ 56
        push    ebx                                     ; 1BC8 _ 53
        sub     esp, 48                                 ; 1BC9 _ 83. EC, 30
        call    task_now                                ; 1BCC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1BD1 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 1BD4 _ 8D. 45, 24
        add     eax, 4                                  ; 1BD7 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1BDA _ 89. 45, F0
        cmp     dword [ebp+1CH], 1                      ; 1BDD _ 83. 7D, 1C, 01
        jnz     ?_100                                   ; 1BE1 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1BE3 _ 8B. 45, 24
        movsx   eax, al                                 ; 1BE6 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1BE9 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1BF1 _ 89. 04 24
        call    cons_putchar                            ; 1BF4 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1BF9 _ E9, 0000030D

?_100:  cmp     dword [ebp+1CH], 2                      ; 1BFE _ 83. 7D, 1C, 02
        jnz     ?_101                                   ; 1C02 _ 75, 18
        mov     edx, dword [buffer]                     ; 1C04 _ 8B. 15, 00000298(d)
        mov     eax, dword [ebp+18H]                    ; 1C0A _ 8B. 45, 18
        add     eax, edx                                ; 1C0D _ 01. D0
        mov     dword [esp], eax                        ; 1C0F _ 89. 04 24
        call    cons_putstr                             ; 1C12 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1C17 _ E9, 000002EF

?_101:  cmp     dword [ebp+1CH], 4                      ; 1C1C _ 83. 7D, 1C, 04
        jnz     ?_102                                   ; 1C20 _ 75, 28
        mov     eax, dword [ebp-0CH]                    ; 1C22 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 1C25 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1C2C _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 1C2F _ 8B. 40, 30
        mov     dword [esp], eax                        ; 1C32 _ 89. 04 24
        call    intToHexStr                             ; 1C35 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1C3A _ 89. 45, EC
        mov     eax, dword [task_cons]                  ; 1C3D _ A1, 00000290(d)
        add     eax, 48                                 ; 1C42 _ 83. C0, 30
        jmp     ?_111                                   ; 1C45 _ E9, 000002C6

?_102:  cmp     dword [ebp+1CH], 5                      ; 1C4A _ 83. 7D, 1C, 05
        jne     ?_103                                   ; 1C4E _ 0F 85, 000000BA
        mov     eax, dword [shtctl]                     ; 1C54 _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 1C59 _ 89. 04 24
        call    sheet_alloc                             ; 1C5C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1C61 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1C64 _ 8B. 45, 24
        mov     ecx, dword [?_365]                      ; 1C67 _ 8B. 0D, 0000029C(d)
        mov     edx, dword [ebp+18H]                    ; 1C6D _ 8B. 55, 18
        add     edx, ecx                                ; 1C70 _ 01. CA
        mov     dword [esp+10H], eax                    ; 1C72 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1C76 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1C79 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C7D _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1C80 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1C84 _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 1C88 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1C8B _ 89. 04 24
        call    sheet_setbuf                            ; 1C8E _ E8, FFFFFFFC(rel)
        mov     edx, dword [buffer]                     ; 1C93 _ 8B. 15, 00000298(d)
        mov     eax, dword [ebp+20H]                    ; 1C99 _ 8B. 45, 20
        add     edx, eax                                ; 1C9C _ 01. C2
        mov     eax, dword [shtctl]                     ; 1C9E _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 1CA3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 1CAB _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1CAF _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1CB2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CB6 _ 89. 04 24
        call    make_window8                            ; 1CB9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1CBE _ A1, 00000284(d)
        mov     dword [esp+0CH], 50                     ; 1CC3 _ C7. 44 24, 0C, 00000032
        mov     dword [esp+8H], 100                     ; 1CCB _ C7. 44 24, 08, 00000064
        mov     edx, dword [ebp-18H]                    ; 1CD3 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1CD6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CDA _ 89. 04 24
        call    sheet_slide                             ; 1CDD _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1CE2 _ A1, 00000284(d)
        mov     dword [esp+8H], 3                       ; 1CE7 _ C7. 44 24, 08, 00000003
        mov     edx, dword [ebp-18H]                    ; 1CEF _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1CF2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CF6 _ 89. 04 24
        call    sheet_updown                            ; 1CF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CFE _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 1D01 _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 1D04 _ 8B. 45, E8
        mov     dword [edx], eax                        ; 1D07 _ 89. 02
        jmp     ?_110                                   ; 1D09 _ E9, 000001FD

?_103:  cmp     dword [ebp+1CH], 6                      ; 1D0E _ 83. 7D, 1C, 06
        jne     ?_104                                   ; 1D12 _ 0F 85, 00000086
        mov     eax, dword [ebp+18H]                    ; 1D18 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1D1B _ 89. 45, E8
        mov     edx, dword [buffer]                     ; 1D1E _ 8B. 15, 00000298(d)
        mov     eax, dword [ebp+10H]                    ; 1D24 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D27 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 1D2A _ 8B. 45, 24
        movsx   edx, al                                 ; 1D2D _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 1D30 _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1D35 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D39 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1D3D _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1D40 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1D44 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1D47 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1D4B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D4E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D52 _ 89. 04 24
        call    showString                              ; 1D55 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1D5A _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 1D5D _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 1D60 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 1D63 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1D6A _ 8B. 45, 0C
        add     edx, eax                                ; 1D6D _ 01. C2
        mov     eax, dword [shtctl]                     ; 1D6F _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1D74 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D78 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1D7C _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1D7F _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1D83 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1D86 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1D8A _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D8D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D91 _ 89. 04 24
        call    sheet_refresh                           ; 1D94 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1D99 _ E9, 0000016D

?_104:  cmp     dword [ebp+1CH], 7                      ; 1D9E _ 83. 7D, 1C, 07
        jnz     ?_105                                   ; 1DA2 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 1DA4 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1DA7 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 1DAA _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1DAD _ 8B. 45, 10
        movzx   ecx, al                                 ; 1DB0 _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 1DB3 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 1DB6 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 1DB9 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 1DBC _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 1DBE _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 1DC1 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 1DC5 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 1DC8 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 1DCC _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 1DCF _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1DD3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1DD7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1DDB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DDF _ 89. 04 24
        call    boxfill8                                ; 1DE2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1DE7 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1DEA _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1DED _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 1DF0 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 1DF3 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1DF6 _ A1, 00000284(d)
        mov     dword [esp+14H], ebx                    ; 1DFB _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 1DFF _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1E03 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1E06 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E0A _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1E0E _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1E11 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E15 _ 89. 04 24
        call    sheet_refresh                           ; 1E18 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1E1D _ E9, 000000E9

?_105:  cmp     dword [ebp+1CH], 11                     ; 1E22 _ 83. 7D, 1C, 0B
        jnz     ?_106                                   ; 1E26 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 1E28 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1E2B _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 1E2E _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 1E31 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 1E33 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 1E36 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 1E39 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 1E3D _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 1E3F _ 8B. 45, 0C
        add     eax, ecx                                ; 1E42 _ 01. C8
        add     edx, eax                                ; 1E44 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 1E46 _ 8B. 45, 24
        mov     byte [edx], al                          ; 1E49 _ 88. 02
        jmp     ?_110                                   ; 1E4B _ E9, 000000BB

?_106:  cmp     dword [ebp+1CH], 12                     ; 1E50 _ 83. 7D, 1C, 0C
        jnz     ?_107                                   ; 1E54 _ 75, 38
        mov     eax, dword [ebp+18H]                    ; 1E56 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1E59 _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 1E5C _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1E5F _ A1, 00000284(d)
        mov     ecx, dword [ebp+8H]                     ; 1E64 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 1E67 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 1E6B _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 1E6E _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1E72 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1E75 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E79 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1E7D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1E80 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E84 _ 89. 04 24
        call    sheet_refresh                           ; 1E87 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1E8C _ EB, 7D

?_107:  cmp     dword [ebp+1CH], 13                     ; 1E8E _ 83. 7D, 1C, 0D
        jnz     ?_108                                   ; 1E92 _ 75, 36
        mov     eax, dword [ebp+18H]                    ; 1E94 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1E97 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1E9A _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 1E9D _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 1EA0 _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 1EA4 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 1EA7 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 1EAB _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 1EAE _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 1EB2 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 1EB5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1EB9 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 1EBD _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1EC0 _ 89. 04 24
        call    api_linewin                             ; 1EC3 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1EC8 _ EB, 41

?_108:  cmp     dword [ebp+1CH], 14                     ; 1ECA _ 83. 7D, 1C, 0E
        jnz     ?_109                                   ; 1ECE _ 75, 1C
        mov     eax, dword [ebp+18H]                    ; 1ED0 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1ED3 _ 89. 45, E8
        mov     eax, dword [shtctl]                     ; 1ED6 _ A1, 00000284(d)
        mov     edx, dword [ebp-18H]                    ; 1EDB _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1EDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EE2 _ 89. 04 24
        call    sheet_free                              ; 1EE5 _ E8, FFFFFFFC(rel)
        jmp     ?_110                                   ; 1EEA _ EB, 1F

?_109:  cmp     dword [ebp+1CH], 15                     ; 1EEC _ 83. 7D, 1C, 0F
        jnz     ?_110                                   ; 1EF0 _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 1EF2 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 1EF5 _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 1EF8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1EFC _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1F00 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1F03 _ 89. 04 24
        call    handle_keyboard                         ; 1F06 _ E8, FFFFFFFC(rel)
?_110:  mov     eax, 0                                  ; 1F0B _ B8, 00000000
?_111:  add     esp, 48                                 ; 1F10 _ 83. C4, 30
        pop     ebx                                     ; 1F13 _ 5B
        pop     esi                                     ; 1F14 _ 5E
        pop     ebp                                     ; 1F15 _ 5D
        ret                                             ; 1F16 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1F17 _ 55
        mov     ebp, esp                                ; 1F18 _ 89. E5
        push    ebx                                     ; 1F1A _ 53
        sub     esp, 36                                 ; 1F1B _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1F1E _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1F21 _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1F24 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1F27 _ 88. 45, F0
        mov     ebx, dword [?_356]                      ; 1F2A _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_355]                      ; 1F30 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 1F36 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1F3C _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1F41 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1F49 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1F4D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1F51 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F55 _ 89. 04 24
        call    set_cursor                              ; 1F58 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 1F5D _ 0F B6. 45, F4
        mov     byte [?_358], al                        ; 1F61 _ A2, 0000001C(d)
        mov     byte [?_359], 0                         ; 1F66 _ C6. 05, 0000001D(d), 00
        mov     ebx, dword [?_356]                      ; 1F6D _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_355]                      ; 1F73 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 1F79 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1F7F _ A1, 00000284(d)
        mov     dword [esp+14H], ?_358                  ; 1F84 _ C7. 44 24, 14, 0000001C(d)
        mov     dword [esp+10H], 7                      ; 1F8C _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1F94 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1F98 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1F9C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FA0 _ 89. 04 24
        call    showString                              ; 1FA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_355]                      ; 1FA8 _ A1, 00000010(d)
        add     eax, 8                                  ; 1FAD _ 83. C0, 08
        mov     dword [?_355], eax                      ; 1FB0 _ A3, 00000010(d)
        add     esp, 36                                 ; 1FB5 _ 83. C4, 24
        pop     ebx                                     ; 1FB8 _ 5B
        pop     ebp                                     ; 1FB9 _ 5D
        ret                                             ; 1FBA _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 1FBB _ 55
        mov     ebp, esp                                ; 1FBC _ 89. E5
        push    ebx                                     ; 1FBE _ 53
        sub     esp, 52                                 ; 1FBF _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 1FC2 _ 81. 7D, 08, 0000008B
        jg      ?_112                                   ; 1FC9 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1FCB _ 83. 45, 08, 10
        jmp     ?_121                                   ; 1FCF _ E9, 000000DF

?_112:  mov     dword [ebp-10H], 28                     ; 1FD4 _ C7. 45, F0, 0000001C
        jmp     ?_116                                   ; 1FDB _ EB, 52

?_113:  mov     dword [ebp-0CH], 8                      ; 1FDD _ C7. 45, F4, 00000008
        jmp     ?_115                                   ; 1FE4 _ EB, 3C

?_114:  mov     eax, dword [ebp+0CH]                    ; 1FE6 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1FE9 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1FEB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1FEE _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1FF1 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1FF5 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1FF7 _ 8B. 45, F4
        add     eax, ecx                                ; 1FFA _ 01. C8
        add     edx, eax                                ; 1FFC _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1FFE _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2001 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2003 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2006 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2009 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 200C _ 8B. 40, 04
        imul    ebx, eax                                ; 200F _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2012 _ 8B. 45, F4
        add     eax, ebx                                ; 2015 _ 01. D8
        add     eax, ecx                                ; 2017 _ 01. C8
        movzx   eax, byte [eax]                         ; 2019 _ 0F B6. 00
        mov     byte [edx], al                          ; 201C _ 88. 02
        add     dword [ebp-0CH], 1                      ; 201E _ 83. 45, F4, 01
?_115:  cmp     dword [ebp-0CH], 247                    ; 2022 _ 81. 7D, F4, 000000F7
        jle     ?_114                                   ; 2029 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 202B _ 83. 45, F0, 01
?_116:  cmp     dword [ebp-10H], 139                    ; 202F _ 81. 7D, F0, 0000008B
        jle     ?_113                                   ; 2036 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2038 _ C7. 45, F0, 0000008C
        jmp     ?_120                                   ; 203F _ EB, 35

?_117:  mov     dword [ebp-0CH], 8                      ; 2041 _ C7. 45, F4, 00000008
        jmp     ?_119                                   ; 2048 _ EB, 1F

?_118:  mov     eax, dword [ebp+0CH]                    ; 204A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 204D _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 204F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2052 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2055 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2059 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 205B _ 8B. 45, F4
        add     eax, ecx                                ; 205E _ 01. C8
        add     eax, edx                                ; 2060 _ 01. D0
        mov     byte [eax], 0                           ; 2062 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2065 _ 83. 45, F4, 01
?_119:  cmp     dword [ebp-0CH], 247                    ; 2069 _ 81. 7D, F4, 000000F7
        jle     ?_118                                   ; 2070 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2072 _ 83. 45, F0, 01
?_120:  cmp     dword [ebp-10H], 155                    ; 2076 _ 81. 7D, F0, 0000009B
        jle     ?_117                                   ; 207D _ 7E, C2
        mov     eax, dword [shtctl]                     ; 207F _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 2084 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 208C _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2094 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 209C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 20A4 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 20A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20AB _ 89. 04 24
        call    sheet_refresh                           ; 20AE _ E8, FFFFFFFC(rel)
?_121:  mov     eax, dword [shtctl]                     ; 20B3 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_337                  ; 20B8 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 20C0 _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 20C8 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 20CB _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 20CF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 20D7 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 20DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20DE _ 89. 04 24
        call    showString                              ; 20E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 20E6 _ 8B. 45, 08
        add     esp, 52                                 ; 20E9 _ 83. C4, 34
        pop     ebx                                     ; 20EC _ 5B
        pop     ebp                                     ; 20ED _ 5D
        ret                                             ; 20EE _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 20EF _ 55
        mov     ebp, esp                                ; 20F0 _ 89. E5
        push    ebx                                     ; 20F2 _ 53
        sub     esp, 36                                 ; 20F3 _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 20F6 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 20F9 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 20FC _ 8B. 45, 0C
        sub     eax, 1                                  ; 20FF _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 2102 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2106 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 210A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2112 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 211A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2122 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2125 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2129 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 212C _ 89. 04 24
        call    boxfill8                                ; 212F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2134 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2137 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 213A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 213D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2140 _ 8B. 45, 10
        sub     eax, 28                                 ; 2143 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2146 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 214A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 214E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2152 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 215A _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2162 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2165 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2169 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 216C _ 89. 04 24
        call    boxfill8                                ; 216F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2174 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2177 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 217A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 217D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2180 _ 8B. 45, 10
        sub     eax, 27                                 ; 2183 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2186 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 218A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 218E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2192 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 219A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 21A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 21A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21AC _ 89. 04 24
        call    boxfill8                                ; 21AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21B4 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 21B7 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 21BA _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 21BD _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 21C0 _ 8B. 45, 10
        sub     eax, 26                                 ; 21C3 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 21C6 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 21CA _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 21CE _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 21D2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 21DA _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 21E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 21E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21EC _ 89. 04 24
        call    boxfill8                                ; 21EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21F4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 21F7 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 21FA _ 8B. 45, 10
        sub     eax, 24                                 ; 21FD _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2200 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2204 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 220C _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2210 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2218 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2220 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2223 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2227 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 222A _ 89. 04 24
        call    boxfill8                                ; 222D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2232 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2235 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2238 _ 8B. 45, 10
        sub     eax, 24                                 ; 223B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 223E _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2242 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 224A _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 224E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2256 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 225E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2261 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2265 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2268 _ 89. 04 24
        call    boxfill8                                ; 226B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2270 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2273 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2276 _ 8B. 45, 10
        sub     eax, 4                                  ; 2279 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 227C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2280 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2288 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 228C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 2294 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 229C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 229F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22A3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22A6 _ 89. 04 24
        call    boxfill8                                ; 22A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22AE _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 22B1 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 22B4 _ 8B. 45, 10
        sub     eax, 23                                 ; 22B7 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 22BA _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 22BE _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 22C6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 22CA _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 22D2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 22DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 22DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22E4 _ 89. 04 24
        call    boxfill8                                ; 22E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22EC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 22EF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 22F2 _ 8B. 45, 10
        sub     eax, 3                                  ; 22F5 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 22F8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 22FC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2304 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2308 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2310 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2318 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 231B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 231F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2322 _ 89. 04 24
        call    boxfill8                                ; 2325 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 232A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 232D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2330 _ 8B. 45, 10
        sub     eax, 24                                 ; 2333 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2336 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 233A _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2342 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2346 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 234E _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2356 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2359 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 235D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2360 _ 89. 04 24
        call    boxfill8                                ; 2363 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2368 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 236B _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 236E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2371 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2374 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2377 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 237A _ 8B. 45, 0C
        sub     eax, 47                                 ; 237D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2380 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2384 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2388 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 238C _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2390 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2398 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 239B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 239F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23A2 _ 89. 04 24
        call    boxfill8                                ; 23A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23AA _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 23AD _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 23B0 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 23B3 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 23B6 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 23B9 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 23BC _ 8B. 45, 0C
        sub     eax, 47                                 ; 23BF _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 23C2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 23C6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 23CA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 23CE _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 23D2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 23DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 23DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23E4 _ 89. 04 24
        call    boxfill8                                ; 23E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23EC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 23EF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 23F2 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 23F5 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 23F8 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 23FB _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 23FE _ 8B. 45, 0C
        sub     eax, 47                                 ; 2401 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2404 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2408 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 240C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2410 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2414 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 241C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 241F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2423 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2426 _ 89. 04 24
        call    boxfill8                                ; 2429 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 242E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2431 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2434 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2437 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 243A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 243D _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2440 _ 8B. 45, 0C
        sub     eax, 3                                  ; 2443 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2446 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 244A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 244E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2452 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2456 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 245E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2461 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2465 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2468 _ 89. 04 24
        call    boxfill8                                ; 246B _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2470 _ 83. C4, 24
        pop     ebx                                     ; 2473 _ 5B
        pop     ebp                                     ; 2474 _ 5D
        ret                                             ; 2475 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2476 _ 55
        mov     ebp, esp                                ; 2477 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2479 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 247C _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 247F _ A1, 00000154(d)
        add     eax, edx                                ; 2484 _ 01. D0
        mov     dword [mx], eax                         ; 2486 _ A3, 00000154(d)
        mov     eax, dword [ebp+10H]                    ; 248B _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 248E _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2491 _ A1, 00000158(d)
        add     eax, edx                                ; 2496 _ 01. D0
        mov     dword [my], eax                         ; 2498 _ A3, 00000158(d)
        mov     eax, dword [mx]                         ; 249D _ A1, 00000154(d)
        test    eax, eax                                ; 24A2 _ 85. C0
        jns     ?_122                                   ; 24A4 _ 79, 0A
        mov     dword [mx], 0                           ; 24A6 _ C7. 05, 00000154(d), 00000000
?_122:  mov     eax, dword [my]                         ; 24B0 _ A1, 00000158(d)
        test    eax, eax                                ; 24B5 _ 85. C0
        jns     ?_123                                   ; 24B7 _ 79, 0A
        mov     dword [my], 0                           ; 24B9 _ C7. 05, 00000158(d), 00000000
?_123:  mov     eax, dword [xsize]                      ; 24C3 _ A1, 0000015C(d)
        lea     edx, [eax-1H]                           ; 24C8 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 24CB _ A1, 00000154(d)
        cmp     edx, eax                                ; 24D0 _ 39. C2
        jge     ?_124                                   ; 24D2 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 24D4 _ A1, 0000015C(d)
        sub     eax, 1                                  ; 24D9 _ 83. E8, 01
        mov     dword [mx], eax                         ; 24DC _ A3, 00000154(d)
?_124:  mov     eax, dword [ysize]                      ; 24E1 _ A1, 00000160(d)
        lea     edx, [eax-1H]                           ; 24E6 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 24E9 _ A1, 00000158(d)
        cmp     edx, eax                                ; 24EE _ 39. C2
        jge     ?_125                                   ; 24F0 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 24F2 _ A1, 00000160(d)
        sub     eax, 1                                  ; 24F7 _ 83. E8, 01
        mov     dword [my], eax                         ; 24FA _ A3, 00000158(d)
?_125:  pop     ebp                                     ; 24FF _ 5D
        ret                                             ; 2500 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2501 _ 55
        mov     ebp, esp                                ; 2502 _ 89. E5
        sub     esp, 40                                 ; 2504 _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 2507 _ A1, 00000164(d)
        mov     dword [ebp-0CH], eax                    ; 250C _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 250F _ C6. 45, F3, 00
        call    io_sti                                  ; 2513 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2518 _ C7. 04 24, 00000048(d)
        call    fifo8_get                               ; 251F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 2524 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 2527 _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 252B _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 252F _ C7. 04 24, 00000120(d)
        call    mouse_decode                            ; 2536 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 253B _ 85. C0
        jz      ?_126                                   ; 253D _ 74, 77
        mov     dword [esp+8H], mdec                    ; 253F _ C7. 44 24, 08, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 2547 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 254A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 254E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2551 _ 89. 04 24
        call    computeMousePosition                    ; 2554 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2559 _ 8B. 15, 00000158(d)
        mov     eax, dword [mx]                         ; 255F _ A1, 00000154(d)
        mov     dword [esp+0CH], edx                    ; 2564 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2568 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 256C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 256F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2573 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2576 _ 89. 04 24
        call    sheet_slide                             ; 2579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_364]                      ; 257E _ A1, 0000012C(d)
        and     eax, 01H                                ; 2583 _ 83. E0, 01
        test    eax, eax                                ; 2586 _ 85. C0
        jz      ?_126                                   ; 2588 _ 74, 2C
        mov     eax, dword [my]                         ; 258A _ A1, 00000158(d)
        lea     ecx, [eax-8H]                           ; 258F _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 2592 _ A1, 00000154(d)
        lea     edx, [eax-50H]                          ; 2597 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 259A _ A1, 00000280(d)
        mov     dword [esp+0CH], ecx                    ; 259F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25A3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 25A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25AE _ 89. 04 24
        call    sheet_slide                             ; 25B1 _ E8, FFFFFFFC(rel)
?_126:  leave                                           ; 25B6 _ C9
        ret                                             ; 25B7 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 25B8 _ 55
        mov     ebp, esp                                ; 25B9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 25BB _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 25BE _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 25C4 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 25C7 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 25CD _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 25D0 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 25D6 _ 5D
        ret                                             ; 25D7 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 25D8 _ 55
        mov     ebp, esp                                ; 25D9 _ 89. E5
        push    ebx                                     ; 25DB _ 53
        sub     esp, 52                                 ; 25DC _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 25DF _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 25E2 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 25E5 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 25E8 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 25EB _ C7. 45, F0, 00000000
        jmp     ?_128                                   ; 25F2 _ EB, 4B

?_127:  mov     eax, dword [ebp+1CH]                    ; 25F4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 25F7 _ 0F B6. 00
        movzx   eax, al                                 ; 25FA _ 0F B6. C0
        shl     eax, 4                                  ; 25FD _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2600 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2606 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 260A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 260D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2610 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2613 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 2615 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2619 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 261D _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 2620 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 2624 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 2627 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 262B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 262F _ 89. 04 24
        call    showFont8                               ; 2632 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 2637 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 263B _ 83. 45, 1C, 01
?_128:  mov     eax, dword [ebp+1CH]                    ; 263F _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2642 _ 0F B6. 00
        test    al, al                                  ; 2645 _ 84. C0
        jnz     ?_127                                   ; 2647 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2649 _ 8B. 45, 14
        add     eax, 16                                 ; 264C _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 264F _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 2653 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2656 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 265A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 265D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2661 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2664 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2668 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 266B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 266F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2672 _ 89. 04 24
        call    sheet_refresh                           ; 2675 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 267A _ 83. C4, 34
        pop     ebx                                     ; 267D _ 5B
        pop     ebp                                     ; 267E _ 5D
        ret                                             ; 267F _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2680 _ 55
        mov     ebp, esp                                ; 2681 _ 89. E5
        sub     esp, 24                                 ; 2683 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.2040          ; 2686 _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 268E _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 2696 _ C7. 04 24, 00000000
        call    set_palette                             ; 269D _ E8, FFFFFFFC(rel)
        nop                                             ; 26A2 _ 90
        leave                                           ; 26A3 _ C9
        ret                                             ; 26A4 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 26A5 _ 55
        mov     ebp, esp                                ; 26A6 _ 89. E5
        sub     esp, 40                                 ; 26A8 _ 83. EC, 28
        call    io_load_eflags                          ; 26AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 26B0 _ 89. 45, F0
        call    io_cli                                  ; 26B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 26B8 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 26BB _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 26BF _ C7. 04 24, 000003C8
        call    io_out8                                 ; 26C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 26CB _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 26CE _ 89. 45, F4
        jmp     ?_130                                   ; 26D1 _ EB, 62

?_129:  mov     eax, dword [ebp+10H]                    ; 26D3 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 26D6 _ 0F B6. 00
        shr     al, 2                                   ; 26D9 _ C0. E8, 02
        movzx   eax, al                                 ; 26DC _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 26DF _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 26E3 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 26EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 26EF _ 8B. 45, 10
        add     eax, 1                                  ; 26F2 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 26F5 _ 0F B6. 00
        shr     al, 2                                   ; 26F8 _ C0. E8, 02
        movzx   eax, al                                 ; 26FB _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 26FE _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2702 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2709 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 270E _ 8B. 45, 10
        add     eax, 2                                  ; 2711 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2714 _ 0F B6. 00
        shr     al, 2                                   ; 2717 _ C0. E8, 02
        movzx   eax, al                                 ; 271A _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 271D _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2721 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2728 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 272D _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 2731 _ 83. 45, F4, 01
?_130:  mov     eax, dword [ebp-0CH]                    ; 2735 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2738 _ 3B. 45, 0C
        jle     ?_129                                   ; 273B _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 273D _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2740 _ 89. 04 24
        call    io_store_eflags                         ; 2743 _ E8, FFFFFFFC(rel)
        nop                                             ; 2748 _ 90
        leave                                           ; 2749 _ C9
        ret                                             ; 274A _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 274B _ 55
        mov     ebp, esp                                ; 274C _ 89. E5
        sub     esp, 20                                 ; 274E _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2751 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 2754 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2757 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 275A _ 89. 45, F8
        jmp     ?_134                                   ; 275D _ EB, 33

?_131:  mov     eax, dword [ebp+14H]                    ; 275F _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 2762 _ 89. 45, FC
        jmp     ?_133                                   ; 2765 _ EB, 1F

?_132:  mov     eax, dword [ebp-8H]                     ; 2767 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 276A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 276E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2770 _ 8B. 45, FC
        add     eax, edx                                ; 2773 _ 01. D0
        mov     edx, eax                                ; 2775 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2777 _ 8B. 45, 08
        add     edx, eax                                ; 277A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 277C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2780 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2782 _ 83. 45, FC, 01
?_133:  mov     eax, dword [ebp-4H]                     ; 2786 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2789 _ 3B. 45, 1C
        jle     ?_132                                   ; 278C _ 7E, D9
        add     dword [ebp-8H], 1                       ; 278E _ 83. 45, F8, 01
?_134:  mov     eax, dword [ebp-8H]                     ; 2792 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2795 _ 3B. 45, 20
        jle     ?_131                                   ; 2798 _ 7E, C5
        leave                                           ; 279A _ C9
        ret                                             ; 279B _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 279C _ 55
        mov     ebp, esp                                ; 279D _ 89. E5
        sub     esp, 20                                 ; 279F _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 27A2 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 27A5 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 27A8 _ C7. 45, FC, 00000000
        jmp     ?_144                                   ; 27AF _ E9, 0000016C

?_135:  mov     edx, dword [ebp-4H]                     ; 27B4 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 27B7 _ 8B. 45, 1C
        add     eax, edx                                ; 27BA _ 01. D0
        movzx   eax, byte [eax]                         ; 27BC _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 27BF _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 27C2 _ 80. 7D, FB, 00
        jns     ?_136                                   ; 27C6 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 27C8 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 27CB _ 8B. 55, 14
        add     eax, edx                                ; 27CE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 27D0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 27D4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 27D6 _ 8B. 45, 10
        add     eax, edx                                ; 27D9 _ 01. D0
        mov     edx, eax                                ; 27DB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27DD _ 8B. 45, 08
        add     edx, eax                                ; 27E0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 27E2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 27E6 _ 88. 02
?_136:  movsx   eax, byte [ebp-5H]                      ; 27E8 _ 0F BE. 45, FB
        and     eax, 40H                                ; 27EC _ 83. E0, 40
        test    eax, eax                                ; 27EF _ 85. C0
        jz      ?_137                                   ; 27F1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 27F3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 27F6 _ 8B. 55, 14
        add     eax, edx                                ; 27F9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 27FB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 27FF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2801 _ 8B. 45, 10
        add     eax, edx                                ; 2804 _ 01. D0
        lea     edx, [eax+1H]                           ; 2806 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2809 _ 8B. 45, 08
        add     edx, eax                                ; 280C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 280E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2812 _ 88. 02
?_137:  movsx   eax, byte [ebp-5H]                      ; 2814 _ 0F BE. 45, FB
        and     eax, 20H                                ; 2818 _ 83. E0, 20
        test    eax, eax                                ; 281B _ 85. C0
        jz      ?_138                                   ; 281D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 281F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2822 _ 8B. 55, 14
        add     eax, edx                                ; 2825 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2827 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 282B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 282D _ 8B. 45, 10
        add     eax, edx                                ; 2830 _ 01. D0
        lea     edx, [eax+2H]                           ; 2832 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2835 _ 8B. 45, 08
        add     edx, eax                                ; 2838 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 283A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 283E _ 88. 02
?_138:  movsx   eax, byte [ebp-5H]                      ; 2840 _ 0F BE. 45, FB
        and     eax, 10H                                ; 2844 _ 83. E0, 10
        test    eax, eax                                ; 2847 _ 85. C0
        jz      ?_139                                   ; 2849 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 284B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 284E _ 8B. 55, 14
        add     eax, edx                                ; 2851 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2853 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2857 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2859 _ 8B. 45, 10
        add     eax, edx                                ; 285C _ 01. D0
        lea     edx, [eax+3H]                           ; 285E _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 2861 _ 8B. 45, 08
        add     edx, eax                                ; 2864 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2866 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 286A _ 88. 02
?_139:  movsx   eax, byte [ebp-5H]                      ; 286C _ 0F BE. 45, FB
        and     eax, 08H                                ; 2870 _ 83. E0, 08
        test    eax, eax                                ; 2873 _ 85. C0
        jz      ?_140                                   ; 2875 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2877 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 287A _ 8B. 55, 14
        add     eax, edx                                ; 287D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 287F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2883 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2885 _ 8B. 45, 10
        add     eax, edx                                ; 2888 _ 01. D0
        lea     edx, [eax+4H]                           ; 288A _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 288D _ 8B. 45, 08
        add     edx, eax                                ; 2890 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2892 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2896 _ 88. 02
?_140:  movsx   eax, byte [ebp-5H]                      ; 2898 _ 0F BE. 45, FB
        and     eax, 04H                                ; 289C _ 83. E0, 04
        test    eax, eax                                ; 289F _ 85. C0
        jz      ?_141                                   ; 28A1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 28A3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 28A6 _ 8B. 55, 14
        add     eax, edx                                ; 28A9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 28AB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 28AF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 28B1 _ 8B. 45, 10
        add     eax, edx                                ; 28B4 _ 01. D0
        lea     edx, [eax+5H]                           ; 28B6 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 28B9 _ 8B. 45, 08
        add     edx, eax                                ; 28BC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 28BE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 28C2 _ 88. 02
?_141:  movsx   eax, byte [ebp-5H]                      ; 28C4 _ 0F BE. 45, FB
        and     eax, 02H                                ; 28C8 _ 83. E0, 02
        test    eax, eax                                ; 28CB _ 85. C0
        jz      ?_142                                   ; 28CD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 28CF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 28D2 _ 8B. 55, 14
        add     eax, edx                                ; 28D5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 28D7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 28DB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 28DD _ 8B. 45, 10
        add     eax, edx                                ; 28E0 _ 01. D0
        lea     edx, [eax+6H]                           ; 28E2 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 28E5 _ 8B. 45, 08
        add     edx, eax                                ; 28E8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 28EA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 28EE _ 88. 02
?_142:  movsx   eax, byte [ebp-5H]                      ; 28F0 _ 0F BE. 45, FB
        and     eax, 01H                                ; 28F4 _ 83. E0, 01
        test    eax, eax                                ; 28F7 _ 85. C0
        jz      ?_143                                   ; 28F9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 28FB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 28FE _ 8B. 55, 14
        add     eax, edx                                ; 2901 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2903 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2907 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2909 _ 8B. 45, 10
        add     eax, edx                                ; 290C _ 01. D0
        lea     edx, [eax+7H]                           ; 290E _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 2911 _ 8B. 45, 08
        add     edx, eax                                ; 2914 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2916 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 291A _ 88. 02
?_143:  add     dword [ebp-4H], 1                       ; 291C _ 83. 45, FC, 01
?_144:  cmp     dword [ebp-4H], 15                      ; 2920 _ 83. 7D, FC, 0F
        jle     ?_135                                   ; 2924 _ 0F 8E, FFFFFE8A
        leave                                           ; 292A _ C9
        ret                                             ; 292B _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 292C _ 55
        mov     ebp, esp                                ; 292D _ 89. E5
        sub     esp, 20                                 ; 292F _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2932 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 2935 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 2938 _ C7. 45, F8, 00000000
        jmp     ?_151                                   ; 293F _ E9, 000000B1

?_145:  mov     dword [ebp-4H], 0                       ; 2944 _ C7. 45, FC, 00000000
        jmp     ?_150                                   ; 294B _ E9, 00000097

?_146:  mov     eax, dword [ebp-8H]                     ; 2950 _ 8B. 45, F8
        shl     eax, 4                                  ; 2953 _ C1. E0, 04
        mov     edx, eax                                ; 2956 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2958 _ 8B. 45, FC
        add     eax, edx                                ; 295B _ 01. D0
        add     eax, cursor.2087                        ; 295D _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 2962 _ 0F B6. 00
        cmp     al, 42                                  ; 2965 _ 3C, 2A
        jnz     ?_147                                   ; 2967 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2969 _ 8B. 45, F8
        shl     eax, 4                                  ; 296C _ C1. E0, 04
        mov     edx, eax                                ; 296F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2971 _ 8B. 45, FC
        add     eax, edx                                ; 2974 _ 01. D0
        mov     edx, eax                                ; 2976 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2978 _ 8B. 45, 08
        add     eax, edx                                ; 297B _ 01. D0
        mov     byte [eax], 0                           ; 297D _ C6. 00, 00
?_147:  mov     eax, dword [ebp-8H]                     ; 2980 _ 8B. 45, F8
        shl     eax, 4                                  ; 2983 _ C1. E0, 04
        mov     edx, eax                                ; 2986 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2988 _ 8B. 45, FC
        add     eax, edx                                ; 298B _ 01. D0
        add     eax, cursor.2087                        ; 298D _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 2992 _ 0F B6. 00
        cmp     al, 79                                  ; 2995 _ 3C, 4F
        jnz     ?_148                                   ; 2997 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2999 _ 8B. 45, F8
        shl     eax, 4                                  ; 299C _ C1. E0, 04
        mov     edx, eax                                ; 299F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 29A1 _ 8B. 45, FC
        add     eax, edx                                ; 29A4 _ 01. D0
        mov     edx, eax                                ; 29A6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 29A8 _ 8B. 45, 08
        add     eax, edx                                ; 29AB _ 01. D0
        mov     byte [eax], 7                           ; 29AD _ C6. 00, 07
?_148:  mov     eax, dword [ebp-8H]                     ; 29B0 _ 8B. 45, F8
        shl     eax, 4                                  ; 29B3 _ C1. E0, 04
        mov     edx, eax                                ; 29B6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 29B8 _ 8B. 45, FC
        add     eax, edx                                ; 29BB _ 01. D0
        add     eax, cursor.2087                        ; 29BD _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 29C2 _ 0F B6. 00
        cmp     al, 46                                  ; 29C5 _ 3C, 2E
        jnz     ?_149                                   ; 29C7 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 29C9 _ 8B. 45, F8
        shl     eax, 4                                  ; 29CC _ C1. E0, 04
        mov     edx, eax                                ; 29CF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 29D1 _ 8B. 45, FC
        add     eax, edx                                ; 29D4 _ 01. D0
        mov     edx, eax                                ; 29D6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 29D8 _ 8B. 45, 08
        add     edx, eax                                ; 29DB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 29DD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 29E1 _ 88. 02
?_149:  add     dword [ebp-4H], 1                       ; 29E3 _ 83. 45, FC, 01
?_150:  cmp     dword [ebp-4H], 15                      ; 29E7 _ 83. 7D, FC, 0F
        jle     ?_146                                   ; 29EB _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 29F1 _ 83. 45, F8, 01
?_151:  cmp     dword [ebp-8H], 15                      ; 29F5 _ 83. 7D, F8, 0F
        jle     ?_145                                   ; 29F9 _ 0F 8E, FFFFFF45
        leave                                           ; 29FF _ C9
        ret                                             ; 2A00 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 2A01 _ 55
        mov     ebp, esp                                ; 2A02 _ 89. E5
        sub     esp, 16                                 ; 2A04 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2A07 _ C7. 45, F8, 00000000
        jmp     ?_155                                   ; 2A0E _ EB, 50

?_152:  mov     dword [ebp-4H], 0                       ; 2A10 _ C7. 45, FC, 00000000
        jmp     ?_154                                   ; 2A17 _ EB, 3B

?_153:  mov     eax, dword [ebp-8H]                     ; 2A19 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 2A1C _ 8B. 55, 1C
        add     eax, edx                                ; 2A1F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2A21 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 2A25 _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 2A28 _ 8B. 4D, 18
        add     edx, ecx                                ; 2A2B _ 01. CA
        add     eax, edx                                ; 2A2D _ 01. D0
        mov     edx, eax                                ; 2A2F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A31 _ 8B. 45, 08
        add     edx, eax                                ; 2A34 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 2A36 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2A39 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2A3D _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2A3F _ 8B. 45, FC
        add     eax, ecx                                ; 2A42 _ 01. C8
        mov     ecx, eax                                ; 2A44 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 2A46 _ 8B. 45, 20
        add     eax, ecx                                ; 2A49 _ 01. C8
        movzx   eax, byte [eax]                         ; 2A4B _ 0F B6. 00
        mov     byte [edx], al                          ; 2A4E _ 88. 02
        add     dword [ebp-4H], 1                       ; 2A50 _ 83. 45, FC, 01
?_154:  mov     eax, dword [ebp-4H]                     ; 2A54 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 2A57 _ 3B. 45, 10
        jl      ?_153                                   ; 2A5A _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2A5C _ 83. 45, F8, 01
?_155:  mov     eax, dword [ebp-8H]                     ; 2A60 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 2A63 _ 3B. 45, 14
        jl      ?_152                                   ; 2A66 _ 7C, A8
        leave                                           ; 2A68 _ C9
        ret                                             ; 2A69 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2A6A _ 55
        mov     ebp, esp                                ; 2A6B _ 89. E5
        sub     esp, 40                                 ; 2A6D _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 2A70 _ A1, 00000024(d)
        mov     dword [ebp-0CH], eax                    ; 2A75 _ 89. 45, F4
        movzx   eax, word [?_361]                       ; 2A78 _ 0F B7. 05, 00000028(d)
        cwde                                            ; 2A7F _ 98
        mov     dword [ebp-10H], eax                    ; 2A80 _ 89. 45, F0
        movzx   eax, word [?_362]                       ; 2A83 _ 0F B7. 05, 0000002A(d)
        cwde                                            ; 2A8A _ 98
        mov     dword [ebp-14H], eax                    ; 2A8B _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 2A8E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2A96 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2A9D _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 2AA2 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 2AA6 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2AAD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 2AB2 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 2AB5 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 2AB9 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2ABD _ C7. 04 24, 0000002C(d)
        call    fifo8_put                               ; 2AC4 _ E8, FFFFFFFC(rel)
        nop                                             ; 2AC9 _ 90
        leave                                           ; 2ACA _ C9
        ret                                             ; 2ACB _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2ACC _ 55
        mov     ebp, esp                                ; 2ACD _ 89. E5
        sub     esp, 4                                  ; 2ACF _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2AD2 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2AD5 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2AD8 _ 80. 7D, FC, 09
        jle     ?_156                                   ; 2ADC _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2ADE _ 0F B6. 45, FC
        add     eax, 55                                 ; 2AE2 _ 83. C0, 37
        jmp     ?_157                                   ; 2AE5 _ EB, 07

?_156:  movzx   eax, byte [ebp-4H]                      ; 2AE7 _ 0F B6. 45, FC
        add     eax, 48                                 ; 2AEB _ 83. C0, 30
?_157:  leave                                           ; 2AEE _ C9
        ret                                             ; 2AEF _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2AF0 _ 55
        mov     ebp, esp                                ; 2AF1 _ 89. E5
        sub     esp, 24                                 ; 2AF3 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2AF6 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2AF9 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2AFC _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2B03 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2B07 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2B0A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2B0D _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2B11 _ 89. 04 24
        call    charToHexVal                            ; 2B14 _ E8, FFFFFFFC(rel)
        mov     byte [?_354], al                        ; 2B19 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 2B1E _ 0F B6. 45, EC
        shr     al, 4                                   ; 2B22 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2B25 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2B28 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2B2C _ 0F BE. C0
        mov     dword [esp], eax                        ; 2B2F _ 89. 04 24
        call    charToHexVal                            ; 2B32 _ E8, FFFFFFFC(rel)
        mov     byte [?_353], al                        ; 2B37 _ A2, 00000112(d)
        mov     eax, keyval                             ; 2B3C _ B8, 00000110(d)
        leave                                           ; 2B41 _ C9
        ret                                             ; 2B42 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2B43 _ 55
        mov     ebp, esp                                ; 2B44 _ 89. E5
        sub     esp, 16                                 ; 2B46 _ 83. EC, 10
        mov     byte [str.2135], 48                     ; 2B49 _ C6. 05, 000003B4(d), 30
        mov     byte [?_367], 88                        ; 2B50 _ C6. 05, 000003B5(d), 58
        mov     byte [?_368], 0                         ; 2B57 _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 2B5E _ C7. 45, FC, 00000002
        jmp     ?_159                                   ; 2B65 _ EB, 0F

?_158:  mov     eax, dword [ebp-4H]                     ; 2B67 _ 8B. 45, FC
        add     eax, str.2135                           ; 2B6A _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 2B6F _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 2B72 _ 83. 45, FC, 01
?_159:  cmp     dword [ebp-4H], 9                       ; 2B76 _ 83. 7D, FC, 09
        jle     ?_158                                   ; 2B7A _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2B7C _ C7. 45, F8, 00000009
        jmp     ?_163                                   ; 2B83 _ EB, 40

?_160:  mov     eax, dword [ebp+8H]                     ; 2B85 _ 8B. 45, 08
        and     eax, 0FH                                ; 2B88 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2B8B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2B8E _ 8B. 45, 08
        shr     eax, 4                                  ; 2B91 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2B94 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 2B97 _ 83. 7D, F4, 09
        jle     ?_161                                   ; 2B9B _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 2B9D _ 8B. 45, F4
        add     eax, 55                                 ; 2BA0 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2BA3 _ 8B. 55, F8
        add     edx, str.2135                           ; 2BA6 _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2BAC _ 88. 02
        jmp     ?_162                                   ; 2BAE _ EB, 11

?_161:  mov     eax, dword [ebp-0CH]                    ; 2BB0 _ 8B. 45, F4
        add     eax, 48                                 ; 2BB3 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2BB6 _ 8B. 55, F8
        add     edx, str.2135                           ; 2BB9 _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2BBF _ 88. 02
?_162:  sub     dword [ebp-8H], 1                       ; 2BC1 _ 83. 6D, F8, 01
?_163:  cmp     dword [ebp-8H], 1                       ; 2BC5 _ 83. 7D, F8, 01
        jle     ?_164                                   ; 2BC9 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2BCB _ 83. 7D, 08, 00
        jnz     ?_160                                   ; 2BCF _ 75, B4
?_164:  mov     eax, str.2135                           ; 2BD1 _ B8, 000003B4(d)
        leave                                           ; 2BD6 _ C9
        ret                                             ; 2BD7 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2BD8 _ 55
        mov     ebp, esp                                ; 2BD9 _ 89. E5
        sub     esp, 24                                 ; 2BDB _ 83. EC, 18
?_165:  mov     dword [esp], 100                        ; 2BDE _ C7. 04 24, 00000064
        call    io_in8                                  ; 2BE5 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2BEA _ 83. E0, 02
        test    eax, eax                                ; 2BED _ 85. C0
        jnz     ?_166                                   ; 2BEF _ 75, 02
        jmp     ?_167                                   ; 2BF1 _ EB, 02

?_166:  jmp     ?_165                                   ; 2BF3 _ EB, E9

?_167:  leave                                           ; 2BF5 _ C9
        ret                                             ; 2BF6 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2BF7 _ 55
        mov     ebp, esp                                ; 2BF8 _ 89. E5
        sub     esp, 24                                 ; 2BFA _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2BFD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2C02 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2C0A _ C7. 04 24, 00000064
        call    io_out8                                 ; 2C11 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2C16 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2C1B _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2C23 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2C2A _ E8, FFFFFFFC(rel)
        nop                                             ; 2C2F _ 90
        leave                                           ; 2C30 _ C9
        ret                                             ; 2C31 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2C32 _ 55
        mov     ebp, esp                                ; 2C33 _ 89. E5
        sub     esp, 24                                 ; 2C35 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2C38 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2C3D _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2C45 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2C4C _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2C51 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2C56 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2C5E _ C7. 04 24, 00000060
        call    io_out8                                 ; 2C65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2C6A _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2C6D _ C6. 40, 03, 00
        nop                                             ; 2C71 _ 90
        leave                                           ; 2C72 _ C9
        ret                                             ; 2C73 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 2C74 _ 55
        mov     ebp, esp                                ; 2C75 _ 89. E5
        sub     esp, 40                                 ; 2C77 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2C7A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2C82 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2C89 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2C8E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2C96 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2C9D _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2CA2 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2CA9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2CAE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2CB1 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2CB5 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2CB9 _ C7. 04 24, 00000048(d)
        call    fifo8_put                               ; 2CC0 _ E8, FFFFFFFC(rel)
        leave                                           ; 2CC5 _ C9
        ret                                             ; 2CC6 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2CC7 _ 55
        mov     ebp, esp                                ; 2CC8 _ 89. E5
        sub     esp, 4                                  ; 2CCA _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2CCD _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2CD0 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2CD3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2CD6 _ 0F B6. 40, 03
        test    al, al                                  ; 2CDA _ 84. C0
        jnz     ?_169                                   ; 2CDC _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2CDE _ 80. 7D, FC, FA
        jnz     ?_168                                   ; 2CE2 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2CE4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2CE7 _ C6. 40, 03, 01
?_168:  mov     eax, 0                                  ; 2CEB _ B8, 00000000
        jmp     ?_176                                   ; 2CF0 _ E9, 0000010F

?_169:  mov     eax, dword [ebp+8H]                     ; 2CF5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2CF8 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2CFC _ 3C, 01
        jnz     ?_171                                   ; 2CFE _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2D00 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2D04 _ 25, 000000C8
        cmp     eax, 8                                  ; 2D09 _ 83. F8, 08
        jnz     ?_170                                   ; 2D0C _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2D0E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2D11 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2D15 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2D17 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2D1A _ C6. 40, 03, 02
?_170:  mov     eax, 0                                  ; 2D1E _ B8, 00000000
        jmp     ?_176                                   ; 2D23 _ E9, 000000DC

?_171:  mov     eax, dword [ebp+8H]                     ; 2D28 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2D2B _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2D2F _ 3C, 02
        jnz     ?_172                                   ; 2D31 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2D33 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2D36 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2D3A _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D3D _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2D40 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2D44 _ B8, 00000000
        jmp     ?_176                                   ; 2D49 _ E9, 000000B6

?_172:  mov     eax, dword [ebp+8H]                     ; 2D4E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2D51 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2D55 _ 3C, 03
        jne     ?_175                                   ; 2D57 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2D5D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2D60 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2D64 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2D67 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2D6A _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2D6E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2D71 _ 0F B6. 00
        movzx   eax, al                                 ; 2D74 _ 0F B6. C0
        and     eax, 07H                                ; 2D77 _ 83. E0, 07
        mov     edx, eax                                ; 2D7A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D7C _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2D7F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D82 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2D85 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2D89 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2D8C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D8F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2D92 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2D95 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2D99 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2D9C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D9F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2DA2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2DA5 _ 0F B6. 00
        movzx   eax, al                                 ; 2DA8 _ 0F B6. C0
        and     eax, 10H                                ; 2DAB _ 83. E0, 10
        test    eax, eax                                ; 2DAE _ 85. C0
        jz      ?_173                                   ; 2DB0 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2DB2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2DB5 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2DB8 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2DBD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DBF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2DC2 _ 89. 50, 04
?_173:  mov     eax, dword [ebp+8H]                     ; 2DC5 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2DC8 _ 0F B6. 00
        movzx   eax, al                                 ; 2DCB _ 0F B6. C0
        and     eax, 20H                                ; 2DCE _ 83. E0, 20
        test    eax, eax                                ; 2DD1 _ 85. C0
        jz      ?_174                                   ; 2DD3 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2DD5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2DD8 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2DDB _ 0D, FFFFFF00
        mov     edx, eax                                ; 2DE0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DE2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2DE5 _ 89. 50, 08
?_174:  mov     eax, dword [ebp+8H]                     ; 2DE8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2DEB _ 8B. 40, 08
        neg     eax                                     ; 2DEE _ F7. D8
        mov     edx, eax                                ; 2DF0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DF2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2DF5 _ 89. 50, 08
        mov     eax, 1                                  ; 2DF8 _ B8, 00000001
        jmp     ?_176                                   ; 2DFD _ EB, 05

?_175:  mov     eax, 4294967295                         ; 2DFF _ B8, FFFFFFFF
?_176:  leave                                           ; 2E04 _ C9
        ret                                             ; 2E05 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 2E06 _ 55
        mov     ebp, esp                                ; 2E07 _ 89. E5
        sub     esp, 72                                 ; 2E09 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 2E0C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 2E13 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 2E1A _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 2E21 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 2E28 _ 8B. 15, 00000160(d)
        mov     eax, dword [ebp+0CH]                    ; 2E2E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E31 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 2E33 _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 2E37 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 2E3A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E3E _ 89. 04 24
        call    init_screen8                            ; 2E41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 2E46 _ 8B. 45, 20
        movsx   eax, al                                 ; 2E49 _ 0F BE. C0
        mov     dword [esp+14H], ?_344                  ; 2E4C _ C7. 44 24, 14, 0000005B(d)
        mov     dword [esp+10H], eax                    ; 2E54 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2E58 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2E5B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E5F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E62 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E66 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E69 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E6D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E70 _ 89. 04 24
        call    showString                              ; 2E73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 2E78 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2E7B _ 89. 04 24
        call    intToHexStr                             ; 2E7E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 2E83 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 2E86 _ 8B. 45, 20
        movsx   eax, al                                 ; 2E89 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 2E8C _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 2E8F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2E93 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2E97 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2E9A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2E9E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2EA1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2EA5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EA8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EAC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EAF _ 89. 04 24
        call    showString                              ; 2EB2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2EB7 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2EBB _ 8B. 45, 20
        movsx   eax, al                                 ; 2EBE _ 0F BE. C0
        mov     dword [esp+14H], ?_345                  ; 2EC1 _ C7. 44 24, 14, 00000065(d)
        mov     dword [esp+10H], eax                    ; 2EC9 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2ECD _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2ED0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2ED4 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2ED7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2EDB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EDE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EE5 _ 89. 04 24
        call    showString                              ; 2EE8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2EED _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 2EF0 _ 8B. 00
        mov     dword [esp], eax                        ; 2EF2 _ 89. 04 24
        call    intToHexStr                             ; 2EF5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2EFA _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 2EFD _ 8B. 45, 20
        movsx   eax, al                                 ; 2F00 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 2F03 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 2F06 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F0A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2F0E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2F11 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2F15 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2F18 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F1C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F1F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F23 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F26 _ 89. 04 24
        call    showString                              ; 2F29 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2F2E _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2F32 _ 8B. 45, 20
        movsx   eax, al                                 ; 2F35 _ 0F BE. C0
        mov     dword [esp+14H], ?_346                  ; 2F38 _ C7. 44 24, 14, 00000071(d)
        mov     dword [esp+10H], eax                    ; 2F40 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2F44 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2F47 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2F4B _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2F4E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F52 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F55 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F59 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F5C _ 89. 04 24
        call    showString                              ; 2F5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F64 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 2F67 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 2F6A _ 89. 04 24
        call    intToHexStr                             ; 2F6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2F72 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 2F75 _ 8B. 45, 20
        movsx   eax, al                                 ; 2F78 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 2F7B _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 2F7E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F82 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2F86 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2F89 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2F8D _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2F90 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F94 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F97 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F9B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F9E _ 89. 04 24
        call    showString                              ; 2FA1 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2FA6 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2FAA _ 8B. 45, 20
        movsx   eax, al                                 ; 2FAD _ 0F BE. C0
        mov     dword [esp+14H], ?_347                  ; 2FB0 _ C7. 44 24, 14, 0000007D(d)
        mov     dword [esp+10H], eax                    ; 2FB8 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2FBC _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2FBF _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2FC3 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2FC6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2FCA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FCD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FD1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FD4 _ 89. 04 24
        call    showString                              ; 2FD7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2FDC _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 2FDF _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2FE2 _ 89. 04 24
        call    intToHexStr                             ; 2FE5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 2FEA _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 2FED _ 8B. 45, 20
        movsx   eax, al                                 ; 2FF0 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 2FF3 _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 2FF6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2FFA _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2FFE _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3001 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3005 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3008 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 300C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 300F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3013 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3016 _ 89. 04 24
        call    showString                              ; 3019 _ E8, FFFFFFFC(rel)
        leave                                           ; 301E _ C9
        ret                                             ; 301F _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3020 _ 55
        mov     ebp, esp                                ; 3021 _ 89. E5
        sub     esp, 56                                 ; 3023 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 3026 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3029 _ 89. 04 24
        call    sheet_alloc                             ; 302C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3031 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3034 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 3039 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3041 _ 89. 04 24
        call    memman_alloc_4k                         ; 3044 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3049 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 304C _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 3054 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 305C _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 3064 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3067 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 306B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 306E _ 89. 04 24
        call    sheet_setbuf                            ; 3071 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 3076 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 307E _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3081 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 3085 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3088 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 308C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 308F _ 89. 04 24
        call    make_window8                            ; 3092 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 3097 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 309F _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 30A7 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 30AF _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 30B7 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 30BF _ 8B. 45, F4
        mov     dword [esp], eax                        ; 30C2 _ 89. 04 24
        call    make_textbox8                           ; 30C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 30CA _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 30D2 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 30DA _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 30DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30E4 _ 89. 04 24
        call    sheet_slide                             ; 30E7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 30EC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 30F4 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 30F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30FE _ 89. 04 24
        call    sheet_updown                            ; 3101 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3106 _ 8B. 45, F4
        leave                                           ; 3109 _ C9
        ret                                             ; 310A _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 310B _ 55
        mov     ebp, esp                                ; 310C _ 89. E5
        push    ebx                                     ; 310E _ 53
        sub     esp, 52                                 ; 310F _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3112 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3115 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3118 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 311B _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 311E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3121 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3124 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3127 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 312A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 312D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3130 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3133 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 3135 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 313D _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3141 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3149 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3151 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3159 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 315C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3160 _ 89. 04 24
        call    boxfill8                                ; 3163 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3168 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 316B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 316E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3171 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 3173 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 317B _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 317F _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3187 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 318F _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3197 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 319A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 319E _ 89. 04 24
        call    boxfill8                                ; 31A1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 31A6 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 31A9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 31AC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31AF _ 8B. 00
        mov     dword [esp+18H], edx                    ; 31B1 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 31B5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 31BD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 31C5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 31CD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 31D5 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 31D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31DC _ 89. 04 24
        call    boxfill8                                ; 31DF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 31E4 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 31E7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 31EA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31ED _ 8B. 00
        mov     dword [esp+18H], edx                    ; 31EF _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 31F3 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 31FB _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3203 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 320B _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3213 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3216 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 321A _ 89. 04 24
        call    boxfill8                                ; 321D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3222 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3225 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3228 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 322B _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 322E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3231 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3234 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3237 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3239 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 323D _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3241 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3249 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 324D _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3255 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 325C _ 89. 04 24
        call    boxfill8                                ; 325F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3264 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3267 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 326A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 326D _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3270 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3273 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3276 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3279 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 327B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 327F _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 3283 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 328B _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 328F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3297 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 329A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 329E _ 89. 04 24
        call    boxfill8                                ; 32A1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 32A6 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 32A9 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 32AC _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 32AF _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 32B2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 32B5 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 32B7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 32BB _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 32BF _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 32C7 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 32CF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 32D7 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 32DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 32DE _ 89. 04 24
        call    boxfill8                                ; 32E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 32E6 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 32E9 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 32EC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 32EF _ 8B. 00
        mov     dword [esp+18H], 20                     ; 32F1 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 32F9 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 32FD _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3305 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 330D _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 3315 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3318 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 331C _ 89. 04 24
        call    boxfill8                                ; 331F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3324 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3327 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 332A _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 332D _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3330 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3333 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3336 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3339 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 333B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 333F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3343 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 3347 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 334F _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3357 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 335A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 335E _ 89. 04 24
        call    boxfill8                                ; 3361 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3366 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3369 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 336C _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 336F _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3372 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3375 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3378 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 337B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 337D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3381 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3385 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3389 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3391 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3399 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 339C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 33A0 _ 89. 04 24
        call    boxfill8                                ; 33A3 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 33A8 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 33AC _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 33B0 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 33B3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 33B7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 33BA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33BE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33C1 _ 89. 04 24
        call    make_wtitle8                            ; 33C4 _ E8, FFFFFFFC(rel)
        nop                                             ; 33C9 _ 90
        add     esp, 52                                 ; 33CA _ 83. C4, 34
        pop     ebx                                     ; 33CD _ 5B
        pop     ebp                                     ; 33CE _ 5D
        ret                                             ; 33CF _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 33D0 _ 55
        mov     ebp, esp                                ; 33D1 _ 89. E5
        push    ebx                                     ; 33D3 _ 53
        sub     esp, 52                                 ; 33D4 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 33D7 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 33DA _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 33DD _ 80. 7D, E4, 00
        jz      ?_177                                   ; 33E1 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 33E3 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 33E7 _ C6. 45, ED, 0C
        jmp     ?_178                                   ; 33EB _ EB, 08

?_177:  mov     byte [ebp-12H], 8                       ; 33ED _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 33F1 _ C6. 45, ED, 0F
?_178:  mov     eax, dword [ebp+0CH]                    ; 33F5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 33F8 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 33FB _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 33FE _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3402 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3405 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3408 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 340B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 340E _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3410 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 3418 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 341C _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3424 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 342C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3430 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3434 _ 89. 04 24
        call    boxfill8                                ; 3437 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 343C _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 3440 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 3443 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3447 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 344B _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 3453 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 345B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 345E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3462 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3465 _ 89. 04 24
        call    showString                              ; 3468 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 346D _ C7. 45, F0, 00000000
        jmp     ?_186                                   ; 3474 _ E9, 00000083

?_179:  mov     dword [ebp-0CH], 0                      ; 3479 _ C7. 45, F4, 00000000
        jmp     ?_185                                   ; 3480 _ EB, 70

?_180:  mov     eax, dword [ebp-10H]                    ; 3482 _ 8B. 45, F0
        shl     eax, 4                                  ; 3485 _ C1. E0, 04
        mov     edx, eax                                ; 3488 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 348A _ 8B. 45, F4
        add     eax, edx                                ; 348D _ 01. D0
        add     eax, closebtn.2206                      ; 348F _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 3494 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3497 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 349A _ 80. 7D, EF, 40
        jnz     ?_181                                   ; 349E _ 75, 06
        mov     byte [ebp-11H], 0                       ; 34A0 _ C6. 45, EF, 00
        jmp     ?_184                                   ; 34A4 _ EB, 1C

?_181:  cmp     byte [ebp-11H], 36                      ; 34A6 _ 80. 7D, EF, 24
        jnz     ?_182                                   ; 34AA _ 75, 06
        mov     byte [ebp-11H], 15                      ; 34AC _ C6. 45, EF, 0F
        jmp     ?_184                                   ; 34B0 _ EB, 10

?_182:  cmp     byte [ebp-11H], 81                      ; 34B2 _ 80. 7D, EF, 51
        jnz     ?_183                                   ; 34B6 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 34B8 _ C6. 45, EF, 08
        jmp     ?_184                                   ; 34BC _ EB, 04

?_183:  mov     byte [ebp-11H], 7                       ; 34BE _ C6. 45, EF, 07
?_184:  mov     eax, dword [ebp+0CH]                    ; 34C2 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 34C5 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 34C7 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 34CA _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 34CD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 34D0 _ 8B. 40, 04
        imul    ecx, eax                                ; 34D3 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 34D6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 34D9 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 34DC _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 34DF _ 8B. 45, F4
        add     eax, ebx                                ; 34E2 _ 01. D8
        add     eax, ecx                                ; 34E4 _ 01. C8
        add     edx, eax                                ; 34E6 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 34E8 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 34EC _ 88. 02
        add     dword [ebp-0CH], 1                      ; 34EE _ 83. 45, F4, 01
?_185:  cmp     dword [ebp-0CH], 15                     ; 34F2 _ 83. 7D, F4, 0F
        jle     ?_180                                   ; 34F6 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 34F8 _ 83. 45, F0, 01
?_186:  cmp     dword [ebp-10H], 13                     ; 34FC _ 83. 7D, F0, 0D
        jle     ?_179                                   ; 3500 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 3506 _ 83. C4, 34
        pop     ebx                                     ; 3509 _ 5B
        pop     ebp                                     ; 350A _ 5D
        ret                                             ; 350B _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 350C _ 55
        mov     ebp, esp                                ; 350D _ 89. E5
        push    edi                                     ; 350F _ 57
        push    esi                                     ; 3510 _ 56
        push    ebx                                     ; 3511 _ 53
        sub     esp, 44                                 ; 3512 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 3515 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 3518 _ 8B. 55, 0C
        add     eax, edx                                ; 351B _ 01. D0
        mov     dword [ebp-10H], eax                    ; 351D _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 3520 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 3523 _ 8B. 55, 10
        add     eax, edx                                ; 3526 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3528 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 352B _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 352E _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3531 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3534 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3537 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 353A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 353D _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3540 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3543 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3546 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3549 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 354C _ 8B. 00
        mov     dword [esp+18H], edi                    ; 354E _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3552 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3556 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 355A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 355E _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3566 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 356A _ 89. 04 24
        call    boxfill8                                ; 356D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3572 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3575 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3578 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 357B _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 357E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3581 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3584 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3587 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 358A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 358D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3590 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3593 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3595 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3599 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 359D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 35A1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 35A5 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 35AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35B1 _ 89. 04 24
        call    boxfill8                                ; 35B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 35B9 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 35BC _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 35BF _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 35C2 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 35C5 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 35C8 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 35CB _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 35CE _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 35D1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 35D4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35D7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35DA _ 8B. 00
        mov     dword [esp+18H], edi                    ; 35DC _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 35E0 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 35E4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 35E8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 35EC _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 35F4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35F8 _ 89. 04 24
        call    boxfill8                                ; 35FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3600 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3603 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3606 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3609 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 360C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 360F _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3612 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 3615 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3618 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 361B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 361E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3621 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3623 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3627 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 362B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 362F _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3633 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 363B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 363F _ 89. 04 24
        call    boxfill8                                ; 3642 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3647 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 364A _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 364D _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3650 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3653 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3656 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3659 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 365C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 365F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3662 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3664 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3668 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 366B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 366F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3673 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3677 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 367F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3683 _ 89. 04 24
        call    boxfill8                                ; 3686 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 368B _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 368E _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 3691 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3694 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3697 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 369A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 369D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 36A0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 36A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36A6 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 36A8 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 36AB _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 36AF _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 36B3 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 36B7 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 36BB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 36C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 36C7 _ 89. 04 24
        call    boxfill8                                ; 36CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 36CF _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 36D2 _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 36D5 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 36D8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 36DB _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 36DE _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 36E1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 36E4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 36E7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36EA _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 36EC _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 36F0 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 36F3 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 36F7 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 36FB _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 36FF _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3707 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 370B _ 89. 04 24
        call    boxfill8                                ; 370E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3713 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3716 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3719 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 371C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 371F _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3722 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3725 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3728 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 372B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 372E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3731 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3734 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3736 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 373A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 373E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3742 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 3746 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 374E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3752 _ 89. 04 24
        call    boxfill8                                ; 3755 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 375A _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 375D _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 3760 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 3763 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 3766 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3769 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 376C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 376F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3772 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3775 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 3777 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 377A _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 377E _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 3781 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 3785 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3789 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 378D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3791 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3795 _ 89. 04 24
        call    boxfill8                                ; 3798 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 379D _ 83. C4, 2C
        pop     ebx                                     ; 37A0 _ 5B
        pop     esi                                     ; 37A1 _ 5E
        pop     edi                                     ; 37A2 _ 5F
        pop     ebp                                     ; 37A3 _ 5D
        ret                                             ; 37A4 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 37A5 _ 55
        mov     ebp, esp                                ; 37A6 _ 89. E5
        sub     esp, 56                                 ; 37A8 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 37AB _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 37B2 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 37B7 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 37BF _ 89. 04 24
        call    memman_alloc                            ; 37C2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 37C7 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 37CA _ 8B. 45, E4
        add     eax, 12                                 ; 37CD _ 83. C0, 0C
        mov     byte [eax], 0                           ; 37D0 _ C6. 00, 00
        jmp     ?_197                                   ; 37D3 _ E9, 0000011E

?_187:  mov     dword [ebp-10H], 0                      ; 37D8 _ C7. 45, F0, 00000000
        jmp     ?_190                                   ; 37DF _ EB, 2C

?_188:  mov     edx, dword [ebp-0CH]                    ; 37E1 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 37E4 _ 8B. 45, F0
        add     eax, edx                                ; 37E7 _ 01. D0
        movzx   eax, byte [eax]                         ; 37E9 _ 0F B6. 00
        test    al, al                                  ; 37EC _ 84. C0
        jz      ?_189                                   ; 37EE _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 37F0 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 37F3 _ 8B. 45, E4
        add     edx, eax                                ; 37F6 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 37F8 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 37FB _ 8B. 45, F0
        add     eax, ecx                                ; 37FE _ 01. C8
        movzx   eax, byte [eax]                         ; 3800 _ 0F B6. 00
        mov     byte [edx], al                          ; 3803 _ 88. 02
        add     dword [ebp-10H], 1                      ; 3805 _ 83. 45, F0, 01
        jmp     ?_190                                   ; 3809 _ EB, 02

?_189:  jmp     ?_191                                   ; 380B _ EB, 06

?_190:  cmp     dword [ebp-10H], 7                      ; 380D _ 83. 7D, F0, 07
        jle     ?_188                                   ; 3811 _ 7E, CE
?_191:  mov     dword [ebp-14H], 0                      ; 3813 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 381A _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 381D _ 8B. 45, E4
        add     eax, edx                                ; 3820 _ 01. D0
        mov     byte [eax], 46                          ; 3822 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 3825 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3829 _ C7. 45, EC, 00000000
        jmp     ?_193                                   ; 3830 _ EB, 1E

?_192:  mov     edx, dword [ebp-10H]                    ; 3832 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3835 _ 8B. 45, E4
        add     edx, eax                                ; 3838 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 383A _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 383D _ 8B. 45, EC
        add     eax, ecx                                ; 3840 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 3842 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3846 _ 88. 02
        add     dword [ebp-10H], 1                      ; 3848 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 384C _ 83. 45, EC, 01
?_193:  cmp     dword [ebp-14H], 2                      ; 3850 _ 83. 7D, EC, 02
        jle     ?_192                                   ; 3854 _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3856 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3859 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 385D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3860 _ 89. 04 24
        call    strcmp                                  ; 3863 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3868 _ 83. F8, 01
        jne     ?_196                                   ; 386B _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 3871 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 3874 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3877 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 387C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3880 _ 89. 04 24
        call    memman_alloc_4k                         ; 3883 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3888 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 388A _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 388D _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 388F _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3892 _ 8B. 40, 1C
        mov     edx, eax                                ; 3895 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3897 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 389A _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 389D _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 38A4 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 38A7 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 38AB _ 0F B7. C0
        shl     eax, 9                                  ; 38AE _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 38B1 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 38B4 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 38B7 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 38BA _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 38BD _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 38C4 _ C7. 45, E8, 00000000
        jmp     ?_195                                   ; 38CB _ EB, 1B

?_194:  mov     eax, dword [ebp+0CH]                    ; 38CD _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 38D0 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 38D2 _ 8B. 45, E8
        add     edx, eax                                ; 38D5 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 38D7 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 38DA _ 8B. 45, E0
        add     eax, ecx                                ; 38DD _ 01. C8
        movzx   eax, byte [eax]                         ; 38DF _ 0F B6. 00
        mov     byte [edx], al                          ; 38E2 _ 88. 02
        add     dword [ebp-18H], 1                      ; 38E4 _ 83. 45, E8, 01
?_195:  mov     eax, dword [ebp-18H]                    ; 38E8 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 38EB _ 3B. 45, DC
        jl      ?_194                                   ; 38EE _ 7C, DD
        jmp     ?_198                                   ; 38F0 _ EB, 12

?_196:  add     dword [ebp-0CH], 32                     ; 38F2 _ 83. 45, F4, 20
?_197:  mov     eax, dword [ebp-0CH]                    ; 38F6 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 38F9 _ 0F B6. 00
        test    al, al                                  ; 38FC _ 84. C0
        jne     ?_187                                   ; 38FE _ 0F 85, FFFFFED4
?_198:  mov     edx, dword [ebp-1CH]                    ; 3904 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 3907 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 390C _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 3914 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3918 _ 89. 04 24
        call    memman_free                             ; 391B _ E8, FFFFFFFC(rel)
        leave                                           ; 3920 _ C9
        ret                                             ; 3921 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 3922 _ 55
        mov     ebp, esp                                ; 3923 _ 89. E5
        sub     esp, 40                                 ; 3925 _ 83. EC, 28
        mov     dword [?_355], 8                        ; 3928 _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_348                      ; 3932 _ C7. 04 24, 00000089(d)
        call    cons_putstr                             ; 3939 _ E8, FFFFFFFC(rel)
        mov     dword [?_355], 8                        ; 393E _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_356]                      ; 3948 _ A1, 00000014(d)
        add     eax, 16                                 ; 394D _ 83. C0, 10
        mov     dword [?_356], eax                      ; 3950 _ A3, 00000014(d)
        mov     dword [esp], ?_349                      ; 3955 _ C7. 04 24, 00000090(d)
        call    cons_putstr                             ; 395C _ E8, FFFFFFFC(rel)
        mov     dword [?_355], 8                        ; 3961 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_356]                      ; 396B _ A1, 00000014(d)
        add     eax, 16                                 ; 3970 _ 83. C0, 10
        mov     dword [?_356], eax                      ; 3973 _ A3, 00000014(d)
        mov     eax, dword [ebp+8H]                     ; 3978 _ 8B. 45, 08
        add     eax, 44                                 ; 397B _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 397E _ 8B. 00
        mov     dword [esp], eax                        ; 3980 _ 89. 04 24
        call    intToHexStr                             ; 3983 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3988 _ 89. 45, F4
        mov     dword [esp], ?_350                      ; 398B _ C7. 04 24, 000000A0(d)
        call    cons_putstr                             ; 3992 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3997 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 399A _ 89. 04 24
        call    cons_putstr                             ; 399D _ E8, FFFFFFFC(rel)
        mov     dword [?_355], 8                        ; 39A2 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_356]                      ; 39AC _ A1, 00000014(d)
        add     eax, 16                                 ; 39B1 _ 83. C0, 10
        mov     dword [?_356], eax                      ; 39B4 _ A3, 00000014(d)
        call    task_now                                ; 39B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 39BE _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 39C1 _ 8B. 45, F0
        add     eax, 48                                 ; 39C4 _ 83. C0, 30
        leave                                           ; 39C7 _ C9
        ret                                             ; 39C8 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 39C9 _ 55
        mov     ebp, esp                                ; 39CA _ 89. E5
        sub     esp, 40                                 ; 39CC _ 83. EC, 28
        mov     dword [?_355], 8                        ; 39CF _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_351                      ; 39D9 _ C7. 04 24, 000000A7(d)
        call    cons_putstr                             ; 39E0 _ E8, FFFFFFFC(rel)
        mov     dword [?_355], 8                        ; 39E5 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_356]                      ; 39EF _ A1, 00000014(d)
        add     eax, 16                                 ; 39F4 _ 83. C0, 10
        mov     dword [?_356], eax                      ; 39F7 _ A3, 00000014(d)
        mov     dword [esp], ?_352                      ; 39FC _ C7. 04 24, 000000AF(d)
        call    cons_putstr                             ; 3A03 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_356]                      ; 3A08 _ A1, 00000014(d)
        add     eax, 16                                 ; 3A0D _ 83. C0, 10
        mov     dword [?_356], eax                      ; 3A10 _ A3, 00000014(d)
        mov     dword [?_355], 8                        ; 3A15 _ C7. 05, 00000010(d), 00000008
        call    task_now                                ; 3A1F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A24 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3A27 _ 8B. 45, F4
        add     eax, 48                                 ; 3A2A _ 83. C0, 30
        leave                                           ; 3A2D _ C9
        ret                                             ; 3A2E _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 3A2F _ 55
        mov     ebp, esp                                ; 3A30 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3A32 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3A35 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3A3B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3A3E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3A45 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3A48 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3A4F _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3A52 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3A59 _ 5D
        ret                                             ; 3A5A _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3A5B _ 55
        mov     ebp, esp                                ; 3A5C _ 89. E5
        sub     esp, 16                                 ; 3A5E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3A61 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3A68 _ C7. 45, F8, 00000000
        jmp     ?_200                                   ; 3A6F _ EB, 14

?_199:  mov     eax, dword [ebp+8H]                     ; 3A71 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3A74 _ 8B. 55, F8
        add     edx, 2                                  ; 3A77 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3A7A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3A7E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3A81 _ 83. 45, F8, 01
?_200:  mov     eax, dword [ebp+8H]                     ; 3A85 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A88 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3A8A _ 3B. 45, F8
        ja      ?_199                                   ; 3A8D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3A8F _ 8B. 45, FC
        leave                                           ; 3A92 _ C9
        ret                                             ; 3A93 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3A94 _ 55
        mov     ebp, esp                                ; 3A95 _ 89. E5
        sub     esp, 16                                 ; 3A97 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3A9A _ C7. 45, F8, 00000000
        jmp     ?_204                                   ; 3AA1 _ E9, 00000085

?_201:  mov     eax, dword [ebp+8H]                     ; 3AA6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3AA9 _ 8B. 55, F8
        add     edx, 2                                  ; 3AAC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3AAF _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3AB3 _ 3B. 45, 0C
        jc      ?_203                                   ; 3AB6 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3AB8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3ABB _ 8B. 55, F8
        add     edx, 2                                  ; 3ABE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3AC1 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3AC4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3AC7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3ACA _ 8B. 55, F8
        add     edx, 2                                  ; 3ACD _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3AD0 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3AD3 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3AD6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3AD9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3ADC _ 8B. 55, F8
        add     edx, 2                                  ; 3ADF _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3AE2 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3AE5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3AE8 _ 8B. 55, F8
        add     edx, 2                                  ; 3AEB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3AEE _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3AF2 _ 2B. 45, 0C
        mov     edx, eax                                ; 3AF5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AF7 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3AFA _ 8B. 4D, F8
        add     ecx, 2                                  ; 3AFD _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3B00 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3B04 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3B07 _ 8B. 55, F8
        add     edx, 2                                  ; 3B0A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3B0D _ 8B. 44 D0, 04
        test    eax, eax                                ; 3B11 _ 85. C0
        jnz     ?_202                                   ; 3B13 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3B15 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B18 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3B1A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3B1D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3B20 _ 89. 10
?_202:  mov     eax, dword [ebp-4H]                     ; 3B22 _ 8B. 45, FC
        jmp     ?_205                                   ; 3B25 _ EB, 17

?_203:  add     dword [ebp-8H], 1                       ; 3B27 _ 83. 45, F8, 01
?_204:  mov     eax, dword [ebp+8H]                     ; 3B2B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B2E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3B30 _ 3B. 45, F8
        ja      ?_201                                   ; 3B33 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3B39 _ B8, 00000000
?_205:  leave                                           ; 3B3E _ C9
        ret                                             ; 3B3F _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3B40 _ 55
        mov     ebp, esp                                ; 3B41 _ 89. E5
        push    ebx                                     ; 3B43 _ 53
        sub     esp, 16                                 ; 3B44 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3B47 _ C7. 45, F4, 00000000
        jmp     ?_208                                   ; 3B4E _ EB, 17

?_206:  mov     eax, dword [ebp+8H]                     ; 3B50 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B53 _ 8B. 55, F4
        add     edx, 2                                  ; 3B56 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3B59 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3B5C _ 3B. 45, 0C
        jbe     ?_207                                   ; 3B5F _ 76, 02
        jmp     ?_209                                   ; 3B61 _ EB, 0E

?_207:  add     dword [ebp-0CH], 1                      ; 3B63 _ 83. 45, F4, 01
?_208:  mov     eax, dword [ebp+8H]                     ; 3B67 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B6A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3B6C _ 3B. 45, F4
        jg      ?_206                                   ; 3B6F _ 7F, DF
?_209:  cmp     dword [ebp-0CH], 0                      ; 3B71 _ 83. 7D, F4, 00
        jle     ?_211                                   ; 3B75 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3B7B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3B7E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3B81 _ 8B. 45, 08
        add     edx, 2                                  ; 3B84 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3B87 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3B8A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3B8D _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3B90 _ 8B. 45, 08
        add     ecx, 2                                  ; 3B93 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3B96 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3B9A _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3B9C _ 3B. 45, 0C
        jne     ?_211                                   ; 3B9F _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3BA5 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3BA8 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3BAB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3BAE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3BB1 _ 8B. 45, 08
        add     edx, 2                                  ; 3BB4 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3BB7 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3BBB _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3BBE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3BC1 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3BC4 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3BC7 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3BCB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3BCE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3BD0 _ 3B. 45, F4
        jle     ?_210                                   ; 3BD3 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3BD5 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3BD8 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3BDB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3BDE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3BE1 _ 8B. 55, F4
        add     edx, 2                                  ; 3BE4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3BE7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3BEA _ 39. C1
        jnz     ?_210                                   ; 3BEC _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3BEE _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3BF1 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3BF4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3BF7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3BFA _ 8B. 45, 08
        add     edx, 2                                  ; 3BFD _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3C00 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3C04 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3C07 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3C0A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3C0D _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3C11 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3C14 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3C17 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3C1A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3C1E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C21 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3C23 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3C26 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3C29 _ 89. 10
?_210:  mov     eax, 0                                  ; 3C2B _ B8, 00000000
        jmp     ?_217                                   ; 3C30 _ E9, 0000011C

?_211:  mov     eax, dword [ebp+8H]                     ; 3C35 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C38 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3C3A _ 3B. 45, F4
        jle     ?_212                                   ; 3C3D _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3C3F _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3C42 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3C45 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3C48 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3C4B _ 8B. 55, F4
        add     edx, 2                                  ; 3C4E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3C51 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3C54 _ 39. C1
        jnz     ?_212                                   ; 3C56 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3C58 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3C5B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3C5E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3C61 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3C64 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3C67 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3C6A _ 8B. 55, F4
        add     edx, 2                                  ; 3C6D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3C70 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3C74 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3C77 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3C7A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3C7D _ 8B. 55, F4
        add     edx, 2                                  ; 3C80 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3C83 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3C87 _ B8, 00000000
        jmp     ?_217                                   ; 3C8C _ E9, 000000C0

?_212:  mov     eax, dword [ebp+8H]                     ; 3C91 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C94 _ 8B. 00
        cmp     eax, 4095                               ; 3C96 _ 3D, 00000FFF
        jg      ?_216                                   ; 3C9B _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3CA1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3CA4 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3CA6 _ 89. 45, F8
        jmp     ?_214                                   ; 3CA9 _ EB, 28

?_213:  mov     eax, dword [ebp-8H]                     ; 3CAB _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3CAE _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3CB1 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3CB4 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3CB7 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3CBA _ 8B. 45, 08
        add     edx, 2                                  ; 3CBD _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3CC0 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3CC3 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3CC5 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3CC8 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3CCB _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3CCF _ 83. 6D, F8, 01
?_214:  mov     eax, dword [ebp-8H]                     ; 3CD3 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3CD6 _ 3B. 45, F4
        jg      ?_213                                   ; 3CD9 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3CDB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3CDE _ 8B. 00
        lea     edx, [eax+1H]                           ; 3CE0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3CE3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3CE6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3CE8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3CEB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3CEE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3CF1 _ 8B. 00
        cmp     edx, eax                                ; 3CF3 _ 39. C2
        jge     ?_215                                   ; 3CF5 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3CF7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3CFA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3CFC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3CFF _ 89. 50, 04
?_215:  mov     eax, dword [ebp+8H]                     ; 3D02 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3D05 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3D08 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3D0B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3D0E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3D11 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3D14 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3D17 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3D1A _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3D1D _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3D21 _ B8, 00000000
        jmp     ?_217                                   ; 3D26 _ EB, 29

?_216:  mov     eax, dword [ebp+8H]                     ; 3D28 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D2B _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3D2E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D31 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3D34 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3D37 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3D3A _ 8B. 40, 08
        mov     edx, eax                                ; 3D3D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3D3F _ 8B. 45, 10
        add     eax, edx                                ; 3D42 _ 01. D0
        mov     edx, eax                                ; 3D44 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3D46 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3D49 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3D4C _ B8, FFFFFFFF
?_217:  add     esp, 16                                 ; 3D51 _ 83. C4, 10
        pop     ebx                                     ; 3D54 _ 5B
        pop     ebp                                     ; 3D55 _ 5D
        ret                                             ; 3D56 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3D57 _ 55
        mov     ebp, esp                                ; 3D58 _ 89. E5
        sub     esp, 24                                 ; 3D5A _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3D5D _ 8B. 45, 0C
        add     eax, 4095                               ; 3D60 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3D65 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3D6A _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3D70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D77 _ 89. 04 24
        call    memman_alloc                            ; 3D7A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3D7F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3D82 _ 8B. 45, FC
        leave                                           ; 3D85 _ C9
        ret                                             ; 3D86 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3D87 _ 55
        mov     ebp, esp                                ; 3D88 _ 89. E5
        sub     esp, 28                                 ; 3D8A _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3D8D _ 8B. 45, 10
        add     eax, 4095                               ; 3D90 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3D95 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3D9A _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3D9D _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3DA0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3DA4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3DA7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DAB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DAE _ 89. 04 24
        call    memman_free                             ; 3DB1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3DB6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3DB9 _ 8B. 45, FC
        leave                                           ; 3DBC _ C9
        ret                                             ; 3DBD _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 3DBE _ 55
        mov     ebp, esp                                ; 3DBF _ 89. E5
        sub     esp, 40                                 ; 3DC1 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 3DC4 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 3DCC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DCF _ 89. 04 24
        call    memman_alloc_4k                         ; 3DD2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3DD7 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3DDA _ 83. 7D, F4, 00
        jnz     ?_218                                   ; 3DDE _ 75, 0A
        mov     eax, 0                                  ; 3DE0 _ B8, 00000000
        jmp     ?_222                                   ; 3DE5 _ E9, 0000009D

?_218:  mov     eax, dword [ebp+10H]                    ; 3DEA _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3DED _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3DF1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DF5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DF8 _ 89. 04 24
        call    memman_alloc_4k                         ; 3DFB _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3E00 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3E02 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 3E05 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3E08 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3E0B _ 8B. 40, 04
        test    eax, eax                                ; 3E0E _ 85. C0
        jnz     ?_219                                   ; 3E10 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3E12 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 3E15 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 3E1D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E21 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E24 _ 89. 04 24
        call    memman_free_4k                          ; 3E27 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3E2C _ B8, 00000000
        jmp     ?_222                                   ; 3E31 _ EB, 54

?_219:  mov     eax, dword [ebp-0CH]                    ; 3E33 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3E36 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3E39 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3E3B _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3E3E _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3E41 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3E44 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3E47 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 3E4A _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 3E4D _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 3E50 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3E57 _ C7. 45, F0, 00000000
        jmp     ?_221                                   ; 3E5E _ EB, 1B

?_220:  mov     eax, dword [ebp-0CH]                    ; 3E60 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3E63 _ 8B. 55, F0
        add     edx, 33                                 ; 3E66 _ 83. C2, 21
        shl     edx, 5                                  ; 3E69 _ C1. E2, 05
        add     eax, edx                                ; 3E6C _ 01. D0
        add     eax, 16                                 ; 3E6E _ 83. C0, 10
        mov     dword [eax], 0                          ; 3E71 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3E77 _ 83. 45, F0, 01
?_221:  cmp     dword [ebp-10H], 255                    ; 3E7B _ 81. 7D, F0, 000000FF
        jle     ?_220                                   ; 3E82 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 3E84 _ 8B. 45, F4
?_222:  leave                                           ; 3E87 _ C9
        ret                                             ; 3E88 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3E89 _ 55
        mov     ebp, esp                                ; 3E8A _ 89. E5
        sub     esp, 16                                 ; 3E8C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3E8F _ C7. 45, F8, 00000000
        jmp     ?_225                                   ; 3E96 _ EB, 5B

?_223:  mov     eax, dword [ebp+8H]                     ; 3E98 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E9B _ 8B. 55, F8
        add     edx, 33                                 ; 3E9E _ 83. C2, 21
        shl     edx, 5                                  ; 3EA1 _ C1. E2, 05
        add     eax, edx                                ; 3EA4 _ 01. D0
        add     eax, 16                                 ; 3EA6 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3EA9 _ 8B. 00
        test    eax, eax                                ; 3EAB _ 85. C0
        jnz     ?_224                                   ; 3EAD _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3EAF _ 8B. 45, F8
        shl     eax, 5                                  ; 3EB2 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3EB5 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3EBB _ 8B. 45, 08
        add     eax, edx                                ; 3EBE _ 01. D0
        add     eax, 4                                  ; 3EC0 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3EC3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3EC6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3EC9 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3ECC _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3ECF _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3ED2 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3ED6 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3ED9 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3EE0 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3EE3 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3EEA _ 8B. 45, FC
        jmp     ?_226                                   ; 3EED _ EB, 12

?_224:  add     dword [ebp-8H], 1                       ; 3EEF _ 83. 45, F8, 01
?_225:  cmp     dword [ebp-8H], 255                     ; 3EF3 _ 81. 7D, F8, 000000FF
        jle     ?_223                                   ; 3EFA _ 7E, 9C
        mov     eax, 0                                  ; 3EFC _ B8, 00000000
?_226:  leave                                           ; 3F01 _ C9
        ret                                             ; 3F02 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3F03 _ 55
        mov     ebp, esp                                ; 3F04 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3F06 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3F09 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3F0C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3F0E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3F11 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3F14 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F17 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3F1A _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3F1D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3F20 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3F23 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3F26 _ 89. 50, 14
        nop                                             ; 3F29 _ 90
        pop     ebp                                     ; 3F2A _ 5D
        ret                                             ; 3F2B _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3F2C _ 55
        mov     ebp, esp                                ; 3F2D _ 89. E5
        push    edi                                     ; 3F2F _ 57
        push    esi                                     ; 3F30 _ 56
        push    ebx                                     ; 3F31 _ 53
        sub     esp, 60                                 ; 3F32 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 3F35 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F38 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 3F3B _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 3F3E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F41 _ 8B. 40, 10
        add     eax, 1                                  ; 3F44 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3F47 _ 3B. 45, 10
        jge     ?_227                                   ; 3F4A _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3F4C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F4F _ 8B. 40, 10
        add     eax, 1                                  ; 3F52 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3F55 _ 89. 45, 10
?_227:  cmp     dword [ebp+10H], -1                     ; 3F58 _ 83. 7D, 10, FF
        jge     ?_228                                   ; 3F5C _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3F5E _ C7. 45, 10, FFFFFFFF
?_228:  mov     eax, dword [ebp+0CH]                    ; 3F65 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3F68 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3F6B _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 3F6E _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3F71 _ 3B. 45, 10
        jle     ?_235                                   ; 3F74 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 3F7A _ 83. 7D, 10, 00
        js      ?_231                                   ; 3F7E _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 3F84 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3F87 _ 89. 45, E0
        jmp     ?_230                                   ; 3F8A _ EB, 34

?_229:  mov     eax, dword [ebp-20H]                    ; 3F8C _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 3F8F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3F92 _ 8B. 45, 08
        add     edx, 4                                  ; 3F95 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3F98 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3F9C _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3F9F _ 8B. 4D, E0
        add     ecx, 4                                  ; 3FA2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3FA5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3FA9 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3FAC _ 8B. 55, E0
        add     edx, 4                                  ; 3FAF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3FB2 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3FB6 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3FB9 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3FBC _ 83. 6D, E0, 01
?_230:  mov     eax, dword [ebp-20H]                    ; 3FC0 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3FC3 _ 3B. 45, 10
        jg      ?_229                                   ; 3FC6 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3FC8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3FCB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3FCE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3FD1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3FD4 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3FD8 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3FDB _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3FDE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FE1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FE4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3FE7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3FEA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3FED _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3FF0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3FF3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3FF6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3FF9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3FFC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FFF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4002 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4005 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 4008 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 400C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4010 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4014 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4018 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 401C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 401F _ 89. 04 24
        call    sheet_refreshmap                        ; 4022 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4027 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 402A _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 402D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4030 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4033 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4036 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4039 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 403C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 403F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4042 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4045 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4048 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 404B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 404E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4051 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4054 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 4057 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 405A _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 405E _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4062 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4066 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 406A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 406E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4072 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4075 _ 89. 04 24
        call    sheet_refreshsub                        ; 4078 _ E8, FFFFFFFC(rel)
        jmp     ?_242                                   ; 407D _ E9, 0000027D

?_231:  mov     eax, dword [ebp+8H]                     ; 4082 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4085 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 4088 _ 3B. 45, E4
        jle     ?_234                                   ; 408B _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 408D _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4090 _ 89. 45, E0
        jmp     ?_233                                   ; 4093 _ EB, 34

?_232:  mov     eax, dword [ebp-20H]                    ; 4095 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4098 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 409B _ 8B. 45, 08
        add     edx, 4                                  ; 409E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 40A1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 40A5 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 40A8 _ 8B. 4D, E0
        add     ecx, 4                                  ; 40AB _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 40AE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 40B2 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 40B5 _ 8B. 55, E0
        add     edx, 4                                  ; 40B8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 40BB _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 40BF _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 40C2 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 40C5 _ 83. 45, E0, 01
?_233:  mov     eax, dword [ebp+8H]                     ; 40C9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 40CC _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 40CF _ 3B. 45, E0
        jg      ?_232                                   ; 40D2 _ 7F, C1
?_234:  mov     eax, dword [ebp+8H]                     ; 40D4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 40D7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 40DA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 40DD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 40E0 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 40E3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 40E6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 40E9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 40EC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 40EF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 40F2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 40F5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 40F8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 40FB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 40FE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4101 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4104 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4107 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 410A _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 410D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4115 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4119 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 411D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4121 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4125 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4128 _ 89. 04 24
        call    sheet_refreshmap                        ; 412B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4130 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4133 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4136 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4139 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 413C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 413F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4142 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4145 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4148 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 414B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 414E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4151 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4154 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4157 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 415A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 415D _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4160 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4164 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 416C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4170 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4174 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4178 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 417C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 417F _ 89. 04 24
        call    sheet_refreshsub                        ; 4182 _ E8, FFFFFFFC(rel)
        jmp     ?_242                                   ; 4187 _ E9, 00000173

?_235:  mov     eax, dword [ebp-1CH]                    ; 418C _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 418F _ 3B. 45, 10
        jge     ?_242                                   ; 4192 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 4198 _ 83. 7D, E4, 00
        js      ?_238                                   ; 419C _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 419E _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 41A1 _ 89. 45, E0
        jmp     ?_237                                   ; 41A4 _ EB, 34

?_236:  mov     eax, dword [ebp-20H]                    ; 41A6 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 41A9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 41AC _ 8B. 45, 08
        add     edx, 4                                  ; 41AF _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 41B2 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 41B6 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 41B9 _ 8B. 4D, E0
        add     ecx, 4                                  ; 41BC _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 41BF _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 41C3 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 41C6 _ 8B. 55, E0
        add     edx, 4                                  ; 41C9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 41CC _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 41D0 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 41D3 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 41D6 _ 83. 45, E0, 01
?_237:  mov     eax, dword [ebp-20H]                    ; 41DA _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 41DD _ 3B. 45, 10
        jl      ?_236                                   ; 41E0 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 41E2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 41E5 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 41E8 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 41EB _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 41EE _ 89. 54 88, 04
        jmp     ?_241                                   ; 41F2 _ EB, 6C

?_238:  mov     eax, dword [ebp+8H]                     ; 41F4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 41F7 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 41FA _ 89. 45, E0
        jmp     ?_240                                   ; 41FD _ EB, 3A

?_239:  mov     eax, dword [ebp-20H]                    ; 41FF _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 4202 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4205 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4208 _ 8B. 55, E0
        add     edx, 4                                  ; 420B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 420E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4212 _ 8B. 45, 08
        add     ecx, 4                                  ; 4215 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4218 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 421C _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 421F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4222 _ 8B. 45, 08
        add     edx, 4                                  ; 4225 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4228 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 422C _ 8B. 55, E0
        add     edx, 1                                  ; 422F _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4232 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4235 _ 83. 6D, E0, 01
?_240:  mov     eax, dword [ebp-20H]                    ; 4239 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 423C _ 3B. 45, 10
        jge     ?_239                                   ; 423F _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4241 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4244 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4247 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 424A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 424D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4251 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4254 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4257 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 425A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 425D _ 89. 50, 10
?_241:  mov     eax, dword [ebp+0CH]                    ; 4260 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4263 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4266 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4269 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 426C _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 426F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4272 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4275 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4278 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 427B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 427E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4281 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4284 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4287 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 428A _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 428D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4291 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4295 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4299 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 429D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42A4 _ 89. 04 24
        call    sheet_refreshmap                        ; 42A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 42AC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 42AF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 42B2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 42B5 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 42B8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 42BB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 42BE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 42C1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 42C4 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 42C7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 42CA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 42CD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 42D0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 42D3 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 42D6 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 42D9 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 42DD _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 42E0 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 42E4 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 42E8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 42EC _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 42F0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42F4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42F7 _ 89. 04 24
        call    sheet_refreshsub                        ; 42FA _ E8, FFFFFFFC(rel)
?_242:  add     esp, 60                                 ; 42FF _ 83. C4, 3C
        pop     ebx                                     ; 4302 _ 5B
        pop     esi                                     ; 4303 _ 5E
        pop     edi                                     ; 4304 _ 5F
        pop     ebp                                     ; 4305 _ 5D
        ret                                             ; 4306 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4307 _ 55
        mov     ebp, esp                                ; 4308 _ 89. E5
        push    edi                                     ; 430A _ 57
        push    esi                                     ; 430B _ 56
        push    ebx                                     ; 430C _ 53
        sub     esp, 44                                 ; 430D _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 4310 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4313 _ 8B. 40, 18
        test    eax, eax                                ; 4316 _ 85. C0
        js      ?_243                                   ; 4318 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 431A _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 431D _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4320 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4323 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4326 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4329 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 432C _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 432F _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4332 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4335 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4338 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 433B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 433E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4341 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4344 _ 8B. 45, 14
        add     edx, eax                                ; 4347 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4349 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 434C _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 434F _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4352 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4355 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 4358 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 435C _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4360 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4364 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 4368 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 436C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4370 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4373 _ 89. 04 24
        call    sheet_refreshsub                        ; 4376 _ E8, FFFFFFFC(rel)
?_243:  mov     eax, 0                                  ; 437B _ B8, 00000000
        add     esp, 44                                 ; 4380 _ 83. C4, 2C
        pop     ebx                                     ; 4383 _ 5B
        pop     esi                                     ; 4384 _ 5E
        pop     edi                                     ; 4385 _ 5F
        pop     ebp                                     ; 4386 _ 5D
        ret                                             ; 4387 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4388 _ 55
        mov     ebp, esp                                ; 4389 _ 89. E5
        push    esi                                     ; 438B _ 56
        push    ebx                                     ; 438C _ 53
        sub     esp, 48                                 ; 438D _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 4390 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4393 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4396 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4399 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 439C _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 439F _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 43A2 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 43A5 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 43A8 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 43AB _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 43AE _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 43B1 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 43B4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 43B7 _ 8B. 40, 18
        test    eax, eax                                ; 43BA _ 85. C0
        js      ?_244                                   ; 43BC _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 43C2 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 43C5 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 43C8 _ 8B. 45, F4
        add     edx, eax                                ; 43CB _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 43CD _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 43D0 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 43D3 _ 8B. 45, F0
        add     eax, ecx                                ; 43D6 _ 01. C8
        mov     dword [esp+14H], 0                      ; 43D8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 43E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 43E4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 43E8 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 43EB _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 43EF _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 43F2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 43F6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 43F9 _ 89. 04 24
        call    sheet_refreshmap                        ; 43FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4401 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4404 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4407 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 440A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 440D _ 8B. 55, 14
        add     ecx, edx                                ; 4410 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4412 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4415 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4418 _ 8B. 55, 10
        add     edx, ebx                                ; 441B _ 01. DA
        mov     dword [esp+14H], eax                    ; 441D _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4421 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4425 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4429 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 442C _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4430 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4433 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4437 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 443A _ 89. 04 24
        call    sheet_refreshmap                        ; 443D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4442 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4445 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4448 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 444B _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 444E _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4451 _ 8B. 45, F4
        add     edx, eax                                ; 4454 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4456 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4459 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 445C _ 8B. 45, F0
        add     eax, ebx                                ; 445F _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4461 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 4465 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 446D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4471 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4475 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4478 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 447C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 447F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4483 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4486 _ 89. 04 24
        call    sheet_refreshsub                        ; 4489 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 448E _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4491 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4494 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4497 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 449A _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 449D _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 44A0 _ 8B. 4D, 14
        add     ebx, ecx                                ; 44A3 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 44A5 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 44A8 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 44AB _ 8B. 4D, 10
        add     ecx, esi                                ; 44AE _ 01. F1
        mov     dword [esp+18H], edx                    ; 44B0 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 44B4 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 44B8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 44BC _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 44C0 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 44C3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 44C7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 44CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 44CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 44D1 _ 89. 04 24
        call    sheet_refreshsub                        ; 44D4 _ E8, FFFFFFFC(rel)
?_244:  add     esp, 48                                 ; 44D9 _ 83. C4, 30
        pop     ebx                                     ; 44DC _ 5B
        pop     esi                                     ; 44DD _ 5E
        pop     ebp                                     ; 44DE _ 5D
        ret                                             ; 44DF _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 44E0 _ 55
        mov     ebp, esp                                ; 44E1 _ 89. E5
        sub     esp, 48                                 ; 44E3 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 44E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44E9 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 44EB _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 44EE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 44F1 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 44F4 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 44F7 _ 83. 7D, 0C, 00
        jns     ?_245                                   ; 44FB _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 44FD _ C7. 45, 0C, 00000000
?_245:  cmp     dword [ebp+10H], 8                      ; 4504 _ 83. 7D, 10, 08
        jg      ?_246                                   ; 4508 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 450A _ C7. 45, 10, 00000000
?_246:  mov     eax, dword [ebp+8H]                     ; 4511 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4514 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4517 _ 3B. 45, 14
        jge     ?_247                                   ; 451A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 451C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 451F _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4522 _ 89. 45, 14
?_247:  mov     eax, dword [ebp+8H]                     ; 4525 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4528 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 452B _ 3B. 45, 18
        jge     ?_248                                   ; 452E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4530 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4533 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4536 _ 89. 45, 18
?_248:  mov     eax, dword [ebp+1CH]                    ; 4539 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 453C _ 89. 45, DC
        jmp     ?_255                                   ; 453F _ E9, 00000119

?_249:  mov     eax, dword [ebp+8H]                     ; 4544 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 4547 _ 8B. 55, DC
        add     edx, 4                                  ; 454A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 454D _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4551 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4554 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4557 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4559 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 455C _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 455F _ 8B. 45, 08
        add     eax, 1044                               ; 4562 _ 05, 00000414
        sub     edx, eax                                ; 4567 _ 29. C2
        mov     eax, edx                                ; 4569 _ 89. D0
        sar     eax, 5                                  ; 456B _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 456E _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 4571 _ C7. 45, E4, 00000000
        jmp     ?_254                                   ; 4578 _ E9, 000000CD

?_250:  mov     eax, dword [ebp-10H]                    ; 457D _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4580 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4583 _ 8B. 45, E4
        add     eax, edx                                ; 4586 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4588 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 458B _ C7. 45, E0, 00000000
        jmp     ?_253                                   ; 4592 _ E9, 000000A0

?_251:  mov     eax, dword [ebp-10H]                    ; 4597 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 459A _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 459D _ 8B. 45, E0
        add     eax, edx                                ; 45A0 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 45A2 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 45A5 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 45A8 _ 3B. 45, FC
        jg      ?_252                                   ; 45AB _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 45B1 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 45B4 _ 3B. 45, 14
        jge     ?_252                                   ; 45B7 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 45B9 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 45BC _ 3B. 45, F8
        jg      ?_252                                   ; 45BF _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 45C1 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 45C4 _ 3B. 45, 18
        jge     ?_252                                   ; 45C7 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 45C9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 45CC _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 45CF _ 0F AF. 45, E4
        mov     edx, eax                                ; 45D3 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 45D5 _ 8B. 45, E0
        add     eax, edx                                ; 45D8 _ 01. D0
        mov     edx, eax                                ; 45DA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 45DC _ 8B. 45, F4
        add     eax, edx                                ; 45DF _ 01. D0
        movzx   eax, byte [eax]                         ; 45E1 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 45E4 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 45E7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 45EA _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 45ED _ 0F AF. 45, F8
        mov     edx, eax                                ; 45F1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 45F3 _ 8B. 45, FC
        add     eax, edx                                ; 45F6 _ 01. D0
        mov     edx, eax                                ; 45F8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 45FA _ 8B. 45, EC
        add     eax, edx                                ; 45FD _ 01. D0
        movzx   eax, byte [eax]                         ; 45FF _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 4602 _ 3A. 45, DA
        jnz     ?_252                                   ; 4605 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 4607 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 460B _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 460E _ 8B. 40, 14
        cmp     edx, eax                                ; 4611 _ 39. C2
        jz      ?_252                                   ; 4613 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4615 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4618 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 461B _ 0F AF. 45, F8
        mov     edx, eax                                ; 461F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4621 _ 8B. 45, FC
        add     eax, edx                                ; 4624 _ 01. D0
        mov     edx, eax                                ; 4626 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4628 _ 8B. 45, E8
        add     edx, eax                                ; 462B _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 462D _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4631 _ 88. 02
?_252:  add     dword [ebp-20H], 1                      ; 4633 _ 83. 45, E0, 01
?_253:  mov     eax, dword [ebp-10H]                    ; 4637 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 463A _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 463D _ 3B. 45, E0
        jg      ?_251                                   ; 4640 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4646 _ 83. 45, E4, 01
?_254:  mov     eax, dword [ebp-10H]                    ; 464A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 464D _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 4650 _ 3B. 45, E4
        jg      ?_250                                   ; 4653 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4659 _ 83. 45, DC, 01
?_255:  mov     eax, dword [ebp-24H]                    ; 465D _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 4660 _ 3B. 45, 20
        jle     ?_249                                   ; 4663 _ 0F 8E, FFFFFEDB
        leave                                           ; 4669 _ C9
        ret                                             ; 466A _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 466B _ 55
        mov     ebp, esp                                ; 466C _ 89. E5
        sub     esp, 64                                 ; 466E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4671 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4674 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4677 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 467A _ 83. 7D, 0C, 00
        jns     ?_256                                   ; 467E _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4680 _ C7. 45, 0C, 00000000
?_256:  cmp     dword [ebp+10H], 0                      ; 4687 _ 83. 7D, 10, 00
        jns     ?_257                                   ; 468B _ 79, 07
        mov     dword [ebp+10H], 0                      ; 468D _ C7. 45, 10, 00000000
?_257:  mov     eax, dword [ebp+8H]                     ; 4694 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4697 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 469A _ 3B. 45, 14
        jge     ?_258                                   ; 469D _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 469F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 46A2 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 46A5 _ 89. 45, 14
?_258:  mov     eax, dword [ebp+8H]                     ; 46A8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 46AB _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 46AE _ 3B. 45, 18
        jge     ?_259                                   ; 46B1 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 46B3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 46B6 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 46B9 _ 89. 45, 18
?_259:  mov     eax, dword [ebp+1CH]                    ; 46BC _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 46BF _ 89. 45, D0
        jmp     ?_270                                   ; 46C2 _ E9, 00000141

?_260:  mov     eax, dword [ebp+8H]                     ; 46C7 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 46CA _ 8B. 55, D0
        add     edx, 4                                  ; 46CD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 46D0 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 46D4 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 46D7 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 46DA _ 8B. 45, 08
        add     eax, 1044                               ; 46DD _ 05, 00000414
        sub     edx, eax                                ; 46E2 _ 29. C2
        mov     eax, edx                                ; 46E4 _ 89. D0
        sar     eax, 5                                  ; 46E6 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 46E9 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 46EC _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 46EF _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 46F1 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 46F4 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 46F7 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 46FA _ 8B. 55, 0C
        sub     edx, eax                                ; 46FD _ 29. C2
        mov     eax, edx                                ; 46FF _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4701 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4704 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4707 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 470A _ 8B. 55, 10
        sub     edx, eax                                ; 470D _ 29. C2
        mov     eax, edx                                ; 470F _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4711 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4714 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4717 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 471A _ 8B. 55, 14
        sub     edx, eax                                ; 471D _ 29. C2
        mov     eax, edx                                ; 471F _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4721 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 4724 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4727 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 472A _ 8B. 55, 18
        sub     edx, eax                                ; 472D _ 29. C2
        mov     eax, edx                                ; 472F _ 89. D0
        mov     dword [ebp-18H], eax                    ; 4731 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 4734 _ 83. 7D, DC, 00
        jns     ?_261                                   ; 4738 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 473A _ C7. 45, DC, 00000000
?_261:  cmp     dword [ebp-20H], 0                      ; 4741 _ 83. 7D, E0, 00
        jns     ?_262                                   ; 4745 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4747 _ C7. 45, E0, 00000000
?_262:  mov     eax, dword [ebp-10H]                    ; 474E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4751 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4754 _ 3B. 45, E4
        jge     ?_263                                   ; 4757 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4759 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 475C _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 475F _ 89. 45, E4
?_263:  mov     eax, dword [ebp-10H]                    ; 4762 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4765 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4768 _ 3B. 45, E8
        jge     ?_264                                   ; 476B _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 476D _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4770 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 4773 _ 89. 45, E8
?_264:  mov     eax, dword [ebp-20H]                    ; 4776 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4779 _ 89. 45, D8
        jmp     ?_269                                   ; 477C _ EB, 7A

?_265:  mov     eax, dword [ebp-10H]                    ; 477E _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4781 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 4784 _ 8B. 45, D8
        add     eax, edx                                ; 4787 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4789 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 478C _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 478F _ 89. 45, D4
        jmp     ?_268                                   ; 4792 _ EB, 58

?_266:  mov     eax, dword [ebp-10H]                    ; 4794 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4797 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 479A _ 8B. 45, D4
        add     eax, edx                                ; 479D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 479F _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 47A2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 47A5 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 47A8 _ 0F AF. 45, D8
        mov     edx, eax                                ; 47AC _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 47AE _ 8B. 45, D4
        add     eax, edx                                ; 47B1 _ 01. D0
        mov     edx, eax                                ; 47B3 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 47B5 _ 8B. 45, F4
        add     eax, edx                                ; 47B8 _ 01. D0
        movzx   eax, byte [eax]                         ; 47BA _ 0F B6. 00
        movzx   edx, al                                 ; 47BD _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 47C0 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 47C3 _ 8B. 40, 14
        cmp     edx, eax                                ; 47C6 _ 39. C2
        jz      ?_267                                   ; 47C8 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 47CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 47CD _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 47D0 _ 0F AF. 45, F8
        mov     edx, eax                                ; 47D4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 47D6 _ 8B. 45, FC
        add     eax, edx                                ; 47D9 _ 01. D0
        mov     edx, eax                                ; 47DB _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 47DD _ 8B. 45, EC
        add     edx, eax                                ; 47E0 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 47E2 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 47E6 _ 88. 02
?_267:  add     dword [ebp-2CH], 1                      ; 47E8 _ 83. 45, D4, 01
?_268:  mov     eax, dword [ebp-2CH]                    ; 47EC _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 47EF _ 3B. 45, E4
        jl      ?_266                                   ; 47F2 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 47F4 _ 83. 45, D8, 01
?_269:  mov     eax, dword [ebp-28H]                    ; 47F8 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 47FB _ 3B. 45, E8
        jl      ?_265                                   ; 47FE _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 4804 _ 83. 45, D0, 01
?_270:  mov     eax, dword [ebp+8H]                     ; 4808 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 480B _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 480E _ 3B. 45, D0
        jge     ?_260                                   ; 4811 _ 0F 8D, FFFFFEB0
        nop                                             ; 4817 _ 90
        leave                                           ; 4818 _ C9
        ret                                             ; 4819 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 481A _ 55
        mov     ebp, esp                                ; 481B _ 89. E5
        sub     esp, 24                                 ; 481D _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4820 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4823 _ 8B. 40, 18
        test    eax, eax                                ; 4826 _ 85. C0
        js      ?_271                                   ; 4828 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 482A _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 4832 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4835 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4839 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 483C _ 89. 04 24
        call    sheet_updown                            ; 483F _ E8, FFFFFFFC(rel)
?_271:  mov     eax, dword [ebp+0CH]                    ; 4844 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 4847 _ C7. 40, 1C, 00000000
        nop                                             ; 484E _ 90
        leave                                           ; 484F _ C9
        ret                                             ; 4850 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 4851 _ 55
        mov     ebp, esp                                ; 4852 _ 89. E5
        sub     esp, 40                                 ; 4854 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 4857 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 485F _ C7. 04 24, 00000043
        call    io_out8                                 ; 4866 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 486B _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4873 _ C7. 04 24, 00000040
        call    io_out8                                 ; 487A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 487F _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4887 _ C7. 04 24, 00000040
        call    io_out8                                 ; 488E _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4893 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 489D _ C7. 45, F4, 00000000
        jmp     ?_273                                   ; 48A4 _ EB, 28

?_272:  mov     eax, dword [ebp-0CH]                    ; 48A6 _ 8B. 45, F4
        shl     eax, 4                                  ; 48A9 _ C1. E0, 04
        add     eax, timerctl                           ; 48AC _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 48B1 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 48B8 _ 8B. 45, F4
        shl     eax, 4                                  ; 48BB _ C1. E0, 04
        add     eax, timerctl                           ; 48BE _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 48C3 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 48CA _ 83. 45, F4, 01
?_273:  cmp     dword [ebp-0CH], 499                    ; 48CE _ 81. 7D, F4, 000001F3
        jle     ?_272                                   ; 48D5 _ 7E, CF
        leave                                           ; 48D7 _ C9
        ret                                             ; 48D8 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 48D9 _ 55
        mov     ebp, esp                                ; 48DA _ 89. E5
        sub     esp, 16                                 ; 48DC _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 48DF _ C7. 45, FC, 00000000
        jmp     ?_276                                   ; 48E6 _ EB, 38

?_274:  mov     eax, dword [ebp-4H]                     ; 48E8 _ 8B. 45, FC
        shl     eax, 4                                  ; 48EB _ C1. E0, 04
        add     eax, timerctl                           ; 48EE _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 48F3 _ 8B. 40, 08
        test    eax, eax                                ; 48F6 _ 85. C0
        jnz     ?_275                                   ; 48F8 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 48FA _ 8B. 45, FC
        shl     eax, 4                                  ; 48FD _ C1. E0, 04
        add     eax, timerctl                           ; 4900 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4905 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 490C _ 8B. 45, FC
        shl     eax, 4                                  ; 490F _ C1. E0, 04
        add     eax, timerctl                           ; 4912 _ 05, 000003C0(d)
        add     eax, 4                                  ; 4917 _ 83. C0, 04
        jmp     ?_277                                   ; 491A _ EB, 12

?_275:  add     dword [ebp-4H], 1                       ; 491C _ 83. 45, FC, 01
?_276:  cmp     dword [ebp-4H], 499                     ; 4920 _ 81. 7D, FC, 000001F3
        jle     ?_274                                   ; 4927 _ 7E, BF
        mov     eax, 0                                  ; 4929 _ B8, 00000000
?_277:  leave                                           ; 492E _ C9
        ret                                             ; 492F _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4930 _ 55
        mov     ebp, esp                                ; 4931 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4933 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4936 _ C7. 40, 04, 00000000
        nop                                             ; 493D _ 90
        pop     ebp                                     ; 493E _ 5D
        ret                                             ; 493F _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4940 _ 55
        mov     ebp, esp                                ; 4941 _ 89. E5
        sub     esp, 4                                  ; 4943 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4946 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4949 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 494C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 494F _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4952 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4955 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4958 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 495C _ 88. 50, 0C
        nop                                             ; 495F _ 90
        leave                                           ; 4960 _ C9
        ret                                             ; 4961 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4962 _ 55
        mov     ebp, esp                                ; 4963 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4965 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4968 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 496B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 496D _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4970 _ C7. 40, 04, 00000002
        nop                                             ; 4977 _ 90
        pop     ebp                                     ; 4978 _ 5D
        ret                                             ; 4979 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 497A _ 55
        mov     ebp, esp                                ; 497B _ 89. E5
        sub     esp, 40                                 ; 497D _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4980 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 4988 _ C7. 04 24, 00000020
        call    io_out8                                 ; 498F _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4994 _ A1, 000003C0(d)
        add     eax, 1                                  ; 4999 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 499C _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 49A1 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 49A5 _ C7. 45, F4, 00000000
        jmp     ?_281                                   ; 49AC _ E9, 000000B0

?_278:  mov     eax, dword [ebp-0CH]                    ; 49B1 _ 8B. 45, F4
        shl     eax, 4                                  ; 49B4 _ C1. E0, 04
        add     eax, timerctl                           ; 49B7 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 49BC _ 8B. 40, 08
        cmp     eax, 2                                  ; 49BF _ 83. F8, 02
        jne     ?_279                                   ; 49C2 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 49C8 _ 8B. 45, F4
        shl     eax, 4                                  ; 49CB _ C1. E0, 04
        add     eax, timerctl                           ; 49CE _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 49D3 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 49D6 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 49D9 _ 8B. 45, F4
        shl     eax, 4                                  ; 49DC _ C1. E0, 04
        add     eax, timerctl                           ; 49DF _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 49E4 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 49E7 _ 8B. 45, F4
        shl     eax, 4                                  ; 49EA _ C1. E0, 04
        add     eax, timerctl                           ; 49ED _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 49F2 _ 8B. 40, 04
        test    eax, eax                                ; 49F5 _ 85. C0
        jnz     ?_279                                   ; 49F7 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 49F9 _ 8B. 45, F4
        shl     eax, 4                                  ; 49FC _ C1. E0, 04
        add     eax, timerctl                           ; 49FF _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4A04 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4A0B _ 8B. 45, F4
        shl     eax, 4                                  ; 4A0E _ C1. E0, 04
        add     eax, timerctl                           ; 4A11 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 4A16 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4A1A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4A1D _ 8B. 45, F4
        shl     eax, 4                                  ; 4A20 _ C1. E0, 04
        add     eax, timerctl                           ; 4A23 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 4A28 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4A2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4A2F _ 89. 04 24
        call    fifo8_put                               ; 4A32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A37 _ 8B. 45, F4
        shl     eax, 4                                  ; 4A3A _ C1. E0, 04
        add     eax, timerctl                           ; 4A3D _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 4A42 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4A45 _ A1, 00000000(d)
        cmp     edx, eax                                ; 4A4A _ 39. C2
        jnz     ?_279                                   ; 4A4C _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4A4E _ C6. 45, F3, 01
?_279:  cmp     byte [ebp-0DH], 0                       ; 4A52 _ 80. 7D, F3, 00
        jz      ?_280                                   ; 4A56 _ 74, 05
        call    task_switch                             ; 4A58 _ E8, FFFFFFFC(rel)
?_280:  add     dword [ebp-0CH], 1                      ; 4A5D _ 83. 45, F4, 01
?_281:  cmp     dword [ebp-0CH], 499                    ; 4A61 _ 81. 7D, F4, 000001F3
        jle     ?_278                                   ; 4A68 _ 0F 8E, FFFFFF43
        nop                                             ; 4A6E _ 90
        leave                                           ; 4A6F _ C9
        ret                                             ; 4A70 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4A71 _ 55
        mov     ebp, esp                                ; 4A72 _ 89. E5
        mov     eax, timerctl                           ; 4A74 _ B8, 000003C0(d)
        pop     ebp                                     ; 4A79 _ 5D
        ret                                             ; 4A7A _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 4A7B _ 55
        mov     ebp, esp                                ; 4A7C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4A7E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4A81 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4A84 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4A87 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4A8A _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4A8D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4A8F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4A92 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4A95 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4A98 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 4A9B _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4AA2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4AA5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4AAC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4AAF _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4AB6 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4AB9 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 4ABC _ 89. 50, 18
        nop                                             ; 4ABF _ 90
        pop     ebp                                     ; 4AC0 _ 5D
        ret                                             ; 4AC1 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4AC2 _ 55
        mov     ebp, esp                                ; 4AC3 _ 89. E5
        sub     esp, 24                                 ; 4AC5 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4AC8 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 4ACB _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 4ACE _ 83. 7D, 08, 00
        jnz     ?_282                                   ; 4AD2 _ 75, 0A
        mov     eax, 4294967295                         ; 4AD4 _ B8, FFFFFFFF
        jmp     ?_286                                   ; 4AD9 _ E9, 000000AB

?_282:  mov     eax, dword [ebp+8H]                     ; 4ADE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4AE1 _ 8B. 40, 10
        test    eax, eax                                ; 4AE4 _ 85. C0
        jnz     ?_283                                   ; 4AE6 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 4AE8 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 4AEB _ 8B. 40, 14
        or      eax, 01H                                ; 4AEE _ 83. C8, 01
        mov     edx, eax                                ; 4AF1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4AF3 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 4AF6 _ 89. 50, 14
        mov     eax, 4294967295                         ; 4AF9 _ B8, FFFFFFFF
        jmp     ?_286                                   ; 4AFE _ E9, 00000086

?_283:  mov     eax, dword [ebp+8H]                     ; 4B03 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4B06 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4B08 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B0B _ 8B. 40, 04
        add     edx, eax                                ; 4B0E _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 4B10 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 4B14 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 4B16 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B19 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4B1C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B1F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4B22 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4B25 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4B28 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4B2B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B2E _ 8B. 40, 0C
        cmp     edx, eax                                ; 4B31 _ 39. C2
        jnz     ?_284                                   ; 4B33 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4B35 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4B38 _ C7. 40, 04, 00000000
?_284:  mov     eax, dword [ebp+8H]                     ; 4B3F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B42 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4B45 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4B48 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4B4B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4B4E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4B51 _ 8B. 40, 18
        test    eax, eax                                ; 4B54 _ 85. C0
        jz      ?_285                                   ; 4B56 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 4B58 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4B5B _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 4B5E _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B61 _ 83. F8, 02
        jz      ?_285                                   ; 4B64 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4B66 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4B69 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 4B6C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 4B74 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 4B7C _ 89. 04 24
        call    task_run                                ; 4B7F _ E8, FFFFFFFC(rel)
?_285:  mov     eax, 0                                  ; 4B84 _ B8, 00000000
?_286:  leave                                           ; 4B89 _ C9
        ret                                             ; 4B8A _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 4B8B _ 55
        mov     ebp, esp                                ; 4B8C _ 89. E5
        sub     esp, 16                                 ; 4B8E _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4B91 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4B94 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4B97 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B9A _ 8B. 40, 0C
        cmp     edx, eax                                ; 4B9D _ 39. C2
        jnz     ?_287                                   ; 4B9F _ 75, 07
        mov     eax, 4294967295                         ; 4BA1 _ B8, FFFFFFFF
        jmp     ?_289                                   ; 4BA6 _ EB, 51

?_287:  mov     eax, dword [ebp+8H]                     ; 4BA8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4BAB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4BAD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4BB0 _ 8B. 40, 08
        add     eax, edx                                ; 4BB3 _ 01. D0
        movzx   eax, byte [eax]                         ; 4BB5 _ 0F B6. 00
        movzx   eax, al                                 ; 4BB8 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 4BBB _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4BBE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4BC1 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4BC4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4BC7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4BCA _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4BCD _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4BD0 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4BD3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4BD6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 4BD9 _ 39. C2
        jnz     ?_288                                   ; 4BDB _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4BDD _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4BE0 _ C7. 40, 08, 00000000
?_288:  mov     eax, dword [ebp+8H]                     ; 4BE7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4BEA _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4BED _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4BF0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4BF3 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4BF6 _ 8B. 45, FC
?_289:  leave                                           ; 4BF9 _ C9
        ret                                             ; 4BFA _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 4BFB _ 55
        mov     ebp, esp                                ; 4BFC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4BFE _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4C01 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4C04 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4C07 _ 8B. 40, 10
        sub     edx, eax                                ; 4C0A _ 29. C2
        mov     eax, edx                                ; 4C0C _ 89. D0
        pop     ebp                                     ; 4C0E _ 5D
        ret                                             ; 4C0F _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 4C10 _ 55
        mov     ebp, esp                                ; 4C11 _ 89. E5
        sub     esp, 16                                 ; 4C13 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 4C16 _ 83. 7D, 08, 00
        jz      ?_290                                   ; 4C1A _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 4C1C _ 83. 7D, 0C, 00
        jnz     ?_291                                   ; 4C20 _ 75, 0A
?_290:  mov     eax, 0                                  ; 4C22 _ B8, 00000000
        jmp     ?_298                                   ; 4C27 _ E9, 0000009B

?_291:  mov     dword [ebp-4H], 0                       ; 4C2C _ C7. 45, FC, 00000000
        jmp     ?_294                                   ; 4C33 _ EB, 25

?_292:  mov     edx, dword [ebp-4H]                     ; 4C35 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4C38 _ 8B. 45, 08
        add     eax, edx                                ; 4C3B _ 01. D0
        movzx   edx, byte [eax]                         ; 4C3D _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 4C40 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 4C43 _ 8B. 45, 0C
        add     eax, ecx                                ; 4C46 _ 01. C8
        movzx   eax, byte [eax]                         ; 4C48 _ 0F B6. 00
        cmp     dl, al                                  ; 4C4B _ 38. C2
        jz      ?_293                                   ; 4C4D _ 74, 07
        mov     eax, 0                                  ; 4C4F _ B8, 00000000
        jmp     ?_298                                   ; 4C54 _ EB, 71

?_293:  add     dword [ebp-4H], 1                       ; 4C56 _ 83. 45, FC, 01
?_294:  mov     edx, dword [ebp-4H]                     ; 4C5A _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4C5D _ 8B. 45, 08
        add     eax, edx                                ; 4C60 _ 01. D0
        movzx   eax, byte [eax]                         ; 4C62 _ 0F B6. 00
        test    al, al                                  ; 4C65 _ 84. C0
        jz      ?_295                                   ; 4C67 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 4C69 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4C6C _ 8B. 45, 0C
        add     eax, edx                                ; 4C6F _ 01. D0
        movzx   eax, byte [eax]                         ; 4C71 _ 0F B6. 00
        test    al, al                                  ; 4C74 _ 84. C0
        jnz     ?_292                                   ; 4C76 _ 75, BD
?_295:  mov     edx, dword [ebp-4H]                     ; 4C78 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4C7B _ 8B. 45, 08
        add     eax, edx                                ; 4C7E _ 01. D0
        movzx   eax, byte [eax]                         ; 4C80 _ 0F B6. 00
        test    al, al                                  ; 4C83 _ 84. C0
        jnz     ?_296                                   ; 4C85 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 4C87 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4C8A _ 8B. 45, 0C
        add     eax, edx                                ; 4C8D _ 01. D0
        movzx   eax, byte [eax]                         ; 4C8F _ 0F B6. 00
        test    al, al                                  ; 4C92 _ 84. C0
        jz      ?_296                                   ; 4C94 _ 74, 07
        mov     eax, 0                                  ; 4C96 _ B8, 00000000
        jmp     ?_298                                   ; 4C9B _ EB, 2A

?_296:  mov     edx, dword [ebp-4H]                     ; 4C9D _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4CA0 _ 8B. 45, 08
        add     eax, edx                                ; 4CA3 _ 01. D0
        movzx   eax, byte [eax]                         ; 4CA5 _ 0F B6. 00
        test    al, al                                  ; 4CA8 _ 84. C0
        jz      ?_297                                   ; 4CAA _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 4CAC _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4CAF _ 8B. 45, 0C
        add     eax, edx                                ; 4CB2 _ 01. D0
        movzx   eax, byte [eax]                         ; 4CB4 _ 0F B6. 00
        test    al, al                                  ; 4CB7 _ 84. C0
        jz      ?_297                                   ; 4CB9 _ 74, 07
        mov     eax, 0                                  ; 4CBB _ B8, 00000000
        jmp     ?_298                                   ; 4CC0 _ EB, 05

?_297:  mov     eax, 1                                  ; 4CC2 _ B8, 00000001
?_298:  leave                                           ; 4CC7 _ C9
        ret                                             ; 4CC8 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 4CC9 _ 55
        mov     ebp, esp                                ; 4CCA _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 4CCC _ 81. 7D, 0C, 000FFFFF
        jbe     ?_299                                   ; 4CD3 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4CD5 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 4CDC _ 8B. 45, 0C
        shr     eax, 12                                 ; 4CDF _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4CE2 _ 89. 45, 0C
?_299:  mov     eax, dword [ebp+0CH]                    ; 4CE5 _ 8B. 45, 0C
        mov     edx, eax                                ; 4CE8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4CEA _ 8B. 45, 08
        mov     word [eax], dx                          ; 4CED _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4CF0 _ 8B. 45, 10
        mov     edx, eax                                ; 4CF3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4CF5 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4CF8 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4CFC _ 8B. 45, 10
        sar     eax, 16                                 ; 4CFF _ C1. F8, 10
        mov     edx, eax                                ; 4D02 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4D04 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4D07 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4D0A _ 8B. 45, 14
        mov     edx, eax                                ; 4D0D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4D0F _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 4D12 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 4D15 _ 8B. 45, 0C
        shr     eax, 16                                 ; 4D18 _ C1. E8, 10
        and     eax, 0FH                                ; 4D1B _ 83. E0, 0F
        mov     edx, eax                                ; 4D1E _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4D20 _ 8B. 45, 14
        sar     eax, 8                                  ; 4D23 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4D26 _ 83. E0, F0
        or      eax, edx                                ; 4D29 _ 09. D0
        mov     edx, eax                                ; 4D2B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4D2D _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4D30 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 4D33 _ 8B. 45, 10
        shr     eax, 24                                 ; 4D36 _ C1. E8, 18
        mov     edx, eax                                ; 4D39 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4D3B _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4D3E _ 88. 50, 07
        nop                                             ; 4D41 _ 90
        pop     ebp                                     ; 4D42 _ 5D
        ret                                             ; 4D43 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 4D44 _ 55
        mov     ebp, esp                                ; 4D45 _ 89. E5
        mov     eax, dword [taskctl]                    ; 4D47 _ A1, 00002308(d)
        pop     ebp                                     ; 4D4C _ 5D
        ret                                             ; 4D4D _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 4D4E _ 55
        mov     ebp, esp                                ; 4D4F _ 89. E5
        sub     esp, 16                                 ; 4D51 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4D54 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 4D5A _ 8B. 55, 08
        mov     eax, edx                                ; 4D5D _ 89. D0
        shl     eax, 2                                  ; 4D5F _ C1. E0, 02
        add     eax, edx                                ; 4D62 _ 01. D0
        shl     eax, 2                                  ; 4D64 _ C1. E0, 02
        add     eax, ecx                                ; 4D67 _ 01. C8
        add     eax, 8                                  ; 4D69 _ 83. C0, 08
        mov     dword [eax], 0                          ; 4D6C _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4D72 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 4D78 _ 8B. 55, 08
        mov     eax, edx                                ; 4D7B _ 89. D0
        shl     eax, 2                                  ; 4D7D _ C1. E0, 02
        add     eax, edx                                ; 4D80 _ 01. D0
        shl     eax, 2                                  ; 4D82 _ C1. E0, 02
        add     eax, ecx                                ; 4D85 _ 01. C8
        add     eax, 12                                 ; 4D87 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4D8A _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4D90 _ C7. 45, FC, 00000000
        jmp     ?_301                                   ; 4D97 _ EB, 21

?_300:  mov     ecx, dword [taskctl]                    ; 4D99 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 4D9F _ 8B. 55, FC
        mov     eax, edx                                ; 4DA2 _ 89. D0
        add     eax, eax                                ; 4DA4 _ 01. C0
        add     eax, edx                                ; 4DA6 _ 01. D0
        shl     eax, 3                                  ; 4DA8 _ C1. E0, 03
        add     eax, ecx                                ; 4DAB _ 01. C8
        add     eax, 16                                 ; 4DAD _ 83. C0, 10
        mov     dword [eax], 0                          ; 4DB0 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4DB6 _ 83. 45, FC, 01
?_301:  cmp     dword [ebp-4H], 2                       ; 4DBA _ 83. 7D, FC, 02
        jle     ?_300                                   ; 4DBE _ 7E, D9
        leave                                           ; 4DC0 _ C9
        ret                                             ; 4DC1 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4DC2 _ 55
        mov     ebp, esp                                ; 4DC3 _ 89. E5
        sub     esp, 40                                 ; 4DC5 _ 83. EC, 28
        call    get_addr_gdt                            ; 4DC8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4DCD _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 4DD0 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 4DD8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DDB _ 89. 04 24
        call    memman_alloc_4k                         ; 4DDE _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 4DE3 _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 4DE8 _ C7. 45, EC, 00000000
        jmp     ?_303                                   ; 4DEF _ E9, 00000085

?_302:  mov     edx, dword [taskctl]                    ; 4DF4 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 4DFA _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4DFD _ 69. C0, 00000094
        add     eax, edx                                ; 4E03 _ 01. D0
        add     eax, 72                                 ; 4E05 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4E08 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4E0E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 4E14 _ 8B. 45, EC
        add     eax, 7                                  ; 4E17 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 4E1A _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4E21 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4E24 _ 69. C0, 00000094
        add     eax, ecx                                ; 4E2A _ 01. C8
        add     eax, 68                                 ; 4E2C _ 83. C0, 44
        mov     dword [eax], edx                        ; 4E2F _ 89. 10
        mov     eax, dword [taskctl]                    ; 4E31 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 4E36 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4E39 _ 69. D2, 00000094
        add     edx, 96                                 ; 4E3F _ 83. C2, 60
        add     eax, edx                                ; 4E42 _ 01. D0
        add     eax, 16                                 ; 4E44 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4E47 _ 8B. 55, EC
        add     edx, 7                                  ; 4E4A _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 4E4D _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4E54 _ 8B. 55, F0
        add     edx, ecx                                ; 4E57 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4E59 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4E61 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4E65 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4E6D _ 89. 14 24
        call    set_segmdesc                            ; 4E70 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4E75 _ 83. 45, EC, 01
?_303:  cmp     dword [ebp-14H], 4                      ; 4E79 _ 83. 7D, EC, 04
        jle     ?_302                                   ; 4E7D _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4E83 _ C7. 45, EC, 00000000
        jmp     ?_305                                   ; 4E8A _ EB, 0F

?_304:  mov     eax, dword [ebp-14H]                    ; 4E8C _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4E8F _ 89. 04 24
        call    init_task_level                         ; 4E92 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4E97 _ 83. 45, EC, 01
?_305:  cmp     dword [ebp-14H], 2                      ; 4E9B _ 83. 7D, EC, 02
        jle     ?_304                                   ; 4E9F _ 7E, EB
        call    task_alloc                              ; 4EA1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4EA6 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4EA9 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4EAC _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4EB3 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4EB6 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4EBD _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4EC0 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4EC7 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4ECA _ 89. 04 24
        call    task_add                                ; 4ECD _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 4ED2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4ED7 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4EDA _ 8B. 00
        mov     dword [esp], eax                        ; 4EDC _ 89. 04 24
        call    load_tr                                 ; 4EDF _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4EE4 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4EE9 _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 4EEE _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4EF1 _ 8B. 40, 08
        mov     edx, eax                                ; 4EF4 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4EF6 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 4EFB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4EFF _ 89. 04 24
        call    timer_settime                           ; 4F02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4F07 _ 8B. 45, F4
        leave                                           ; 4F0A _ C9
        ret                                             ; 4F0B _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4F0C _ 55
        mov     ebp, esp                                ; 4F0D _ 89. E5
        sub     esp, 16                                 ; 4F0F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4F12 _ C7. 45, F8, 00000000
        jmp     ?_308                                   ; 4F19 _ E9, 00000100

?_306:  mov     edx, dword [taskctl]                    ; 4F1E _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 4F24 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4F27 _ 69. C0, 00000094
        add     eax, edx                                ; 4F2D _ 01. D0
        add     eax, 72                                 ; 4F2F _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4F32 _ 8B. 00
        test    eax, eax                                ; 4F34 _ 85. C0
        jne     ?_307                                   ; 4F36 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 4F3C _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 4F41 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4F44 _ 69. D2, 00000094
        add     edx, 64                                 ; 4F4A _ 83. C2, 40
        add     eax, edx                                ; 4F4D _ 01. D0
        add     eax, 4                                  ; 4F4F _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4F52 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4F55 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4F58 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4F5F _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4F62 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4F69 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4F6C _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4F73 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4F76 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4F7D _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4F80 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4F87 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4F8A _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 4F91 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4F94 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 4F9B _ 8B. 45, F8
        add     eax, 1                                  ; 4F9E _ 83. C0, 01
        shl     eax, 9                                  ; 4FA1 _ C1. E0, 09
        mov     edx, eax                                ; 4FA4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4FA6 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4FA9 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4FAC _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4FAF _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FB6 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4FB9 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FC0 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4FC3 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FCA _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4FCD _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FD7 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4FDA _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FE4 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4FE7 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FF1 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 4FF4 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 4FFB _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4FFE _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5008 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 500B _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5015 _ 8B. 45, FC
        jmp     ?_309                                   ; 5018 _ EB, 13

?_307:  add     dword [ebp-8H], 1                       ; 501A _ 83. 45, F8, 01
?_308:  cmp     dword [ebp-8H], 4                       ; 501E _ 83. 7D, F8, 04
        jle     ?_306                                   ; 5022 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 5028 _ B8, 00000000
?_309:  leave                                           ; 502D _ C9
        ret                                             ; 502E _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 502F _ 55
        mov     ebp, esp                                ; 5030 _ 89. E5
        sub     esp, 24                                 ; 5032 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5035 _ 83. 7D, 0C, 00
        jns     ?_310                                   ; 5039 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 503B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 503E _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5041 _ 89. 45, 0C
?_310:  cmp     dword [ebp+10H], 0                      ; 5044 _ 83. 7D, 10, 00
        jle     ?_311                                   ; 5048 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 504A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 504D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5050 _ 89. 50, 08
?_311:  mov     eax, dword [ebp+8H]                     ; 5053 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5056 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5059 _ 83. F8, 02
        jnz     ?_312                                   ; 505C _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 505E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5061 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5064 _ 3B. 45, 0C
        jz      ?_312                                   ; 5067 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 5069 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 506C _ 89. 04 24
        call    task_remove                             ; 506F _ E8, FFFFFFFC(rel)
?_312:  mov     eax, dword [ebp+8H]                     ; 5074 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5077 _ 8B. 40, 04
        cmp     eax, 2                                  ; 507A _ 83. F8, 02
        jz      ?_313                                   ; 507D _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 507F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5082 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5085 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5088 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 508B _ 89. 04 24
        call    task_add                                ; 508E _ E8, FFFFFFFC(rel)
?_313:  mov     eax, dword [taskctl]                    ; 5093 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 5098 _ C7. 40, 04, 00000001
        nop                                             ; 509F _ 90
        leave                                           ; 50A0 _ C9
        ret                                             ; 50A1 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 50A2 _ 55
        mov     ebp, esp                                ; 50A3 _ 89. E5
        sub     esp, 40                                 ; 50A5 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 50A8 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 50AE _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 50B3 _ 8B. 10
        mov     eax, edx                                ; 50B5 _ 89. D0
        shl     eax, 2                                  ; 50B7 _ C1. E0, 02
        add     eax, edx                                ; 50BA _ 01. D0
        shl     eax, 2                                  ; 50BC _ C1. E0, 02
        add     eax, ecx                                ; 50BF _ 01. C8
        add     eax, 8                                  ; 50C1 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 50C4 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 50C7 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 50CA _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 50CD _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 50D0 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 50D4 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 50D7 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 50DA _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 50DD _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 50E0 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 50E3 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 50E6 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 50E9 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 50EC _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 50EF _ 8B. 00
        cmp     edx, eax                                ; 50F1 _ 39. C2
        jnz     ?_314                                   ; 50F3 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 50F5 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 50F8 _ C7. 40, 04, 00000000
?_314:  mov     eax, dword [taskctl]                    ; 50FF _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 5104 _ 8B. 40, 04
        test    eax, eax                                ; 5107 _ 85. C0
        jz      ?_315                                   ; 5109 _ 74, 24
        call    task_switchsub                          ; 510B _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5110 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5116 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 511B _ 8B. 10
        mov     eax, edx                                ; 511D _ 89. D0
        shl     eax, 2                                  ; 511F _ C1. E0, 02
        add     eax, edx                                ; 5122 _ 01. D0
        shl     eax, 2                                  ; 5124 _ C1. E0, 02
        add     eax, ecx                                ; 5127 _ 01. C8
        add     eax, 8                                  ; 5129 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 512C _ 89. 45, EC
?_315:  mov     eax, dword [ebp-14H]                    ; 512F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5132 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5135 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5138 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 513C _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 513F _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5142 _ 8B. 40, 08
        mov     edx, eax                                ; 5145 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5147 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 514C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5150 _ 89. 04 24
        call    timer_settime                           ; 5153 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5158 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 515B _ 3B. 45, F0
        jz      ?_316                                   ; 515E _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 5160 _ 83. 7D, F4, 00
        jz      ?_316                                   ; 5164 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5166 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5169 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 516B _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 516F _ C7. 04 24, 00000000
        call    farjmp                                  ; 5176 _ E8, FFFFFFFC(rel)
?_316:  nop                                             ; 517B _ 90
        leave                                           ; 517C _ C9
        ret                                             ; 517D _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 517E _ 55
        mov     ebp, esp                                ; 517F _ 89. E5
        sub     esp, 40                                 ; 5181 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 5184 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 518B _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5192 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5195 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5198 _ 83. F8, 02
        jnz     ?_317                                   ; 519B _ 75, 51
        call    task_now                                ; 519D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 51A2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 51A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51A8 _ 89. 04 24
        call    task_remove                             ; 51AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 51B0 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 51B7 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 51BA _ 3B. 45, F4
        jnz     ?_317                                   ; 51BD _ 75, 2F
        call    task_switchsub                          ; 51BF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 51C4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 51C9 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 51CC _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 51D3 _ 83. 7D, F4, 00
        jz      ?_317                                   ; 51D7 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 51D9 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 51DC _ 8B. 00
        mov     dword [esp+4H], eax                     ; 51DE _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 51E2 _ C7. 04 24, 00000000
        call    farjmp                                  ; 51E9 _ E8, FFFFFFFC(rel)
?_317:  mov     eax, dword [ebp-10H]                    ; 51EE _ 8B. 45, F0
        leave                                           ; 51F1 _ C9
        ret                                             ; 51F2 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 51F3 _ 55
        mov     ebp, esp                                ; 51F4 _ 89. E5
        sub     esp, 16                                 ; 51F6 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 51F9 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 51FF _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5204 _ 8B. 10
        mov     eax, edx                                ; 5206 _ 89. D0
        shl     eax, 2                                  ; 5208 _ C1. E0, 02
        add     eax, edx                                ; 520B _ 01. D0
        shl     eax, 2                                  ; 520D _ C1. E0, 02
        add     eax, ecx                                ; 5210 _ 01. C8
        add     eax, 8                                  ; 5212 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5215 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5218 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 521B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 521E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5221 _ 8B. 44 90, 08
        leave                                           ; 5225 _ C9
        ret                                             ; 5226 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5227 _ 55
        mov     ebp, esp                                ; 5228 _ 89. E5
        sub     esp, 16                                 ; 522A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 522D _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5233 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5236 _ 8B. 50, 0C
        mov     eax, edx                                ; 5239 _ 89. D0
        shl     eax, 2                                  ; 523B _ C1. E0, 02
        add     eax, edx                                ; 523E _ 01. D0
        shl     eax, 2                                  ; 5240 _ C1. E0, 02
        add     eax, ecx                                ; 5243 _ 01. C8
        add     eax, 8                                  ; 5245 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5248 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 524B _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 524E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5250 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5253 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5256 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 525A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 525D _ 8B. 00
        lea     edx, [eax+1H]                           ; 525F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5262 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5265 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5267 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 526A _ C7. 40, 04, 00000002
        nop                                             ; 5271 _ 90
        leave                                           ; 5272 _ C9
        ret                                             ; 5273 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5274 _ 55
        mov     ebp, esp                                ; 5275 _ 89. E5
        sub     esp, 16                                 ; 5277 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 527A _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5280 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5283 _ 8B. 50, 0C
        mov     eax, edx                                ; 5286 _ 89. D0
        shl     eax, 2                                  ; 5288 _ C1. E0, 02
        add     eax, edx                                ; 528B _ 01. D0
        shl     eax, 2                                  ; 528D _ C1. E0, 02
        add     eax, ecx                                ; 5290 _ 01. C8
        add     eax, 8                                  ; 5292 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5295 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5298 _ C7. 45, F8, 00000000
        jmp     ?_320                                   ; 529F _ EB, 23

?_318:  mov     eax, dword [ebp-4H]                     ; 52A1 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 52A4 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 52A7 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 52AB _ 3B. 45, 08
        jnz     ?_319                                   ; 52AE _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 52B0 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 52B3 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 52B6 _ C7. 44 90, 08, 00000000
        jmp     ?_321                                   ; 52BE _ EB, 0E

?_319:  add     dword [ebp-8H], 1                       ; 52C0 _ 83. 45, F8, 01
?_320:  mov     eax, dword [ebp-4H]                     ; 52C4 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 52C7 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 52C9 _ 3B. 45, F8
        jg      ?_318                                   ; 52CC _ 7F, D3
?_321:  mov     eax, dword [ebp-4H]                     ; 52CE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 52D1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 52D3 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 52D6 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 52D9 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 52DB _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 52DE _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 52E1 _ 3B. 45, F8
        jle     ?_322                                   ; 52E4 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 52E6 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 52E9 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 52EC _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 52EF _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 52F2 _ 89. 50, 04
?_322:  mov     eax, dword [ebp-4H]                     ; 52F5 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 52F8 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 52FB _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 52FE _ 8B. 00
        cmp     edx, eax                                ; 5300 _ 39. C2
        jl      ?_323                                   ; 5302 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5304 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5307 _ C7. 40, 04, 00000000
?_323:  mov     eax, dword [ebp+8H]                     ; 530E _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5311 _ C7. 40, 04, 00000001
        jmp     ?_325                                   ; 5318 _ EB, 1B

?_324:  mov     eax, dword [ebp-8H]                     ; 531A _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 531D _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5320 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5323 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5327 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 532A _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 532D _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5331 _ 83. 45, F8, 01
?_325:  mov     eax, dword [ebp-4H]                     ; 5335 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5338 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 533A _ 3B. 45, F8
        jg      ?_324                                   ; 533D _ 7F, DB
        nop                                             ; 533F _ 90
        leave                                           ; 5340 _ C9
        ret                                             ; 5341 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5342 _ 55
        mov     ebp, esp                                ; 5343 _ 89. E5
        sub     esp, 16                                 ; 5345 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5348 _ C7. 45, FC, 00000000
        jmp     ?_328                                   ; 534F _ EB, 24

?_326:  mov     ecx, dword [taskctl]                    ; 5351 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5357 _ 8B. 55, FC
        mov     eax, edx                                ; 535A _ 89. D0
        shl     eax, 2                                  ; 535C _ C1. E0, 02
        add     eax, edx                                ; 535F _ 01. D0
        shl     eax, 2                                  ; 5361 _ C1. E0, 02
        add     eax, ecx                                ; 5364 _ 01. C8
        add     eax, 8                                  ; 5366 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 5369 _ 8B. 00
        test    eax, eax                                ; 536B _ 85. C0
        jle     ?_327                                   ; 536D _ 7E, 02
        jmp     ?_329                                   ; 536F _ EB, 0A

?_327:  add     dword [ebp-4H], 1                       ; 5371 _ 83. 45, FC, 01
?_328:  cmp     dword [ebp-4H], 2                       ; 5375 _ 83. 7D, FC, 02
        jle     ?_326                                   ; 5379 _ 7E, D6
?_329:  mov     eax, dword [taskctl]                    ; 537B _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5380 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5383 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5385 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 538A _ C7. 40, 04, 00000000
        leave                                           ; 5391 _ C9
        ret                                             ; 5392 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5393 _ 55
        mov     ebp, esp                                ; 5394 _ 89. E5
        sub     esp, 24                                 ; 5396 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 5399 _ 8B. 45, 10
        movzx   eax, al                                 ; 539C _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 539F _ 8B. 55, 0C
        add     edx, 16                                 ; 53A2 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 53A5 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 53A9 _ 89. 14 24
        call    fifo8_put                               ; 53AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 53B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 53B4 _ 89. 04 24
        call    task_sleep                              ; 53B7 _ E8, FFFFFFFC(rel)
        leave                                           ; 53BC _ C9
        ret                                             ; 53BD _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_330:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_331:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_332:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_333:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_334:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_335:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_336:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_337:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_338:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_339:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 003A _ keyboard
        db 20H, 72H, 65H, 63H, 65H, 69H, 76H, 65H       ; 0042 _  receive
        db 00H                                          ; 004A _ .

?_340:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 004B _ mem.

?_341:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 004F _ cls.

?_342:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0053 _ hlt.

?_343:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0057 _ dir.

?_344:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 005B _ page is:
        db 20H, 00H                                     ; 0063 _  .

?_345:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0065 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 006D _ L: .

?_346:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0071 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0079 _ H: .

?_347:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 007D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0085 _ w: .

?_348:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0089 _ INT OC.

?_349:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 0090 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0098 _ ception.

?_350:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00A0 _ EIP = .

?_351:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00A7 _ INT 0D .

?_352:                                                  ; byte
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

?_353:  db 00H                                          ; 0112 _ .

?_354:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0118 _ 29 0 

table_rgb.2040:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2087:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01A0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01B0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01C0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01D0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 01F0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0200 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0210 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0220 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0230 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0240 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0250 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........

closebtn.2206:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0260 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0268 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0280 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0300 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0310 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0320 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0328 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0330 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0338 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

g_hlt:                                                  ; dword
        resd    1                                       ; 0000

key_shift:                                              ; dword
        resd    1                                       ; 0004

caps_lock:                                              ; dword
        resd    1                                       ; 0008

g_Console:                                              ; byte
        resd    1                                       ; 000C

?_355:  resd    1                                       ; 0010

?_356:  resd    1                                       ; 0014

?_357:  resd    1                                       ; 0018

?_358:  resb    1                                       ; 001C

?_359:  resb    3                                       ; 001D

?_360:  resd    1                                       ; 0020

bootInfo:                                               ; qword
        resb    4                                       ; 0024

?_361:  resw    1                                       ; 0028

?_362:  resw    1                                       ; 002A

keyinfo:                                                ; byte
        resb    24                                      ; 002C

?_363:  resd    1                                       ; 0044

mouseinfo:                                              ; byte
        resb    56                                      ; 0048

keybuf:                                                 ; yword
        resb    32                                      ; 0080

mousebuf:                                               ; byte
        resb    128                                     ; 00A0

mdec:                                                   ; oword
        resb    12                                      ; 0120

?_364:  resd    1                                       ; 012C

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

task_cons:                                              ; dword
        resd    1                                       ; 0290

task_main:                                              ; dword
        resd    1                                       ; 0294

buffer:                                                 ; byte
        resd    1                                       ; 0298

?_365:  resd    1                                       ; 029C

?_366:  resd    1                                       ; 02A0

task_a.1802:                                            ; dword
        resd    7                                       ; 02A4

tss_a.1801:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1800:                                             ; byte
        resb    104                                     ; 0340

task_b.1790:                                            ; byte
        resb    12                                      ; 03A8

str.2135:                                               ; byte
        resb    1                                       ; 03B4

?_367:  resb    9                                       ; 03B5

?_368:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


