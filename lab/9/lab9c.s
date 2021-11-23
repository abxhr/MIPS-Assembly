# Area of Circle (Single-Precision Input)

	.data
pi:	.float 3.1415926535897924
inPromptr:	.asciiz	"Enter the radius: "
outPrompt:	.asciiz	"Area: "
newl:		.asciiz	"\n"

	.text
main:
	li $v0, 4
	la $a0, inPromptr
	syscall

	li $v0, 6
	syscall	

	l.s $f2, pi
	
	li $v0, 4
	la $a0, newl
	syscall

	mul.s $f12, $f0, $f0
	mul.s $f12, $f12, $f2

	li $v0, 2
	syscall

	li $v0, 10
	syscall