bits 64

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, messageLen
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

section .data
    message db "Hello, World!", 10
    messageLen equ $ - message
