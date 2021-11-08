.data
	x: .word 10
.text

.globl _start

_start:
	
	;// cerinta a: EAX <- EAX&1
	and $1, %eax
	
	;// cerinta b: EAX <- EAX ^ EAX
	xor %eax, %eax

	;//cerinta c: EAX <- (EAX^EBX)^EBX
	xor %ebx, %eax
	xor %eax, %ebx
	mov %ebx, %eax

	;//cerinta d: EAX <- EAX & (EAX - 1)
	mov %eax, %ebx
	sub $1, %eax 
	and %ebx, %eax
	
	;//cerinta e: EAX <- (EAX & ~EBX) | (~EAX & EBX )
	mov %eax, %edx # copie a lui eax in edx
	mov %ebx, %ecx # copie a lui ebx in ecx

	not %eax
	and %ebx, %eax
	
	mov %ecx, %ebx
	not %ebx
	and %edx, %ebx

	or %ebx, %eax

	;//cerinta f: EAX <- (EAX & ~EAX) | (~EBX & EBX)
	mov %eax, %edx # copie a lui eax in edx
	mov %ebx, %ecx # copie a lui ebx in ecx

	not %ebx
	and %ecx, %ebx

	not %eax
	and %edx, %eax

	or %ebx, %eax

	;//cerinta g: EAX <- (EAX | ~EBX) & (~EAX & EBX)
	mov %eax, %edx # copie a lui eax in edx
	mov %ebx, %ecx # copie a lui ebx in ecx

	not %eax
	and %ebx, %eax

	not %ebx
	or %edx, %ebx

	and %ebx, %eax

	;//cerinta h: EAX <- (EAX | ~EAX) & (~EBX | EBX)
	mov %eax, %edx # copie a lui eax in edx
	mov %ebx, %ecx # copie a lui ebx in ecx

	not %eax
	or %edx, %eax

	not %ebx
	or %ecx, %ebx

	and %ebx, %eax

	;//cerinta i: EAX <- EBX ^ ((EAX ^ EBX) & -(EAX < EBX))


	;//cerinta j: EAX <- EAX ^ ((EAX ^ EBX) & -(EAX < EBX))

	;//cerinta k: ECX <- EAX + EBX - ECX
	add %ebx, %eax
	sub %ecx, %eax

	;//cerinta l: EBX <- ((EAX x 2 + EBX) x 2 + ECX) / 2
	
	mov $2, x
	imul x # eax x 2
	add %ebx, %eax # eax x 2 + ebx
	imul x
	add %ecx, %eax

	mov $0, %edx # impartire pe mai putin de 32 de biti
	idiv x

	mov %eax, %ebx

	;//cerinta m: EAX <- (EAX + EBX + ECX) x 16
	add %ebx, %eax
	add %ecx, %eax

	mov $16, x
	mul x

	;//cerinta n: ECX <- (EAX / 16) + (EBX x 16)
	mov $0, %edx # impartire pe mai putin de 32 de biti
	mov $16, x
	div x

	mov %eax, %ecx

	mov %ebx, %eax
	mul %x

	add %eax, %ecx

	;//cerinta o: ECX <- (EAX & 0xFF00) + (EBX & 0x00FF)
	and $0xFF00, %eax
	and $0x00FF, %ebx
	add %ebx, %eax
	mov %eax, %ecx 

	;//cerinta p: EAX <- (EAX + EBX) / (EAX + ECX)
	add %eax, %ecx
	add %ebx, %eax

	mov $0, %edx # impartire pe mai putin de 32 de biti
	div %ecx

	;//cerinta q: EAX <- (EAX x EBX) / (ECX^2)
	mov $0, %edx
	mul %ebx
	mov %eax, %ebx # am calculat eax x ebx si pastra rezultatul in ebx

	mov %ecx, %eax 
	mul %ecx # am calculat ecx x ecx in eax
	
	mov %eax, %ecx 
	mov %ebx, %eax
	div %ecx

	;//cerinta r: EAX <- EAX x ((EAX + EBX) / ECX + 1)
	mov %eax, %edx # copie a lui eax in edx
	add %ebx, %eax

	mov $0, %edx
	div %ecx

	add $1, %eax

	mov %eax, %ecx 
	mov %edx, %eax
	mul %ecx

	;//cerinta s: EAX <- 1 + EAX + EAX^2 / 2 + EAX^3 / 6 + EAX ^ 4 / 24 + ...



	

