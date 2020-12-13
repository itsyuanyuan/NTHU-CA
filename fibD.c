#include <stdio.h>
#include <stdlib.h>
int Q1[4] = {1,1,1,0};

int* mml (int * m1, int*m2) {
    int* r =(int*)malloc(sizeof(int) * 4 );
    r[0] = m1[0] * m2[0] + m1[1] * m2[2];//provide by TA
    r[1] = m1[0] * m2[1] + m1[1]  *m2[3];
    r[2] = m1[2] * m2[0] + m1[3]  *m2[2];
    r[3] = m1[2] * m2[1] + m1[3]  *m2[3];
    return r;
}

int* Find_Q_matrix(int num){
    int i = 2;
    int * Q_n = Q1;// initial array for Q_n
    for (i=2;i<=num;i++){
        Q_n=mml(Q_n,Q1);//multiply Q_n to get the value
    }
    return Q_n;
}

int main () {
    int num;
    scanf("%d", &num);
    if (num == 0){
        printf("0\n");
    }
    else if (num < 0) {
        printf("Invalid input\n");
    } else {
        int *Q_n = Find_Q_matrix(num);
		    printf("%d\n", Q_n[2]);
   		  free(Q_n);
    }
    return 0;
}


