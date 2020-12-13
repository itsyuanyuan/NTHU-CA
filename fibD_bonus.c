#include <stdio.h>
#include <math.h>
int fib(int num) {
    // the equation and algorithm will be show in my report
    // I split the number to 1.with sqrt 2.without sqrt
    int A = 5;//initail value of without sqrt part
    int B = 1;//initail value of sqrt part
    const int C = 1;//multiple term
    const int D = 1;//multiple term
    int i;

    for (i = 1 ; i<num;i++){
        int buf = A;//save A because we need it later
        A = A * C; //without sqrt part multiple
        A += B * D*5;//sqrt part * sqrt part so we can make sqrt disappear
        B = B * C; // sqrt part * without sqrt part
        B += buf * D;// sqrt part * without sqrt part
        A = A/2;// every time we should divide two for both term
        B= B/2;// every time we should divide two for both term
    }
    return A/5;//initial value in denominator should be divide
}

int main() {
    int num;
    scanf("%d",&num);
    if(num ==0)
        printf("0\n");
    else if(num<0)
        printf("invalid input!");
    else
        printf("%d\n",fib(num));
    return 0;
}
