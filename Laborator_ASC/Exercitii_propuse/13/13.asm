.data
    n: .long 5
    v: .long 10, 20, 30, 40, 50
    sum: .long 0
    med: .space 4
.text

.globl _start

_start:
    lea v, %edi
    mov $0, %ecx
    mov (%edi, %ecx, 4), %ebx
    add %ebx, sum # sum = edi + ecx x 4 = primul elem din v = 10
    sub $1, n
    mov n, %ecx

etsum: # ecx ia val de la n - 1 la 0, dar la 0 nu mai intra in bucla
    mov (%edi, %ecx, 4), %ebx
    add %ebx, sum
    loop etsum

etmedie:
    add $1, n # refacem n-ul
    mov $0, %edx
    mov sum, %eax    
    mov n, %ebx
    divl %ebx # sum / n cu catul in eax si restul in edx
    mov %eax, med
etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
