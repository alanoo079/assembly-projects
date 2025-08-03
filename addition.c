#include <stdio.h>
#include <stdlib.h>

void int_check(int a, int b);

int main() {
    int a;
    int b;
    printf("Num 1: ");
    scanf("%i", &a);
    printf("Num 2: ");
    scanf("%i", &b);
    int_check(a, b);
    printf("Result: ");
    a = a + b;
    printf("%i\n", a);
    return 0;
}

void int_check(int a, int b) {
    if (a + b >= 2147483646) {
        printf("We dont like integar overflows :(\n");
        exit(1);
    }
    return;
}