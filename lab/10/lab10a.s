	.data

a1:	.float	4.3
a2:	.float	5.6
b1:	.float	8.2
b2:	.float	7.1
iChar:	.asciiz	" + i"
newL:	.asciiz "\n"
addT:	.asciiz	" + "
equalsT:	.asciiz	" = "
openT:	.asciiz "("
closeT:	.asciiz	")"

	.text
main:
	li $v0, 4
	la $a0, openT
	syscall	

	l.s $f12, a1
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, iChar
	syscall	

	l.s $f12, b1
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, closeT
	syscall
	
	li $v0, 4
	la $a0, addT
	syscall

	li $v0, 4
	la $a0, openT
	syscall	

	l.s $f12, a2
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, iChar
	syscall	

	l.s $f12, b2
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, closeT
	syscall

	li $v0, 4
	la $a0, equalsT
	syscall

	li $v0, 4
	la $a0, openT
	syscall	

	l.s $f2, a1
	l.s $f4, a2
	add.s $f12, $f2, $f4
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, iChar
	syscall	

	l.s $f2, b1
	l.s $f4, b2
	add.s $f12, $f2, $f4
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, closeT
	syscall

	li $v0, 10
	syscall

	