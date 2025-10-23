.text
# here we store variables and strings and stuff. These are the strings we will need:
first_prompt: .asciz "\nWELCOME TO EXPONENTIATOR.\nENTER A VALUE: "
second_prompt: .asciz "\nEXCELLENT. NOW ENTER AN EXPONENT: "
third_prompt: .asciz "\nCALCULATING YOUR EXPONENTIATED VALUE..."
fourth_prompt: .asciz "\nYOUR EXPONENTIATED VALUE IS EQUAL TO: "

# here we store two input variables, which scanf will use to 
input1: .asciz "%ld"
input2: .asciz "%ld"

.global main



main:
    # Prologue (lines at the start of a function that prepare the stack and registers for use)
    pushq   %rbp                # push the base pointer
    movq    %rsp, %rbp          # copy stack pointer value to base pointer
    
    # main program
    movq    $0, %rax            # no vector registers in use for printf
    movq    $first_prompt, %rdi # first parameter: first_prompt string
    call    printf              # call printf, which will take the value of rdi register and print
   
    subq    $16, %rsp           # reserve space in stack for the first input
    movq    $0, %rax            # no vector registers in use for scanf
    movq    $input1, %rdi       # first parameter: input format string
    leaq    -16(%rbp), %rsi     # lea: load effective address. But for some reason this is a parameter: address of the reserved space (which does make sense)
    call    scanf

    movq    -16(%rbp), %rsi     # load the input value into RSI
                                # RSI is the second parameter register

    # TEST let's see if this can print my value
    movq    $0, %rax            # no vector registers in use for printf
    movq    %rsi, %rdi          # first parameter (rsi, where our input value is stored). We copy this value into the RDI register, the first parameter register
    call    printf              # now we call the function and let it print the rdi register



    # Epilogue (lines at the end of a function that store the old base pointer and copy the stack pointer to be a new base pointer)
    movq    %rbp, %rsp          # clear local variables from stack
    popq    %rbp                # restore base pointer location



end: # this loads the program exit code and exits the program

    movq    $0, %rdi
    call    exit



power:
    pushq   %rbp                # push the base pointer
    movq    %rsp, %rbp          # copy stack pointer value to base pointer
    
