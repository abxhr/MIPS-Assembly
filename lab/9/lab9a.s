# Print Float and Double variables from the memory

	.data
no1:	.float	3.2
no2:	.double	0.0002
newl:	.asciiz	"\n"

	.text
main:
	l.s $f0, no1
	l.d $f2, no2

	li $v0, 2
	mov.s $f12, $f0
	syscall

	li $v0, 4
	la $a0, newl
	syscall

	li $v0, 3
	mov.d $f12, $f2
	syscall

	li $v0, 10
	syscall

	