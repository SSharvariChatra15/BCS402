
#include<stdio.h>
int square(int num) {
	return num*num;
}
int main() {
	for(int i=0;i<=9;i++) {
		printf("Square of %d is %d\n",i,square(i));
	}
	return 0;
}
