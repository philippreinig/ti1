#include <stdio.h>

int circumference_c(int a, int b, int c){
    return a + b + c;
}

double area_c(int a, int ha){
    return (double) 1/2*a*ha;
}

// Function declaration for mips assembly code
extern int circumference(int, int, int);

//extern double area(int, int);

int main(){
    int a = 5;
    int b = 7;
    int c = 2;
    int ha = 4;
    printf("The circumference is: %d\n", circumference_c(a,b,c));
    printf("The area is: %f\n", area_c(a,ha));


    // ----- Calling the assembler function -----
    printf("The circumference is: %d (assembly calculation)\n", circumference (a,b,c)); 
    
    // Couldn't get this to work, since couldn't find out how to return a double from an assembly function
    // printf("The area is: %f (assembly calculation)\n", area(a,ha)); 

    return 0;
}