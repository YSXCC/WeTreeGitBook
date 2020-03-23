; Disassembly of file: ckernel.o
; Mon Mar 23 17:03:35 2020
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
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 0000001C(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 0000001C(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_348]                       ; 001E _ 0F B7. 05, 00000020(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_349]                       ; 002B _ 0F B7. 05, 00000022(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0066 _ 89. 45, E0
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
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
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
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
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 00E5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 00F8 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 00000024(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000040(d)
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
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 01A8 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000140(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000268(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000026C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000160(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000144(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000160(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000140(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000264(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000264(d)
        mov     dword [esp+4H], ?_319                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000264(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000264(d)
        mov     dword [esp+8H], 100                     ; 0369 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000100(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1797], eax                ; 039B _ A3, 00000284(d)
        mov     eax, dword [task_a.1797]                ; 03A0 _ A1, 00000284(d)
        mov     dword [?_350], eax                      ; 03A5 _ A3, 0000003C(d)
        mov     eax, dword [task_a.1797]                ; 03AA _ A1, 00000284(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1797]                ; 03B4 _ A1, 00000284(d)
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
?_001:  mov     dword [esp], keyinfo                    ; 040A _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0411 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0416 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0418 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 041F _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0424 _ 01. C3
        mov     dword [esp], timerinfo                  ; 0426 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 042D _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0432 _ 01. D8
        test    eax, eax                                ; 0434 _ 85. C0
        jnz     ?_002                                   ; 0436 _ 75, 0A
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 043D _ E9, 0000037E

?_002:  mov     dword [esp], keyinfo                    ; 0442 _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0449 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 044E _ 85. C0
        je      ?_008                                   ; 0450 _ 0F 84, 00000339
        call    io_sti                                  ; 0456 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 045B _ C7. 04 24, 00000024(d)
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
        mov     eax, dword [task_cons]                  ; 0488 _ A1, 00000270(d)
        mov     eax, dword [eax+34H]                    ; 048D _ 8B. 40, 34
        test    eax, eax                                ; 0490 _ 85. C0
        jz      ?_003                                   ; 0492 _ 74, 2E
        mov     dword [esp], ?_320                      ; 0494 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 049B _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 04A0 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 04A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 04AA _ 89. 45, B0
        mov     eax, dword [task_cons]                  ; 04AD _ A1, 00000270(d)
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
        mov     edx, dword [shtMsgBox]                  ; 04E4 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04EA _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 04EF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_321                   ; 04F7 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 04FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0503 _ 89. 04 24
        call    make_wtitle8                            ; 0506 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 050B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0510 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_322                   ; 0518 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 0520 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0523 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0527 _ 89. 04 24
        call    make_wtitle8                            ; 052A _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 052F _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0535 _ A1, 00000264(d)
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
        mov     edx, dword [shtMsgBox]                  ; 056D _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0573 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0578 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_321                   ; 0580 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0588 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 058C _ 89. 04 24
        call    make_wtitle8                            ; 058F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0594 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0599 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_322                   ; 05A1 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 05A9 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 05AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05B0 _ 89. 04 24
        call    make_wtitle8                            ; 05B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_cons]                  ; 05B8 _ A1, 00000270(d)
        add     eax, 16                                 ; 05BD _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 05C0 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05C8 _ 89. 04 24
        call    fifo8_put                               ; 05CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 88                     ; 05D0 _ C7. 45, E8, 00000058
?_005:  mov     eax, dword [shtMsgBox]                  ; 05D7 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 05DC _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 05DF _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05E5 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 05EA _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 05F2 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 05F6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05FE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0606 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 060A _ 89. 04 24
        call    sheet_refresh                           ; 060D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0612 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0615 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0618 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 061D _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], edx                    ; 0625 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0629 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0631 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-34H]                    ; 0639 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 063C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0640 _ 89. 04 24
        call    sheet_refresh                           ; 0643 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_cons]                  ; 0648 _ 8B. 15, 00000270(d)
        mov     eax, dword [task_a.1797]                ; 064E _ A1, 00000284(d)
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
        mov     edx, dword [shtMsgBox]                  ; 0690 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0696 _ A1, 00000264(d)
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
        mov     edx, dword [shtMsgBox]                  ; 06D7 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06DD _ A1, 00000264(d)
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
        mov     edx, dword [shtMsgBox]                  ; 0717 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 071D _ A1, 00000264(d)
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
        mov     edx, dword [task_cons]                  ; 075B _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 0761 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0764 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0768 _ 89. 14 24
        call    fifo8_put                               ; 076B _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0770 _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0777 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 077C _ 85. C0
        jnz     ?_009                                   ; 077E _ 75, 40
        mov     eax, dword [task_a.1797]                ; 0780 _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 0785 _ 89. 04 24
        call    task_sleep                              ; 0788 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 078D _ EB, 31

?_008:  mov     dword [esp], mouseinfo                  ; 078F _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0796 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 079B _ 85. C0
        jz      ?_009                                   ; 079D _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 079F _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 07A5 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 07AB _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 07B0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07B8 _ 89. 04 24
        call    show_mouse_info                         ; 07BB _ E8, FFFFFFFC(rel)
?_009:  mov     dword [esp], timerinfo                  ; 07C0 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 07C7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07CC _ 85. C0
        je      ?_013                                   ; 07CE _ 0F 84, 000000DB
        call    io_sti                                  ; 07D4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 07D9 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 07E0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 07E5 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 07E8 _ 83. 7D, A8, 00
        jz      ?_010                                   ; 07EC _ 74, 24
        mov     dword [esp+8H], 0                       ; 07EE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 07F6 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 07FE _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0801 _ 89. 04 24
        call    timer_init                              ; 0804 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0809 _ C7. 45, F0, 00000000
        jmp     ?_011                                   ; 0810 _ EB, 22

?_010:  mov     dword [esp+8H], 1                       ; 0812 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 081A _ C7. 44 24, 04, 00000110(d)
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
        mov     edx, dword [shtMsgBox]                  ; 084D _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0853 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0858 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 085B _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 085F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0867 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 086A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 086E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0872 _ 89. 04 24
        call    set_cursor                              ; 0875 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 087A _ EB, 33

?_012:  mov     edx, dword [shtMsgBox]                  ; 087C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0882 _ A1, 00000264(d)
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
        mov     eax, dword [shtctl]                     ; 0ACF _ A1, 00000264(d)
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
        mov     eax, dword [shtctl]                     ; 0B21 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0B26 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_322                   ; 0B2E _ C7. 44 24, 08, 0000001C(d)
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
        mov     eax, dword [shtctl]                     ; 0C49 _ A1, 00000264(d)
        mov     dword [esp+0CH], 4                      ; 0C4E _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0C56 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0C5E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C61 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C65 _ 89. 04 24
        call    sheet_slide                             ; 0C68 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C6D _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 0C72 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0C7A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C7D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C81 _ 89. 04 24
        call    sheet_updown                            ; 0C84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0C89 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0C8C _ A3, 00000270(d)
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
        mov     edx, dword [g_Console]                  ; 0CA0 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 0CA6 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    cons_newline                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_344]                      ; 0CB7 _ A1, 00000010(d)
        add     eax, 16                                 ; 0CBC _ 83. C0, 10
        mov     dword [?_344], eax                      ; 0CBF _ A3, 00000010(d)
        mov     eax, dword [task_cons]                  ; 0CC4 _ A1, 00000270(d)
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
        mov     ecx, dword [?_344]                      ; 0D88 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0D8E _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0D94 _ A1, 00000264(d)
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
        mov     ecx, dword [?_344]                      ; 0DD8 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0DDE _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0DE4 _ A1, 00000264(d)
        mov     ebx, dword [ebp-20H]                    ; 0DE9 _ 8B. 5D, E0
        mov     dword [esp+14H], ebx                    ; 0DEC _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DF0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DF8 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 0DFC _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 0DFF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0E03 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E07 _ 89. 04 24
        call    showString                              ; 0E0A _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 0E0F _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 0E15 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0E1A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E1E _ 89. 04 24
        call    cons_newline                            ; 0E21 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 0E26 _ A3, 00000010(d)
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
        mov     dword [?_343], 16                       ; 0FB0 _ C7. 05, 0000000C(d), 00000010
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
?_050:  mov     ebx, dword [?_344]                      ; 0FE0 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_343]                      ; 0FE6 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 0FEC _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0FF2 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_323                  ; 0FF7 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 0FFF _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1007 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 100B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 100F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1013 _ 89. 04 24
        call    showString                              ; 1016 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_343]                      ; 101B _ A1, 0000000C(d)
        add     eax, 8                                  ; 1020 _ 83. C0, 08
        mov     dword [?_343], eax                      ; 1023 _ A3, 0000000C(d)
        mov     eax, dword [?_343]                      ; 1028 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 102D _ 3D, 000000F8
        jnz     ?_051                                   ; 1032 _ 75, 28
        mov     dword [?_343], 8                        ; 1034 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 103E _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 1044 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1049 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 104D _ 89. 04 24
        call    cons_newline                            ; 1050 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 1055 _ A3, 00000010(d)
        jmp     ?_050                                   ; 105A _ EB, 84

?_051:  jmp     ?_050                                   ; 105C _ EB, 82

?_052:  movzx   eax, byte [ebp-3BH]                     ; 105E _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1062 _ 3C, 0A
        jnz     ?_053                                   ; 1064 _ 75, 2B
        mov     dword [?_343], 8                        ; 1066 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 1070 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 1076 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 107B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107F _ 89. 04 24
        call    cons_newline                            ; 1082 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 1087 _ A3, 00000010(d)
        jmp     ?_054                                   ; 108C _ E9, 00000081

?_053:  movzx   eax, byte [ebp-3BH]                     ; 1091 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 1095 _ 3C, 0D
        jz      ?_054                                   ; 1097 _ 74, 79
        mov     ebx, dword [?_344]                      ; 1099 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_343]                      ; 109F _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 10A5 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 10AB _ A1, 00000264(d)
        lea     esi, [ebp-3BH]                          ; 10B0 _ 8D. 75, C5
        mov     dword [esp+14H], esi                    ; 10B3 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 10B7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 10BF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 10C3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10CB _ 89. 04 24
        call    showString                              ; 10CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_343]                      ; 10D3 _ A1, 0000000C(d)
        add     eax, 8                                  ; 10D8 _ 83. C0, 08
        mov     dword [?_343], eax                      ; 10DB _ A3, 0000000C(d)
        mov     eax, dword [?_343]                      ; 10E0 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 10E5 _ 3D, 000000F8
        jnz     ?_054                                   ; 10EA _ 75, 26
        mov     dword [?_343], 16                       ; 10EC _ C7. 05, 0000000C(d), 00000010
        mov     edx, dword [g_Console]                  ; 10F6 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 10FC _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1101 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1105 _ 89. 04 24
        call    cons_newline                            ; 1108 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 110D _ A3, 00000010(d)
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
?_058:  mov     edx, dword [g_Console]                  ; 1137 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 113D _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1142 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1146 _ 89. 04 24
        call    cons_newline                            ; 1149 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 114E _ A3, 00000010(d)
        mov     edx, dword [ebp-24H]                    ; 1153 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1156 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 115B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1163 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1167 _ 89. 04 24
        call    memman_free                             ; 116A _ E8, FFFFFFFC(rel)
        mov     dword [?_343], 16                       ; 116F _ C7. 05, 0000000C(d), 00000010
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
        mov     ecx, dword [?_344]                      ; 11A3 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 11A9 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 11AF _ A1, 00000264(d)
        mov     dword [esp+14H], ?_324                  ; 11B4 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11BC _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11D4 _ 89. 04 24
        call    showString                              ; 11D7 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_344]                      ; 11DC _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 11E2 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 11E8 _ A1, 00000264(d)
        mov     ebx, dword [ebp-0CH]                    ; 11ED _ 8B. 5D, F4
        mov     dword [esp+14H], ebx                    ; 11F0 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 11F4 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 1200 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1208 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 120C _ 89. 04 24
        call    showString                              ; 120F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_344]                      ; 1214 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 121A _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1220 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_325                  ; 1225 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 122D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1235 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1239 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1241 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1245 _ 89. 04 24
        call    showString                              ; 1248 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 124D _ 8B. 15, 00000008(d)
        mov     eax, dword [?_344]                      ; 1253 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 125C _ 89. 04 24
        call    cons_newline                            ; 125F _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 1264 _ A3, 00000010(d)
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

?_060:  mov     eax, dword [g_Console]                  ; 1295 _ A1, 00000008(d)
        mov     edx, dword [eax]                        ; 129A _ 8B. 10
        mov     eax, dword [g_Console]                  ; 129C _ A1, 00000008(d)
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
        mov     edx, dword [g_Console]                  ; 12CE _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 12D4 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 12D9 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 12E1 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 12E9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 12F1 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 12F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12FD _ 89. 04 24
        call    sheet_refresh                           ; 1300 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], 28                       ; 1305 _ C7. 05, 00000010(d), 0000001C
        mov     edx, dword [g_Console]                  ; 130F _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1315 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_326                  ; 131A _ C7. 44 24, 14, 00000030(d)
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
        mov     dword [esp+4H], buffer                  ; 134E _ C7. 44 24, 04, 00000278(d)
        mov     dword [esp], ?_327                      ; 1356 _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 135D _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1362 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1367 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 136A _ A1, 00000278(d)
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
        mov     dword [?_352], eax                      ; 13AC _ A3, 0000027C(d)
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
        mov     eax, dword [?_353]                      ; 1416 _ A1, 00000280(d)
        mov     ecx, eax                                ; 141B _ 89. C1
        mov     eax, dword [buffer]                     ; 141D _ A1, 00000278(d)
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
        mov     dword [g_Console], eax                  ; 14AE _ A3, 00000008(d)
        mov     dword [?_343], 16                       ; 14B3 _ C7. 05, 0000000C(d), 00000010
        mov     dword [?_344], 28                       ; 14BD _ C7. 05, 00000010(d), 0000001C
        mov     dword [?_345], -1                       ; 14C7 _ C7. 05, 00000014(d), FFFFFFFF
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
        mov     eax, dword [shtctl]                     ; 152D _ A1, 00000264(d)
        mov     dword [esp+14H], ?_326                  ; 1532 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 153A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1542 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 154A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1552 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1555 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1559 _ 89. 04 24
        call    showString                              ; 155C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1561 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 1568 _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 156F _ C7. 45, D0, 00000000
?_063:  call    io_cli                                  ; 1576 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 157B _ 8B. 45, F0
        add     eax, 16                                 ; 157E _ 83. C0, 10
        mov     dword [esp], eax                        ; 1581 _ 89. 04 24
        call    fifo8_status                            ; 1584 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1589 _ 85. C0
        jnz     ?_064                                   ; 158B _ 75, 0A
        call    io_sti                                  ; 158D _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1592 _ E9, 000003AF

?_064:  call    io_sti                                  ; 1597 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 159C _ 8B. 45, F0
        add     eax, 16                                 ; 159F _ 83. C0, 10
        mov     dword [esp], eax                        ; 15A2 _ 89. 04 24
        call    fifo8_get                               ; 15A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15AA _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 15AD _ 83. 7D, CC, 01
        jg      ?_067                                   ; 15B1 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 15B3 _ 83. 7D, F4, 00
        js      ?_067                                   ; 15B7 _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 15B9 _ 83. 7D, CC, 00
        jz      ?_065                                   ; 15BD _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 15BF _ 8B. 45, F0
        add     eax, 16                                 ; 15C2 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 15C5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 15CD _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15D1 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15D4 _ 89. 04 24
        call    timer_init                              ; 15D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 15DC _ C7. 45, F4, 00000007
        jmp     ?_066                                   ; 15E3 _ EB, 24

?_065:  mov     eax, dword [ebp-10H]                    ; 15E5 _ 8B. 45, F0
        add     eax, 16                                 ; 15E8 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 15EB _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 15F3 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15F7 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15FA _ 89. 04 24
        call    timer_init                              ; 15FD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1602 _ C7. 45, F4, 00000000
?_066:  mov     dword [esp+4H], 50                      ; 1609 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1611 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1614 _ 89. 04 24
        call    timer_settime                           ; 1617 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 161C _ E9, 000002EB

?_067:  cmp     dword [ebp-34H], 87                     ; 1621 _ 83. 7D, CC, 57
        jnz     ?_068                                   ; 1625 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1627 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 162E _ 8B. 45, F0
        add     eax, 16                                 ; 1631 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1634 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 163C _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1640 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1643 _ 89. 04 24
        call    timer_init                              ; 1646 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 164B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1653 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1656 _ 89. 04 24
        call    timer_settime                           ; 1659 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 165E _ E9, 000002A9

?_068:  cmp     dword [ebp-34H], 88                     ; 1663 _ 83. 7D, CC, 58
        jnz     ?_069                                   ; 1667 _ 75, 59
        mov     ecx, dword [?_344]                      ; 1669 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_343]                      ; 166F _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1675 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 167A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1682 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1686 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 168A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 168D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1691 _ 89. 04 24
        call    set_cursor                              ; 1694 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1699 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 16A0 _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 16A5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 16AD _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 16B5 _ 89. 04 24
        call    task_run                                ; 16B8 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 16BD _ E9, 0000024A

?_069:  cmp     dword [ebp-34H], 28                     ; 16C2 _ 83. 7D, CC, 1C
        jne     ?_074                                   ; 16C6 _ 0F 85, 00000154
        mov     ecx, dword [?_344]                      ; 16CC _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_343]                      ; 16D2 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 16D8 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 16DD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16E5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16E9 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16ED _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 16F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16F4 _ 89. 04 24
        call    set_cursor                              ; 16F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_343]                      ; 16FC _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 1701 _ 8D. 50, 07
        test    eax, eax                                ; 1704 _ 85. C0
        cmovs   eax, edx                                ; 1706 _ 0F 48. C2
        sar     eax, 3                                  ; 1709 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 170C _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 170F _ 8B. 45, E0
        add     eax, edx                                ; 1712 _ 01. D0
        mov     byte [eax], 0                           ; 1714 _ C6. 00, 00
        mov     eax, dword [?_344]                      ; 1717 _ A1, 00000010(d)
        mov     edx, dword [ebp+8H]                     ; 171C _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 171F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1723 _ 89. 04 24
        call    cons_newline                            ; 1726 _ E8, FFFFFFFC(rel)
        mov     dword [?_344], eax                      ; 172B _ A3, 00000010(d)
        mov     dword [?_343], 16                       ; 1730 _ C7. 05, 0000000C(d), 00000010
        mov     dword [esp+4H], ?_328                   ; 173A _ C7. 44 24, 04, 0000003A(d)
        mov     eax, dword [ebp-20H]                    ; 1742 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1745 _ 89. 04 24
        call    strcmp                                  ; 1748 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 174D _ 83. F8, 01
        jnz     ?_070                                   ; 1750 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1752 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1755 _ 89. 04 24
        call    cmd_mem                                 ; 1758 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 175D _ E9, 000001AA

?_070:  mov     dword [esp+4H], ?_329                   ; 1762 _ C7. 44 24, 04, 0000003E(d)
        mov     eax, dword [ebp-20H]                    ; 176A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 176D _ 89. 04 24
        call    strcmp                                  ; 1770 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1775 _ 83. F8, 01
        jnz     ?_071                                   ; 1778 _ 75, 0A
        call    cmd_cls                                 ; 177A _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 177F _ E9, 00000188

?_071:  mov     dword [esp+4H], ?_330                   ; 1784 _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-20H]                    ; 178C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 178F _ 89. 04 24
        call    strcmp                                  ; 1792 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1797 _ 83. F8, 01
        jnz     ?_072                                   ; 179A _ 75, 11
        call    cmd_hlt                                 ; 179C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], 1                      ; 17A1 _ C7. 45, D0, 00000001
        jmp     ?_076                                   ; 17A8 _ E9, 0000015F

?_072:  mov     dword [esp+4H], ?_331                   ; 17AD _ C7. 44 24, 04, 00000046(d)
        mov     eax, dword [ebp-20H]                    ; 17B5 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B8 _ 89. 04 24
        call    strcmp                                  ; 17BB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17C0 _ 83. F8, 01
        jnz     ?_073                                   ; 17C3 _ 75, 0A
        call    cmd_dir                                 ; 17C5 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 17CA _ E9, 0000013D

?_073:  mov     eax, dword [ebp-20H]                    ; 17CF _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 17D2 _ 0F B6. 00
        cmp     al, 116                                 ; 17D5 _ 3C, 74
        jne     ?_076                                   ; 17D7 _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 17DD _ 8B. 45, E0
        add     eax, 1                                  ; 17E0 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 17E3 _ 0F B6. 00
        cmp     al, 121                                 ; 17E6 _ 3C, 79
        jne     ?_076                                   ; 17E8 _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 17EE _ 8B. 45, E0
        add     eax, 2                                  ; 17F1 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 17F4 _ 0F B6. 00
        cmp     al, 112                                 ; 17F7 _ 3C, 70
        jne     ?_076                                   ; 17F9 _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 17FF _ 8B. 45, E0
        add     eax, 3                                  ; 1802 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1805 _ 0F B6. 00
        cmp     al, 101                                 ; 1808 _ 3C, 65
        jne     ?_076                                   ; 180A _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1810 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1813 _ 89. 04 24
        call    cmd_type                                ; 1816 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 181B _ E9, 000000EC

?_074:  cmp     dword [ebp-34H], 14                     ; 1820 _ 83. 7D, CC, 0E
        jnz     ?_075                                   ; 1824 _ 75, 79
        mov     eax, dword [?_343]                      ; 1826 _ A1, 0000000C(d)
        cmp     eax, 8                                  ; 182B _ 83. F8, 08
        jle     ?_075                                   ; 182E _ 7E, 6F
        mov     ecx, dword [?_344]                      ; 1830 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_343]                      ; 1836 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 183C _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1841 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1849 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 184D _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1851 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1854 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1858 _ 89. 04 24
        call    set_cursor                              ; 185B _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_343]                      ; 1860 _ A1, 0000000C(d)
        sub     eax, 8                                  ; 1865 _ 83. E8, 08
        mov     dword [?_343], eax                      ; 1868 _ A3, 0000000C(d)
        mov     ecx, dword [?_344]                      ; 186D _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_343]                      ; 1873 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1879 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 187E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1886 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 188A _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 188E _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1891 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1895 _ 89. 04 24
        call    set_cursor                              ; 1898 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 189D _ EB, 6D

?_075:  mov     eax, dword [ebp-34H]                    ; 189F _ 8B. 45, CC
        mov     dword [esp], eax                        ; 18A2 _ 89. 04 24
        call    transferScanCode                        ; 18A5 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 18AA _ 88. 45, CB
        mov     eax, dword [?_343]                      ; 18AD _ A1, 0000000C(d)
        cmp     eax, 239                                ; 18B2 _ 3D, 000000EF
        jg      ?_076                                   ; 18B7 _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 18B9 _ 80. 7D, CB, 00
        jz      ?_076                                   ; 18BD _ 74, 4D
        mov     eax, dword [?_343]                      ; 18BF _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18C4 _ 8D. 50, 07
        test    eax, eax                                ; 18C7 _ 85. C0
        cmovs   eax, edx                                ; 18C9 _ 0F 48. C2
        sar     eax, 3                                  ; 18CC _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 18CF _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 18D2 _ 8B. 45, E0
        add     edx, eax                                ; 18D5 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 18D7 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 18DB _ 88. 02
        mov     eax, dword [?_343]                      ; 18DD _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18E2 _ 8D. 50, 07
        test    eax, eax                                ; 18E5 _ 85. C0
        cmovs   eax, edx                                ; 18E7 _ 0F 48. C2
        sar     eax, 3                                  ; 18EA _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 18ED _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 18F0 _ 8B. 45, E0
        add     eax, edx                                ; 18F3 _ 01. D0
        mov     byte [eax], 0                           ; 18F5 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 18F8 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 18FC _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1904 _ 89. 04 24
        call    cons_putchar                            ; 1907 _ E8, FFFFFFFC(rel)
?_076:  cmp     dword [ebp-0CH], 0                      ; 190C _ 83. 7D, F4, 00
        js      ?_077                                   ; 1910 _ 78, 34
        mov     ecx, dword [?_344]                      ; 1912 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_343]                      ; 1918 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 191E _ A1, 00000264(d)
        mov     ebx, dword [ebp-0CH]                    ; 1923 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 1926 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 192A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 192E _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1932 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1935 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1939 _ 89. 04 24
        call    set_cursor                              ; 193C _ E8, FFFFFFFC(rel)
        jmp     ?_063                                   ; 1941 _ E9, FFFFFC30

?_077:  jmp     ?_063                                   ; 1946 _ E9, FFFFFC2B
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 194B _ 55
        mov     ebp, esp                                ; 194C _ 89. E5
        sub     esp, 24                                 ; 194E _ 83. EC, 18
        jmp     ?_079                                   ; 1951 _ EB, 1D

?_078:  mov     eax, dword [ebp+8H]                     ; 1953 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1956 _ 0F B6. 00
        movsx   eax, al                                 ; 1959 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 195C _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1964 _ 89. 04 24
        call    cons_putchar                            ; 1967 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 196C _ 83. 45, 08, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 1970 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1973 _ 0F B6. 00
        test    al, al                                  ; 1976 _ 84. C0
        jnz     ?_078                                   ; 1978 _ 75, D9
        nop                                             ; 197A _ 90
        leave                                           ; 197B _ C9
        ret                                             ; 197C _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 197D _ 55
        mov     ebp, esp                                ; 197E _ 89. E5
        sub     esp, 32                                 ; 1980 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1983 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1986 _ 8B. 55, 14
        sub     edx, eax                                ; 1989 _ 29. C2
        mov     eax, edx                                ; 198B _ 89. D0
        mov     dword [ebp-14H], eax                    ; 198D _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1990 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1993 _ 8B. 55, 18
        sub     edx, eax                                ; 1996 _ 29. C2
        mov     eax, edx                                ; 1998 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 199A _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 199D _ 8B. 45, 0C
        shl     eax, 10                                 ; 19A0 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 19A3 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 19A6 _ 8B. 45, 10
        shl     eax, 10                                 ; 19A9 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 19AC _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 19AF _ 83. 7D, EC, 00
        jns     ?_080                                   ; 19B3 _ 79, 03
        neg     dword [ebp-14H]                         ; 19B5 _ F7. 5D, EC
?_080:  cmp     dword [ebp-18H], 0                      ; 19B8 _ 83. 7D, E8, 00
        jns     ?_081                                   ; 19BC _ 79, 03
        neg     dword [ebp-18H]                         ; 19BE _ F7. 5D, E8
?_081:  mov     eax, dword [ebp-14H]                    ; 19C1 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 19C4 _ 3B. 45, E8
        jl      ?_085                                   ; 19C7 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 19C9 _ 8B. 45, EC
        add     eax, 1                                  ; 19CC _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 19CF _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 19D2 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 19D5 _ 3B. 45, 14
        jle     ?_082                                   ; 19D8 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 19DA _ C7. 45, EC, FFFFFC00
        jmp     ?_083                                   ; 19E1 _ EB, 07

?_082:  mov     dword [ebp-14H], 1024                   ; 19E3 _ C7. 45, EC, 00000400
?_083:  mov     eax, dword [ebp+10H]                    ; 19EA _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 19ED _ 3B. 45, 18
        jg      ?_084                                   ; 19F0 _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 19F2 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 19F5 _ 8B. 55, 18
        sub     edx, eax                                ; 19F8 _ 29. C2
        mov     eax, edx                                ; 19FA _ 89. D0
        add     eax, 1                                  ; 19FC _ 83. C0, 01
        shl     eax, 10                                 ; 19FF _ C1. E0, 0A
        cdq                                             ; 1A02 _ 99
        idiv    dword [ebp-10H]                         ; 1A03 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A06 _ 89. 45, E8
        jmp     ?_089                                   ; 1A09 _ EB, 72

?_084:  mov     eax, dword [ebp+10H]                    ; 1A0B _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A0E _ 8B. 55, 18
        sub     edx, eax                                ; 1A11 _ 29. C2
        mov     eax, edx                                ; 1A13 _ 89. D0
        sub     eax, 1                                  ; 1A15 _ 83. E8, 01
        shl     eax, 10                                 ; 1A18 _ C1. E0, 0A
        cdq                                             ; 1A1B _ 99
        idiv    dword [ebp-10H]                         ; 1A1C _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A1F _ 89. 45, E8
        jmp     ?_089                                   ; 1A22 _ EB, 59

?_085:  mov     eax, dword [ebp-18H]                    ; 1A24 _ 8B. 45, E8
        add     eax, 1                                  ; 1A27 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A2A _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1A2D _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1A30 _ 3B. 45, 18
        jle     ?_086                                   ; 1A33 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1A35 _ C7. 45, E8, FFFFFC00
        jmp     ?_087                                   ; 1A3C _ EB, 07

?_086:  mov     dword [ebp-18H], 1024                   ; 1A3E _ C7. 45, E8, 00000400
?_087:  mov     eax, dword [ebp+0CH]                    ; 1A45 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1A48 _ 3B. 45, 14
        jg      ?_088                                   ; 1A4B _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1A4D _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1A50 _ 8B. 55, 14
        sub     edx, eax                                ; 1A53 _ 29. C2
        mov     eax, edx                                ; 1A55 _ 89. D0
        add     eax, 1                                  ; 1A57 _ 83. C0, 01
        shl     eax, 10                                 ; 1A5A _ C1. E0, 0A
        cdq                                             ; 1A5D _ 99
        idiv    dword [ebp-10H]                         ; 1A5E _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1A61 _ 89. 45, EC
        jmp     ?_089                                   ; 1A64 _ EB, 17

?_088:  mov     eax, dword [ebp+0CH]                    ; 1A66 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1A69 _ 8B. 55, 14
        sub     edx, eax                                ; 1A6C _ 29. C2
        mov     eax, edx                                ; 1A6E _ 89. D0
        sub     eax, 1                                  ; 1A70 _ 83. E8, 01
        shl     eax, 10                                 ; 1A73 _ C1. E0, 0A
        cdq                                             ; 1A76 _ 99
        idiv    dword [ebp-10H]                         ; 1A77 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1A7A _ 89. 45, EC
?_089:  mov     dword [ebp-4H], 0                       ; 1A7D _ C7. 45, FC, 00000000
        jmp     ?_091                                   ; 1A84 _ EB, 35

?_090:  mov     eax, dword [ebp+8H]                     ; 1A86 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1A89 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1A8B _ 8B. 45, F4
        sar     eax, 10                                 ; 1A8E _ C1. F8, 0A
        mov     ecx, eax                                ; 1A91 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1A93 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A96 _ 8B. 40, 04
        imul    eax, ecx                                ; 1A99 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1A9C _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1A9F _ C1. F9, 0A
        add     eax, ecx                                ; 1AA2 _ 01. C8
        add     edx, eax                                ; 1AA4 _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1AA6 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1AA9 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1AAB _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1AAE _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1AB1 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1AB4 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1AB7 _ 83. 45, FC, 01
?_091:  mov     eax, dword [ebp-4H]                     ; 1ABB _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1ABE _ 3B. 45, F0
        jl      ?_090                                   ; 1AC1 _ 7C, C3
        leave                                           ; 1AC3 _ C9
        ret                                             ; 1AC4 _ C3
; api_linewin End of function

kernel_api:; Function begin
        push    ebp                                     ; 1AC5 _ 55
        mov     ebp, esp                                ; 1AC6 _ 89. E5
        push    esi                                     ; 1AC8 _ 56
        push    ebx                                     ; 1AC9 _ 53
        sub     esp, 48                                 ; 1ACA _ 83. EC, 30
        call    task_now                                ; 1ACD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1AD2 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 1AD5 _ 8D. 45, 24
        add     eax, 4                                  ; 1AD8 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1ADB _ 89. 45, F0
        cmp     dword [ebp+1CH], 1                      ; 1ADE _ 83. 7D, 1C, 01
        jnz     ?_092                                   ; 1AE2 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1AE4 _ 8B. 45, 24
        movsx   eax, al                                 ; 1AE7 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1AEA _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1AF2 _ 89. 04 24
        call    cons_putchar                            ; 1AF5 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1AFA _ E9, 000002C7

?_092:  cmp     dword [ebp+1CH], 2                      ; 1AFF _ 83. 7D, 1C, 02
        jnz     ?_093                                   ; 1B03 _ 75, 18
        mov     edx, dword [buffer]                     ; 1B05 _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+18H]                    ; 1B0B _ 8B. 45, 18
        add     eax, edx                                ; 1B0E _ 01. D0
        mov     dword [esp], eax                        ; 1B10 _ 89. 04 24
        call    cons_putstr                             ; 1B13 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1B18 _ E9, 000002A9

?_093:  cmp     dword [ebp+1CH], 4                      ; 1B1D _ 83. 7D, 1C, 04
        jnz     ?_094                                   ; 1B21 _ 75, 28
        mov     eax, dword [ebp-0CH]                    ; 1B23 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 1B26 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1B2D _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 1B30 _ 8B. 40, 30
        mov     dword [esp], eax                        ; 1B33 _ 89. 04 24
        call    intToHexStr                             ; 1B36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1B3B _ 89. 45, EC
        mov     eax, dword [task_cons]                  ; 1B3E _ A1, 00000270(d)
        add     eax, 48                                 ; 1B43 _ 83. C0, 30
        jmp     ?_101                                   ; 1B46 _ E9, 00000280

?_094:  cmp     dword [ebp+1CH], 5                      ; 1B4B _ 83. 7D, 1C, 05
        jne     ?_095                                   ; 1B4F _ 0F 85, 000000BA
        mov     eax, dword [shtctl]                     ; 1B55 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 1B5A _ 89. 04 24
        call    sheet_alloc                             ; 1B5D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1B62 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1B65 _ 8B. 45, 24
        mov     ecx, dword [?_352]                      ; 1B68 _ 8B. 0D, 0000027C(d)
        mov     edx, dword [ebp+18H]                    ; 1B6E _ 8B. 55, 18
        add     edx, ecx                                ; 1B71 _ 01. CA
        mov     dword [esp+10H], eax                    ; 1B73 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1B77 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1B7A _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B7E _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1B81 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1B85 _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 1B89 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1B8C _ 89. 04 24
        call    sheet_setbuf                            ; 1B8F _ E8, FFFFFFFC(rel)
        mov     edx, dword [buffer]                     ; 1B94 _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+20H]                    ; 1B9A _ 8B. 45, 20
        add     edx, eax                                ; 1B9D _ 01. C2
        mov     eax, dword [shtctl]                     ; 1B9F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 1BA4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 1BAC _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1BB0 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1BB3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BB7 _ 89. 04 24
        call    make_window8                            ; 1BBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1BBF _ A1, 00000264(d)
        mov     dword [esp+0CH], 50                     ; 1BC4 _ C7. 44 24, 0C, 00000032
        mov     dword [esp+8H], 100                     ; 1BCC _ C7. 44 24, 08, 00000064
        mov     edx, dword [ebp-18H]                    ; 1BD4 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1BD7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BDB _ 89. 04 24
        call    sheet_slide                             ; 1BDE _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1BE3 _ A1, 00000264(d)
        mov     dword [esp+8H], 3                       ; 1BE8 _ C7. 44 24, 08, 00000003
        mov     edx, dword [ebp-18H]                    ; 1BF0 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1BF3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BF7 _ 89. 04 24
        call    sheet_updown                            ; 1BFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BFF _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 1C02 _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 1C05 _ 8B. 45, E8
        mov     dword [edx], eax                        ; 1C08 _ 89. 02
        jmp     ?_100                                   ; 1C0A _ E9, 000001B7

?_095:  cmp     dword [ebp+1CH], 6                      ; 1C0F _ 83. 7D, 1C, 06
        jne     ?_096                                   ; 1C13 _ 0F 85, 00000086
        mov     eax, dword [ebp+18H]                    ; 1C19 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1C1C _ 89. 45, E8
        mov     edx, dword [buffer]                     ; 1C1F _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+10H]                    ; 1C25 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1C28 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 1C2B _ 8B. 45, 24
        movsx   edx, al                                 ; 1C2E _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 1C31 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 1C36 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C3A _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1C3E _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1C41 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1C45 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1C48 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1C4C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1C4F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C53 _ 89. 04 24
        call    showString                              ; 1C56 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1C5B _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 1C5E _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 1C61 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 1C64 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1C6B _ 8B. 45, 0C
        add     edx, eax                                ; 1C6E _ 01. C2
        mov     eax, dword [shtctl]                     ; 1C70 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 1C75 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C79 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1C7D _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1C80 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1C84 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1C87 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1C8B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1C8E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C92 _ 89. 04 24
        call    sheet_refresh                           ; 1C95 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1C9A _ E9, 00000127

?_096:  cmp     dword [ebp+1CH], 7                      ; 1C9F _ 83. 7D, 1C, 07
        jnz     ?_097                                   ; 1CA3 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 1CA5 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1CA8 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 1CAB _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1CAE _ 8B. 45, 10
        movzx   ecx, al                                 ; 1CB1 _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 1CB4 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 1CB7 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 1CBA _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 1CBD _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 1CBF _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 1CC2 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 1CC6 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 1CC9 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 1CCD _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 1CD0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1CD4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1CD8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1CDC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE0 _ 89. 04 24
        call    boxfill8                                ; 1CE3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1CE8 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1CEB _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1CEE _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 1CF1 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 1CF4 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1CF7 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 1CFC _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 1D00 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1D04 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1D07 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1D0B _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1D0F _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D12 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D16 _ 89. 04 24
        call    sheet_refresh                           ; 1D19 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D1E _ E9, 000000A3

?_097:  cmp     dword [ebp+1CH], 11                     ; 1D23 _ 83. 7D, 1C, 0B
        jnz     ?_098                                   ; 1D27 _ 75, 25
        mov     eax, dword [ebp+18H]                    ; 1D29 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1D2C _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 1D2F _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 1D32 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 1D34 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 1D37 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 1D3A _ 0F AF. 45, 08
        mov     ecx, eax                                ; 1D3E _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 1D40 _ 8B. 45, 0C
        add     eax, ecx                                ; 1D43 _ 01. C8
        add     edx, eax                                ; 1D45 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 1D47 _ 8B. 45, 24
        mov     byte [edx], al                          ; 1D4A _ 88. 02
        jmp     ?_100                                   ; 1D4C _ EB, 78

?_098:  cmp     dword [ebp+1CH], 12                     ; 1D4E _ 83. 7D, 1C, 0C
        jnz     ?_099                                   ; 1D52 _ 75, 38
        mov     eax, dword [ebp+18H]                    ; 1D54 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1D57 _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 1D5A _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1D5D _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 1D62 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 1D65 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 1D69 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 1D6C _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1D70 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1D73 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1D77 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1D7B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1D7E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D82 _ 89. 04 24
        call    sheet_refresh                           ; 1D85 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D8A _ EB, 3A

?_099:  cmp     dword [ebp+1CH], 13                     ; 1D8C _ 83. 7D, 1C, 0D
        jnz     ?_100                                   ; 1D90 _ 75, 34
        mov     eax, dword [ebp+18H]                    ; 1D92 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1D95 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1D98 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 1D9B _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 1D9E _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 1DA2 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 1DA5 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 1DA9 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 1DAC _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 1DB0 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 1DB3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1DB7 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 1DBB _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1DBE _ 89. 04 24
        call    api_linewin                             ; 1DC1 _ E8, FFFFFFFC(rel)
?_100:  mov     eax, 0                                  ; 1DC6 _ B8, 00000000
?_101:  add     esp, 48                                 ; 1DCB _ 83. C4, 30
        pop     ebx                                     ; 1DCE _ 5B
        pop     esi                                     ; 1DCF _ 5E
        pop     ebp                                     ; 1DD0 _ 5D
        ret                                             ; 1DD1 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1DD2 _ 55
        mov     ebp, esp                                ; 1DD3 _ 89. E5
        push    ebx                                     ; 1DD5 _ 53
        sub     esp, 36                                 ; 1DD6 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1DD9 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1DDC _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1DDF _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1DE2 _ 88. 45, F0
        mov     ebx, dword [?_344]                      ; 1DE5 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_343]                      ; 1DEB _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1DF1 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1DF7 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1DFC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1E04 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1E08 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E0C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E10 _ 89. 04 24
        call    set_cursor                              ; 1E13 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 1E18 _ 0F B6. 45, F4
        mov     byte [?_346], al                        ; 1E1C _ A2, 00000018(d)
        mov     byte [?_347], 0                         ; 1E21 _ C6. 05, 00000019(d), 00
        mov     ebx, dword [?_344]                      ; 1E28 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_343]                      ; 1E2E _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1E34 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1E3A _ A1, 00000264(d)
        mov     dword [esp+14H], ?_346                  ; 1E3F _ C7. 44 24, 14, 00000018(d)
        mov     dword [esp+10H], 7                      ; 1E47 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1E4F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1E53 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E57 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E5B _ 89. 04 24
        call    showString                              ; 1E5E _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_343]                      ; 1E63 _ A1, 0000000C(d)
        add     eax, 8                                  ; 1E68 _ 83. C0, 08
        mov     dword [?_343], eax                      ; 1E6B _ A3, 0000000C(d)
        add     esp, 36                                 ; 1E70 _ 83. C4, 24
        pop     ebx                                     ; 1E73 _ 5B
        pop     ebp                                     ; 1E74 _ 5D
        ret                                             ; 1E75 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 1E76 _ 55
        mov     ebp, esp                                ; 1E77 _ 89. E5
        push    ebx                                     ; 1E79 _ 53
        sub     esp, 52                                 ; 1E7A _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 1E7D _ 81. 7D, 08, 0000008B
        jg      ?_102                                   ; 1E84 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1E86 _ 83. 45, 08, 10
        jmp     ?_111                                   ; 1E8A _ E9, 000000DF

?_102:  mov     dword [ebp-10H], 28                     ; 1E8F _ C7. 45, F0, 0000001C
        jmp     ?_106                                   ; 1E96 _ EB, 52

?_103:  mov     dword [ebp-0CH], 8                      ; 1E98 _ C7. 45, F4, 00000008
        jmp     ?_105                                   ; 1E9F _ EB, 3C

?_104:  mov     eax, dword [ebp+0CH]                    ; 1EA1 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1EA4 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1EA6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EA9 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1EAC _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1EB0 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1EB2 _ 8B. 45, F4
        add     eax, ecx                                ; 1EB5 _ 01. C8
        add     edx, eax                                ; 1EB7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1EB9 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 1EBC _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 1EBE _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 1EC1 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 1EC4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EC7 _ 8B. 40, 04
        imul    ebx, eax                                ; 1ECA _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 1ECD _ 8B. 45, F4
        add     eax, ebx                                ; 1ED0 _ 01. D8
        add     eax, ecx                                ; 1ED2 _ 01. C8
        movzx   eax, byte [eax]                         ; 1ED4 _ 0F B6. 00
        mov     byte [edx], al                          ; 1ED7 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1ED9 _ 83. 45, F4, 01
?_105:  cmp     dword [ebp-0CH], 247                    ; 1EDD _ 81. 7D, F4, 000000F7
        jle     ?_104                                   ; 1EE4 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 1EE6 _ 83. 45, F0, 01
?_106:  cmp     dword [ebp-10H], 139                    ; 1EEA _ 81. 7D, F0, 0000008B
        jle     ?_103                                   ; 1EF1 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 1EF3 _ C7. 45, F0, 0000008C
        jmp     ?_110                                   ; 1EFA _ EB, 35

?_107:  mov     dword [ebp-0CH], 8                      ; 1EFC _ C7. 45, F4, 00000008
        jmp     ?_109                                   ; 1F03 _ EB, 1F

?_108:  mov     eax, dword [ebp+0CH]                    ; 1F05 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1F08 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1F0A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F0D _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1F10 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1F14 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1F16 _ 8B. 45, F4
        add     eax, ecx                                ; 1F19 _ 01. C8
        add     eax, edx                                ; 1F1B _ 01. D0
        mov     byte [eax], 0                           ; 1F1D _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1F20 _ 83. 45, F4, 01
?_109:  cmp     dword [ebp-0CH], 247                    ; 1F24 _ 81. 7D, F4, 000000F7
        jle     ?_108                                   ; 1F2B _ 7E, D8
        add     dword [ebp-10H], 1                      ; 1F2D _ 83. 45, F0, 01
?_110:  cmp     dword [ebp-10H], 155                    ; 1F31 _ 81. 7D, F0, 0000009B
        jle     ?_107                                   ; 1F38 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 1F3A _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 1F3F _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1F47 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1F4F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1F57 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1F5F _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1F62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F66 _ 89. 04 24
        call    sheet_refresh                           ; 1F69 _ E8, FFFFFFFC(rel)
?_111:  mov     eax, dword [shtctl]                     ; 1F6E _ A1, 00000264(d)
        mov     dword [esp+14H], ?_326                  ; 1F73 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1F7B _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 1F83 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1F86 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 1F8A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1F92 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1F95 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F99 _ 89. 04 24
        call    showString                              ; 1F9C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1FA1 _ 8B. 45, 08
        add     esp, 52                                 ; 1FA4 _ 83. C4, 34
        pop     ebx                                     ; 1FA7 _ 5B
        pop     ebp                                     ; 1FA8 _ 5D
        ret                                             ; 1FA9 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 1FAA _ 55
        mov     ebp, esp                                ; 1FAB _ 89. E5
        push    ebx                                     ; 1FAD _ 53
        sub     esp, 36                                 ; 1FAE _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 1FB1 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 1FB4 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1FB7 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1FBA _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 1FBD _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 1FC1 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 1FC5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1FCD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 1FD5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1FDD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FE0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FE4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FE7 _ 89. 04 24
        call    boxfill8                                ; 1FEA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1FEF _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1FF2 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1FF5 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1FF8 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1FFB _ 8B. 45, 10
        sub     eax, 28                                 ; 1FFE _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2001 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2005 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2009 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 200D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2015 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 201D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2020 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2024 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2027 _ 89. 04 24
        call    boxfill8                                ; 202A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 202F _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2032 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2035 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2038 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 203B _ 8B. 45, 10
        sub     eax, 27                                 ; 203E _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2041 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2045 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2049 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 204D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2055 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 205D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2060 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2064 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2067 _ 89. 04 24
        call    boxfill8                                ; 206A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 206F _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2072 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2075 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2078 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 207B _ 8B. 45, 10
        sub     eax, 26                                 ; 207E _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2081 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2085 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2089 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 208D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2095 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 209D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 20A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20A7 _ 89. 04 24
        call    boxfill8                                ; 20AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 20AF _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 20B2 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 20B5 _ 8B. 45, 10
        sub     eax, 24                                 ; 20B8 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 20BB _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 20BF _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 20C7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 20CB _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 20D3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 20DB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 20DE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20E2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20E5 _ 89. 04 24
        call    boxfill8                                ; 20E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 20ED _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 20F0 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 20F3 _ 8B. 45, 10
        sub     eax, 24                                 ; 20F6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 20F9 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 20FD _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2105 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2109 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2111 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2119 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 211C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2120 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2123 _ 89. 04 24
        call    boxfill8                                ; 2126 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 212B _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 212E _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2131 _ 8B. 45, 10
        sub     eax, 4                                  ; 2134 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2137 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 213B _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2143 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2147 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 214F _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2157 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 215A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 215E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2161 _ 89. 04 24
        call    boxfill8                                ; 2164 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2169 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 216C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 216F _ 8B. 45, 10
        sub     eax, 23                                 ; 2172 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2175 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2179 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2181 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2185 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 218D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2195 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2198 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 219C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 219F _ 89. 04 24
        call    boxfill8                                ; 21A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21A7 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 21AA _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 21AD _ 8B. 45, 10
        sub     eax, 3                                  ; 21B0 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 21B3 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 21B7 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 21BF _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 21C3 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 21CB _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 21D3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 21D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21DD _ 89. 04 24
        call    boxfill8                                ; 21E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21E5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 21E8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 21EB _ 8B. 45, 10
        sub     eax, 24                                 ; 21EE _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 21F1 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 21F5 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 21FD _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2201 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2209 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2211 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2214 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2218 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 221B _ 89. 04 24
        call    boxfill8                                ; 221E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2223 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2226 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2229 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 222C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 222F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2232 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2235 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2238 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 223B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 223F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2243 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2247 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 224B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2253 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2256 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 225A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 225D _ 89. 04 24
        call    boxfill8                                ; 2260 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2265 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2268 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 226B _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 226E _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2271 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2274 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2277 _ 8B. 45, 0C
        sub     eax, 47                                 ; 227A _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 227D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2281 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2285 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2289 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 228D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2295 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2298 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 229C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 229F _ 89. 04 24
        call    boxfill8                                ; 22A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22A7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 22AA _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 22AD _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 22B0 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 22B3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 22B6 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 22B9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 22BC _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 22BF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 22C3 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 22C7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 22CB _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 22CF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 22D7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 22DA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22E1 _ 89. 04 24
        call    boxfill8                                ; 22E4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22E9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 22EC _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 22EF _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 22F2 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 22F5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 22F8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 22FB _ 8B. 45, 0C
        sub     eax, 3                                  ; 22FE _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2301 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2305 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2309 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 230D _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2311 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2319 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 231C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2320 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2323 _ 89. 04 24
        call    boxfill8                                ; 2326 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 232B _ 83. C4, 24
        pop     ebx                                     ; 232E _ 5B
        pop     ebp                                     ; 232F _ 5D
        ret                                             ; 2330 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2331 _ 55
        mov     ebp, esp                                ; 2332 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2334 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2337 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 233A _ A1, 00000134(d)
        add     eax, edx                                ; 233F _ 01. D0
        mov     dword [mx], eax                         ; 2341 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2346 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2349 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 234C _ A1, 00000138(d)
        add     eax, edx                                ; 2351 _ 01. D0
        mov     dword [my], eax                         ; 2353 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2358 _ A1, 00000134(d)
        test    eax, eax                                ; 235D _ 85. C0
        jns     ?_112                                   ; 235F _ 79, 0A
        mov     dword [mx], 0                           ; 2361 _ C7. 05, 00000134(d), 00000000
?_112:  mov     eax, dword [my]                         ; 236B _ A1, 00000138(d)
        test    eax, eax                                ; 2370 _ 85. C0
        jns     ?_113                                   ; 2372 _ 79, 0A
        mov     dword [my], 0                           ; 2374 _ C7. 05, 00000138(d), 00000000
?_113:  mov     eax, dword [xsize]                      ; 237E _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2383 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2386 _ A1, 00000134(d)
        cmp     edx, eax                                ; 238B _ 39. C2
        jge     ?_114                                   ; 238D _ 7D, 0D
        mov     eax, dword [xsize]                      ; 238F _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2394 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2397 _ A3, 00000134(d)
?_114:  mov     eax, dword [ysize]                      ; 239C _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 23A1 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 23A4 _ A1, 00000138(d)
        cmp     edx, eax                                ; 23A9 _ 39. C2
        jge     ?_115                                   ; 23AB _ 7D, 0D
        mov     eax, dword [ysize]                      ; 23AD _ A1, 00000140(d)
        sub     eax, 1                                  ; 23B2 _ 83. E8, 01
        mov     dword [my], eax                         ; 23B5 _ A3, 00000138(d)
?_115:  pop     ebp                                     ; 23BA _ 5D
        ret                                             ; 23BB _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 23BC _ 55
        mov     ebp, esp                                ; 23BD _ 89. E5
        sub     esp, 40                                 ; 23BF _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 23C2 _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 23C7 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 23CA _ C6. 45, F3, 00
        call    io_sti                                  ; 23CE _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 23D3 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 23DA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 23DF _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 23E2 _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 23E6 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 23EA _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 23F1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 23F6 _ 85. C0
        jz      ?_116                                   ; 23F8 _ 74, 77
        mov     dword [esp+8H], mdec                    ; 23FA _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 2402 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2405 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2409 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 240C _ 89. 04 24
        call    computeMousePosition                    ; 240F _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2414 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 241A _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 241F _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2423 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2427 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 242A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 242E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2431 _ 89. 04 24
        call    sheet_slide                             ; 2434 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_351]                      ; 2439 _ A1, 0000010C(d)
        and     eax, 01H                                ; 243E _ 83. E0, 01
        test    eax, eax                                ; 2441 _ 85. C0
        jz      ?_116                                   ; 2443 _ 74, 2C
        mov     eax, dword [my]                         ; 2445 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 244A _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 244D _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 2452 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 2455 _ A1, 00000260(d)
        mov     dword [esp+0CH], ecx                    ; 245A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 245E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2462 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2466 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2469 _ 89. 04 24
        call    sheet_slide                             ; 246C _ E8, FFFFFFFC(rel)
?_116:  leave                                           ; 2471 _ C9
        ret                                             ; 2472 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2473 _ 55
        mov     ebp, esp                                ; 2474 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2476 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 2479 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 247F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 2482 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 2488 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 248B _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 2491 _ 5D
        ret                                             ; 2492 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 2493 _ 55
        mov     ebp, esp                                ; 2494 _ 89. E5
        push    ebx                                     ; 2496 _ 53
        sub     esp, 52                                 ; 2497 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 249A _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 249D _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 24A0 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 24A3 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 24A6 _ C7. 45, F0, 00000000
        jmp     ?_118                                   ; 24AD _ EB, 4B

?_117:  mov     eax, dword [ebp+1CH]                    ; 24AF _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 24B2 _ 0F B6. 00
        movzx   eax, al                                 ; 24B5 _ 0F B6. C0
        shl     eax, 4                                  ; 24B8 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 24BB _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 24C1 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 24C5 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 24C8 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 24CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 24CE _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 24D0 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 24D4 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 24D8 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 24DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 24DF _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 24E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 24E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24EA _ 89. 04 24
        call    showFont8                               ; 24ED _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 24F2 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 24F6 _ 83. 45, 1C, 01
?_118:  mov     eax, dword [ebp+1CH]                    ; 24FA _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 24FD _ 0F B6. 00
        test    al, al                                  ; 2500 _ 84. C0
        jnz     ?_117                                   ; 2502 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2504 _ 8B. 45, 14
        add     eax, 16                                 ; 2507 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 250A _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 250E _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2511 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2515 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2518 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 251C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 251F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2523 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2526 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 252A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 252D _ 89. 04 24
        call    sheet_refresh                           ; 2530 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2535 _ 83. C4, 34
        pop     ebx                                     ; 2538 _ 5B
        pop     ebp                                     ; 2539 _ 5D
        ret                                             ; 253A _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 253B _ 55
        mov     ebp, esp                                ; 253C _ 89. E5
        sub     esp, 24                                 ; 253E _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.2026          ; 2541 _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 2549 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 2551 _ C7. 04 24, 00000000
        call    set_palette                             ; 2558 _ E8, FFFFFFFC(rel)
        nop                                             ; 255D _ 90
        leave                                           ; 255E _ C9
        ret                                             ; 255F _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 2560 _ 55
        mov     ebp, esp                                ; 2561 _ 89. E5
        sub     esp, 40                                 ; 2563 _ 83. EC, 28
        call    io_load_eflags                          ; 2566 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 256B _ 89. 45, F0
        call    io_cli                                  ; 256E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2573 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 2576 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 257A _ C7. 04 24, 000003C8
        call    io_out8                                 ; 2581 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2586 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 2589 _ 89. 45, F4
        jmp     ?_120                                   ; 258C _ EB, 62

?_119:  mov     eax, dword [ebp+10H]                    ; 258E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 2591 _ 0F B6. 00
        shr     al, 2                                   ; 2594 _ C0. E8, 02
        movzx   eax, al                                 ; 2597 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 259A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 259E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 25A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 25AA _ 8B. 45, 10
        add     eax, 1                                  ; 25AD _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 25B0 _ 0F B6. 00
        shr     al, 2                                   ; 25B3 _ C0. E8, 02
        movzx   eax, al                                 ; 25B6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 25B9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 25BD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 25C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 25C9 _ 8B. 45, 10
        add     eax, 2                                  ; 25CC _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 25CF _ 0F B6. 00
        shr     al, 2                                   ; 25D2 _ C0. E8, 02
        movzx   eax, al                                 ; 25D5 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 25D8 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 25DC _ C7. 04 24, 000003C9
        call    io_out8                                 ; 25E3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 25E8 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 25EC _ 83. 45, F4, 01
?_120:  mov     eax, dword [ebp-0CH]                    ; 25F0 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 25F3 _ 3B. 45, 0C
        jle     ?_119                                   ; 25F6 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 25F8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 25FB _ 89. 04 24
        call    io_store_eflags                         ; 25FE _ E8, FFFFFFFC(rel)
        nop                                             ; 2603 _ 90
        leave                                           ; 2604 _ C9
        ret                                             ; 2605 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2606 _ 55
        mov     ebp, esp                                ; 2607 _ 89. E5
        sub     esp, 20                                 ; 2609 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 260C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 260F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2612 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2615 _ 89. 45, F8
        jmp     ?_124                                   ; 2618 _ EB, 33

?_121:  mov     eax, dword [ebp+14H]                    ; 261A _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 261D _ 89. 45, FC
        jmp     ?_123                                   ; 2620 _ EB, 1F

?_122:  mov     eax, dword [ebp-8H]                     ; 2622 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2625 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2629 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 262B _ 8B. 45, FC
        add     eax, edx                                ; 262E _ 01. D0
        mov     edx, eax                                ; 2630 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2632 _ 8B. 45, 08
        add     edx, eax                                ; 2635 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2637 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 263B _ 88. 02
        add     dword [ebp-4H], 1                       ; 263D _ 83. 45, FC, 01
?_123:  mov     eax, dword [ebp-4H]                     ; 2641 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2644 _ 3B. 45, 1C
        jle     ?_122                                   ; 2647 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2649 _ 83. 45, F8, 01
?_124:  mov     eax, dword [ebp-8H]                     ; 264D _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2650 _ 3B. 45, 20
        jle     ?_121                                   ; 2653 _ 7E, C5
        leave                                           ; 2655 _ C9
        ret                                             ; 2656 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 2657 _ 55
        mov     ebp, esp                                ; 2658 _ 89. E5
        sub     esp, 20                                 ; 265A _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 265D _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 2660 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2663 _ C7. 45, FC, 00000000
        jmp     ?_134                                   ; 266A _ E9, 0000016C

?_125:  mov     edx, dword [ebp-4H]                     ; 266F _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 2672 _ 8B. 45, 1C
        add     eax, edx                                ; 2675 _ 01. D0
        movzx   eax, byte [eax]                         ; 2677 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 267A _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 267D _ 80. 7D, FB, 00
        jns     ?_126                                   ; 2681 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 2683 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2686 _ 8B. 55, 14
        add     eax, edx                                ; 2689 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 268B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 268F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2691 _ 8B. 45, 10
        add     eax, edx                                ; 2694 _ 01. D0
        mov     edx, eax                                ; 2696 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2698 _ 8B. 45, 08
        add     edx, eax                                ; 269B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 269D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 26A1 _ 88. 02
?_126:  movsx   eax, byte [ebp-5H]                      ; 26A3 _ 0F BE. 45, FB
        and     eax, 40H                                ; 26A7 _ 83. E0, 40
        test    eax, eax                                ; 26AA _ 85. C0
        jz      ?_127                                   ; 26AC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 26AE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 26B1 _ 8B. 55, 14
        add     eax, edx                                ; 26B4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 26B6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 26BA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 26BC _ 8B. 45, 10
        add     eax, edx                                ; 26BF _ 01. D0
        lea     edx, [eax+1H]                           ; 26C1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 26C4 _ 8B. 45, 08
        add     edx, eax                                ; 26C7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 26C9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 26CD _ 88. 02
?_127:  movsx   eax, byte [ebp-5H]                      ; 26CF _ 0F BE. 45, FB
        and     eax, 20H                                ; 26D3 _ 83. E0, 20
        test    eax, eax                                ; 26D6 _ 85. C0
        jz      ?_128                                   ; 26D8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 26DA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 26DD _ 8B. 55, 14
        add     eax, edx                                ; 26E0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 26E2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 26E6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 26E8 _ 8B. 45, 10
        add     eax, edx                                ; 26EB _ 01. D0
        lea     edx, [eax+2H]                           ; 26ED _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 26F0 _ 8B. 45, 08
        add     edx, eax                                ; 26F3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 26F5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 26F9 _ 88. 02
?_128:  movsx   eax, byte [ebp-5H]                      ; 26FB _ 0F BE. 45, FB
        and     eax, 10H                                ; 26FF _ 83. E0, 10
        test    eax, eax                                ; 2702 _ 85. C0
        jz      ?_129                                   ; 2704 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2706 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2709 _ 8B. 55, 14
        add     eax, edx                                ; 270C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 270E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2712 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2714 _ 8B. 45, 10
        add     eax, edx                                ; 2717 _ 01. D0
        lea     edx, [eax+3H]                           ; 2719 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 271C _ 8B. 45, 08
        add     edx, eax                                ; 271F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2721 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2725 _ 88. 02
?_129:  movsx   eax, byte [ebp-5H]                      ; 2727 _ 0F BE. 45, FB
        and     eax, 08H                                ; 272B _ 83. E0, 08
        test    eax, eax                                ; 272E _ 85. C0
        jz      ?_130                                   ; 2730 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2732 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2735 _ 8B. 55, 14
        add     eax, edx                                ; 2738 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 273A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 273E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2740 _ 8B. 45, 10
        add     eax, edx                                ; 2743 _ 01. D0
        lea     edx, [eax+4H]                           ; 2745 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2748 _ 8B. 45, 08
        add     edx, eax                                ; 274B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 274D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2751 _ 88. 02
?_130:  movsx   eax, byte [ebp-5H]                      ; 2753 _ 0F BE. 45, FB
        and     eax, 04H                                ; 2757 _ 83. E0, 04
        test    eax, eax                                ; 275A _ 85. C0
        jz      ?_131                                   ; 275C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 275E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2761 _ 8B. 55, 14
        add     eax, edx                                ; 2764 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2766 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 276A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 276C _ 8B. 45, 10
        add     eax, edx                                ; 276F _ 01. D0
        lea     edx, [eax+5H]                           ; 2771 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 2774 _ 8B. 45, 08
        add     edx, eax                                ; 2777 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2779 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 277D _ 88. 02
?_131:  movsx   eax, byte [ebp-5H]                      ; 277F _ 0F BE. 45, FB
        and     eax, 02H                                ; 2783 _ 83. E0, 02
        test    eax, eax                                ; 2786 _ 85. C0
        jz      ?_132                                   ; 2788 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 278A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 278D _ 8B. 55, 14
        add     eax, edx                                ; 2790 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2792 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2796 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2798 _ 8B. 45, 10
        add     eax, edx                                ; 279B _ 01. D0
        lea     edx, [eax+6H]                           ; 279D _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 27A0 _ 8B. 45, 08
        add     edx, eax                                ; 27A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 27A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 27A9 _ 88. 02
?_132:  movsx   eax, byte [ebp-5H]                      ; 27AB _ 0F BE. 45, FB
        and     eax, 01H                                ; 27AF _ 83. E0, 01
        test    eax, eax                                ; 27B2 _ 85. C0
        jz      ?_133                                   ; 27B4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 27B6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 27B9 _ 8B. 55, 14
        add     eax, edx                                ; 27BC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 27BE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 27C2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 27C4 _ 8B. 45, 10
        add     eax, edx                                ; 27C7 _ 01. D0
        lea     edx, [eax+7H]                           ; 27C9 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 27CC _ 8B. 45, 08
        add     edx, eax                                ; 27CF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 27D1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 27D5 _ 88. 02
?_133:  add     dword [ebp-4H], 1                       ; 27D7 _ 83. 45, FC, 01
?_134:  cmp     dword [ebp-4H], 15                      ; 27DB _ 83. 7D, FC, 0F
        jle     ?_125                                   ; 27DF _ 0F 8E, FFFFFE8A
        leave                                           ; 27E5 _ C9
        ret                                             ; 27E6 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 27E7 _ 55
        mov     ebp, esp                                ; 27E8 _ 89. E5
        sub     esp, 20                                 ; 27EA _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 27ED _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 27F0 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 27F3 _ C7. 45, F8, 00000000
        jmp     ?_141                                   ; 27FA _ E9, 000000B1

?_135:  mov     dword [ebp-4H], 0                       ; 27FF _ C7. 45, FC, 00000000
        jmp     ?_140                                   ; 2806 _ E9, 00000097

?_136:  mov     eax, dword [ebp-8H]                     ; 280B _ 8B. 45, F8
        shl     eax, 4                                  ; 280E _ C1. E0, 04
        mov     edx, eax                                ; 2811 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2813 _ 8B. 45, FC
        add     eax, edx                                ; 2816 _ 01. D0
        add     eax, cursor.2073                        ; 2818 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 281D _ 0F B6. 00
        cmp     al, 42                                  ; 2820 _ 3C, 2A
        jnz     ?_137                                   ; 2822 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2824 _ 8B. 45, F8
        shl     eax, 4                                  ; 2827 _ C1. E0, 04
        mov     edx, eax                                ; 282A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 282C _ 8B. 45, FC
        add     eax, edx                                ; 282F _ 01. D0
        mov     edx, eax                                ; 2831 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2833 _ 8B. 45, 08
        add     eax, edx                                ; 2836 _ 01. D0
        mov     byte [eax], 0                           ; 2838 _ C6. 00, 00
?_137:  mov     eax, dword [ebp-8H]                     ; 283B _ 8B. 45, F8
        shl     eax, 4                                  ; 283E _ C1. E0, 04
        mov     edx, eax                                ; 2841 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2843 _ 8B. 45, FC
        add     eax, edx                                ; 2846 _ 01. D0
        add     eax, cursor.2073                        ; 2848 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 284D _ 0F B6. 00
        cmp     al, 79                                  ; 2850 _ 3C, 4F
        jnz     ?_138                                   ; 2852 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2854 _ 8B. 45, F8
        shl     eax, 4                                  ; 2857 _ C1. E0, 04
        mov     edx, eax                                ; 285A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 285C _ 8B. 45, FC
        add     eax, edx                                ; 285F _ 01. D0
        mov     edx, eax                                ; 2861 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2863 _ 8B. 45, 08
        add     eax, edx                                ; 2866 _ 01. D0
        mov     byte [eax], 7                           ; 2868 _ C6. 00, 07
?_138:  mov     eax, dword [ebp-8H]                     ; 286B _ 8B. 45, F8
        shl     eax, 4                                  ; 286E _ C1. E0, 04
        mov     edx, eax                                ; 2871 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2873 _ 8B. 45, FC
        add     eax, edx                                ; 2876 _ 01. D0
        add     eax, cursor.2073                        ; 2878 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 287D _ 0F B6. 00
        cmp     al, 46                                  ; 2880 _ 3C, 2E
        jnz     ?_139                                   ; 2882 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 2884 _ 8B. 45, F8
        shl     eax, 4                                  ; 2887 _ C1. E0, 04
        mov     edx, eax                                ; 288A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 288C _ 8B. 45, FC
        add     eax, edx                                ; 288F _ 01. D0
        mov     edx, eax                                ; 2891 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2893 _ 8B. 45, 08
        add     edx, eax                                ; 2896 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2898 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 289C _ 88. 02
?_139:  add     dword [ebp-4H], 1                       ; 289E _ 83. 45, FC, 01
?_140:  cmp     dword [ebp-4H], 15                      ; 28A2 _ 83. 7D, FC, 0F
        jle     ?_136                                   ; 28A6 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 28AC _ 83. 45, F8, 01
?_141:  cmp     dword [ebp-8H], 15                      ; 28B0 _ 83. 7D, F8, 0F
        jle     ?_135                                   ; 28B4 _ 0F 8E, FFFFFF45
        leave                                           ; 28BA _ C9
        ret                                             ; 28BB _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 28BC _ 55
        mov     ebp, esp                                ; 28BD _ 89. E5
        sub     esp, 16                                 ; 28BF _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 28C2 _ C7. 45, F8, 00000000
        jmp     ?_145                                   ; 28C9 _ EB, 50

?_142:  mov     dword [ebp-4H], 0                       ; 28CB _ C7. 45, FC, 00000000
        jmp     ?_144                                   ; 28D2 _ EB, 3B

?_143:  mov     eax, dword [ebp-8H]                     ; 28D4 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 28D7 _ 8B. 55, 1C
        add     eax, edx                                ; 28DA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 28DC _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 28E0 _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 28E3 _ 8B. 4D, 18
        add     edx, ecx                                ; 28E6 _ 01. CA
        add     eax, edx                                ; 28E8 _ 01. D0
        mov     edx, eax                                ; 28EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28EC _ 8B. 45, 08
        add     edx, eax                                ; 28EF _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 28F1 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 28F4 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 28F8 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 28FA _ 8B. 45, FC
        add     eax, ecx                                ; 28FD _ 01. C8
        mov     ecx, eax                                ; 28FF _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 2901 _ 8B. 45, 20
        add     eax, ecx                                ; 2904 _ 01. C8
        movzx   eax, byte [eax]                         ; 2906 _ 0F B6. 00
        mov     byte [edx], al                          ; 2909 _ 88. 02
        add     dword [ebp-4H], 1                       ; 290B _ 83. 45, FC, 01
?_144:  mov     eax, dword [ebp-4H]                     ; 290F _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 2912 _ 3B. 45, 10
        jl      ?_143                                   ; 2915 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2917 _ 83. 45, F8, 01
?_145:  mov     eax, dword [ebp-8H]                     ; 291B _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 291E _ 3B. 45, 14
        jl      ?_142                                   ; 2921 _ 7C, A8
        leave                                           ; 2923 _ C9
        ret                                             ; 2924 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2925 _ 55
        mov     ebp, esp                                ; 2926 _ 89. E5
        sub     esp, 40                                 ; 2928 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 292B _ A1, 0000001C(d)
        mov     dword [ebp-0CH], eax                    ; 2930 _ 89. 45, F4
        movzx   eax, word [?_348]                       ; 2933 _ 0F B7. 05, 00000020(d)
        cwde                                            ; 293A _ 98
        mov     dword [ebp-10H], eax                    ; 293B _ 89. 45, F0
        movzx   eax, word [?_349]                       ; 293E _ 0F B7. 05, 00000022(d)
        cwde                                            ; 2945 _ 98
        mov     dword [ebp-14H], eax                    ; 2946 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 2949 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2951 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2958 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 295D _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 2961 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2968 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 296D _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 2970 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 2974 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2978 _ C7. 04 24, 00000024(d)
        call    fifo8_put                               ; 297F _ E8, FFFFFFFC(rel)
        nop                                             ; 2984 _ 90
        leave                                           ; 2985 _ C9
        ret                                             ; 2986 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2987 _ 55
        mov     ebp, esp                                ; 2988 _ 89. E5
        sub     esp, 4                                  ; 298A _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 298D _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2990 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2993 _ 80. 7D, FC, 09
        jle     ?_146                                   ; 2997 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2999 _ 0F B6. 45, FC
        add     eax, 55                                 ; 299D _ 83. C0, 37
        jmp     ?_147                                   ; 29A0 _ EB, 07

?_146:  movzx   eax, byte [ebp-4H]                      ; 29A2 _ 0F B6. 45, FC
        add     eax, 48                                 ; 29A6 _ 83. C0, 30
?_147:  leave                                           ; 29A9 _ C9
        ret                                             ; 29AA _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 29AB _ 55
        mov     ebp, esp                                ; 29AC _ 89. E5
        sub     esp, 24                                 ; 29AE _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 29B1 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 29B4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 29B7 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 29BE _ 0F B6. 45, EC
        and     eax, 0FH                                ; 29C2 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 29C5 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 29C8 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 29CC _ 89. 04 24
        call    charToHexVal                            ; 29CF _ E8, FFFFFFFC(rel)
        mov     byte [?_342], al                        ; 29D4 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 29D9 _ 0F B6. 45, EC
        shr     al, 4                                   ; 29DD _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 29E0 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 29E3 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 29E7 _ 0F BE. C0
        mov     dword [esp], eax                        ; 29EA _ 89. 04 24
        call    charToHexVal                            ; 29ED _ E8, FFFFFFFC(rel)
        mov     byte [?_341], al                        ; 29F2 _ A2, 00000112(d)
        mov     eax, keyval                             ; 29F7 _ B8, 00000110(d)
        leave                                           ; 29FC _ C9
        ret                                             ; 29FD _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 29FE _ 55
        mov     ebp, esp                                ; 29FF _ 89. E5
        sub     esp, 16                                 ; 2A01 _ 83. EC, 10
        mov     byte [str.2121], 48                     ; 2A04 _ C6. 05, 00000394(d), 30
        mov     byte [?_354], 88                        ; 2A0B _ C6. 05, 00000395(d), 58
        mov     byte [?_355], 0                         ; 2A12 _ C6. 05, 0000039E(d), 00
        mov     dword [ebp-4H], 2                       ; 2A19 _ C7. 45, FC, 00000002
        jmp     ?_149                                   ; 2A20 _ EB, 0F

?_148:  mov     eax, dword [ebp-4H]                     ; 2A22 _ 8B. 45, FC
        add     eax, str.2121                           ; 2A25 _ 05, 00000394(d)
        mov     byte [eax], 48                          ; 2A2A _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 2A2D _ 83. 45, FC, 01
?_149:  cmp     dword [ebp-4H], 9                       ; 2A31 _ 83. 7D, FC, 09
        jle     ?_148                                   ; 2A35 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2A37 _ C7. 45, F8, 00000009
        jmp     ?_153                                   ; 2A3E _ EB, 40

?_150:  mov     eax, dword [ebp+8H]                     ; 2A40 _ 8B. 45, 08
        and     eax, 0FH                                ; 2A43 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2A46 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2A49 _ 8B. 45, 08
        shr     eax, 4                                  ; 2A4C _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2A4F _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 2A52 _ 83. 7D, F4, 09
        jle     ?_151                                   ; 2A56 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 2A58 _ 8B. 45, F4
        add     eax, 55                                 ; 2A5B _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2A5E _ 8B. 55, F8
        add     edx, str.2121                           ; 2A61 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 2A67 _ 88. 02
        jmp     ?_152                                   ; 2A69 _ EB, 11

?_151:  mov     eax, dword [ebp-0CH]                    ; 2A6B _ 8B. 45, F4
        add     eax, 48                                 ; 2A6E _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2A71 _ 8B. 55, F8
        add     edx, str.2121                           ; 2A74 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 2A7A _ 88. 02
?_152:  sub     dword [ebp-8H], 1                       ; 2A7C _ 83. 6D, F8, 01
?_153:  cmp     dword [ebp-8H], 1                       ; 2A80 _ 83. 7D, F8, 01
        jle     ?_154                                   ; 2A84 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2A86 _ 83. 7D, 08, 00
        jnz     ?_150                                   ; 2A8A _ 75, B4
?_154:  mov     eax, str.2121                           ; 2A8C _ B8, 00000394(d)
        leave                                           ; 2A91 _ C9
        ret                                             ; 2A92 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2A93 _ 55
        mov     ebp, esp                                ; 2A94 _ 89. E5
        sub     esp, 24                                 ; 2A96 _ 83. EC, 18
?_155:  mov     dword [esp], 100                        ; 2A99 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2AA0 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2AA5 _ 83. E0, 02
        test    eax, eax                                ; 2AA8 _ 85. C0
        jnz     ?_156                                   ; 2AAA _ 75, 02
        jmp     ?_157                                   ; 2AAC _ EB, 02

?_156:  jmp     ?_155                                   ; 2AAE _ EB, E9

?_157:  leave                                           ; 2AB0 _ C9
        ret                                             ; 2AB1 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2AB2 _ 55
        mov     ebp, esp                                ; 2AB3 _ 89. E5
        sub     esp, 24                                 ; 2AB5 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2AB8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2ABD _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2AC5 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2ACC _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2AD1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2AD6 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2ADE _ C7. 04 24, 00000060
        call    io_out8                                 ; 2AE5 _ E8, FFFFFFFC(rel)
        nop                                             ; 2AEA _ 90
        leave                                           ; 2AEB _ C9
        ret                                             ; 2AEC _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2AED _ 55
        mov     ebp, esp                                ; 2AEE _ 89. E5
        sub     esp, 24                                 ; 2AF0 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2AF3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2AF8 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2B00 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2B07 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2B0C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2B11 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2B19 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2B20 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2B25 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2B28 _ C6. 40, 03, 00
        nop                                             ; 2B2C _ 90
        leave                                           ; 2B2D _ C9
        ret                                             ; 2B2E _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 2B2F _ 55
        mov     ebp, esp                                ; 2B30 _ 89. E5
        sub     esp, 40                                 ; 2B32 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2B35 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2B3D _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2B44 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2B49 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2B51 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2B58 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2B5D _ C7. 04 24, 00000060
        call    io_in8                                  ; 2B64 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2B69 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2B6C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2B70 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2B74 _ C7. 04 24, 00000040(d)
        call    fifo8_put                               ; 2B7B _ E8, FFFFFFFC(rel)
        leave                                           ; 2B80 _ C9
        ret                                             ; 2B81 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2B82 _ 55
        mov     ebp, esp                                ; 2B83 _ 89. E5
        sub     esp, 4                                  ; 2B85 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2B88 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2B8B _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B8E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2B91 _ 0F B6. 40, 03
        test    al, al                                  ; 2B95 _ 84. C0
        jnz     ?_159                                   ; 2B97 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2B99 _ 80. 7D, FC, FA
        jnz     ?_158                                   ; 2B9D _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2B9F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2BA2 _ C6. 40, 03, 01
?_158:  mov     eax, 0                                  ; 2BA6 _ B8, 00000000
        jmp     ?_166                                   ; 2BAB _ E9, 0000010F

?_159:  mov     eax, dword [ebp+8H]                     ; 2BB0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2BB3 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2BB7 _ 3C, 01
        jnz     ?_161                                   ; 2BB9 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2BBB _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2BBF _ 25, 000000C8
        cmp     eax, 8                                  ; 2BC4 _ 83. F8, 08
        jnz     ?_160                                   ; 2BC7 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2BC9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2BCC _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2BD0 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2BD2 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2BD5 _ C6. 40, 03, 02
?_160:  mov     eax, 0                                  ; 2BD9 _ B8, 00000000
        jmp     ?_166                                   ; 2BDE _ E9, 000000DC

?_161:  mov     eax, dword [ebp+8H]                     ; 2BE3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2BE6 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2BEA _ 3C, 02
        jnz     ?_162                                   ; 2BEC _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2BEE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2BF1 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2BF5 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2BF8 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2BFB _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2BFF _ B8, 00000000
        jmp     ?_166                                   ; 2C04 _ E9, 000000B6

?_162:  mov     eax, dword [ebp+8H]                     ; 2C09 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2C0C _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2C10 _ 3C, 03
        jne     ?_165                                   ; 2C12 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2C18 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2C1B _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2C1F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2C22 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2C25 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2C29 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2C2C _ 0F B6. 00
        movzx   eax, al                                 ; 2C2F _ 0F B6. C0
        and     eax, 07H                                ; 2C32 _ 83. E0, 07
        mov     edx, eax                                ; 2C35 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C37 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2C3A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2C3D _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2C40 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2C44 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2C47 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2C4A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C4D _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2C50 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2C54 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2C57 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2C5A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2C5D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2C60 _ 0F B6. 00
        movzx   eax, al                                 ; 2C63 _ 0F B6. C0
        and     eax, 10H                                ; 2C66 _ 83. E0, 10
        test    eax, eax                                ; 2C69 _ 85. C0
        jz      ?_163                                   ; 2C6B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2C6D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C70 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2C73 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2C78 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C7A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2C7D _ 89. 50, 04
?_163:  mov     eax, dword [ebp+8H]                     ; 2C80 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2C83 _ 0F B6. 00
        movzx   eax, al                                 ; 2C86 _ 0F B6. C0
        and     eax, 20H                                ; 2C89 _ 83. E0, 20
        test    eax, eax                                ; 2C8C _ 85. C0
        jz      ?_164                                   ; 2C8E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2C90 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C93 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2C96 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2C9B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C9D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2CA0 _ 89. 50, 08
?_164:  mov     eax, dword [ebp+8H]                     ; 2CA3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CA6 _ 8B. 40, 08
        neg     eax                                     ; 2CA9 _ F7. D8
        mov     edx, eax                                ; 2CAB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2CAD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2CB0 _ 89. 50, 08
        mov     eax, 1                                  ; 2CB3 _ B8, 00000001
        jmp     ?_166                                   ; 2CB8 _ EB, 05

?_165:  mov     eax, 4294967295                         ; 2CBA _ B8, FFFFFFFF
?_166:  leave                                           ; 2CBF _ C9
        ret                                             ; 2CC0 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 2CC1 _ 55
        mov     ebp, esp                                ; 2CC2 _ 89. E5
        sub     esp, 72                                 ; 2CC4 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 2CC7 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 2CCE _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 2CD5 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 2CDC _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 2CE3 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 2CE9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2CEC _ 8B. 00
        mov     dword [esp+8H], edx                     ; 2CEE _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 2CF2 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 2CF5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CF9 _ 89. 04 24
        call    init_screen8                            ; 2CFC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 2D01 _ 8B. 45, 20
        movsx   eax, al                                 ; 2D04 _ 0F BE. C0
        mov     dword [esp+14H], ?_332                  ; 2D07 _ C7. 44 24, 14, 0000004A(d)
        mov     dword [esp+10H], eax                    ; 2D0F _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2D13 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2D16 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2D1A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2D1D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2D21 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D24 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D28 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D2B _ 89. 04 24
        call    showString                              ; 2D2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 2D33 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2D36 _ 89. 04 24
        call    intToHexStr                             ; 2D39 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 2D3E _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 2D41 _ 8B. 45, 20
        movsx   eax, al                                 ; 2D44 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 2D47 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 2D4A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2D4E _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2D52 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2D55 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2D59 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2D5C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2D60 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D6A _ 89. 04 24
        call    showString                              ; 2D6D _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2D72 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2D76 _ 8B. 45, 20
        movsx   eax, al                                 ; 2D79 _ 0F BE. C0
        mov     dword [esp+14H], ?_333                  ; 2D7C _ C7. 44 24, 14, 00000054(d)
        mov     dword [esp+10H], eax                    ; 2D84 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2D88 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2D8B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2D8F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2D92 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2D96 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D99 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D9D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DA0 _ 89. 04 24
        call    showString                              ; 2DA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2DA8 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 2DAB _ 8B. 00
        mov     dword [esp], eax                        ; 2DAD _ 89. 04 24
        call    intToHexStr                             ; 2DB0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2DB5 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 2DB8 _ 8B. 45, 20
        movsx   eax, al                                 ; 2DBB _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 2DBE _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 2DC1 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2DC5 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2DC9 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2DCC _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2DD0 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2DD3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2DD7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2DDA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DDE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DE1 _ 89. 04 24
        call    showString                              ; 2DE4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2DE9 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2DED _ 8B. 45, 20
        movsx   eax, al                                 ; 2DF0 _ 0F BE. C0
        mov     dword [esp+14H], ?_334                  ; 2DF3 _ C7. 44 24, 14, 00000060(d)
        mov     dword [esp+10H], eax                    ; 2DFB _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2DFF _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2E02 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E06 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E09 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E0D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E17 _ 89. 04 24
        call    showString                              ; 2E1A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E1F _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 2E22 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 2E25 _ 89. 04 24
        call    intToHexStr                             ; 2E28 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2E2D _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 2E30 _ 8B. 45, 20
        movsx   eax, al                                 ; 2E33 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 2E36 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 2E39 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2E3D _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2E41 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2E44 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2E48 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2E4B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E4F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E52 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E56 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E59 _ 89. 04 24
        call    showString                              ; 2E5C _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2E61 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2E65 _ 8B. 45, 20
        movsx   eax, al                                 ; 2E68 _ 0F BE. C0
        mov     dword [esp+14H], ?_335                  ; 2E6B _ C7. 44 24, 14, 0000006C(d)
        mov     dword [esp+10H], eax                    ; 2E73 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2E77 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2E7A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E7E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E81 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E85 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E88 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E8C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E8F _ 89. 04 24
        call    showString                              ; 2E92 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E97 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 2E9A _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2E9D _ 89. 04 24
        call    intToHexStr                             ; 2EA0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 2EA5 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 2EA8 _ 8B. 45, 20
        movsx   eax, al                                 ; 2EAB _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 2EAE _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 2EB1 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2EB5 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2EB9 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2EBC _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2EC0 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2EC3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2EC7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2ECA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2ECE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2ED1 _ 89. 04 24
        call    showString                              ; 2ED4 _ E8, FFFFFFFC(rel)
        leave                                           ; 2ED9 _ C9
        ret                                             ; 2EDA _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 2EDB _ 55
        mov     ebp, esp                                ; 2EDC _ 89. E5
        sub     esp, 56                                 ; 2EDE _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 2EE1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EE4 _ 89. 04 24
        call    sheet_alloc                             ; 2EE7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2EEC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2EEF _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 2EF4 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 2EFC _ 89. 04 24
        call    memman_alloc_4k                         ; 2EFF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2F04 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 2F07 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 2F0F _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 2F17 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 2F1F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2F22 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2F26 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2F29 _ 89. 04 24
        call    sheet_setbuf                            ; 2F2C _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 2F31 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 2F39 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2F3C _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 2F40 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2F43 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F47 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F4A _ 89. 04 24
        call    make_window8                            ; 2F4D _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 2F52 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 2F5A _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 2F62 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 2F6A _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2F72 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2F7A _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2F7D _ 89. 04 24
        call    make_textbox8                           ; 2F80 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 2F85 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 2F8D _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 2F95 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2F98 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F9C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F9F _ 89. 04 24
        call    sheet_slide                             ; 2FA2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 2FA7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 2FAF _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2FB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FB9 _ 89. 04 24
        call    sheet_updown                            ; 2FBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2FC1 _ 8B. 45, F4
        leave                                           ; 2FC4 _ C9
        ret                                             ; 2FC5 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 2FC6 _ 55
        mov     ebp, esp                                ; 2FC7 _ 89. E5
        push    ebx                                     ; 2FC9 _ 53
        sub     esp, 52                                 ; 2FCA _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 2FCD _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2FD0 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2FD3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FD6 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2FD9 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2FDC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2FDF _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 2FE2 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 2FE5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2FE8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2FEB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2FEE _ 8B. 00
        mov     dword [esp+18H], 0                      ; 2FF0 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 2FF8 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 2FFC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3004 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 300C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3014 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3017 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 301B _ 89. 04 24
        call    boxfill8                                ; 301E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3023 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3026 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3029 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 302C _ 8B. 00
        mov     dword [esp+18H], 1                      ; 302E _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3036 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 303A _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3042 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 304A _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3052 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3055 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3059 _ 89. 04 24
        call    boxfill8                                ; 305C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3061 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3064 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3067 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 306A _ 8B. 00
        mov     dword [esp+18H], edx                    ; 306C _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 3070 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 3078 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3080 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3088 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3090 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3093 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3097 _ 89. 04 24
        call    boxfill8                                ; 309A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 309F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 30A2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 30A5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 30A8 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 30AA _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 30AE _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 30B6 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 30BE _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 30C6 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 30CE _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 30D1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 30D5 _ 89. 04 24
        call    boxfill8                                ; 30D8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 30DD _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 30E0 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 30E3 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 30E6 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 30E9 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 30EC _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 30EF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 30F2 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 30F4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 30F8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 30FC _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3104 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3108 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3110 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3113 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3117 _ 89. 04 24
        call    boxfill8                                ; 311A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 311F _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3122 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3125 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3128 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 312B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 312E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3131 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3134 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3136 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 313A _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 313E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 3146 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 314A _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3152 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3155 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3159 _ 89. 04 24
        call    boxfill8                                ; 315C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3161 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3164 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3167 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 316A _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 316D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3170 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3172 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 3176 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 317A _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 3182 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 318A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3192 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3195 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3199 _ 89. 04 24
        call    boxfill8                                ; 319C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 31A1 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 31A4 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 31A7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31AA _ 8B. 00
        mov     dword [esp+18H], 20                     ; 31AC _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 31B4 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 31B8 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 31C0 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 31C8 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 31D0 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 31D3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31D7 _ 89. 04 24
        call    boxfill8                                ; 31DA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 31DF _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 31E2 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 31E5 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 31E8 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 31EB _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 31EE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 31F1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31F4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 31F6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 31FA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 31FE _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 3202 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 320A _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3212 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3215 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3219 _ 89. 04 24
        call    boxfill8                                ; 321C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3221 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3224 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3227 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 322A _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 322D _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3230 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3233 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3236 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3238 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 323C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3240 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3244 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 324C _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3254 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3257 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 325B _ 89. 04 24
        call    boxfill8                                ; 325E _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 3263 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 3267 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 326B _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 326E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3272 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3275 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3279 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 327C _ 89. 04 24
        call    make_wtitle8                            ; 327F _ E8, FFFFFFFC(rel)
        nop                                             ; 3284 _ 90
        add     esp, 52                                 ; 3285 _ 83. C4, 34
        pop     ebx                                     ; 3288 _ 5B
        pop     ebp                                     ; 3289 _ 5D
        ret                                             ; 328A _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 328B _ 55
        mov     ebp, esp                                ; 328C _ 89. E5
        push    ebx                                     ; 328E _ 53
        sub     esp, 52                                 ; 328F _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3292 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3295 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3298 _ 80. 7D, E4, 00
        jz      ?_167                                   ; 329C _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 329E _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 32A2 _ C6. 45, ED, 0C
        jmp     ?_168                                   ; 32A6 _ EB, 08

?_167:  mov     byte [ebp-12H], 8                       ; 32A8 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 32AC _ C6. 45, ED, 0F
?_168:  mov     eax, dword [ebp+0CH]                    ; 32B0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 32B3 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 32B6 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 32B9 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 32BD _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 32C0 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 32C3 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 32C6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 32C9 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 32CB _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 32D3 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 32D7 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 32DF _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 32E7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 32EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 32EF _ 89. 04 24
        call    boxfill8                                ; 32F2 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 32F7 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 32FB _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 32FE _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3302 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3306 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 330E _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3316 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3319 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 331D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3320 _ 89. 04 24
        call    showString                              ; 3323 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3328 _ C7. 45, F0, 00000000
        jmp     ?_176                                   ; 332F _ E9, 00000083

?_169:  mov     dword [ebp-0CH], 0                      ; 3334 _ C7. 45, F4, 00000000
        jmp     ?_175                                   ; 333B _ EB, 70

?_170:  mov     eax, dword [ebp-10H]                    ; 333D _ 8B. 45, F0
        shl     eax, 4                                  ; 3340 _ C1. E0, 04
        mov     edx, eax                                ; 3343 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3345 _ 8B. 45, F4
        add     eax, edx                                ; 3348 _ 01. D0
        add     eax, closebtn.2192                      ; 334A _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 334F _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3352 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3355 _ 80. 7D, EF, 40
        jnz     ?_171                                   ; 3359 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 335B _ C6. 45, EF, 00
        jmp     ?_174                                   ; 335F _ EB, 1C

?_171:  cmp     byte [ebp-11H], 36                      ; 3361 _ 80. 7D, EF, 24
        jnz     ?_172                                   ; 3365 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3367 _ C6. 45, EF, 0F
        jmp     ?_174                                   ; 336B _ EB, 10

?_172:  cmp     byte [ebp-11H], 81                      ; 336D _ 80. 7D, EF, 51
        jnz     ?_173                                   ; 3371 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3373 _ C6. 45, EF, 08
        jmp     ?_174                                   ; 3377 _ EB, 04

?_173:  mov     byte [ebp-11H], 7                       ; 3379 _ C6. 45, EF, 07
?_174:  mov     eax, dword [ebp+0CH]                    ; 337D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3380 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3382 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3385 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3388 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 338B _ 8B. 40, 04
        imul    ecx, eax                                ; 338E _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3391 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3394 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3397 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 339A _ 8B. 45, F4
        add     eax, ebx                                ; 339D _ 01. D8
        add     eax, ecx                                ; 339F _ 01. C8
        add     edx, eax                                ; 33A1 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 33A3 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 33A7 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 33A9 _ 83. 45, F4, 01
?_175:  cmp     dword [ebp-0CH], 15                     ; 33AD _ 83. 7D, F4, 0F
        jle     ?_170                                   ; 33B1 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 33B3 _ 83. 45, F0, 01
?_176:  cmp     dword [ebp-10H], 13                     ; 33B7 _ 83. 7D, F0, 0D
        jle     ?_169                                   ; 33BB _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 33C1 _ 83. C4, 34
        pop     ebx                                     ; 33C4 _ 5B
        pop     ebp                                     ; 33C5 _ 5D
        ret                                             ; 33C6 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 33C7 _ 55
        mov     ebp, esp                                ; 33C8 _ 89. E5
        push    edi                                     ; 33CA _ 57
        push    esi                                     ; 33CB _ 56
        push    ebx                                     ; 33CC _ 53
        sub     esp, 44                                 ; 33CD _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 33D0 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 33D3 _ 8B. 55, 0C
        add     eax, edx                                ; 33D6 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 33D8 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 33DB _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 33DE _ 8B. 55, 10
        add     eax, edx                                ; 33E1 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 33E3 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 33E6 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 33E9 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 33EC _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 33EF _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 33F2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 33F5 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 33F8 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 33FB _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 33FE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3401 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3404 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3407 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3409 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 340D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3411 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3415 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3419 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3425 _ 89. 04 24
        call    boxfill8                                ; 3428 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 342D _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3430 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3433 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3436 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3439 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 343C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 343F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3442 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3445 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3448 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 344B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 344E _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3450 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3454 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3458 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 345C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3460 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3468 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 346C _ 89. 04 24
        call    boxfill8                                ; 346F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3474 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3477 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 347A _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 347D _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3480 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3483 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3486 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3489 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 348C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 348F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3492 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3495 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3497 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 349B _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 349F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 34A3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 34A7 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 34AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 34B3 _ 89. 04 24
        call    boxfill8                                ; 34B6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 34BB _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 34BE _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 34C1 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 34C4 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 34C7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 34CA _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 34CD _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 34D0 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 34D3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 34D6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 34D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 34DC _ 8B. 00
        mov     dword [esp+18H], edi                    ; 34DE _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 34E2 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 34E6 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 34EA _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 34EE _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 34F6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 34FA _ 89. 04 24
        call    boxfill8                                ; 34FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3502 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3505 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3508 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 350B _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 350E _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3511 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3514 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3517 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 351A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 351D _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 351F _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3523 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3526 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 352A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 352E _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3532 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 353A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 353E _ 89. 04 24
        call    boxfill8                                ; 3541 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3546 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 3549 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 354C _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 354F _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3552 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3555 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3558 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 355B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 355E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3561 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 3563 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 3566 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 356A _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 356E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3572 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3576 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 357E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3582 _ 89. 04 24
        call    boxfill8                                ; 3585 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 358A _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 358D _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 3590 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3593 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3596 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3599 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 359C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 359F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35A5 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 35A7 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 35AB _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 35AE _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 35B2 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 35B6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 35BA _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 35C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35C6 _ 89. 04 24
        call    boxfill8                                ; 35C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 35CE _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 35D1 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 35D4 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 35D7 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 35DA _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 35DD _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 35E0 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 35E3 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 35E6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 35E9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35EF _ 8B. 00
        mov     dword [esp+18H], edi                    ; 35F1 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 35F5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 35F9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 35FD _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 3601 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3609 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 360D _ 89. 04 24
        call    boxfill8                                ; 3610 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3615 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3618 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 361B _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 361E _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 3621 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3624 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3627 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 362A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 362D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3630 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 3632 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3635 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3639 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 363C _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 3640 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3644 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 3648 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 364C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3650 _ 89. 04 24
        call    boxfill8                                ; 3653 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 3658 _ 83. C4, 2C
        pop     ebx                                     ; 365B _ 5B
        pop     esi                                     ; 365C _ 5E
        pop     edi                                     ; 365D _ 5F
        pop     ebp                                     ; 365E _ 5D
        ret                                             ; 365F _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 3660 _ 55
        mov     ebp, esp                                ; 3661 _ 89. E5
        sub     esp, 56                                 ; 3663 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 3666 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 366D _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 3672 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 367A _ 89. 04 24
        call    memman_alloc                            ; 367D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3682 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3685 _ 8B. 45, E4
        add     eax, 12                                 ; 3688 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 368B _ C6. 00, 00
        jmp     ?_187                                   ; 368E _ E9, 0000011E

?_177:  mov     dword [ebp-10H], 0                      ; 3693 _ C7. 45, F0, 00000000
        jmp     ?_180                                   ; 369A _ EB, 2C

?_178:  mov     edx, dword [ebp-0CH]                    ; 369C _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 369F _ 8B. 45, F0
        add     eax, edx                                ; 36A2 _ 01. D0
        movzx   eax, byte [eax]                         ; 36A4 _ 0F B6. 00
        test    al, al                                  ; 36A7 _ 84. C0
        jz      ?_179                                   ; 36A9 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 36AB _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 36AE _ 8B. 45, E4
        add     edx, eax                                ; 36B1 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 36B3 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 36B6 _ 8B. 45, F0
        add     eax, ecx                                ; 36B9 _ 01. C8
        movzx   eax, byte [eax]                         ; 36BB _ 0F B6. 00
        mov     byte [edx], al                          ; 36BE _ 88. 02
        add     dword [ebp-10H], 1                      ; 36C0 _ 83. 45, F0, 01
        jmp     ?_180                                   ; 36C4 _ EB, 02

?_179:  jmp     ?_181                                   ; 36C6 _ EB, 06

?_180:  cmp     dword [ebp-10H], 7                      ; 36C8 _ 83. 7D, F0, 07
        jle     ?_178                                   ; 36CC _ 7E, CE
?_181:  mov     dword [ebp-14H], 0                      ; 36CE _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 36D5 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 36D8 _ 8B. 45, E4
        add     eax, edx                                ; 36DB _ 01. D0
        mov     byte [eax], 46                          ; 36DD _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 36E0 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 36E4 _ C7. 45, EC, 00000000
        jmp     ?_183                                   ; 36EB _ EB, 1E

?_182:  mov     edx, dword [ebp-10H]                    ; 36ED _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 36F0 _ 8B. 45, E4
        add     edx, eax                                ; 36F3 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 36F5 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 36F8 _ 8B. 45, EC
        add     eax, ecx                                ; 36FB _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 36FD _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3701 _ 88. 02
        add     dword [ebp-10H], 1                      ; 3703 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3707 _ 83. 45, EC, 01
?_183:  cmp     dword [ebp-14H], 2                      ; 370B _ 83. 7D, EC, 02
        jle     ?_182                                   ; 370F _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3711 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3714 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3718 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 371B _ 89. 04 24
        call    strcmp                                  ; 371E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3723 _ 83. F8, 01
        jne     ?_186                                   ; 3726 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 372C _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 372F _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3732 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3737 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 373B _ 89. 04 24
        call    memman_alloc_4k                         ; 373E _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3743 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3745 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3748 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 374A _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 374D _ 8B. 40, 1C
        mov     edx, eax                                ; 3750 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3752 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3755 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 3758 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 375F _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 3762 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3766 _ 0F B7. C0
        shl     eax, 9                                  ; 3769 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 376C _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 376F _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3772 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3775 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3778 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 377F _ C7. 45, E8, 00000000
        jmp     ?_185                                   ; 3786 _ EB, 1B

?_184:  mov     eax, dword [ebp+0CH]                    ; 3788 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 378B _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 378D _ 8B. 45, E8
        add     edx, eax                                ; 3790 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 3792 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 3795 _ 8B. 45, E0
        add     eax, ecx                                ; 3798 _ 01. C8
        movzx   eax, byte [eax]                         ; 379A _ 0F B6. 00
        mov     byte [edx], al                          ; 379D _ 88. 02
        add     dword [ebp-18H], 1                      ; 379F _ 83. 45, E8, 01
?_185:  mov     eax, dword [ebp-18H]                    ; 37A3 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 37A6 _ 3B. 45, DC
        jl      ?_184                                   ; 37A9 _ 7C, DD
        jmp     ?_188                                   ; 37AB _ EB, 12

?_186:  add     dword [ebp-0CH], 32                     ; 37AD _ 83. 45, F4, 20
?_187:  mov     eax, dword [ebp-0CH]                    ; 37B1 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 37B4 _ 0F B6. 00
        test    al, al                                  ; 37B7 _ 84. C0
        jne     ?_177                                   ; 37B9 _ 0F 85, FFFFFED4
?_188:  mov     edx, dword [ebp-1CH]                    ; 37BF _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 37C2 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 37C7 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 37CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 37D3 _ 89. 04 24
        call    memman_free                             ; 37D6 _ E8, FFFFFFFC(rel)
        leave                                           ; 37DB _ C9
        ret                                             ; 37DC _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 37DD _ 55
        mov     ebp, esp                                ; 37DE _ 89. E5
        sub     esp, 40                                 ; 37E0 _ 83. EC, 28
        mov     dword [?_343], 8                        ; 37E3 _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_336                      ; 37ED _ C7. 04 24, 00000078(d)
        call    cons_putstr                             ; 37F4 _ E8, FFFFFFFC(rel)
        mov     dword [?_343], 8                        ; 37F9 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_344]                      ; 3803 _ A1, 00000010(d)
        add     eax, 16                                 ; 3808 _ 83. C0, 10
        mov     dword [?_344], eax                      ; 380B _ A3, 00000010(d)
        mov     dword [esp], ?_337                      ; 3810 _ C7. 04 24, 0000007F(d)
        call    cons_putstr                             ; 3817 _ E8, FFFFFFFC(rel)
        mov     dword [?_343], 8                        ; 381C _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_344]                      ; 3826 _ A1, 00000010(d)
        add     eax, 16                                 ; 382B _ 83. C0, 10
        mov     dword [?_344], eax                      ; 382E _ A3, 00000010(d)
        mov     eax, dword [ebp+8H]                     ; 3833 _ 8B. 45, 08
        add     eax, 44                                 ; 3836 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3839 _ 8B. 00
        mov     dword [esp], eax                        ; 383B _ 89. 04 24
        call    intToHexStr                             ; 383E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3843 _ 89. 45, F4
        mov     dword [esp], ?_338                      ; 3846 _ C7. 04 24, 0000008F(d)
        call    cons_putstr                             ; 384D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3852 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3855 _ 89. 04 24
        call    cons_putstr                             ; 3858 _ E8, FFFFFFFC(rel)
        mov     dword [?_343], 8                        ; 385D _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_344]                      ; 3867 _ A1, 00000010(d)
        add     eax, 16                                 ; 386C _ 83. C0, 10
        mov     dword [?_344], eax                      ; 386F _ A3, 00000010(d)
        call    task_now                                ; 3874 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3879 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 387C _ 8B. 45, F0
        add     eax, 48                                 ; 387F _ 83. C0, 30
        leave                                           ; 3882 _ C9
        ret                                             ; 3883 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3884 _ 55
        mov     ebp, esp                                ; 3885 _ 89. E5
        sub     esp, 40                                 ; 3887 _ 83. EC, 28
        mov     dword [?_343], 8                        ; 388A _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_339                      ; 3894 _ C7. 04 24, 00000096(d)
        call    cons_putstr                             ; 389B _ E8, FFFFFFFC(rel)
        mov     dword [?_343], 8                        ; 38A0 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_344]                      ; 38AA _ A1, 00000010(d)
        add     eax, 16                                 ; 38AF _ 83. C0, 10
        mov     dword [?_344], eax                      ; 38B2 _ A3, 00000010(d)
        mov     dword [esp], ?_340                      ; 38B7 _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 38BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_344]                      ; 38C3 _ A1, 00000010(d)
        add     eax, 16                                 ; 38C8 _ 83. C0, 10
        mov     dword [?_344], eax                      ; 38CB _ A3, 00000010(d)
        mov     dword [?_343], 8                        ; 38D0 _ C7. 05, 0000000C(d), 00000008
        call    task_now                                ; 38DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 38DF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 38E2 _ 8B. 45, F4
        add     eax, 48                                 ; 38E5 _ 83. C0, 30
        leave                                           ; 38E8 _ C9
        ret                                             ; 38E9 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 38EA _ 55
        mov     ebp, esp                                ; 38EB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 38ED _ 8B. 45, 08
        mov     dword [eax], 0                          ; 38F0 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 38F6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 38F9 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3900 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3903 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 390A _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 390D _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3914 _ 5D
        ret                                             ; 3915 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3916 _ 55
        mov     ebp, esp                                ; 3917 _ 89. E5
        sub     esp, 16                                 ; 3919 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 391C _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3923 _ C7. 45, F8, 00000000
        jmp     ?_190                                   ; 392A _ EB, 14

?_189:  mov     eax, dword [ebp+8H]                     ; 392C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 392F _ 8B. 55, F8
        add     edx, 2                                  ; 3932 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3935 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3939 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 393C _ 83. 45, F8, 01
?_190:  mov     eax, dword [ebp+8H]                     ; 3940 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3943 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3945 _ 3B. 45, F8
        ja      ?_189                                   ; 3948 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 394A _ 8B. 45, FC
        leave                                           ; 394D _ C9
        ret                                             ; 394E _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 394F _ 55
        mov     ebp, esp                                ; 3950 _ 89. E5
        sub     esp, 16                                 ; 3952 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3955 _ C7. 45, F8, 00000000
        jmp     ?_194                                   ; 395C _ E9, 00000085

?_191:  mov     eax, dword [ebp+8H]                     ; 3961 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3964 _ 8B. 55, F8
        add     edx, 2                                  ; 3967 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 396A _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 396E _ 3B. 45, 0C
        jc      ?_193                                   ; 3971 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3973 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3976 _ 8B. 55, F8
        add     edx, 2                                  ; 3979 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 397C _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 397F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3982 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3985 _ 8B. 55, F8
        add     edx, 2                                  ; 3988 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 398B _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 398E _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3991 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3994 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3997 _ 8B. 55, F8
        add     edx, 2                                  ; 399A _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 399D _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 39A0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 39A3 _ 8B. 55, F8
        add     edx, 2                                  ; 39A6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 39A9 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 39AD _ 2B. 45, 0C
        mov     edx, eax                                ; 39B0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 39B2 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 39B5 _ 8B. 4D, F8
        add     ecx, 2                                  ; 39B8 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 39BB _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 39BF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 39C2 _ 8B. 55, F8
        add     edx, 2                                  ; 39C5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 39C8 _ 8B. 44 D0, 04
        test    eax, eax                                ; 39CC _ 85. C0
        jnz     ?_192                                   ; 39CE _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 39D0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39D3 _ 8B. 00
        lea     edx, [eax-1H]                           ; 39D5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 39D8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 39DB _ 89. 10
?_192:  mov     eax, dword [ebp-4H]                     ; 39DD _ 8B. 45, FC
        jmp     ?_195                                   ; 39E0 _ EB, 17

?_193:  add     dword [ebp-8H], 1                       ; 39E2 _ 83. 45, F8, 01
?_194:  mov     eax, dword [ebp+8H]                     ; 39E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39E9 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 39EB _ 3B. 45, F8
        ja      ?_191                                   ; 39EE _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 39F4 _ B8, 00000000
?_195:  leave                                           ; 39F9 _ C9
        ret                                             ; 39FA _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 39FB _ 55
        mov     ebp, esp                                ; 39FC _ 89. E5
        push    ebx                                     ; 39FE _ 53
        sub     esp, 16                                 ; 39FF _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3A02 _ C7. 45, F4, 00000000
        jmp     ?_198                                   ; 3A09 _ EB, 17

?_196:  mov     eax, dword [ebp+8H]                     ; 3A0B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A0E _ 8B. 55, F4
        add     edx, 2                                  ; 3A11 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3A14 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3A17 _ 3B. 45, 0C
        jbe     ?_197                                   ; 3A1A _ 76, 02
        jmp     ?_199                                   ; 3A1C _ EB, 0E

?_197:  add     dword [ebp-0CH], 1                      ; 3A1E _ 83. 45, F4, 01
?_198:  mov     eax, dword [ebp+8H]                     ; 3A22 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A25 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3A27 _ 3B. 45, F4
        jg      ?_196                                   ; 3A2A _ 7F, DF
?_199:  cmp     dword [ebp-0CH], 0                      ; 3A2C _ 83. 7D, F4, 00
        jle     ?_201                                   ; 3A30 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3A36 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3A39 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3A3C _ 8B. 45, 08
        add     edx, 2                                  ; 3A3F _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3A42 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3A45 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3A48 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3A4B _ 8B. 45, 08
        add     ecx, 2                                  ; 3A4E _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3A51 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3A55 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3A57 _ 3B. 45, 0C
        jne     ?_201                                   ; 3A5A _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3A60 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3A63 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3A66 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3A69 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3A6C _ 8B. 45, 08
        add     edx, 2                                  ; 3A6F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3A72 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3A76 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3A79 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A7C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3A7F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3A82 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3A86 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A89 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3A8B _ 3B. 45, F4
        jle     ?_200                                   ; 3A8E _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3A90 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3A93 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3A96 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A99 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A9C _ 8B. 55, F4
        add     edx, 2                                  ; 3A9F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3AA2 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3AA5 _ 39. C1
        jnz     ?_200                                   ; 3AA7 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3AA9 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3AAC _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3AAF _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3AB2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3AB5 _ 8B. 45, 08
        add     edx, 2                                  ; 3AB8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3ABB _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3ABF _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3AC2 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3AC5 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3AC8 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3ACC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3ACF _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3AD2 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3AD5 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3AD9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3ADC _ 8B. 00
        lea     edx, [eax-1H]                           ; 3ADE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3AE1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3AE4 _ 89. 10
?_200:  mov     eax, 0                                  ; 3AE6 _ B8, 00000000
        jmp     ?_207                                   ; 3AEB _ E9, 0000011C

?_201:  mov     eax, dword [ebp+8H]                     ; 3AF0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AF3 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3AF5 _ 3B. 45, F4
        jle     ?_202                                   ; 3AF8 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3AFA _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3AFD _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3B00 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3B03 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B06 _ 8B. 55, F4
        add     edx, 2                                  ; 3B09 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3B0C _ 8B. 04 D0
        cmp     ecx, eax                                ; 3B0F _ 39. C1
        jnz     ?_202                                   ; 3B11 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3B13 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B16 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3B19 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3B1C _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3B1F _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3B22 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B25 _ 8B. 55, F4
        add     edx, 2                                  ; 3B28 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3B2B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3B2F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3B32 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3B35 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B38 _ 8B. 55, F4
        add     edx, 2                                  ; 3B3B _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3B3E _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3B42 _ B8, 00000000
        jmp     ?_207                                   ; 3B47 _ E9, 000000C0

?_202:  mov     eax, dword [ebp+8H]                     ; 3B4C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B4F _ 8B. 00
        cmp     eax, 4095                               ; 3B51 _ 3D, 00000FFF
        jg      ?_206                                   ; 3B56 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3B5C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B5F _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3B61 _ 89. 45, F8
        jmp     ?_204                                   ; 3B64 _ EB, 28

?_203:  mov     eax, dword [ebp-8H]                     ; 3B66 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3B69 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3B6C _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3B6F _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3B72 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3B75 _ 8B. 45, 08
        add     edx, 2                                  ; 3B78 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3B7B _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3B7E _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3B80 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3B83 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3B86 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3B8A _ 83. 6D, F8, 01
?_204:  mov     eax, dword [ebp-8H]                     ; 3B8E _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3B91 _ 3B. 45, F4
        jg      ?_203                                   ; 3B94 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3B96 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B99 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3B9B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3B9E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3BA1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3BA3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3BA6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3BA9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3BAC _ 8B. 00
        cmp     edx, eax                                ; 3BAE _ 39. C2
        jge     ?_205                                   ; 3BB0 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3BB2 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3BB5 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3BB7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3BBA _ 89. 50, 04
?_205:  mov     eax, dword [ebp+8H]                     ; 3BBD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3BC0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3BC3 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3BC6 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3BC9 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3BCC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3BCF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3BD2 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3BD5 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3BD8 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3BDC _ B8, 00000000
        jmp     ?_207                                   ; 3BE1 _ EB, 29

?_206:  mov     eax, dword [ebp+8H]                     ; 3BE3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3BE6 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3BE9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3BEC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3BEF _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3BF2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3BF5 _ 8B. 40, 08
        mov     edx, eax                                ; 3BF8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3BFA _ 8B. 45, 10
        add     eax, edx                                ; 3BFD _ 01. D0
        mov     edx, eax                                ; 3BFF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C01 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3C04 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3C07 _ B8, FFFFFFFF
?_207:  add     esp, 16                                 ; 3C0C _ 83. C4, 10
        pop     ebx                                     ; 3C0F _ 5B
        pop     ebp                                     ; 3C10 _ 5D
        ret                                             ; 3C11 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3C12 _ 55
        mov     ebp, esp                                ; 3C13 _ 89. E5
        sub     esp, 24                                 ; 3C15 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3C18 _ 8B. 45, 0C
        add     eax, 4095                               ; 3C1B _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3C20 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3C25 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C28 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C2B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C2F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C32 _ 89. 04 24
        call    memman_alloc                            ; 3C35 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3C3A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3C3D _ 8B. 45, FC
        leave                                           ; 3C40 _ C9
        ret                                             ; 3C41 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3C42 _ 55
        mov     ebp, esp                                ; 3C43 _ 89. E5
        sub     esp, 28                                 ; 3C45 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3C48 _ 8B. 45, 10
        add     eax, 4095                               ; 3C4B _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3C50 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3C55 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3C58 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3C5B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C5F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C62 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C66 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C69 _ 89. 04 24
        call    memman_free                             ; 3C6C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3C71 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3C74 _ 8B. 45, FC
        leave                                           ; 3C77 _ C9
        ret                                             ; 3C78 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 3C79 _ 55
        mov     ebp, esp                                ; 3C7A _ 89. E5
        sub     esp, 40                                 ; 3C7C _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 3C7F _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 3C87 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C8A _ 89. 04 24
        call    memman_alloc_4k                         ; 3C8D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3C92 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3C95 _ 83. 7D, F4, 00
        jnz     ?_208                                   ; 3C99 _ 75, 0A
        mov     eax, 0                                  ; 3C9B _ B8, 00000000
        jmp     ?_212                                   ; 3CA0 _ E9, 0000009D

?_208:  mov     eax, dword [ebp+10H]                    ; 3CA5 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3CA8 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3CAC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CB0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CB3 _ 89. 04 24
        call    memman_alloc_4k                         ; 3CB6 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3CBB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3CBD _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 3CC0 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3CC3 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3CC6 _ 8B. 40, 04
        test    eax, eax                                ; 3CC9 _ 85. C0
        jnz     ?_209                                   ; 3CCB _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3CCD _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 3CD0 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 3CD8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CDC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CDF _ 89. 04 24
        call    memman_free_4k                          ; 3CE2 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3CE7 _ B8, 00000000
        jmp     ?_212                                   ; 3CEC _ EB, 54

?_209:  mov     eax, dword [ebp-0CH]                    ; 3CEE _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3CF1 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3CF4 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3CF6 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3CF9 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3CFC _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3CFF _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3D02 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 3D05 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 3D08 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 3D0B _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3D12 _ C7. 45, F0, 00000000
        jmp     ?_211                                   ; 3D19 _ EB, 1B

?_210:  mov     eax, dword [ebp-0CH]                    ; 3D1B _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3D1E _ 8B. 55, F0
        add     edx, 33                                 ; 3D21 _ 83. C2, 21
        shl     edx, 5                                  ; 3D24 _ C1. E2, 05
        add     eax, edx                                ; 3D27 _ 01. D0
        add     eax, 16                                 ; 3D29 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3D2C _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3D32 _ 83. 45, F0, 01
?_211:  cmp     dword [ebp-10H], 255                    ; 3D36 _ 81. 7D, F0, 000000FF
        jle     ?_210                                   ; 3D3D _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 3D3F _ 8B. 45, F4
?_212:  leave                                           ; 3D42 _ C9
        ret                                             ; 3D43 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3D44 _ 55
        mov     ebp, esp                                ; 3D45 _ 89. E5
        sub     esp, 16                                 ; 3D47 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3D4A _ C7. 45, F8, 00000000
        jmp     ?_215                                   ; 3D51 _ EB, 5B

?_213:  mov     eax, dword [ebp+8H]                     ; 3D53 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3D56 _ 8B. 55, F8
        add     edx, 33                                 ; 3D59 _ 83. C2, 21
        shl     edx, 5                                  ; 3D5C _ C1. E2, 05
        add     eax, edx                                ; 3D5F _ 01. D0
        add     eax, 16                                 ; 3D61 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3D64 _ 8B. 00
        test    eax, eax                                ; 3D66 _ 85. C0
        jnz     ?_214                                   ; 3D68 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3D6A _ 8B. 45, F8
        shl     eax, 5                                  ; 3D6D _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3D70 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3D76 _ 8B. 45, 08
        add     eax, edx                                ; 3D79 _ 01. D0
        add     eax, 4                                  ; 3D7B _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3D7E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3D81 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3D84 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3D87 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3D8A _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3D8D _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3D91 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3D94 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3D9B _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3D9E _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3DA5 _ 8B. 45, FC
        jmp     ?_216                                   ; 3DA8 _ EB, 12

?_214:  add     dword [ebp-8H], 1                       ; 3DAA _ 83. 45, F8, 01
?_215:  cmp     dword [ebp-8H], 255                     ; 3DAE _ 81. 7D, F8, 000000FF
        jle     ?_213                                   ; 3DB5 _ 7E, 9C
        mov     eax, 0                                  ; 3DB7 _ B8, 00000000
?_216:  leave                                           ; 3DBC _ C9
        ret                                             ; 3DBD _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3DBE _ 55
        mov     ebp, esp                                ; 3DBF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3DC1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3DC4 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3DC7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3DC9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3DCC _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3DCF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3DD2 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3DD5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3DD8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3DDB _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3DDE _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3DE1 _ 89. 50, 14
        nop                                             ; 3DE4 _ 90
        pop     ebp                                     ; 3DE5 _ 5D
        ret                                             ; 3DE6 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3DE7 _ 55
        mov     ebp, esp                                ; 3DE8 _ 89. E5
        push    edi                                     ; 3DEA _ 57
        push    esi                                     ; 3DEB _ 56
        push    ebx                                     ; 3DEC _ 53
        sub     esp, 60                                 ; 3DED _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 3DF0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3DF3 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 3DF6 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 3DF9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3DFC _ 8B. 40, 10
        add     eax, 1                                  ; 3DFF _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3E02 _ 3B. 45, 10
        jge     ?_217                                   ; 3E05 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3E07 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3E0A _ 8B. 40, 10
        add     eax, 1                                  ; 3E0D _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3E10 _ 89. 45, 10
?_217:  cmp     dword [ebp+10H], -1                     ; 3E13 _ 83. 7D, 10, FF
        jge     ?_218                                   ; 3E17 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3E19 _ C7. 45, 10, FFFFFFFF
?_218:  mov     eax, dword [ebp+0CH]                    ; 3E20 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3E23 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3E26 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 3E29 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3E2C _ 3B. 45, 10
        jle     ?_225                                   ; 3E2F _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 3E35 _ 83. 7D, 10, 00
        js      ?_221                                   ; 3E39 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 3E3F _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3E42 _ 89. 45, E0
        jmp     ?_220                                   ; 3E45 _ EB, 34

?_219:  mov     eax, dword [ebp-20H]                    ; 3E47 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 3E4A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3E4D _ 8B. 45, 08
        add     edx, 4                                  ; 3E50 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E53 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E57 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3E5A _ 8B. 4D, E0
        add     ecx, 4                                  ; 3E5D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E60 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E64 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3E67 _ 8B. 55, E0
        add     edx, 4                                  ; 3E6A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E6D _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3E71 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3E74 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3E77 _ 83. 6D, E0, 01
?_220:  mov     eax, dword [ebp-20H]                    ; 3E7B _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3E7E _ 3B. 45, 10
        jg      ?_219                                   ; 3E81 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3E83 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3E86 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3E89 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3E8C _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3E8F _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3E93 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3E96 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3E99 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E9C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E9F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3EA2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3EA5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3EA8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EAB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EAE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EB1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3EB4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3EB7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EBA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EBD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3EC0 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3EC3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3EC7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3ECB _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3ECF _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3ED3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3ED7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EDA _ 89. 04 24
        call    sheet_refreshmap                        ; 3EDD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3EE2 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 3EE5 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3EE8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EEB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EEE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3EF1 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3EF4 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3EF7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EFA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EFD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F00 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F03 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F06 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F09 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F0C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F0F _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 3F12 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 3F15 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3F19 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 3F1D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3F21 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F25 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F30 _ 89. 04 24
        call    sheet_refreshsub                        ; 3F33 _ E8, FFFFFFFC(rel)
        jmp     ?_232                                   ; 3F38 _ E9, 0000027D

?_221:  mov     eax, dword [ebp+8H]                     ; 3F3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F40 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 3F43 _ 3B. 45, E4
        jle     ?_224                                   ; 3F46 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 3F48 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3F4B _ 89. 45, E0
        jmp     ?_223                                   ; 3F4E _ EB, 34

?_222:  mov     eax, dword [ebp-20H]                    ; 3F50 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3F53 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F56 _ 8B. 45, 08
        add     edx, 4                                  ; 3F59 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3F5C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3F60 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3F63 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3F66 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3F69 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F6D _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3F70 _ 8B. 55, E0
        add     edx, 4                                  ; 3F73 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3F76 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3F7A _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3F7D _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 3F80 _ 83. 45, E0, 01
?_223:  mov     eax, dword [ebp+8H]                     ; 3F84 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F87 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 3F8A _ 3B. 45, E0
        jg      ?_222                                   ; 3F8D _ 7F, C1
?_224:  mov     eax, dword [ebp+8H]                     ; 3F8F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F92 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3F95 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3F98 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3F9B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F9E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FA1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FA4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3FA7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3FAA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3FAD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3FB0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3FB3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3FB6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3FB9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3FBC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FBF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FC2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3FC5 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3FC8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3FD0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3FD4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FD8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FDC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FE0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FE3 _ 89. 04 24
        call    sheet_refreshmap                        ; 3FE6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 3FEB _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 3FEE _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3FF1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FF4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FF7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3FFA _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3FFD _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4000 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4003 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4006 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4009 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 400C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 400F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4012 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4015 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4018 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 401B _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 401F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4027 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 402B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 402F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4033 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4037 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 403A _ 89. 04 24
        call    sheet_refreshsub                        ; 403D _ E8, FFFFFFFC(rel)
        jmp     ?_232                                   ; 4042 _ E9, 00000173

?_225:  mov     eax, dword [ebp-1CH]                    ; 4047 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 404A _ 3B. 45, 10
        jge     ?_232                                   ; 404D _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 4053 _ 83. 7D, E4, 00
        js      ?_228                                   ; 4057 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 4059 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 405C _ 89. 45, E0
        jmp     ?_227                                   ; 405F _ EB, 34

?_226:  mov     eax, dword [ebp-20H]                    ; 4061 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4064 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4067 _ 8B. 45, 08
        add     edx, 4                                  ; 406A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 406D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4071 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4074 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4077 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 407A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 407E _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4081 _ 8B. 55, E0
        add     edx, 4                                  ; 4084 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4087 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 408B _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 408E _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4091 _ 83. 45, E0, 01
?_227:  mov     eax, dword [ebp-20H]                    ; 4095 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4098 _ 3B. 45, 10
        jl      ?_226                                   ; 409B _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 409D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 40A0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 40A3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 40A6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 40A9 _ 89. 54 88, 04
        jmp     ?_231                                   ; 40AD _ EB, 6C

?_228:  mov     eax, dword [ebp+8H]                     ; 40AF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 40B2 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 40B5 _ 89. 45, E0
        jmp     ?_230                                   ; 40B8 _ EB, 3A

?_229:  mov     eax, dword [ebp-20H]                    ; 40BA _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 40BD _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 40C0 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 40C3 _ 8B. 55, E0
        add     edx, 4                                  ; 40C6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 40C9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 40CD _ 8B. 45, 08
        add     ecx, 4                                  ; 40D0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 40D3 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 40D7 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 40DA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 40DD _ 8B. 45, 08
        add     edx, 4                                  ; 40E0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 40E3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 40E7 _ 8B. 55, E0
        add     edx, 1                                  ; 40EA _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 40ED _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 40F0 _ 83. 6D, E0, 01
?_230:  mov     eax, dword [ebp-20H]                    ; 40F4 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 40F7 _ 3B. 45, 10
        jge     ?_229                                   ; 40FA _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 40FC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 40FF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4102 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4105 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4108 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 410C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 410F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4112 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4115 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4118 _ 89. 50, 10
?_231:  mov     eax, dword [ebp+0CH]                    ; 411B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 411E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4121 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4124 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4127 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 412A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 412D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4130 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4133 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4136 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4139 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 413C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 413F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4142 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4145 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4148 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 414C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4150 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4154 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4158 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 415C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 415F _ 89. 04 24
        call    sheet_refreshmap                        ; 4162 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4167 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 416A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 416D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4170 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4173 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4176 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4179 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 417C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 417F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4182 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4185 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4188 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 418B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 418E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4191 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 4194 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 4198 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 419B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 419F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 41A3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 41A7 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 41AB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41AF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41B2 _ 89. 04 24
        call    sheet_refreshsub                        ; 41B5 _ E8, FFFFFFFC(rel)
?_232:  add     esp, 60                                 ; 41BA _ 83. C4, 3C
        pop     ebx                                     ; 41BD _ 5B
        pop     esi                                     ; 41BE _ 5E
        pop     edi                                     ; 41BF _ 5F
        pop     ebp                                     ; 41C0 _ 5D
        ret                                             ; 41C1 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 41C2 _ 55
        mov     ebp, esp                                ; 41C3 _ 89. E5
        push    edi                                     ; 41C5 _ 57
        push    esi                                     ; 41C6 _ 56
        push    ebx                                     ; 41C7 _ 53
        sub     esp, 44                                 ; 41C8 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 41CB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 41CE _ 8B. 40, 18
        test    eax, eax                                ; 41D1 _ 85. C0
        js      ?_233                                   ; 41D3 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 41D5 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 41D8 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 41DB _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 41DE _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 41E1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 41E4 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 41E7 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 41EA _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 41ED _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 41F0 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 41F3 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 41F6 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 41F9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 41FC _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 41FF _ 8B. 45, 14
        add     edx, eax                                ; 4202 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4204 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4207 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 420A _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 420D _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4210 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 4213 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4217 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 421B _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 421F _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 4223 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4227 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 422B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 422E _ 89. 04 24
        call    sheet_refreshsub                        ; 4231 _ E8, FFFFFFFC(rel)
?_233:  mov     eax, 0                                  ; 4236 _ B8, 00000000
        add     esp, 44                                 ; 423B _ 83. C4, 2C
        pop     ebx                                     ; 423E _ 5B
        pop     esi                                     ; 423F _ 5E
        pop     edi                                     ; 4240 _ 5F
        pop     ebp                                     ; 4241 _ 5D
        ret                                             ; 4242 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4243 _ 55
        mov     ebp, esp                                ; 4244 _ 89. E5
        push    esi                                     ; 4246 _ 56
        push    ebx                                     ; 4247 _ 53
        sub     esp, 48                                 ; 4248 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 424B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 424E _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4251 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4254 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4257 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 425A _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 425D _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4260 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4263 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4266 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4269 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 426C _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 426F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4272 _ 8B. 40, 18
        test    eax, eax                                ; 4275 _ 85. C0
        js      ?_234                                   ; 4277 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 427D _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4280 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4283 _ 8B. 45, F4
        add     edx, eax                                ; 4286 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4288 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 428B _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 428E _ 8B. 45, F0
        add     eax, ecx                                ; 4291 _ 01. C8
        mov     dword [esp+14H], 0                      ; 4293 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 429B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 429F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 42A3 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 42A6 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 42AA _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 42AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42B4 _ 89. 04 24
        call    sheet_refreshmap                        ; 42B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 42BC _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 42BF _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 42C2 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 42C5 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 42C8 _ 8B. 55, 14
        add     ecx, edx                                ; 42CB _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 42CD _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 42D0 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 42D3 _ 8B. 55, 10
        add     edx, ebx                                ; 42D6 _ 01. DA
        mov     dword [esp+14H], eax                    ; 42D8 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 42DC _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 42E0 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 42E4 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 42E7 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 42EB _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 42EE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42F2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42F5 _ 89. 04 24
        call    sheet_refreshmap                        ; 42F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 42FD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4300 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4303 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4306 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4309 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 430C _ 8B. 45, F4
        add     edx, eax                                ; 430F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4311 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4314 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4317 _ 8B. 45, F0
        add     eax, ebx                                ; 431A _ 01. D8
        mov     dword [esp+18H], ecx                    ; 431C _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 4320 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4328 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 432C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4330 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4333 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4337 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 433A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 433E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4341 _ 89. 04 24
        call    sheet_refreshsub                        ; 4344 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4349 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 434C _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 434F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4352 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4355 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4358 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 435B _ 8B. 4D, 14
        add     ebx, ecx                                ; 435E _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 4360 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4363 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4366 _ 8B. 4D, 10
        add     ecx, esi                                ; 4369 _ 01. F1
        mov     dword [esp+18H], edx                    ; 436B _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 436F _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 4373 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4377 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 437B _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 437E _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4382 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4385 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4389 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 438C _ 89. 04 24
        call    sheet_refreshsub                        ; 438F _ E8, FFFFFFFC(rel)
?_234:  add     esp, 48                                 ; 4394 _ 83. C4, 30
        pop     ebx                                     ; 4397 _ 5B
        pop     esi                                     ; 4398 _ 5E
        pop     ebp                                     ; 4399 _ 5D
        ret                                             ; 439A _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 439B _ 55
        mov     ebp, esp                                ; 439C _ 89. E5
        sub     esp, 48                                 ; 439E _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 43A1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43A4 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 43A6 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 43A9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 43AC _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 43AF _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 43B2 _ 83. 7D, 0C, 00
        jns     ?_235                                   ; 43B6 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 43B8 _ C7. 45, 0C, 00000000
?_235:  cmp     dword [ebp+10H], 8                      ; 43BF _ 83. 7D, 10, 08
        jg      ?_236                                   ; 43C3 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 43C5 _ C7. 45, 10, 00000000
?_236:  mov     eax, dword [ebp+8H]                     ; 43CC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 43CF _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 43D2 _ 3B. 45, 14
        jge     ?_237                                   ; 43D5 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 43D7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 43DA _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 43DD _ 89. 45, 14
?_237:  mov     eax, dword [ebp+8H]                     ; 43E0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 43E3 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 43E6 _ 3B. 45, 18
        jge     ?_238                                   ; 43E9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 43EB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 43EE _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 43F1 _ 89. 45, 18
?_238:  mov     eax, dword [ebp+1CH]                    ; 43F4 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 43F7 _ 89. 45, DC
        jmp     ?_245                                   ; 43FA _ E9, 00000119

?_239:  mov     eax, dword [ebp+8H]                     ; 43FF _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 4402 _ 8B. 55, DC
        add     edx, 4                                  ; 4405 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4408 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 440C _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 440F _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4412 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4414 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4417 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 441A _ 8B. 45, 08
        add     eax, 1044                               ; 441D _ 05, 00000414
        sub     edx, eax                                ; 4422 _ 29. C2
        mov     eax, edx                                ; 4424 _ 89. D0
        sar     eax, 5                                  ; 4426 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 4429 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 442C _ C7. 45, E4, 00000000
        jmp     ?_244                                   ; 4433 _ E9, 000000CD

?_240:  mov     eax, dword [ebp-10H]                    ; 4438 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 443B _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 443E _ 8B. 45, E4
        add     eax, edx                                ; 4441 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4443 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 4446 _ C7. 45, E0, 00000000
        jmp     ?_243                                   ; 444D _ E9, 000000A0

?_241:  mov     eax, dword [ebp-10H]                    ; 4452 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4455 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4458 _ 8B. 45, E0
        add     eax, edx                                ; 445B _ 01. D0
        mov     dword [ebp-4H], eax                     ; 445D _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 4460 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 4463 _ 3B. 45, FC
        jg      ?_242                                   ; 4466 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 446C _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 446F _ 3B. 45, 14
        jge     ?_242                                   ; 4472 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 4474 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4477 _ 3B. 45, F8
        jg      ?_242                                   ; 447A _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 447C _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 447F _ 3B. 45, 18
        jge     ?_242                                   ; 4482 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 4484 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4487 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 448A _ 0F AF. 45, E4
        mov     edx, eax                                ; 448E _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4490 _ 8B. 45, E0
        add     eax, edx                                ; 4493 _ 01. D0
        mov     edx, eax                                ; 4495 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4497 _ 8B. 45, F4
        add     eax, edx                                ; 449A _ 01. D0
        movzx   eax, byte [eax]                         ; 449C _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 449F _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 44A2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 44A5 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 44A8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 44AC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 44AE _ 8B. 45, FC
        add     eax, edx                                ; 44B1 _ 01. D0
        mov     edx, eax                                ; 44B3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 44B5 _ 8B. 45, EC
        add     eax, edx                                ; 44B8 _ 01. D0
        movzx   eax, byte [eax]                         ; 44BA _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 44BD _ 3A. 45, DA
        jnz     ?_242                                   ; 44C0 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 44C2 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 44C6 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 44C9 _ 8B. 40, 14
        cmp     edx, eax                                ; 44CC _ 39. C2
        jz      ?_242                                   ; 44CE _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 44D0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 44D3 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 44D6 _ 0F AF. 45, F8
        mov     edx, eax                                ; 44DA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 44DC _ 8B. 45, FC
        add     eax, edx                                ; 44DF _ 01. D0
        mov     edx, eax                                ; 44E1 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 44E3 _ 8B. 45, E8
        add     edx, eax                                ; 44E6 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 44E8 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 44EC _ 88. 02
?_242:  add     dword [ebp-20H], 1                      ; 44EE _ 83. 45, E0, 01
?_243:  mov     eax, dword [ebp-10H]                    ; 44F2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 44F5 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 44F8 _ 3B. 45, E0
        jg      ?_241                                   ; 44FB _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4501 _ 83. 45, E4, 01
?_244:  mov     eax, dword [ebp-10H]                    ; 4505 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4508 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 450B _ 3B. 45, E4
        jg      ?_240                                   ; 450E _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4514 _ 83. 45, DC, 01
?_245:  mov     eax, dword [ebp-24H]                    ; 4518 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 451B _ 3B. 45, 20
        jle     ?_239                                   ; 451E _ 0F 8E, FFFFFEDB
        leave                                           ; 4524 _ C9
        ret                                             ; 4525 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4526 _ 55
        mov     ebp, esp                                ; 4527 _ 89. E5
        sub     esp, 64                                 ; 4529 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 452C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 452F _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4532 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4535 _ 83. 7D, 0C, 00
        jns     ?_246                                   ; 4539 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 453B _ C7. 45, 0C, 00000000
?_246:  cmp     dword [ebp+10H], 0                      ; 4542 _ 83. 7D, 10, 00
        jns     ?_247                                   ; 4546 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4548 _ C7. 45, 10, 00000000
?_247:  mov     eax, dword [ebp+8H]                     ; 454F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4552 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4555 _ 3B. 45, 14
        jge     ?_248                                   ; 4558 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 455A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 455D _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4560 _ 89. 45, 14
?_248:  mov     eax, dword [ebp+8H]                     ; 4563 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4566 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4569 _ 3B. 45, 18
        jge     ?_249                                   ; 456C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 456E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4571 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4574 _ 89. 45, 18
?_249:  mov     eax, dword [ebp+1CH]                    ; 4577 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 457A _ 89. 45, D0
        jmp     ?_260                                   ; 457D _ E9, 00000141

?_250:  mov     eax, dword [ebp+8H]                     ; 4582 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4585 _ 8B. 55, D0
        add     edx, 4                                  ; 4588 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 458B _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 458F _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4592 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4595 _ 8B. 45, 08
        add     eax, 1044                               ; 4598 _ 05, 00000414
        sub     edx, eax                                ; 459D _ 29. C2
        mov     eax, edx                                ; 459F _ 89. D0
        sar     eax, 5                                  ; 45A1 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 45A4 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 45A7 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 45AA _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 45AC _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 45AF _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 45B2 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 45B5 _ 8B. 55, 0C
        sub     edx, eax                                ; 45B8 _ 29. C2
        mov     eax, edx                                ; 45BA _ 89. D0
        mov     dword [ebp-24H], eax                    ; 45BC _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 45BF _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 45C2 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 45C5 _ 8B. 55, 10
        sub     edx, eax                                ; 45C8 _ 29. C2
        mov     eax, edx                                ; 45CA _ 89. D0
        mov     dword [ebp-20H], eax                    ; 45CC _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 45CF _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 45D2 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 45D5 _ 8B. 55, 14
        sub     edx, eax                                ; 45D8 _ 29. C2
        mov     eax, edx                                ; 45DA _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 45DC _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 45DF _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 45E2 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 45E5 _ 8B. 55, 18
        sub     edx, eax                                ; 45E8 _ 29. C2
        mov     eax, edx                                ; 45EA _ 89. D0
        mov     dword [ebp-18H], eax                    ; 45EC _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 45EF _ 83. 7D, DC, 00
        jns     ?_251                                   ; 45F3 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 45F5 _ C7. 45, DC, 00000000
?_251:  cmp     dword [ebp-20H], 0                      ; 45FC _ 83. 7D, E0, 00
        jns     ?_252                                   ; 4600 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4602 _ C7. 45, E0, 00000000
?_252:  mov     eax, dword [ebp-10H]                    ; 4609 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 460C _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 460F _ 3B. 45, E4
        jge     ?_253                                   ; 4612 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4614 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4617 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 461A _ 89. 45, E4
?_253:  mov     eax, dword [ebp-10H]                    ; 461D _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4620 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4623 _ 3B. 45, E8
        jge     ?_254                                   ; 4626 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4628 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 462B _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 462E _ 89. 45, E8
?_254:  mov     eax, dword [ebp-20H]                    ; 4631 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4634 _ 89. 45, D8
        jmp     ?_259                                   ; 4637 _ EB, 7A

?_255:  mov     eax, dword [ebp-10H]                    ; 4639 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 463C _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 463F _ 8B. 45, D8
        add     eax, edx                                ; 4642 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4644 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 4647 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 464A _ 89. 45, D4
        jmp     ?_258                                   ; 464D _ EB, 58

?_256:  mov     eax, dword [ebp-10H]                    ; 464F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4652 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4655 _ 8B. 45, D4
        add     eax, edx                                ; 4658 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 465A _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 465D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4660 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 4663 _ 0F AF. 45, D8
        mov     edx, eax                                ; 4667 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 4669 _ 8B. 45, D4
        add     eax, edx                                ; 466C _ 01. D0
        mov     edx, eax                                ; 466E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4670 _ 8B. 45, F4
        add     eax, edx                                ; 4673 _ 01. D0
        movzx   eax, byte [eax]                         ; 4675 _ 0F B6. 00
        movzx   edx, al                                 ; 4678 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 467B _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 467E _ 8B. 40, 14
        cmp     edx, eax                                ; 4681 _ 39. C2
        jz      ?_257                                   ; 4683 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4685 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4688 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 468B _ 0F AF. 45, F8
        mov     edx, eax                                ; 468F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4691 _ 8B. 45, FC
        add     eax, edx                                ; 4694 _ 01. D0
        mov     edx, eax                                ; 4696 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4698 _ 8B. 45, EC
        add     edx, eax                                ; 469B _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 469D _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 46A1 _ 88. 02
?_257:  add     dword [ebp-2CH], 1                      ; 46A3 _ 83. 45, D4, 01
?_258:  mov     eax, dword [ebp-2CH]                    ; 46A7 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 46AA _ 3B. 45, E4
        jl      ?_256                                   ; 46AD _ 7C, A0
        add     dword [ebp-28H], 1                      ; 46AF _ 83. 45, D8, 01
?_259:  mov     eax, dword [ebp-28H]                    ; 46B3 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 46B6 _ 3B. 45, E8
        jl      ?_255                                   ; 46B9 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 46BF _ 83. 45, D0, 01
?_260:  mov     eax, dword [ebp+8H]                     ; 46C3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 46C6 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 46C9 _ 3B. 45, D0
        jge     ?_250                                   ; 46CC _ 0F 8D, FFFFFEB0
        nop                                             ; 46D2 _ 90
        leave                                           ; 46D3 _ C9
        ret                                             ; 46D4 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 46D5 _ 55
        mov     ebp, esp                                ; 46D6 _ 89. E5
        sub     esp, 40                                 ; 46D8 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 46DB _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 46E3 _ C7. 04 24, 00000043
        call    io_out8                                 ; 46EA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 46EF _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 46F7 _ C7. 04 24, 00000040
        call    io_out8                                 ; 46FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4703 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 470B _ C7. 04 24, 00000040
        call    io_out8                                 ; 4712 _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4717 _ C7. 05, 000003A0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4721 _ C7. 45, F4, 00000000
        jmp     ?_262                                   ; 4728 _ EB, 28

?_261:  mov     eax, dword [ebp-0CH]                    ; 472A _ 8B. 45, F4
        shl     eax, 4                                  ; 472D _ C1. E0, 04
        add     eax, timerctl                           ; 4730 _ 05, 000003A0(d)
        mov     dword [eax+8H], 0                       ; 4735 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 473C _ 8B. 45, F4
        shl     eax, 4                                  ; 473F _ C1. E0, 04
        add     eax, timerctl                           ; 4742 _ 05, 000003A0(d)
        mov     dword [eax+0CH], 0                      ; 4747 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 474E _ 83. 45, F4, 01
?_262:  cmp     dword [ebp-0CH], 499                    ; 4752 _ 81. 7D, F4, 000001F3
        jle     ?_261                                   ; 4759 _ 7E, CF
        leave                                           ; 475B _ C9
        ret                                             ; 475C _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 475D _ 55
        mov     ebp, esp                                ; 475E _ 89. E5
        sub     esp, 16                                 ; 4760 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4763 _ C7. 45, FC, 00000000
        jmp     ?_265                                   ; 476A _ EB, 38

?_263:  mov     eax, dword [ebp-4H]                     ; 476C _ 8B. 45, FC
        shl     eax, 4                                  ; 476F _ C1. E0, 04
        add     eax, timerctl                           ; 4772 _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 4777 _ 8B. 40, 08
        test    eax, eax                                ; 477A _ 85. C0
        jnz     ?_264                                   ; 477C _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 477E _ 8B. 45, FC
        shl     eax, 4                                  ; 4781 _ C1. E0, 04
        add     eax, timerctl                           ; 4784 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 4789 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 4790 _ 8B. 45, FC
        shl     eax, 4                                  ; 4793 _ C1. E0, 04
        add     eax, timerctl                           ; 4796 _ 05, 000003A0(d)
        add     eax, 4                                  ; 479B _ 83. C0, 04
        jmp     ?_266                                   ; 479E _ EB, 12

?_264:  add     dword [ebp-4H], 1                       ; 47A0 _ 83. 45, FC, 01
?_265:  cmp     dword [ebp-4H], 499                     ; 47A4 _ 81. 7D, FC, 000001F3
        jle     ?_263                                   ; 47AB _ 7E, BF
        mov     eax, 0                                  ; 47AD _ B8, 00000000
?_266:  leave                                           ; 47B2 _ C9
        ret                                             ; 47B3 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 47B4 _ 55
        mov     ebp, esp                                ; 47B5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 47B7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 47BA _ C7. 40, 04, 00000000
        nop                                             ; 47C1 _ 90
        pop     ebp                                     ; 47C2 _ 5D
        ret                                             ; 47C3 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 47C4 _ 55
        mov     ebp, esp                                ; 47C5 _ 89. E5
        sub     esp, 4                                  ; 47C7 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 47CA _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 47CD _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 47D0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 47D3 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 47D6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 47D9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 47DC _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 47E0 _ 88. 50, 0C
        nop                                             ; 47E3 _ 90
        leave                                           ; 47E4 _ C9
        ret                                             ; 47E5 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 47E6 _ 55
        mov     ebp, esp                                ; 47E7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 47E9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 47EC _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 47EF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 47F1 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 47F4 _ C7. 40, 04, 00000002
        nop                                             ; 47FB _ 90
        pop     ebp                                     ; 47FC _ 5D
        ret                                             ; 47FD _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 47FE _ 55
        mov     ebp, esp                                ; 47FF _ 89. E5
        sub     esp, 40                                 ; 4801 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4804 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 480C _ C7. 04 24, 00000020
        call    io_out8                                 ; 4813 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4818 _ A1, 000003A0(d)
        add     eax, 1                                  ; 481D _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 4820 _ A3, 000003A0(d)
        mov     byte [ebp-0DH], 0                       ; 4825 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4829 _ C7. 45, F4, 00000000
        jmp     ?_270                                   ; 4830 _ E9, 000000B0

?_267:  mov     eax, dword [ebp-0CH]                    ; 4835 _ 8B. 45, F4
        shl     eax, 4                                  ; 4838 _ C1. E0, 04
        add     eax, timerctl                           ; 483B _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 4840 _ 8B. 40, 08
        cmp     eax, 2                                  ; 4843 _ 83. F8, 02
        jne     ?_268                                   ; 4846 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 484C _ 8B. 45, F4
        shl     eax, 4                                  ; 484F _ C1. E0, 04
        add     eax, timerctl                           ; 4852 _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 4857 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 485A _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 485D _ 8B. 45, F4
        shl     eax, 4                                  ; 4860 _ C1. E0, 04
        add     eax, timerctl                           ; 4863 _ 05, 000003A0(d)
        mov     dword [eax+4H], edx                     ; 4868 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 486B _ 8B. 45, F4
        shl     eax, 4                                  ; 486E _ C1. E0, 04
        add     eax, timerctl                           ; 4871 _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 4876 _ 8B. 40, 04
        test    eax, eax                                ; 4879 _ 85. C0
        jnz     ?_268                                   ; 487B _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 487D _ 8B. 45, F4
        shl     eax, 4                                  ; 4880 _ C1. E0, 04
        add     eax, timerctl                           ; 4883 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 4888 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 488F _ 8B. 45, F4
        shl     eax, 4                                  ; 4892 _ C1. E0, 04
        add     eax, timerctl                           ; 4895 _ 05, 000003A0(d)
        movzx   eax, byte [eax+10H]                     ; 489A _ 0F B6. 40, 10
        movzx   edx, al                                 ; 489E _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 48A1 _ 8B. 45, F4
        shl     eax, 4                                  ; 48A4 _ C1. E0, 04
        add     eax, timerctl                           ; 48A7 _ 05, 000003A0(d)
        mov     eax, dword [eax+0CH]                    ; 48AC _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 48AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 48B3 _ 89. 04 24
        call    fifo8_put                               ; 48B6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 48BB _ 8B. 45, F4
        shl     eax, 4                                  ; 48BE _ C1. E0, 04
        add     eax, timerctl                           ; 48C1 _ 05, 000003A0(d)
        lea     edx, [eax+4H]                           ; 48C6 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 48C9 _ A1, 00000000(d)
        cmp     edx, eax                                ; 48CE _ 39. C2
        jnz     ?_268                                   ; 48D0 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 48D2 _ C6. 45, F3, 01
?_268:  cmp     byte [ebp-0DH], 0                       ; 48D6 _ 80. 7D, F3, 00
        jz      ?_269                                   ; 48DA _ 74, 05
        call    task_switch                             ; 48DC _ E8, FFFFFFFC(rel)
?_269:  add     dword [ebp-0CH], 1                      ; 48E1 _ 83. 45, F4, 01
?_270:  cmp     dword [ebp-0CH], 499                    ; 48E5 _ 81. 7D, F4, 000001F3
        jle     ?_267                                   ; 48EC _ 0F 8E, FFFFFF43
        nop                                             ; 48F2 _ 90
        leave                                           ; 48F3 _ C9
        ret                                             ; 48F4 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 48F5 _ 55
        mov     ebp, esp                                ; 48F6 _ 89. E5
        mov     eax, timerctl                           ; 48F8 _ B8, 000003A0(d)
        pop     ebp                                     ; 48FD _ 5D
        ret                                             ; 48FE _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 48FF _ 55
        mov     ebp, esp                                ; 4900 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4902 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4905 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4908 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 490B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 490E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4911 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4913 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4916 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4919 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 491C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 491F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4926 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4929 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4930 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4933 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 493A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 493D _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 4940 _ 89. 50, 18
        nop                                             ; 4943 _ 90
        pop     ebp                                     ; 4944 _ 5D
        ret                                             ; 4945 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4946 _ 55
        mov     ebp, esp                                ; 4947 _ 89. E5
        sub     esp, 24                                 ; 4949 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 494C _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 494F _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 4952 _ 83. 7D, 08, 00
        jnz     ?_271                                   ; 4956 _ 75, 0A
        mov     eax, 4294967295                         ; 4958 _ B8, FFFFFFFF
        jmp     ?_275                                   ; 495D _ E9, 000000AB

?_271:  mov     eax, dword [ebp+8H]                     ; 4962 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4965 _ 8B. 40, 10
        test    eax, eax                                ; 4968 _ 85. C0
        jnz     ?_272                                   ; 496A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 496C _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 496F _ 8B. 40, 14
        or      eax, 01H                                ; 4972 _ 83. C8, 01
        mov     edx, eax                                ; 4975 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4977 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 497A _ 89. 50, 14
        mov     eax, 4294967295                         ; 497D _ B8, FFFFFFFF
        jmp     ?_275                                   ; 4982 _ E9, 00000086

?_272:  mov     eax, dword [ebp+8H]                     ; 4987 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 498A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 498C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 498F _ 8B. 40, 04
        add     edx, eax                                ; 4992 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 4994 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 4998 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 499A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 499D _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 49A0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 49A3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 49A6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 49A9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 49AC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 49AF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 49B2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 49B5 _ 39. C2
        jnz     ?_273                                   ; 49B7 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 49B9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 49BC _ C7. 40, 04, 00000000
?_273:  mov     eax, dword [ebp+8H]                     ; 49C3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 49C6 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 49C9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 49CC _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 49CF _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 49D2 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 49D5 _ 8B. 40, 18
        test    eax, eax                                ; 49D8 _ 85. C0
        jz      ?_274                                   ; 49DA _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 49DC _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 49DF _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 49E2 _ 8B. 40, 04
        cmp     eax, 2                                  ; 49E5 _ 83. F8, 02
        jz      ?_274                                   ; 49E8 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 49EA _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 49ED _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 49F0 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 49F8 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 4A00 _ 89. 04 24
        call    task_run                                ; 4A03 _ E8, FFFFFFFC(rel)
?_274:  mov     eax, 0                                  ; 4A08 _ B8, 00000000
?_275:  leave                                           ; 4A0D _ C9
        ret                                             ; 4A0E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 4A0F _ 55
        mov     ebp, esp                                ; 4A10 _ 89. E5
        sub     esp, 16                                 ; 4A12 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4A15 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4A18 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4A1B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A1E _ 8B. 40, 0C
        cmp     edx, eax                                ; 4A21 _ 39. C2
        jnz     ?_276                                   ; 4A23 _ 75, 07
        mov     eax, 4294967295                         ; 4A25 _ B8, FFFFFFFF
        jmp     ?_278                                   ; 4A2A _ EB, 51

?_276:  mov     eax, dword [ebp+8H]                     ; 4A2C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4A2F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4A31 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A34 _ 8B. 40, 08
        add     eax, edx                                ; 4A37 _ 01. D0
        movzx   eax, byte [eax]                         ; 4A39 _ 0F B6. 00
        movzx   eax, al                                 ; 4A3C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 4A3F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4A42 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A45 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4A48 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4A4B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4A4E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4A51 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4A54 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4A57 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A5A _ 8B. 40, 0C
        cmp     edx, eax                                ; 4A5D _ 39. C2
        jnz     ?_277                                   ; 4A5F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4A61 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4A64 _ C7. 40, 08, 00000000
?_277:  mov     eax, dword [ebp+8H]                     ; 4A6B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A6E _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4A71 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4A74 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4A77 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4A7A _ 8B. 45, FC
?_278:  leave                                           ; 4A7D _ C9
        ret                                             ; 4A7E _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 4A7F _ 55
        mov     ebp, esp                                ; 4A80 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4A82 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4A85 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4A88 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A8B _ 8B. 40, 10
        sub     edx, eax                                ; 4A8E _ 29. C2
        mov     eax, edx                                ; 4A90 _ 89. D0
        pop     ebp                                     ; 4A92 _ 5D
        ret                                             ; 4A93 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 4A94 _ 55
        mov     ebp, esp                                ; 4A95 _ 89. E5
        sub     esp, 16                                 ; 4A97 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 4A9A _ 83. 7D, 08, 00
        jz      ?_279                                   ; 4A9E _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 4AA0 _ 83. 7D, 0C, 00
        jnz     ?_280                                   ; 4AA4 _ 75, 0A
?_279:  mov     eax, 0                                  ; 4AA6 _ B8, 00000000
        jmp     ?_287                                   ; 4AAB _ E9, 0000009B

?_280:  mov     dword [ebp-4H], 0                       ; 4AB0 _ C7. 45, FC, 00000000
        jmp     ?_283                                   ; 4AB7 _ EB, 25

?_281:  mov     edx, dword [ebp-4H]                     ; 4AB9 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4ABC _ 8B. 45, 08
        add     eax, edx                                ; 4ABF _ 01. D0
        movzx   edx, byte [eax]                         ; 4AC1 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 4AC4 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 4AC7 _ 8B. 45, 0C
        add     eax, ecx                                ; 4ACA _ 01. C8
        movzx   eax, byte [eax]                         ; 4ACC _ 0F B6. 00
        cmp     dl, al                                  ; 4ACF _ 38. C2
        jz      ?_282                                   ; 4AD1 _ 74, 07
        mov     eax, 0                                  ; 4AD3 _ B8, 00000000
        jmp     ?_287                                   ; 4AD8 _ EB, 71

?_282:  add     dword [ebp-4H], 1                       ; 4ADA _ 83. 45, FC, 01
?_283:  mov     edx, dword [ebp-4H]                     ; 4ADE _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4AE1 _ 8B. 45, 08
        add     eax, edx                                ; 4AE4 _ 01. D0
        movzx   eax, byte [eax]                         ; 4AE6 _ 0F B6. 00
        test    al, al                                  ; 4AE9 _ 84. C0
        jz      ?_284                                   ; 4AEB _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 4AED _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4AF0 _ 8B. 45, 0C
        add     eax, edx                                ; 4AF3 _ 01. D0
        movzx   eax, byte [eax]                         ; 4AF5 _ 0F B6. 00
        test    al, al                                  ; 4AF8 _ 84. C0
        jnz     ?_281                                   ; 4AFA _ 75, BD
?_284:  mov     edx, dword [ebp-4H]                     ; 4AFC _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4AFF _ 8B. 45, 08
        add     eax, edx                                ; 4B02 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B04 _ 0F B6. 00
        test    al, al                                  ; 4B07 _ 84. C0
        jnz     ?_285                                   ; 4B09 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 4B0B _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4B0E _ 8B. 45, 0C
        add     eax, edx                                ; 4B11 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B13 _ 0F B6. 00
        test    al, al                                  ; 4B16 _ 84. C0
        jz      ?_285                                   ; 4B18 _ 74, 07
        mov     eax, 0                                  ; 4B1A _ B8, 00000000
        jmp     ?_287                                   ; 4B1F _ EB, 2A

?_285:  mov     edx, dword [ebp-4H]                     ; 4B21 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4B24 _ 8B. 45, 08
        add     eax, edx                                ; 4B27 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B29 _ 0F B6. 00
        test    al, al                                  ; 4B2C _ 84. C0
        jz      ?_286                                   ; 4B2E _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 4B30 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4B33 _ 8B. 45, 0C
        add     eax, edx                                ; 4B36 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B38 _ 0F B6. 00
        test    al, al                                  ; 4B3B _ 84. C0
        jz      ?_286                                   ; 4B3D _ 74, 07
        mov     eax, 0                                  ; 4B3F _ B8, 00000000
        jmp     ?_287                                   ; 4B44 _ EB, 05

?_286:  mov     eax, 1                                  ; 4B46 _ B8, 00000001
?_287:  leave                                           ; 4B4B _ C9
        ret                                             ; 4B4C _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 4B4D _ 55
        mov     ebp, esp                                ; 4B4E _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 4B50 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_288                                   ; 4B57 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4B59 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 4B60 _ 8B. 45, 0C
        shr     eax, 12                                 ; 4B63 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4B66 _ 89. 45, 0C
?_288:  mov     eax, dword [ebp+0CH]                    ; 4B69 _ 8B. 45, 0C
        mov     edx, eax                                ; 4B6C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4B6E _ 8B. 45, 08
        mov     word [eax], dx                          ; 4B71 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4B74 _ 8B. 45, 10
        mov     edx, eax                                ; 4B77 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4B79 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4B7C _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4B80 _ 8B. 45, 10
        sar     eax, 16                                 ; 4B83 _ C1. F8, 10
        mov     edx, eax                                ; 4B86 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4B88 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4B8B _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4B8E _ 8B. 45, 14
        mov     edx, eax                                ; 4B91 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4B93 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 4B96 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 4B99 _ 8B. 45, 0C
        shr     eax, 16                                 ; 4B9C _ C1. E8, 10
        and     eax, 0FH                                ; 4B9F _ 83. E0, 0F
        mov     edx, eax                                ; 4BA2 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4BA4 _ 8B. 45, 14
        sar     eax, 8                                  ; 4BA7 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4BAA _ 83. E0, F0
        or      eax, edx                                ; 4BAD _ 09. D0
        mov     edx, eax                                ; 4BAF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4BB1 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4BB4 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 4BB7 _ 8B. 45, 10
        shr     eax, 24                                 ; 4BBA _ C1. E8, 18
        mov     edx, eax                                ; 4BBD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4BBF _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4BC2 _ 88. 50, 07
        nop                                             ; 4BC5 _ 90
        pop     ebp                                     ; 4BC6 _ 5D
        ret                                             ; 4BC7 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 4BC8 _ 55
        mov     ebp, esp                                ; 4BC9 _ 89. E5
        mov     eax, dword [taskctl]                    ; 4BCB _ A1, 000022E8(d)
        pop     ebp                                     ; 4BD0 _ 5D
        ret                                             ; 4BD1 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 4BD2 _ 55
        mov     ebp, esp                                ; 4BD3 _ 89. E5
        sub     esp, 16                                 ; 4BD5 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4BD8 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 4BDE _ 8B. 55, 08
        mov     eax, edx                                ; 4BE1 _ 89. D0
        shl     eax, 2                                  ; 4BE3 _ C1. E0, 02
        add     eax, edx                                ; 4BE6 _ 01. D0
        shl     eax, 2                                  ; 4BE8 _ C1. E0, 02
        add     eax, ecx                                ; 4BEB _ 01. C8
        add     eax, 8                                  ; 4BED _ 83. C0, 08
        mov     dword [eax], 0                          ; 4BF0 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4BF6 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 4BFC _ 8B. 55, 08
        mov     eax, edx                                ; 4BFF _ 89. D0
        shl     eax, 2                                  ; 4C01 _ C1. E0, 02
        add     eax, edx                                ; 4C04 _ 01. D0
        shl     eax, 2                                  ; 4C06 _ C1. E0, 02
        add     eax, ecx                                ; 4C09 _ 01. C8
        add     eax, 12                                 ; 4C0B _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4C0E _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4C14 _ C7. 45, FC, 00000000
        jmp     ?_290                                   ; 4C1B _ EB, 21

?_289:  mov     ecx, dword [taskctl]                    ; 4C1D _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4C23 _ 8B. 55, FC
        mov     eax, edx                                ; 4C26 _ 89. D0
        add     eax, eax                                ; 4C28 _ 01. C0
        add     eax, edx                                ; 4C2A _ 01. D0
        shl     eax, 3                                  ; 4C2C _ C1. E0, 03
        add     eax, ecx                                ; 4C2F _ 01. C8
        add     eax, 16                                 ; 4C31 _ 83. C0, 10
        mov     dword [eax], 0                          ; 4C34 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4C3A _ 83. 45, FC, 01
?_290:  cmp     dword [ebp-4H], 2                       ; 4C3E _ 83. 7D, FC, 02
        jle     ?_289                                   ; 4C42 _ 7E, D9
        leave                                           ; 4C44 _ C9
        ret                                             ; 4C45 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4C46 _ 55
        mov     ebp, esp                                ; 4C47 _ 89. E5
        sub     esp, 40                                 ; 4C49 _ 83. EC, 28
        call    get_addr_gdt                            ; 4C4C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4C51 _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 4C54 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 4C5C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C5F _ 89. 04 24
        call    memman_alloc_4k                         ; 4C62 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 4C67 _ A3, 000022E8(d)
        mov     dword [ebp-14H], 0                      ; 4C6C _ C7. 45, EC, 00000000
        jmp     ?_292                                   ; 4C73 _ E9, 00000085

?_291:  mov     edx, dword [taskctl]                    ; 4C78 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 4C7E _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4C81 _ 69. C0, 00000094
        add     eax, edx                                ; 4C87 _ 01. D0
        add     eax, 72                                 ; 4C89 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4C8C _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4C92 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 4C98 _ 8B. 45, EC
        add     eax, 7                                  ; 4C9B _ 83. C0, 07
        lea     edx, [eax*8]                            ; 4C9E _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4CA5 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4CA8 _ 69. C0, 00000094
        add     eax, ecx                                ; 4CAE _ 01. C8
        add     eax, 68                                 ; 4CB0 _ 83. C0, 44
        mov     dword [eax], edx                        ; 4CB3 _ 89. 10
        mov     eax, dword [taskctl]                    ; 4CB5 _ A1, 000022E8(d)
        mov     edx, dword [ebp-14H]                    ; 4CBA _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4CBD _ 69. D2, 00000094
        add     edx, 96                                 ; 4CC3 _ 83. C2, 60
        add     eax, edx                                ; 4CC6 _ 01. D0
        add     eax, 16                                 ; 4CC8 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4CCB _ 8B. 55, EC
        add     edx, 7                                  ; 4CCE _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 4CD1 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4CD8 _ 8B. 55, F0
        add     edx, ecx                                ; 4CDB _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4CDD _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4CE5 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4CE9 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4CF1 _ 89. 14 24
        call    set_segmdesc                            ; 4CF4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4CF9 _ 83. 45, EC, 01
?_292:  cmp     dword [ebp-14H], 4                      ; 4CFD _ 83. 7D, EC, 04
        jle     ?_291                                   ; 4D01 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4D07 _ C7. 45, EC, 00000000
        jmp     ?_294                                   ; 4D0E _ EB, 0F

?_293:  mov     eax, dword [ebp-14H]                    ; 4D10 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4D13 _ 89. 04 24
        call    init_task_level                         ; 4D16 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4D1B _ 83. 45, EC, 01
?_294:  cmp     dword [ebp-14H], 2                      ; 4D1F _ 83. 7D, EC, 02
        jle     ?_293                                   ; 4D23 _ 7E, EB
        call    task_alloc                              ; 4D25 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4D2A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4D2D _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4D30 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4D37 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4D3A _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4D41 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4D44 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4D4B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4D4E _ 89. 04 24
        call    task_add                                ; 4D51 _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 4D56 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4D5B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4D5E _ 8B. 00
        mov     dword [esp], eax                        ; 4D60 _ 89. 04 24
        call    load_tr                                 ; 4D63 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4D68 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4D6D _ A3, 000022E4(d)
        mov     eax, dword [ebp-0CH]                    ; 4D72 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4D75 _ 8B. 40, 08
        mov     edx, eax                                ; 4D78 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4D7A _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 4D7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4D83 _ 89. 04 24
        call    timer_settime                           ; 4D86 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4D8B _ 8B. 45, F4
        leave                                           ; 4D8E _ C9
        ret                                             ; 4D8F _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4D90 _ 55
        mov     ebp, esp                                ; 4D91 _ 89. E5
        sub     esp, 16                                 ; 4D93 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4D96 _ C7. 45, F8, 00000000
        jmp     ?_297                                   ; 4D9D _ E9, 00000100

?_295:  mov     edx, dword [taskctl]                    ; 4DA2 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-8H]                     ; 4DA8 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4DAB _ 69. C0, 00000094
        add     eax, edx                                ; 4DB1 _ 01. D0
        add     eax, 72                                 ; 4DB3 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4DB6 _ 8B. 00
        test    eax, eax                                ; 4DB8 _ 85. C0
        jne     ?_296                                   ; 4DBA _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 4DC0 _ A1, 000022E8(d)
        mov     edx, dword [ebp-8H]                     ; 4DC5 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4DC8 _ 69. D2, 00000094
        add     edx, 64                                 ; 4DCE _ 83. C2, 40
        add     eax, edx                                ; 4DD1 _ 01. D0
        add     eax, 4                                  ; 4DD3 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4DD6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4DD9 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4DDC _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4DE3 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4DE6 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4DED _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4DF0 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4DF7 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4DFA _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E01 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4E04 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E0B _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4E0E _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E15 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4E18 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 4E1F _ 8B. 45, F8
        add     eax, 1                                  ; 4E22 _ 83. C0, 01
        shl     eax, 9                                  ; 4E25 _ C1. E0, 09
        mov     edx, eax                                ; 4E28 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4E2A _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4E2D _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4E30 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4E33 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E3A _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4E3D _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E44 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4E47 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E4E _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4E51 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E5B _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4E5E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E68 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4E6B _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E75 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 4E78 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E7F _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4E82 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4E8C _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4E8F _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4E99 _ 8B. 45, FC
        jmp     ?_298                                   ; 4E9C _ EB, 13

?_296:  add     dword [ebp-8H], 1                       ; 4E9E _ 83. 45, F8, 01
?_297:  cmp     dword [ebp-8H], 4                       ; 4EA2 _ 83. 7D, F8, 04
        jle     ?_295                                   ; 4EA6 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 4EAC _ B8, 00000000
?_298:  leave                                           ; 4EB1 _ C9
        ret                                             ; 4EB2 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4EB3 _ 55
        mov     ebp, esp                                ; 4EB4 _ 89. E5
        sub     esp, 24                                 ; 4EB6 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4EB9 _ 83. 7D, 0C, 00
        jns     ?_299                                   ; 4EBD _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4EBF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4EC2 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4EC5 _ 89. 45, 0C
?_299:  cmp     dword [ebp+10H], 0                      ; 4EC8 _ 83. 7D, 10, 00
        jle     ?_300                                   ; 4ECC _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4ECE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4ED1 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4ED4 _ 89. 50, 08
?_300:  mov     eax, dword [ebp+8H]                     ; 4ED7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4EDA _ 8B. 40, 04
        cmp     eax, 2                                  ; 4EDD _ 83. F8, 02
        jnz     ?_301                                   ; 4EE0 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4EE2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4EE5 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4EE8 _ 3B. 45, 0C
        jz      ?_301                                   ; 4EEB _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4EED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4EF0 _ 89. 04 24
        call    task_remove                             ; 4EF3 _ E8, FFFFFFFC(rel)
?_301:  mov     eax, dword [ebp+8H]                     ; 4EF8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4EFB _ 8B. 40, 04
        cmp     eax, 2                                  ; 4EFE _ 83. F8, 02
        jz      ?_302                                   ; 4F01 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4F03 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4F06 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4F09 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4F0C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F0F _ 89. 04 24
        call    task_add                                ; 4F12 _ E8, FFFFFFFC(rel)
?_302:  mov     eax, dword [taskctl]                    ; 4F17 _ A1, 000022E8(d)
        mov     dword [eax+4H], 1                       ; 4F1C _ C7. 40, 04, 00000001
        nop                                             ; 4F23 _ 90
        leave                                           ; 4F24 _ C9
        ret                                             ; 4F25 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4F26 _ 55
        mov     ebp, esp                                ; 4F27 _ 89. E5
        sub     esp, 40                                 ; 4F29 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 4F2C _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4F32 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4F37 _ 8B. 10
        mov     eax, edx                                ; 4F39 _ 89. D0
        shl     eax, 2                                  ; 4F3B _ C1. E0, 02
        add     eax, edx                                ; 4F3E _ 01. D0
        shl     eax, 2                                  ; 4F40 _ C1. E0, 02
        add     eax, ecx                                ; 4F43 _ 01. C8
        add     eax, 8                                  ; 4F45 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4F48 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4F4B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4F4E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4F51 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4F54 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4F58 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4F5B _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4F5E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4F61 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4F64 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4F67 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4F6A _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4F6D _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4F70 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4F73 _ 8B. 00
        cmp     edx, eax                                ; 4F75 _ 39. C2
        jnz     ?_303                                   ; 4F77 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4F79 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4F7C _ C7. 40, 04, 00000000
?_303:  mov     eax, dword [taskctl]                    ; 4F83 _ A1, 000022E8(d)
        mov     eax, dword [eax+4H]                     ; 4F88 _ 8B. 40, 04
        test    eax, eax                                ; 4F8B _ 85. C0
        jz      ?_304                                   ; 4F8D _ 74, 24
        call    task_switchsub                          ; 4F8F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 4F94 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4F9A _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4F9F _ 8B. 10
        mov     eax, edx                                ; 4FA1 _ 89. D0
        shl     eax, 2                                  ; 4FA3 _ C1. E0, 02
        add     eax, edx                                ; 4FA6 _ 01. D0
        shl     eax, 2                                  ; 4FA8 _ C1. E0, 02
        add     eax, ecx                                ; 4FAB _ 01. C8
        add     eax, 8                                  ; 4FAD _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4FB0 _ 89. 45, EC
?_304:  mov     eax, dword [ebp-14H]                    ; 4FB3 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4FB6 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4FB9 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4FBC _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4FC0 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4FC3 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4FC6 _ 8B. 40, 08
        mov     edx, eax                                ; 4FC9 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4FCB _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 4FD0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4FD4 _ 89. 04 24
        call    timer_settime                           ; 4FD7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4FDC _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4FDF _ 3B. 45, F0
        jz      ?_305                                   ; 4FE2 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4FE4 _ 83. 7D, F4, 00
        jz      ?_305                                   ; 4FE8 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4FEA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4FED _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4FEF _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4FF3 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4FFA _ E8, FFFFFFFC(rel)
?_305:  nop                                             ; 4FFF _ 90
        leave                                           ; 5000 _ C9
        ret                                             ; 5001 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5002 _ 55
        mov     ebp, esp                                ; 5003 _ 89. E5
        sub     esp, 40                                 ; 5005 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 5008 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 500F _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5016 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5019 _ 8B. 40, 04
        cmp     eax, 2                                  ; 501C _ 83. F8, 02
        jnz     ?_306                                   ; 501F _ 75, 51
        call    task_now                                ; 5021 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5026 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 5029 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 502C _ 89. 04 24
        call    task_remove                             ; 502F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 5034 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 503B _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 503E _ 3B. 45, F4
        jnz     ?_306                                   ; 5041 _ 75, 2F
        call    task_switchsub                          ; 5043 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5048 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 504D _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5050 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5057 _ 83. 7D, F4, 00
        jz      ?_306                                   ; 505B _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 505D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5060 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5062 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5066 _ C7. 04 24, 00000000
        call    farjmp                                  ; 506D _ E8, FFFFFFFC(rel)
?_306:  mov     eax, dword [ebp-10H]                    ; 5072 _ 8B. 45, F0
        leave                                           ; 5075 _ C9
        ret                                             ; 5076 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5077 _ 55
        mov     ebp, esp                                ; 5078 _ 89. E5
        sub     esp, 16                                 ; 507A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 507D _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 5083 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 5088 _ 8B. 10
        mov     eax, edx                                ; 508A _ 89. D0
        shl     eax, 2                                  ; 508C _ C1. E0, 02
        add     eax, edx                                ; 508F _ 01. D0
        shl     eax, 2                                  ; 5091 _ C1. E0, 02
        add     eax, ecx                                ; 5094 _ 01. C8
        add     eax, 8                                  ; 5096 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5099 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 509C _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 509F _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 50A2 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 50A5 _ 8B. 44 90, 08
        leave                                           ; 50A9 _ C9
        ret                                             ; 50AA _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 50AB _ 55
        mov     ebp, esp                                ; 50AC _ 89. E5
        sub     esp, 16                                 ; 50AE _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 50B1 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 50B7 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 50BA _ 8B. 50, 0C
        mov     eax, edx                                ; 50BD _ 89. D0
        shl     eax, 2                                  ; 50BF _ C1. E0, 02
        add     eax, edx                                ; 50C2 _ 01. D0
        shl     eax, 2                                  ; 50C4 _ C1. E0, 02
        add     eax, ecx                                ; 50C7 _ 01. C8
        add     eax, 8                                  ; 50C9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 50CC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 50CF _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 50D2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 50D4 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 50D7 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 50DA _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 50DE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 50E1 _ 8B. 00
        lea     edx, [eax+1H]                           ; 50E3 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 50E6 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 50E9 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 50EB _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 50EE _ C7. 40, 04, 00000002
        nop                                             ; 50F5 _ 90
        leave                                           ; 50F6 _ C9
        ret                                             ; 50F7 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 50F8 _ 55
        mov     ebp, esp                                ; 50F9 _ 89. E5
        sub     esp, 16                                 ; 50FB _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 50FE _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 5104 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5107 _ 8B. 50, 0C
        mov     eax, edx                                ; 510A _ 89. D0
        shl     eax, 2                                  ; 510C _ C1. E0, 02
        add     eax, edx                                ; 510F _ 01. D0
        shl     eax, 2                                  ; 5111 _ C1. E0, 02
        add     eax, ecx                                ; 5114 _ 01. C8
        add     eax, 8                                  ; 5116 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5119 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 511C _ C7. 45, F8, 00000000
        jmp     ?_309                                   ; 5123 _ EB, 23

?_307:  mov     eax, dword [ebp-4H]                     ; 5125 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5128 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 512B _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 512F _ 3B. 45, 08
        jnz     ?_308                                   ; 5132 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5134 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5137 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 513A _ C7. 44 90, 08, 00000000
        jmp     ?_310                                   ; 5142 _ EB, 0E

?_308:  add     dword [ebp-8H], 1                       ; 5144 _ 83. 45, F8, 01
?_309:  mov     eax, dword [ebp-4H]                     ; 5148 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 514B _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 514D _ 3B. 45, F8
        jg      ?_307                                   ; 5150 _ 7F, D3
?_310:  mov     eax, dword [ebp-4H]                     ; 5152 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5155 _ 8B. 00
        lea     edx, [eax-1H]                           ; 5157 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 515A _ 8B. 45, FC
        mov     dword [eax], edx                        ; 515D _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 515F _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5162 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5165 _ 3B. 45, F8
        jle     ?_311                                   ; 5168 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 516A _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 516D _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5170 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5173 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5176 _ 89. 50, 04
?_311:  mov     eax, dword [ebp-4H]                     ; 5179 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 517C _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 517F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5182 _ 8B. 00
        cmp     edx, eax                                ; 5184 _ 39. C2
        jl      ?_312                                   ; 5186 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5188 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 518B _ C7. 40, 04, 00000000
?_312:  mov     eax, dword [ebp+8H]                     ; 5192 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5195 _ C7. 40, 04, 00000001
        jmp     ?_314                                   ; 519C _ EB, 1B

?_313:  mov     eax, dword [ebp-8H]                     ; 519E _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 51A1 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 51A4 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 51A7 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 51AB _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 51AE _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 51B1 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 51B5 _ 83. 45, F8, 01
?_314:  mov     eax, dword [ebp-4H]                     ; 51B9 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 51BC _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 51BE _ 3B. 45, F8
        jg      ?_313                                   ; 51C1 _ 7F, DB
        nop                                             ; 51C3 _ 90
        leave                                           ; 51C4 _ C9
        ret                                             ; 51C5 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 51C6 _ 55
        mov     ebp, esp                                ; 51C7 _ 89. E5
        sub     esp, 16                                 ; 51C9 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 51CC _ C7. 45, FC, 00000000
        jmp     ?_317                                   ; 51D3 _ EB, 24

?_315:  mov     ecx, dword [taskctl]                    ; 51D5 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 51DB _ 8B. 55, FC
        mov     eax, edx                                ; 51DE _ 89. D0
        shl     eax, 2                                  ; 51E0 _ C1. E0, 02
        add     eax, edx                                ; 51E3 _ 01. D0
        shl     eax, 2                                  ; 51E5 _ C1. E0, 02
        add     eax, ecx                                ; 51E8 _ 01. C8
        add     eax, 8                                  ; 51EA _ 83. C0, 08
        mov     eax, dword [eax]                        ; 51ED _ 8B. 00
        test    eax, eax                                ; 51EF _ 85. C0
        jle     ?_316                                   ; 51F1 _ 7E, 02
        jmp     ?_318                                   ; 51F3 _ EB, 0A

?_316:  add     dword [ebp-4H], 1                       ; 51F5 _ 83. 45, FC, 01
?_317:  cmp     dword [ebp-4H], 2                       ; 51F9 _ 83. 7D, FC, 02
        jle     ?_315                                   ; 51FD _ 7E, D6
?_318:  mov     eax, dword [taskctl]                    ; 51FF _ A1, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 5204 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5207 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5209 _ A1, 000022E8(d)
        mov     dword [eax+4H], 0                       ; 520E _ C7. 40, 04, 00000000
        leave                                           ; 5215 _ C9
        ret                                             ; 5216 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5217 _ 55
        mov     ebp, esp                                ; 5218 _ 89. E5
        sub     esp, 24                                 ; 521A _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 521D _ 8B. 45, 10
        movzx   eax, al                                 ; 5220 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5223 _ 8B. 55, 0C
        add     edx, 16                                 ; 5226 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 5229 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 522D _ 89. 14 24
        call    fifo8_put                               ; 5230 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 5235 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5238 _ 89. 04 24
        call    task_sleep                              ; 523B _ E8, FFFFFFFC(rel)
        leave                                           ; 5240 _ C9
        ret                                             ; 5241 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_319:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_320:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_321:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_322:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_323:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_324:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_325:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_326:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_327:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_328:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 003A _ mem.

?_329:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 003E _ cls.

?_330:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0042 _ hlt.

?_331:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0046 _ dir.

?_332:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 004A _ page is:
        db 20H, 00H                                     ; 0052 _  .

?_333:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0054 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 005C _ L: .

?_334:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0060 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0068 _ H: .

?_335:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 006C _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0074 _ w: .

?_336:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0078 _ INT OC.

?_337:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 007F _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0087 _ ception.

?_338:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 008F _ EIP = .

?_339:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 0096 _ INT 0D .

?_340:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 009E _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00A6 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00AE _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00B6 _ ion.


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

?_341:  db 00H                                          ; 0112 _ .

?_342:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0118 _ 29 0 

table_rgb.2026:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2073:                                            ; byte
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

closebtn.2192:                                          ; byte
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

key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

g_Console:                                              ; byte
        resd    1                                       ; 0008

?_343:  resd    1                                       ; 000C

?_344:  resd    1                                       ; 0010

?_345:  resd    1                                       ; 0014

?_346:  resb    1                                       ; 0018

?_347:  resb    3                                       ; 0019

bootInfo:                                               ; qword
        resb    4                                       ; 001C

?_348:  resw    1                                       ; 0020

?_349:  resw    1                                       ; 0022

keyinfo:                                                ; byte
        resb    24                                      ; 0024

?_350:  resd    1                                       ; 003C

mouseinfo:                                              ; byte
        resb    32                                      ; 0040

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_351:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  7                                       ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

task_cons:                                              ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

buffer:                                                 ; byte
        resd    1                                       ; 0278

?_352:  resd    1                                       ; 027C

?_353:  resd    1                                       ; 0280

task_a.1797:                                            ; dword
        resd    7                                       ; 0284

tss_a.1796:                                             ; byte
        resb    128                                     ; 02A0

tss_b.1795:                                             ; byte
        resb    104                                     ; 0320

task_b.1785:                                            ; byte
        resb    12                                      ; 0388

str.2121:                                               ; byte
        resb    1                                       ; 0394

?_354:  resb    9                                       ; 0395

?_355:  resb    2                                       ; 039E

timerctl:                                               ; byte
        resd    2001                                    ; 03A0

task_timer:                                             ; dword
        resd    1                                       ; 22E4

taskctl: resd   1                                       ; 22E8


