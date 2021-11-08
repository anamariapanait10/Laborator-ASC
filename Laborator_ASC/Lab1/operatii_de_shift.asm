
.data
	x: .word 30
	y: .word -7
	shl: .space 2
	shr: .space 2
	sal: .space 2
	sar: .space 2
.text
.globl _start

_start:
	mov x, %eax
	mov y, %ebx
	shr $4,%eax
	mov %eax, shr
	shl $4, %ebx
	mov %ebx, shl

	mov x, %eax
	mov y, %ebx
	sal $4, %eax
	mov %eax, sal
	sar $4, %ebx
	mov %ebx, sar

	mov $1, %eax
	mov $0, %ebx
	int $0x80
	 
	
