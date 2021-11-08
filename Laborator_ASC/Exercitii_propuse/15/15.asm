.data
    n: .long 10 # nr de elem din v
    v: .long 6, 1, 2, 6, 3, 6, 4, 5, 6, 3
    max: .space 4
    cnt: .long 0 # contor pe care o sa-l folosesc ca sa retin nr de aparitii a maximului
.text

.globl _start

_start:
    ;// sa se determine maximul si numarul de aparitii al acestuia intr-un array

    lea v, %edi
    
    # initializam max cu primul elem 
    mov $0, %ecx
    movl (%edi, %ecx, 4), %eax
    movl %eax, max 

    movl $1, cnt # nr de ap a lui max este 1

    mov n, %ecx # contor pt etloop
    sub $1, %ecx # punem n - 1 care este indicele ultimului elem

etloop: # parculegem de la final la inceput fara primul elem (adica de la n - 1 la 1)

    # comparam max cu elem cu indice ecx din vector
    movl (%edi, %ecx, 4), %eax
    cmp %eax, max 
    jl etless # dc max < (%edi, %ecx, 4)
    je etequal # dc max = (%edi, %ecx, 4)

    loop etloop

    jmp etexit

etless:
    # actualizam maximul
    movl (%edi, %ecx, 4), %eax
    movl %eax, max 

    movl $1, cnt # resetam contorul

    loop etloop # continuam bucla

etequal:
    add $1, cnt # crestem contorul de aparitii a lui max

    loop etloop

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
   