#include <stdio.h>
int power(int base, int exp) { // this is our pow subroutine, which will convert our two integers into the exponentialized value and return that
    // this variable will contain the return value of our function once the base and exponent variables are operated correctly
    // we're going to assign it to base. Later we will multiply it by base for an exp number of times
    int total = base;
    
    // we wanna multiply total by base an exp number of times
    // so we make a for loop
    for (int i = 0; i < (exp - 1); i++) { // start the count of loops at 0, then keep looping until the amount of loops is equal to exp
        // multiply total by base
        total *= base;

    } // this will keep looping an exp number of times

    // now, since the for loop made total the exponentialized version of base, we have the result we want
    // we will return the value
    return total;
}

int main() { // our main routine will contain the part of the program which our user will actually see and interact with.
    int base;
    int exp;
    
    // start with a string explaining the program and textually ask for user input
    printf("WELCOME TO EXPONENTIATOR.\nENTER A VALUE: ");
    scanf("%d", &base); // get the user input and assign it to the value of base
    
    // explain the next step and textually ask for user input
    printf("\nEXCELLENT. NOW ENTER AN EXPONENT: ");
    scanf("%d", &exp); // get the user input and assign it to the value of exp
    
    // this has no point
    printf("\nCALCULATING YOUR EXPONENTIATED VALUE...");
    printf("\nYOUR EXPONENTIATED VALUE IS EQUAL TO: ");
    printf("%d", power(base, exp));
    printf("\n");    

    return 0;

}