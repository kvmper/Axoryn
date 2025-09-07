/* made with help of https://mcyoung.xyz/2021/06/01/linker-script/ */

OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)

MEMORY {
    rom (rx)   : ORIGIN = 0x00100000, LENGTH = 16M /* adjustable */
    ram (rw!x) : ORIGIN = 0x01100000, LENGTH = 128M
}

SECTIONS {
    . = 1M;
    __kernel_start = .;

    .multiboot : {
        KEEP(*(.multiboot)) /* DO NOT CHANGE */
    }

    .text ALIGN(4K) : {
        __text_start = .;
        *(.text .text.*)
        __text_end = .;
    } > rom

    .rodata ALIGN(4K) : {
        __rodata_start = .;
        *(.rodata .rodata.*)
        __rodata_end = .;
    } > rom

    .data ALIGN(4K) : {
        __data_start = .;
        *(.data .data.*)
        __data_end = .;
    } > ram AT> rom

    .bss ALIGN(4K) : {
        __bss_start = .;
        *(.bss .bss.* COMMON)
        __bss_end = .;
    } > ram

    __kernel_end = .;
}
