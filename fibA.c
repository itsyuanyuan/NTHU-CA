#include <stdio.h>

void fib (int num) {
    int f0, f1, f2, i;
    f0 = 0, f1 = 1;
    for (i=2; i<=num; i++) {//f2 is the output!
        f2 = f0 + f1;
        f0 = f1;
        f1 = f2;
    }
    printf("%d\n",f2);
}

int main () {
    int num;
    scanf("%d", &num);
    if (num == 0) {
        printf("0\n");
    } else if (num == 1) {
        printf("1\n");
    } else if (num < 0) {
        printf("Invalid input\n");
    } else {
        fib(num);
    }
    return 0;
}
