.data
    putere: .long 1
    log: .long 0
.text

.globl _start

_start:

    ;// sa se calculeze [log2 eax]

    ;//abordare: calculam cea mai mare putere a lui 2 mai mica decat nr din eax
    ;// si retinem puterea intr-o alta variabila si aceea e rezultatul expresiei

    ;//codul echivalent in python:
    ;//
    ;// putere = 1
    ;// log = 0
    ;// while putere < n: # n este nr din eax
    ;//     putere = putere * 2
    ;//     log += 1
    ;//
    ;// if putere > n: # pentru ca puterea a depasit n trebuie sa o impartim cu 2 echivalent cu a scadea unu din putere
    ;//     log -= 1
    ;//
    ;// print(log)

    mov $17, %eax # date de test

    jmp etwhile    


etwhile:
    cmp %eax, putere # comparam puterea cu eax
    jb etcalculate # dc putere < eax
    jae etresult # dc putere >= eax


etcalculate:
    mov %eax, %ecx # copie a lui eax in ecx pt ca avem nevoie de eax pt inmultire

    mov $2, %ebx # ebx este reg auxiliar pt a face inmultirea cu 2
    mov putere, %eax # punem puterea in eax
    mull %ebx # inmultim puterea cu 2
    mov %eax, putere # punem rezultatul inmultirii in putere
    
    mov %ecx, %eax # punem valoarea lui eax inapoi

    add $1, log # adunam unu la log

    jmp etwhile # continuam bucla


etresult:
    cmp %eax, putere
    ja etsub # dc putere > eax
    
    jmp etexit


etsub:
    sub $1, log

    jmp etexit


etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80