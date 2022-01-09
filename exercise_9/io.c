#include <stdio.h>

// pointers to memory should be declared volatile, otherwise code might break due to compiler optimisation
volatile int* receiver_control = (int*) 0xFFFF0000; 
volatile int* receiver_data = (int*) 0xFFFF0004;

void wait_until_character_received(){
    bool receiver_ready = 0;
    // Loop until receiver_ready bit is set to 1
    while(!receiver_ready){
        // Check if receiver_ready (first bit of receiver_control) == 1
        receiver_ready = (*receiver_control) & 1;
    }
}

char read_character(){
    // read the character at the receiver_data address and return it
    return (char) *receiver_data;
}


int main(int argc, char* argv[]){
    return 0;
}