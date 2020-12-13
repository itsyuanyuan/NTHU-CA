#include <stdio.h>

int fib (int n, int a, int b) {
	if (n ==0)
		return a;
	else
		return fib(n-1, b, a+b);//save value  in (a+b)

}

int main () {
    int num;
    scanf("%d", &num);
    if (num < 0) {
        printf("Invalid input\n");
    } else {
        printf("%d\n",fib(num,0,1));
    }
    return 0;
}
