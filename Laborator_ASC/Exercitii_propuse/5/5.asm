.data
    cnt: .long 0
.text

.globl _start

_start:

    ;// nr de biti de 1 din reprez bin a nr din eax

    ;// abordare: Stim ca n & 1 este egal cu 0 daca ultimul bit din reprezentarea binara a nr n este 0
    ;// si 1 daca e 1. Asa ca daca facem asta pt ultimul bit si apoi shiftam spre dreapta cu un bit nr n
    ;// penultimul bit o sa devina ultimul si putem repeta procesul cat timp mai avem biti in reprezentare.
    ;// Daca ne luam un contor putem adauga chiar rezultatul lui n & 1 pt ca o sa il creasca cu unu daca 
    ;// ultimul bit e unu si o sa adauge zero daca e zero (adica nu influenteaza rezultatul).

    ;// codul echivalent in python:
    ;//
    ;// cnt = 0;
    ;// while n: # n e nr din eax
    ;//     cnt = cnt + (n & 1)
    ;//     n = n >> 1
    ;// print("Nr de biti de unu este ", cnt) 

    mov $10, %eax # date de test
    
    jmp etwhile # incepem bucla

etwhile:
    cmp $0, %eax # comparam eax cu 0
    ja etshift # dc eax > 0
    je etexit # dc eax = 0 ne oprim

etshift:
    mov $1, %ebx 
    and %eax, %ebx # avem eax & 1 in ebx

    add %ebx, cnt # adunam la cnt eax & 1

    shr $1, %eax # shiftam la dreapta cu unu

    jmp etwhile # continuam bucla

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80