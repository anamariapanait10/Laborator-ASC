.data
    fact: .long 1
.text

.globl _start

_start:
    ;// eax <- eax! (eax factorial)
    
    mov $5, %eax

    mov %eax, %ecx
    
etfact:
    mov $0, %edx
    mov fact, %eax
    mull %ecx
    mov %eax, fact
    loop etfact

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80