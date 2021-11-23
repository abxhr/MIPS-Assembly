# Read and print float and double values

	.data
no1:	.space	4
no2:	.space	8
newl:	.asciiz	"\n"
inPromptS:	.asciiz	"Enter a Float Number: "
inPromptD:	.asciiz	"Enter a Double Number: "

	.text
main:
	li $v0, 4
	la $a0, inPromptS
	syscall

	li $v0, 6
	syscall
	s.s $f0, no1

	li $v0, 4
	la $a0, inPromptD
	syscall

	li $v0, 7
	syscall
	s.d $f0, no2
	
	li $v0, 2
	l.s $f0, no1
	mov.s $f12, $f0
	syscall

	li $v0, 4
	la $a0, newl
	syscall

	li $v0, 3
	l.d $f2, no2
	mov.d $f12, $f2
	syscall

	li $v0, 10
	syscall
