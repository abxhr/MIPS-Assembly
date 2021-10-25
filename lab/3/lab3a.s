# Odd or Even

	.data

myint:	.word	0
prompt:	.asciiz	"Enter a value: "
outodd: .asciiz "N is odd"
outeven: .asciiz "N is even"

	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	sw $v0, myint

	li $t1, 2
	div $v0, $t1

	mfhi $t2
	bnez $t2, odd

	li $v0, 4
	la $a0, outeven
	syscall

	j exit

odd:
	li $v0, 4
	la $a0, outodd
	syscall

exit:
	li $v0, 10
	syscall
	