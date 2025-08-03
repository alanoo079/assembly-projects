.intel_syntax noprefix
.globl main

.section .data
    hello_msg: .ascii "Hello, World!\n"
    hello_len = . - hello_msg

.section .text
main:
    mov rax, 1
    mov rdi, 1
    lea rsi, [hello_msg + rip]
    mov rdx, hello_len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

.section .note.GNU-stack,"",@progbits