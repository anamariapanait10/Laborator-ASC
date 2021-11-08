.data

.text

.globl _start

_start:
    mov $2318, %ebx
    mov %ebx, %eax
    
etexit:
    mov $4, %eax
    mov $1, %ebx
    int $0x80