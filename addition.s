.intel_syntax noprefix
.globl main

.section .data
    a: .quad 0
    b: .quad 0
    num1: .ascii "Num 1: \0"
    num2: .ascii "Num 2: \0"
    result: .ascii "Result: %ld\n\0"
    fmt: .ascii "%ld\0"

    quit_msg: .ascii "We dont like integar overflows :(\n"
    quit_msg_len = . - quit_msg

.section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    lea rdi, [num1 + rip]
    xor rax, rax
    call printf

    lea rdi, [fmt + rip]
    lea rsi, [a + rip]
    xor rax, rax
    call scanf

    lea rdi, [num2 + rip]
    xor rax, rax
    call printf

    lea rdi, [fmt + rip]
    lea rsi, [b + rip]
    xor rax, rax
    call scanf

    mov rax, [a + rip]
    cmp rax, 2147483646
    jge _quit
    add rax, [b + rip]

    cmp rax, 2147483646
    jge _quit

    lea rdi, [result + rip]
    mov rsi, rax
    xor rax, rax
    call printf

    add rsp, 16
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall

_quit:
    mov rax, 1
    mov rdi, 1
    lea rsi, [quit_msg + rip]
    mov rdx, quit_msg_len
    syscall

    add rsp, 16
    pop rbp
    xor rdi, rdi
    syscall
    mov rax, 60
    mov rdi, 0
    syscall

.section .note.GNU-stack,"",@progbits