# Length of a string

	.data
strIn:		.space		400
strPrompt:	.asciiz		"Enter the String: "
lenPrompt:	.asciiz		"\nLength of the string: "

	
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
loop:
	add $t0, $s1, $s0

	lbu $a0, 0($t0)
	beq $a0, $zero, print
	addi $s1, $s1, 1
	li $v0, 11
	syscall
	
	j loop

print:
	move $a0, $s1
	li $v0, 1
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call
