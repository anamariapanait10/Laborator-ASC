.data
    putere: .long 1
.text

.globl _start

_start:

    ;// cea mai apropiata putere de 2 strict mai mare decat nr din eax

    ;// abordare: cea mai mare putere de 2 strict mai mare decat nr din eax e 
    ;// 2 la puterea nr de biti din reprezentarea binara a nr din eax
    ;// asa ca impart nr din eax la 2 pana devine 0 (prin shiftare pe biti) 
    ;// ca sa aflam cati biti are reprezentarea binara a nr in timp ce 
    ;// calculez intr-o variabila 2 la puterea nr de biti (prin inmultire repetata cu 2)
   
    ;// codul echivalent in python:
    ;// 
    ;// putere = 1
    ;// while n: # n e nr din eax
    ;//     n = n >> 1
    ;//     putere = putere * 2

    mov $10, %eax # date de test

    jmp etwhile # incepem bucla

etwhile:
    cmp $0, %eax # comparam eax cu 0
    ja etshift # daca eax > 0
    je etexit # daca nr a devenit 0 ne oprim
    
etshift:
    shr $1, %eax # shiftam la dreata cu un bit
    
    mov $0, %edx # presupun ca nu e nevoie de mai mult de 32 de biti la inmultire
    mov %eax, %ebx # face o copie a lui eax in ebx ca sa o putem face inmultirea fara sa pierdem valoarea initiala
    mov putere, %eax # punem val putere in eax ca sa o inmultim cu 2
    mov $2, %ecx # luam un registru auxiliar in care punem 2 pt ca nu putem face inmultirea direct cu o constanta
    mull %ecx # inmultim puterea cu 2
    mov %eax, putere # punem val actualizata inapoi in putere
    mov %ebx, %eax # punem la loc valoarea lui eax

    jmp etwhile # continuam bucla

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
