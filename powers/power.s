.text
# here we store variables and strings and stuff. These are the strings we will need:
first_prompt: .asciz "\nWELCOME TO EXPONENTIATOR.\nENTER A VALUE: "
second_prompt: .asciz "\nEXCELLENT. NOW ENTER AN EXPONENT: "
third_prompt: .asciz "\nCALCULATING YOUR EXPONENTIATED VALUE..."
fourth_prompt: .asciz "\nYOUR EXPONENTIATED VALUE IS EQUAL TO: "
.global main

main:
    # Prologue (lines at the start of a function that prepare the stack and registers for use)
    pushq   %rbp                # push the base pointer
    movq    %rsp, %rbp          # copy stack pointer value to base pointer
    
    movq    $0, %rax            # no vector registers in use for printf
    movq    $first_prompt, %rdi # first parameter: first_prompt string
    call    printf              # call printf, which will take the value of rdi register and print

    # Epilogue (lines at the end of a function that store the old base pointer and copy the stack pointer to be a new base pointer)
    movq    %rbp, %rsp          # clear local variables from stack
    popq    %rbp                # restore base pointer location

end: # this loads the program exit code and exits the program

    movq    $0, %rdi
    call    exit
