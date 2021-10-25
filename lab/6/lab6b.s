# Reverse an input string

	.data
strIn:		.space		400
strPrompt:	.asciiz		"Enter the String: "
revPrompt:	.asciiz		"\nReveresed String: "
revStr:		.space		400
	
	.text
main:
	li $v0, 4
	la $a0, strPrompt
	syscall

	li $v0, 8
	la $a0, strIn
	syscall

	la $s0, strIn
	li $s1, 0

findLen:
	add $t0, $s1, $s0
	lbu $a0, 0($t0)
	beq $a0, $zero, reverse
	addi $s1, $s1, 1		# $s1 - Length
	j findLen


reverse:
	addi $s1, $s1, -1
	li $s2, 0			# Rev string index - $s2
	la $s3, revStr

loop:
	add $t2, $s3, $s2		# Put char address
	add $t0, $s1, $s0		# Get char address
	lbu $a0, 0($t0)
	
	sb $a0, 0($t2)
	
	addi $s1, $s1, -1
	addi $s3, $s3, 1
	
	blt $s1, $zero, print
	j loop

print:
	li $v0, 4
	la $a0, revPrompt
	syscall

	li $v0, 4
	la $a0, revStr
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call