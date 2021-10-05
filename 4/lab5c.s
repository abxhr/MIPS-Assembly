# Sum of two arrays

	.data
myA:		.word	1, 2, 3, 4, 5
myB:		.word	1, 2, 3, 4, 5
myC:		.space	20
prompt:		.asciiz	"\tC[i] = A[i] + B[i]:\n\n"
len:		.word	5
outArray:		.asciiz	"\n\tC["
closer: 		.asciiz	"]:  "

	.text
main:

	li $v0, 4
	la $a0, prompt
	syscall

	lw $t0, len		# Length of Array
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
