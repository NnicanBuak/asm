bits 64

section .data
    dividend dq 13
    divisor  dq 5
    line     db "00 / 0 = 0 (0)", 10
    line_len equ $ - line

section .text
    global _start

_start:
    mov rax, [dividend]
    mov rbx, rax
    mov rcx, [divisor]

    mov rax, rbx
    lea rdi, [rel line]
    call store_two_digits

    mov rax, rcx
    add al, '0'
    mov [line + 5], al

    mov rax, rbx
    xor rdx, rdx
    div rcx

    mov bl, al
    add bl, '0'
    mov [line + 9], bl

    mov bl, dl
    add bl, '0'
    mov [line + 12], bl

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel line]
    mov rdx, line_len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

store_two_digits:
    mov r9, 10
    xor rdx, rdx
    div r9
    add dl, '0'
    mov [rdi + 1], dl
    add al, '0'
    cmp al, '0'
    jne .store_tens
    mov byte [rdi], ' '
    ret

.store_tens:
    mov [rdi], al
    ret
