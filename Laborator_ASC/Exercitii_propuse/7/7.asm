.data
    lung: .long 0
.text

.globl _start

_start:

    ;// dimensiunea celui mai lung sir de biti de 1 din reprez bin a nr din eax

    ;// abordare: Stim ca n & (n >> 1) scade cu unu toate secventele de 1 din reprezentarea binara.
    ;// Asa ca daca aplicam asta de un nr k de ori pana nu mai avem biti de 1 in reprezentare cel mai lung sir
    ;// de biti de 1 este k
    ;// 
    ;// sa luam un exemplu ca sa vedem cum actioneaza expresia de mai sus:
    ;// n               = 01111010 01110110
    ;// n >> 1          = 00111101 00111011
    ;// n & (n >> 1)    = 00111000 00110010 
    ;// observam ca toate secventele de 1 au scazut cu 1 si daca ii atribuim lui n val n & (n >> 1) 
    ;// si repetam procesul o sa aflam cati biti de 1 are cea mai lunga secventa

    ;// codul echivalent in python
    ;//
    ;// lung = 0 
    ;// while n: # n e nr din eax
    ;//     n = n & (n >> 1)
    ;//     lung += 1
    ;// print(lung)

    mov $2234, %eax # 2234 are reprez bin 100010111010

    jmp etwhile

etwhile:
    cmp $0, %eax # comparam eax cu 0
    ja etcalculate # dc eax > 0
    je etexit # dc eax = 0 ne oprim

etcalculate:
    mov %eax, %ebx
    shr $1, %ebx

    and %ebx, %eax
    add $1, lung

    jmp etwhile

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80


