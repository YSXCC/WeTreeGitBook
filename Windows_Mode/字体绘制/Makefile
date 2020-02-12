ckernel_temp.asm : ckernel.o
	./objconv -fnasm ckernel.o ckernel_temp.asm

ckernel.o : write_vga_desktop.o windows_init.o
	ld -m elf_i386 -r write_vga_desktop.o windows_init.o -o ckernel.o

write_vga_desktop.o:
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c

windows_init.o : windows_init.c windows_init.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o windows_init.o windows_init.c

clean :
	rm -rf *.o