; coin flipping program for linux intel x86 GNU as
.intel_syntax
.section .text
.global _start

_start:
    ; read rand value into rax
    rdrand %rax
    ; AND random value with 1
    ; to determine if even or odd
    and %rax, 1
    ; jump to heads if even
    jz heads
    ; jump to heads if odd
    jmp tails

heads:
    ; load text
    lea %ecx, [head]
    ; prepare return code
    mov %rax, 0
    ; save return code
    mov [return], %rax
    ; jump to print
    jmp print

tails:
    ; load text
    lea %ecx, [tail]
    ; prepare return code
    mov %rax, 1
    ; save return code
    mov [return], %rax
    ; jump to print
    jmp print

print:
    ; write syscall
    mov %eax, 4
    ; write to STDOUT
    mov %ebx, 1 # 1 STDOUT, 2 STDIN, 3 STDERR
    ; text length
    mov %edx, 8
    ; interrupt for syscall
    int 0x80
    ; jump to exit
    jmp exit

exit:
    ; exit syscall
    mov %eax, 1
    ; load return code
    mov %ebx, [return]
    ; interrupt for syscall
    int 0x80

.section .data
    head: .asciz "Heads!\n"
    tail: .asciz "Tails!\n"
    return: .word 0
