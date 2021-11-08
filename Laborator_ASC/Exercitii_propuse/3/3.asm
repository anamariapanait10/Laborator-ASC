.data

.text

.globl _start

_start:
    ;// swap (%eax , %ebx) doar cu fct logice 

    mov $10, %eax
    mov $15, %ebx

    xor %ebx, %eax # in eax avem eax ^ ebx
    xor %eax, %ebx # in ebx avem eax ^ ebx ^ ebx = eax 
    xor %ebx, %eax # in eax avem eax ^ ebx ^ eax = ebx

    mov $1, %eax
    mov $0, %ebx
    int $0x80    