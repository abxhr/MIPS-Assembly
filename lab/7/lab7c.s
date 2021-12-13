    .data
no_terms: .word 10
msg1: .asciiz "The fibonacci series is\n"
msg2: .asciiz " "

    .text 
main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 1
	li $a0, 0
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	li $a0, 1
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	lw $a1, no_terms	
	jal fibo
	li $v0, 10
	syscall

fibo:
	li $t0, 2
	li $t1, 0
	li $t2, 1
	
loop:	
    add $t3, $t1, $t2
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	move $t1, $t2
	move $t2, $t3
	addi $t0, $t0, 1
	blt $t0, $a1, loop 
	jr $ra

