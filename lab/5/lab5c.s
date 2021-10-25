# Sum of odd and even elements

	.data
arrayA:		.space	40
len:		.word	10
enterIn:	.asciiz	"Enter 10 integer values: "
sumEPrompt:	.asciiz	"\n\tSum (Even): "
sumOPrompt:	.asciiz	"\n\tSum (Odd): "

	.text
main:
	li $v0, 4
	la $a0, enterIn
	syscall

	lw $t0, len	# Length of Array

	li $t1, 0	# Index
	la $s0, arrayA

input:
	bge $t1, $t0, findSums

	li $v0, 5
	syscall

	sw $v0, 0($s0)

	addi $s0, $s0, 4	
	addi $t1, $t1, 1
	j input

findSums:
	li $t1, 0	# Index i
	la $s0, arrayA	# Base address of Array
	li $a1, 0	# Sum (Even)
	li $a2, 0	# Sum (Odd)

loop: 
	bge $t1, $t0, out

	lw $t2, 0($s0)

	rem $t3, $t2, 2

	beqz $t3, evenAdd
	add $a2, $a2, $t2

next:	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop

evenAdd:
	add $a1, $a1, $t2
	j next

out:
	li $v0, 4		
	la $a0, sumEPrompt
	syscall
	
	add $a0, $zero, $a1
	li $v0, 1
	syscall

	li $v0, 4		
	la $a0, sumOPrompt
	syscall
	
	add $a0, $zero, $a2
	li $v0, 1
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call