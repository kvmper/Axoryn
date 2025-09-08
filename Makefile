ISO = build/axoryn.iso
KERNEL = build/bin/kernel.bin
OBJS = build/obj/common.o build/obj/video.o build/obj/kernel.o build/obj/boot.o
CFLAGS = -Iinclude -ffreestanding

$(KERNEL): $(OBJS)
	ld -m elf_i386 -T kernel/src/link.ld -o $@ $^

build/obj/boot.o: kernel/src/asm/boot/boot.s
	mkdir -p build/obj
	nasm -f elf32 $< -o $@

build/obj/kernel.o: kernel/src/c/kernel.c
	gcc -m32 $(CFLAGS) -fno-stack-protector -c $< -o $@

build/obj/common.o: kernel/src/c/common.c
	gcc -m32 $(CFLAGS) -fno-stack-protector -c $< -o $@

build/obj/video.o: kernel/src/c/video.c
	gcc -m32 $(CFLAGS) -fno-stack-protector -c $< -o $@


build: $(ISO)
$(ISO): $(KERNEL)
	mkdir -p build/bin
	grub-mkrescue -o $@ build

run: $(ISO)
	qemu-system-i386 -cdrom $<

clean:
	rm -rf build/obj/* build/bin/* build/boot/kernel.elf $(ISO)
