.intel_syntax
.section .text
.global _start

_start:
    rdrand %rax
    and %rax, 1
    jz heads
    jmp tails

heads:
    lea %ecx, [head]
    mov %rax, 0
    mov [return], %rax
    jmp print

tails:
    lea %ecx, [tail]
    mov %rax, 1
    mov [return], %rax
    jmp print

print:
    mov %eax, 4
    mov %ebx, 1
    mov %edx, 8
    int 0x80
    jmp exit

exit:
    mov %eax, 1
    mov %ebx, [return]
    int 0x80

.section .data
    head: .asciz "Heads!\n"
    tail: .asciz "Tails!\n"
    return: .word 0
