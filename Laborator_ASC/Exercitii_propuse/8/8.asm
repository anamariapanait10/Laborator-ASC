.data
    len: .long 0 # numarul de biti din reprez binara
    k: .space 4 # va fi len / 2
    bit1: .space 4 # va fi primul bit din perechea de biti simetici fata de mijloc
    bit2: .space 4 # va fi al doilea bit din perechea de biti simetici fata de mijloc
    text1: .asciz "Numarul din eax este palindrom in reprezentarea binara.\n" # 56 caractere fara terminator
    text2: .asciz "Numarul din eax nu este palindrom in reprezentarea binara.\n" # 59 caractere fara terminator
.text

.globl _start

_start:

    ;// Sa se verifice dc nr din eax este palindrom in reprez binara

    ;// Stim ca n & (1 << (k - 1)) are o val dif de 0 dc al k-lea bit e 1 si 0 daca e 0
    
    mov $29, %eax # 29 are reprez bin 11101, nu e palindrom
    # mov $165, %eax # 165 are reprez bin 10100101, este palindrom

    mov %eax, %ebx # copie a lui eax in ebx

    jmp etlen

etlen:
    cmp $0, %eax
    ja etwhile # eax > 0
    je etfor # eax = 0, am aflat nr de biti si continuam cu verificarea dc e palindrom

etwhile:
  shr $1, %eax
  add $1, len

  jmp etlen

etfor:
    
    # in k punem len / 2
    mov $0, %edx
    mov len, %eax
    mov $2, %ecx
    div %ecx
    mov %eax, k

    mov %ebx, %eax # pun val initiala inapoi in eax
   
    mov k, %ecx # initializez ecx cu k si continua cu etloop
    jmp etloop

etloop:

    mov %ecx, k 
    sub $1, k # in k vom retine ecx - 1 care ne trebuie pt a compara perechile de biti simetrice
    # avem de comparat perechile eax & (1 << (ecx - 1)) cu eax & (1 << (len - ecx))
    # echivalent cu eax & (1 << k) cu eax & (1 << (len - k - 1))

    mov $1, %ebx # ebx e auxiliar pt a face shiftarea lui 1 cu k biti
    mov %ecx, %edx # facem copie la ecx pt ca aparent shl acepta ca prim argument doar constanta sau registrul ecx...
    mov k, %ecx # deci ne punem variabila in ecx
    shl %ecx, %ebx # in ebx avem 1 << k
    mov %edx, %ecx # repunem valoarea contorului
    and %eax, %ebx # eax & (1 << k) in ebx
    mov %ebx, bit1 # pastram val in bit1 pt ca vom avea nevoie de ebx mai incolo

    mov %ecx, %edx # facem din nou copie la ecx pt ca urmeaza sa il folosim pt shl...
    mov len, %ecx # in ecx o sa pun len - k - 1
    sub k, %ecx
    sub $1, %ecx
    mov $1, %ebx # ebx e auxiliar pt a face shiftarea lui 1 cu len - k - 1 biti
    shl %ecx, %ebx # in ebx avem 1 << (len - k - 1)
    and %eax, %ebx # eax & (1 << (len - k - 1)) in ebx
    mov %edx, %ecx # punem la loc val lui ecx
    mov %ebx, bit2

    # dc bit1 si bit2 au val mai mari ca 0 sau sunt ambele 0 at continuam verificarea
    # altfel dc bit1 = 0 si %ebx e mai mare ca 0 sau invers nu e palindrom
    cmp $0, bit1
    je etcmp1

    cmp $0, bit2
    je etcmp2
    
    loop etloop

etcmp1:
    cmp $0, bit2
    ja etstopverifypal # bit2 > 0 at nu e pal pt ca bit1 era 0

    loop etloop

etcmp2:
    cmp $0, bit1
    ja etstopverifypal # bit1 > 0 at nu e pal pt ca bit2 era 0

    loop etloop

etstopverifypal:
    cmp $0, %ecx
    jne etnotpal
    je etpal # inseamna ca s-a terminat natural etfor adica toate perechile de biti simetrice sunt egale

etpal: # afisam in consola ca e palindrom
    mov $4, %eax
    mov $1, %ebx
    mov $text1, %ecx
    mov $57, %edx
    int $0x80

    jmp etexit

etnotpal: # afisam in consola ca nu e palindrom
    mov $4, %eax
    mov $1, %ebx
    mov $text2, %ecx
    mov $60, %edx
    int $0x80

    jmp etexit

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80