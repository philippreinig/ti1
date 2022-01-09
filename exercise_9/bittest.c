#include <stdio.h>

int c_bittest(int x, int n){
    return (x >> n) & 1;
}

extern int bittest(int, int);


int main(){

    printf("%d\n", c_bittest(27, -123));
    printf("%d\n", c_bittest(27, 0));
    printf("%d\n", c_bittest(27, 1));
    printf("%d\n", c_bittest(27, 2));
    printf("%d\n", c_bittest(27, 3));
    printf("%d\n", c_bittest(27, 17));

    printf("---\n");

    printf("%d\n", bittest(13, -1));
    printf("%d\n", bittest(13, 0));
    printf("%d\n", bittest(13, 1));
    printf("%d\n", bittest(13, 2));
    printf("%d\n", bittest(13, 3));
    printf("%d\n", bittest(13, 4));



}