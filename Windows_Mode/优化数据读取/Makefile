ckernel_temp.asm : ckernel.o
	./objconv -fnasm ckernel.o ckernel_temp.asm

ckernel.o : write_vga_desktop.o windows_init.o interrupt.o fifo.o to_hex_str.o
	ld -m elf_i386 -r write_vga_desktop.o windows_init.o interrupt.o fifo.o to_hex_str.o -o ckernel.o

write_vga_desktop.o:
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c

to_hex_str.o : to_hex_str.c to_hex_str.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o to_hex_str.o to_hex_str.c

fifo.o : fifo.c fifo.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o fifo.o fifo.c

interrupt.o : interrupt.c interrupt.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o interrupt.o interrupt.c

windows_init.o : windows_init.c windows_init.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o windows_init.o windows_init.c

clean :
	rm -rf *.o