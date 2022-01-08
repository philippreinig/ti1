#include <stdio.h>


int c_gauss_sum_formula(int n){
    return (n*n + n) / 2;
}

int c_gauss_sum_iter(int n){
    int sum = 0;
    for(int i = 1; i <= n; ++i){
        sum += i;
    }
    return sum;
}

extern int gauss_sum_iter(int);
extern int gauss_sum_formula(int);


int main(){

    int n = 13;

    printf("The gaussion sum of %d is: %d (c calculation iterative) \n", n, c_gauss_sum_iter(n));
    printf("The gaussian sum of %d is: %d (c calculation formula\n", n, c_gauss_sum_formula(n));

    printf("The gaussion sum of %d is: %d (assembly calculation iterative)\n", n, gauss_sum_iter(n));
    printf("The gaussion sum of %d is: %d (assembly calculation formula)\n", n, gauss_sum_formula(n));
    

    return 0;
}
