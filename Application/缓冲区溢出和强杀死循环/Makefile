ckernel_temp.asm : ckernel.o app_u.asm
	./objconv -fnasm ckernel.o ckernel_temp.asm

app_u.asm : app.o
	./objconv -fnasm  app.o app_u.asm
app.o : app.c
	gcc -m32 -fno-asynchronous-unwind-tables -fno-stack-protector -s -c -o app.o app.c

ckernel.o : write_vga_desktop.o windows_init.o interrupt.o fifo.o to_hex_str.o memory_util.o windows_sheet.o timer.o multi_task.o file_system.o
	ld -m elf_i386 -r write_vga_desktop.o windows_init.o interrupt.o fifo.o to_hex_str.o memory_util.o windows_sheet.o timer.o multi_task.o file_system.o -o ckernel.o

write_vga_desktop.o:
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c

file_system.o : file_system.c file_system.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o file_system.o file_system.c

multi_task.o : multi_task.c multi_task.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o multi_task.o multi_task.c

timer.o : timer.c timer.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o timer.o timer.c

memory_util.o : memory_util.c memory_util.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o memory_util.o memory_util.c

to_hex_str.o : to_hex_str.c to_hex_str.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o to_hex_str.o to_hex_str.c

fifo.o : fifo.c fifo.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o fifo.o fifo.c 

interrupt.o : interrupt.c interrupt.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o interrupt.o interrupt.c

windows_sheet.o : windows_sheet.c windows_sheet.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o windows_sheet.o windows_sheet.c

windows_init.o : windows_init.c windows_init.h
	gcc -m32 -fno-asynchronous-unwind-tables -fno-stack-protector -s -c -o windows_init.o windows_init.c

clean :
	rm -rf *.o