.text
welcome: .asciz "Ik ben Jonathan Elkouby en ik heb geen netID want ik zit niet op Delft en mijn assignment heet powers"

.global main # waarom is .global niet blauw

main: #  the main routine
    # prologue wat was dat ook alweer
    pushq   %rbp            # push the base pointer idk wat dat betekent
    movq    %rsp, %rbp      # copy stack pointer value to base pointer wtf

    movq    $0, %rax
    movq    $welcome, %rdi
    call    printf          # call printf to print this string

    # epilogue
    movq    %rbp, %rsp      # clear local variables from stack
    popq    %rbp            # restore base pointer location

end: # this loads the program exit code and exits the program

    movq    $0, %rdi
    call    exit
