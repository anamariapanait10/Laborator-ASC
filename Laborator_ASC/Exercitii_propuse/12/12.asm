

.data
    n: .long 5
    str1: "Numarul trebuie sa fie intreg si pozitiv"
.text

.globl _start

_start:

    cmp $1, n
    jl # n < 1
    je # afisare 1

    cmp $2, n
    je # afisare 1

    # altfel
    mov n, %ecx

etfor:
    add a, b
    mov b, c # c = a + b
    mov a, b # a = b
    mov b, c # b = c
    loop etfor

    # afisare c
    jmp etexit

etexit:
    mov $4, %eax
    mov $1, %ebx
    int $0x80
 