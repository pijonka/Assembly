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

    # calling printf, first prompt
    movq    $0, %rax            # no vector registers in use for printf
    movq    $first_prompt, %rdi # first parameter: first_prompt string
    call    printf              # call printf, which will take the value of rdi register and print
   
    #calling scanf, input1
    subq    $16, %rsp           # reserve space in stack for the first input
    movq    $0, %rax            # no vector registers in use for scanf
    movq    $input1, %rdi       # first parameter: input format string
    leaq    -16(%rbp), %rsi     # lea: load effective address. But for some reason this is a parameter: address of the reserved space (which does make sense)
    call    scanf

    # copying the input1 value
    movq    -16(%rbp), %rsi     # load the input value into RSI
                                # RSI is the second parameter register
    movq    %rsi, %r12          # Save the value somewhere it won't be nuked                    

    # calling printf, second prompt
    movq    $0, %rax            # no vector registers in use for printf
    movq    $second_prompt, %rdi# first parameter: second_prompt string
    call    printf              # call printf

    # calling scanf, input2
    subq    $16, %rsp           # reserve space in stack for the second input
    movq    $0, %rax            # no vector registers in use for scanf
    movq    $input2, %rdi       # first parameter: input format string
    leaq    -16(%rbp), %rsi     # lea: load effective address.
    call    scanf

    # copying the input2 value
    movq    -16(%rbp), %rsi     # I'm just going to load it into rsi like I did with the other value whatever
    movq    %rsi, %r13          # Save the value somewhere it won't be nuked

    # calling printf, third prompt
    movq    $0, %rax            # no vector registers in use for printf
    movq    $third_prompt, %rdi # first parameter: third_prompt string
    call    printf              # call printf
    
    # calling power
    movq    $0, %rax            # no vector registers in use for power (actually that might not be true)
    movq    %r12, %rdi          # first parameter: input1, which was moved to the r12 value before
    movq    %r13, %rsi          # second paramater: input2, which was moved to the r13 value before
    call    power               # call power
    

    # Epilogue (lines at the end of a function that store the old base pointer and copy the stack pointer to be a new base pointer)
    movq    %rbp, %rsp          # clear local variables from stack
    popq    %rbp                # restore base pointer location



end: # this loads the program exit code and exits the program

    movq    $0, %rdi
    call    exit



power:
    # Prologue
    pushq   %rbp                # push the base pointer
    movq    %rsp, %rbp          # copy stack pointer value to base pointer

    # Subroutine

    # assign value of base to "total", which now is just going to be a register I guess
    movq    %rdx, %rdi


    loop: # multiply total by input1 an inpu times 
        t2 number of
        sub     %rsi, 1             # subtract 1 from input2, aka exp
        cmpq    %rsi, %rax          # if RAX < input2
        jl      

    end:

    movq   
