.intel_syntax noprefix
.globl main

.section .data
    input: .space 100

.section .text
main:
    mov rax, 0
    mov rdi, 0
    lea rsi, [input + rip]
    mov rdx, 100
    syscall

    mov r8, rax
    mov rax, 1
    mov rdi, 1
    lea rsi, [input + rip]
    mov rdx, r8
    syscall
    jmp main

    mov rax, 60
    mov rdi, 0
    syscall

.section .note.GNU-stack,"",@progbits