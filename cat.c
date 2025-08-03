#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <file.*>\n", argv[0]);
        return 1;
    }

    FILE *a;
    a = fopen(argv[1], "r");
    char content[100];

    while (fgets(content, 100, a)) {
        printf("%s", content);
    }
    printf("\n");

    fclose(a);
}