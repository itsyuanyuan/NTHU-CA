#include <stdio.h>

int fib(int num) {
	if (num==0) return 0;
	int i=1,Fi=1,Fi1=1,F2i,F2i1,Fi2;//duplicate the algorithm that provides by TA
	while (i<num) {
		if (i<=num/2) {
			F2i1 = Fi*Fi+Fi1*Fi1;
			F2i = Fi*(2*Fi1-Fi);
			Fi=F2i;
			Fi1=F2i1;
			i*=2;
		}
		else {
			Fi2 = Fi1+Fi;
			Fi = Fi1;
			Fi1=Fi2;
			i++;
		}
	}
	return Fi;
}
int main () {
	int num;
	scanf("%d", &num);
	printf("%d\n", fib(num));
	return 0;
}

