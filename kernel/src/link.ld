OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)

SECTIONS {
    . = 1M;

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
    } > ram

    .bss ALIGN(4K) : {
        __bss_end = .;
        *(.bss .bss.* COMMON)
        __bss_end = .;
    } > ram
}
