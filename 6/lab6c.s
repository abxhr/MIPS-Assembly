	.data
strIn:		.space		400
strPrompt:	.asciiz		"Enter the String: "
yesPrompt:	.asciiz		"The string is a palindrome!"
noPrompt:	.asciiz		"The string is not a palindrome!"

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
	beq $a0, $zero, check
	addi $s1, $s1, 1		# $s1 - Length
	j findLen

check:
	addi $s1, $s1, -1
	rem $t1, $s1, 2
	beq $t1, $zero, palCheck

fixOdd:
	addi $s1, $s1, -1

palCheck:
	div $s1, $s2, 2
	li $s2, 0		# From start

loop:
	add $t2, $s2, $s0
	add $t0, $s1, $s0
	lbu $a0, 0($t0)
	lbu $a1, 0($t2)

	bne $a0, $a1, notPal

	addi $s1, $s1, -1
	addi $s2, $s2, 1

	blt $s1, $zero, yesPal
	j loop

yesPal:
	li $v0, 4
	la $a0, yesPrompt
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call

notPal:
	li $v0, 4
	la $a0, noPrompt
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call