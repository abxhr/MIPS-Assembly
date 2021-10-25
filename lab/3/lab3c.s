#  a  = a * b / c % d + e

	.data
myA:		.word	0
myB:		.word	0
myC:		.word	0
myD:		.word	0
myE:		.word	0
promptA:	.asciiz	"Enter value for a: "
promptB:	.asciiz	"Enter value for b: "
promptC:	.asciiz	"Enter value for c: "
promptD:	.asciiz	"Enter value for d: "
promptE:	.asciiz	"Enter value for e: "
	.text
main:
# A ($t1)
	li $v0, 4
	la $a0, promptA
	syscall

	li $v0, 5
	syscall
	add $t1, $zero, $v0

# B ($t2)
	li $v0, 4
	la $a0, promptB
	syscall

	li $v0, 5
	syscall	
	add $t2, $zero, $v0

# C ($t3)
	li $v0, 4
	la $a0, promptC
	syscall

	li $v0, 5
	syscall	
	add $t3, $zero, $v0

# D ($t4)
	li $v0, 4
	la $a0, promptD
	syscall

	li $v0, 5
	syscall	
	add $t4, $zero, $v0

# E ($t5)
	li $v0, 4
	la $a0, promptE
	syscall

	li $v0, 5
	syscall	
	add $t5, $zero, $v0

# a * b (1)
	mul $t1, $t1, $t2

# c % d (2)
	rem $t0, $t3, $t4

# 1 / 2
	div $t1, $t1, $t0

# +e
	add $t1, $t1, $t5
	
# result
	sw $t1, myA
	li $v0, 1
	lw $a0, myA
	syscall

# Exit
	li $v0, 10
	syscall