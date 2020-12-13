#include <stdio.h>
int fib (int num) {
    if (num == 0 )
        return 0;
    else if(num == 1)
        return 1;
    else
        return fib(num-1) +fib(num-2);
}

int main () {
    int num;
    scanf("%d", &num);
    if (num < 0) {
        printf("Invalid input\n");
    } else {
        printf("%d\n",fib(num));
    }
    return 0;
}

