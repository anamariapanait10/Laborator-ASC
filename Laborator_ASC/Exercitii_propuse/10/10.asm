.data
    x: .long 11 # nr pe care il verificam daca e prim
    d: .long 2 # var folosita pt a verifica daca nr de la 2 la radical din x sunt divizori sau nu
    dxd: .space 4 # var folosita pt a calcula patratul var d
    text1: .asciz "Numarul este prim.\n" # are 19 caractere fara terminator
    text2: .asciz "Numarul nu este prim.\n" # are 22 caractere fara terminator
.text

.globl _start

_start:

    ;// sa se verifice dc un nr dat este prim

    cmp $2, x # comparam x cu 2
    jl etnotprime # x < 2 at nu e prim 
    je etprime # x = 2 at e prim 
    jg etverify # x > 2 at trebuie facute verificari

etverify:
    mov $0, %edx
    mov d, %eax
    mov %eax, dxd
    mull dxd # in dxd avem patratul lui d
    mov %eax, dxd

    cmp x, %eax # compara dxd cu x
    jle etfor # dc dxd <= x adica daca d e pana in radical din x
    jg etprime # dc dxd > x inseamna ca e prim

etfor:
    # verificam dc restul impartirii lui x la d e 0
    # daca e inseamna ca d e divizor propriu si x e nr compus
    # altfel continuam sa verificam nr pana in radical din x

    mov $0, %edx
    mov x, %eax
    divl d # x : d cu catul in %eax si restul in %edx

    cmp $0, %edx # comparam catul cu 0
    je etnotprime
    
    add $1, d # crestem d-ul si continuam verificarea
    jmp etverify

etprime:
    ;// afisam textul care spune ca x e prim 
    mov $4, %eax
    mov $1, %ebx
    mov $text1, %ecx
    mov $20, %edx
    int $0x80

    jmp etexit

etnotprime:
    ;// afisam textul care spune ca x nu e prim 
    mov $4, %eax
    mov $1, %ebx
    mov $text2, %ecx
    mov $23, %edx
    int $0x80

    jmp etexit

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80