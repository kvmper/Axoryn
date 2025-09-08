section .multiboot
    align 4
multiboot_header:
    dd 0x1BADB002
    dd 0x3
    dd -(0x1BADB002 + 0x3)

section .text
    global _start
    extern kernel_main

_start:
    call kernel_main
    cli
.hang:
    hlt
    jmp $
