.data
    a: .long 5
    b: .long 6
    c: .long 7
    sir1: .asciz "a este cel mai mic numar.\n" # 26 caractere
    sir2: .asciz "b este cel mai mic numar.\n"
    sir3: .asciz "c este cel mai mic numar.\n"

.text

.globl _start

_start:
    mov a, %eax
    cmp b, %eax 
    jle eta # a <= b
    jg etb # a > b

eta:
    cmp %eax, c
    jle etminc # c <= a
    jg etmina # c > a

etb:    
    mov b, %eax
    cmp %eax, c
    jle etminc # c <= b
    jg etminb # c > b

etmina:
    mov $4, %eax
    mov $1, %ebx
    mov $sir1, %ecx
    mov $27, %edx
    int $0x80

    jmp etexit

etminb:
    mov $4, %eax
    mov $1, %ebx
    mov $sir2, %ecx
    mov $27, %edx
    int $0x80

    jmp etexit

etminc:
    mov $4, %eax
    mov $1, %ebx
    mov $sir3, %ecx
    mov $27, %edx
    int $0x80

    jmp etexit

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80