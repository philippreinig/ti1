#include <stdio.h>

int c_faculty_iter(int n){
    if (n<0) return -1;
    int product = 1;
    while(n>0){
        product*=n;
        --n;
    }
    return product;
}

int c_faculty_rec(int n){
    if (n < 0) return -1;
    else if (n <= 1) return 1;
    else return n*c_faculty_rec(n-1);
}

int c_fibonacci_iter(int n){
    if (n == 0 || n == 1) return n;
    int fib_1 = 0;
    int fib_2 = 1;
    for (int i = 2; i <= n; ++i){
        int temp = fib_2;
        fib_2 = fib_2 + fib_1;
        fib_1 = fib_2;
        fib_1 = temp;
    } 
    return fib_2;
}

int c_fibonacci_rec(int n){ 
    if (n == 0 || n == 1) return n;
    else return c_fibonacci_rec(n-1) + c_fibonacci_rec(n-2);
}


extern int faculty_rec(int);
extern int fibonacci_iter(int);

int main(){

    int n = 10;

    printf("C functions:\n");
    printf("    faculty:\n");
    printf("        The faculty of %d is: %d (iterative calculation)\n", n, c_faculty_iter(n));
    printf("        The faculty of %d is: %d (recursive calculation)\n", n, c_faculty_rec(n));
    printf("    fibonacci:\n");
    printf("        The %d-dth fibonacci number is: %d (iterative calculation)\n", n, c_fibonacci_iter(n));
    printf("        The %d-dth fibonacci number is: %d (recursive calculation)\n", n, c_fibonacci_rec(n));

    printf("Assembly functions:\n");
    printf("    faculty:\n");
    //printf("        The faculty of %d is: %d (iterative assembly calculation)\n", n, faculty_iter(n));
    printf("        The faculty of %d is: %d (recursive assembly calculation)\n", n, faculty_rec(n));
    printf("    fibonacci:\n");
    printf("        The %d-dth fibonacci number is: %d (iterative assembly calculation)\n", n, fibonacci_iter(n));
    //printf("        The %d-dth fibonacci number is: %d (recursive assembly alculation)\n", n, fibonacci_rec(n));


    return 0;


}