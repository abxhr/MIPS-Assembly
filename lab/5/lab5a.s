# Largest and Smallest

	.data
arrayA:			.space	40
len:			.word	10
enterIn:		.asciiz	"Enter 10 integer values: "
largestPrompt:	.asciiz	"\n\tLargest: "
smallestPrompt:	.asciiz	"\n\tSmallest: "

	.text
main:
	li $v0, 4
	la $a0, enterIn
	syscall

	lw $t0, len	# Length of Array

	li $t1, 0	# Index
	la $s0, arrayA

input:
	bge $t1, $t0, findLS

	li $v0, 5
	syscall

	sw $v0, 0($s0)

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j input

findLS:
	li $t1, 0		# Index i
	la $s0, arrayA	# Base address of Array
	lw $a1, 0($s0)	# Largest
	lw $a2, 0($s0)	# Smallest

loop:
	bge $t1, $t0, out

	lw $t2, 0($s0)

	bgt $t2, $a1, setLargest
next:	
	blt $t2, $a2, setSmallest
index:	
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop
	
setLargest:
	add $a1, $zero, $t2
	j next

setSmallest:
	add $a2, $zero, $t2
	j index

out:
	li $v0, 4		
	la $a0, largestPrompt
	syscall
	
	add $a0, $zero, $a1
	li $v0, 1
	syscall

	li $v0, 4		
	la $a0, smallestPrompt
	syscall
	
	add $a0, $zero, $a2
	li $v0, 1
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call