#include <stdio.h>

int n, a = 1, b = 1, c;

int main(){
    ;// al n-lea termen al sirului Fibonacci, n dat de la tastatura, nu se garanteaza ca e intreg poz


    scanf("%d", &n);

    if( n != (int)n || n < 1)
        printf("Numarul introdus trebuie sa fie intreg strict pozitiv");
    else if(n <= 2)
        printf("%d", 1);
    else {
        __asm__(

            "pusha;"
            "mov $3, %ecx;"

            "etfor:"
                "mov a, %eax;"
                "add b, %eax;"
                "mov %eax, c; # c = a + b"
                "mov b, %eax;"   
                "mov %eax, a; # a = b"
                "mov c, %eax;" 
                "mov %eax, b; # b = c"

                "add $1, %ecx; # cresc contorul"
                
                "cmp n, %ecx; # ma opresc"
                "je etexit; # ecx == n"

                "jmp etfor;"

            "etexit:"
                "popa;"
        );

        printf("%d", c);
        return 0;
    }

    return 0;
}