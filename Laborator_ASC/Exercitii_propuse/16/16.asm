.data
    n: .long 10
    v: .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    min1: .space 4
    min2: .space 4

.text

.globl _start

_start:

    lea v, %edi

    mov $0, %ecx
    mov (%edi, %ecx, 4), min1 # initializam cu primul elem 
    mov $1, %ecx
    mov (%edi, %ecx, 4), min2 # initializam cu al doilea elem 
    
    mov n, %ecx # initializam contorul pt etloop

    mov min1, %eax
    cmp %eax, min2 # comparam min1 cu min2 si punem in min1 cel mai mic nr
    jl etswap # min2 < min1
    

etswap:
    mov min1, %eax
    mov min2, %ebx
    mov %ebx, min1
    mov %eax, min2

etloop:
    cmp $1, %ecx # terminam bucla mai devreme adica cand ecx ajunge 1
    je etexit

    mov (%edi, %ecx, 4), %eax
    cmp %eax, min1
    jg # min1 > %eax

    cmp %eax, min2
    jg # min2 > %eax

    loop etloop

etmin1:

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80