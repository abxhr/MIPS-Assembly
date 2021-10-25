# Sum of array elements

	.data
arrayA:		.space	20
len:		.word	5
enterIn:	.asciiz	"Enter 10 integer values: "
sumPrompt:	.asciiz	"\n\tSum: "

	.text
main:
	li $v0, 4
	la $a0, enterIn
	syscall

	lw $t0, len	# Length of Array

	li $t1, 0	# Index
	la $s0, arrayA

input:
	bge $t1, $t0, findSum

	li $v0, 5
	syscall

	sw $v0, 0($s0)

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j input

findSum:
	li $t1, 0	# Index i
	la $s0, arrayA	# Base address of Array
	li $a1, 0	# Sum

loop: 
	bge $t1, $t0, out

	lw $t2, 0($s0)

	add $a1, $a1, $t2

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop

out:
	li $v0, 4		
	la $a0, sumPrompt
	syscall
	
	add $a0, $zero, $a1
	li $v0, 1
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call