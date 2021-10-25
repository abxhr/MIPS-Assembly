# Sum of two arrays

	.data
myA:		.space	80
myB:		.space	80
myC:		.space	80
heading:		.asciiz	"\tC[i] = A[i] + B[i]:\n\n"
inPrompt:		.asciiz	"Enter size of array (MAX: 20): "
inputA:		.asciiz	"\nEnter element for A: "
inputB:		.asciiz	"Enter element for B: "
outArray:		.asciiz	"\n\tC["
closer: 		.asciiz	"]:  "

	.text
main:

	li $v0, 4		# Heading
	la $a0, heading
	syscall

	li $v0, 4
	la $a0, inPrompt	# Array Length Input
	syscall

	li $v0, 5		# Length of Array
	syscall
	add $t0, $zero, $v0

	li $t1, 0		# Index i
	la $s0, myA	# Base address of A
	la $s1, myB	# Base address of B
	la $s2, myB	# Base address of C

input:	
	bge $t1, $t0, sum
	
	li $v0, 4		# Prompt for A
	la $a0, inputA
	syscall

	li $v0, 5		# Input for A
	syscall

	sw $v0, 0($s0)	# Store into A


	li $v0, 4		# Prompt for B
	la $a0, inputB
	syscall

	li $v0, 5		# Input for B
	syscall

	sw $v0, 0($s1)	# Store into B

	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $t1, $t1, 1

	j input

sum:
 	li $t1, 0		# Index i
	la $s0, myA	# Base address of A
	la $s1, myB	# Base address of B
	la $s2, myB	# Base address of C

loop:
	bge $t1, $t0, out
	
	lw $a0, 0($s0)
	lw $a1, 0($s1)

	add $t2, $a0, $a1

	sw $t2, 0($s2)
	
	li $v0, 4
	la $a0, outArray
	syscall

	li $v0, 1
	add $a0, $zero, $t1
	syscall

	li $v0, 4
	la $a0, closer
	syscall

	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $t1, $t1, 1
	
	j loop

out:	
	li $v0, 10		# syscall 10 (Exit)
	syscall		# System call
