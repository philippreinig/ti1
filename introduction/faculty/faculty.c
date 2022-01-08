#include <stdio.h>

int faculty_iter(int n){
    if (n<0) return -1;
    int product = 1;
    while(n>0){
        product*=n;
        --n;
    }
    return product;
}

int faculty_rec(int n){
    if (n < 0) return -1;
    else if (n <= 1) return 1;
    else return n*faculty_rec(n-1);
}


int main(){

    int n = 10;

    printf("The faculty of %d is: %d (recursive calculation)\n", n, faculty_rec(n));
    printf("The faculty of %d is: %d (iterative calculation)\n", n, faculty_iter(n));

}