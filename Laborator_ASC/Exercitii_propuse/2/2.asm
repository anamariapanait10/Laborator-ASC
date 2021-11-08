.data
    less: .asciz "In %eax e un numar negativ.\n" # 28 de caractere fara terminatorul nul
    greater: .asciz "In %eax e un numar pozitiv.\n" # 28 de caractere fara terminatorul nul
    equal: .asciz "In %eax e numarul zero.\n" # 24 de caractere fara terminatorul nul
.text

.globl _start

_start:
    ;// in eax avem un nr intreg, sa se verifice dc e neg, poz sau zero

    mov $27, %eax
    # mov $-16, %eax
    # mov $0, %eax
    
    cmp $0, %eax 
    jl etless # eax < 0
    jg etgreater # eax > 0
    je etequal # eax = 0

etless:
    ;//afisam in consola stringul corespunzator
    mov $4, %eax
    mov $1, %ebx
    mov $less, %ecx
    mov $29, %edx
    int $0x80
    
    jmp etexit

etgreater:
    mov $4, %eax
    mov $1, %ebx
    mov $greater, %ecx
    mov $29, %edx
    int $0x80
    
    jmp etexit

etequal:
    mov $4, %eax
    mov $1, %ebx
    mov $equal, %ecx
    mov $25, %edx
    int $0x80
    
    jmp etexit

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
