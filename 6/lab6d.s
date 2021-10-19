	.data
finalStr:		.space		800
strPrompt:	.asciiz		"Enter the String: "
revPrompt:	.asciiz		"\nReveresed String: "
aStr:		.space		400
bStr:		.space		400

	.text
main:
	li $v0, 4
	la $a0, strPrompt
	syscall

	li $v0, 8
	la $a0, aStr
	syscall

	li $v0, 8
	la $a0, bStr
	syscall

	la $s0, aStr
	li $s1, 0

