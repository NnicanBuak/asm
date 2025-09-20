bits 64

%macro write 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

section .data
    number      dq 7
    even_msg    db "The number is even", 10
    even_len    equ $ - even_msg
    odd_msg     db "The number is odd", 10
    odd_len     equ $ - odd_msg

section .text
    global _start

_start:
    mov rax, [number]
    and rax, 1
    jnz .odd
    write even_msg, even_len
    jmp .exit

.odd:
    write odd_msg, odd_len

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall
