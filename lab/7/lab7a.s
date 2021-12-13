    .data
x:  .space  4
y:  .space  4
xPrompt:    .asciiz "Enter x: "
yPrompt:    .asciiz "Enter y: "
sumPrompt:  .asciiz "\nSum: "
diffPrompt: .asciiz "\nDifference: "
prodPrompt: .asciiz "\nProduct: "
quotPrompt: .asciiz "\nQuotient: "

    .text
main:
    li $v0, 4
    la $a0, xPrompt
    syscall
    li $v0, 5
    syscall
    sw $v0, x

    li $v0, 4
    la $a0, yPrompt
    syscall
    li $v0, 5
    syscall
    sw $v0, y

    # Sum

    lw $a0, x
    lw $a1, y
    jal sum

    move $t0, $v0
    li $v0, 4
    la $a0, sumPrompt
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Difference

    lw $a0, x
    lw $a1, y

    jal difference

    move $t0, $v0
    li $v0, 4
    la $a0, diffPrompt
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Product

    lw $a0, x
    lw $a1, y

    jal product

    move $t0, $v0
    li $v0, 4
    la $a0, prodPrompt
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Quotient

    lw $a0, x
    lw $a1, y

    jal quotient

    move $t0, $v0
    li $v0, 4
    la $a0, quotPrompt
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Exit

    li $v0, 10
    syscall

    sum:
    add $v0, $a0, $a1
    jr $ra

    difference:
    sub $v0, $a0, $a1
    jr $ra

    product:
    mul $v0, $a0, $a1
    jr $ra

    quotient:
    div $v0, $a0, $a1
    jr $ra