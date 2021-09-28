# Logical Operations

	.data
myA:		.word		28
myB:		.word		40
outLeft: 	.asciiz 	"\nShift Left of A (4): "
outRight:	.asciiz		"\nShift Right (4): "
outOr:		.asciiz		"\nOR Operation: "
outAnd:		.asciiz		"\nAND Operation: "

	.text
main:
	lw $t0, myA
	lw $t1, myB
	sll $t2, $t0, 4

	li $v0, 4
	la $a0, outLeft
	syscall

	li $v0, 1
	add $a0, $zero, $t2
	syscall

	srl $t2, $t2, 3

	li $v0, 4
	la $a0, outRight
	syscall

	li $v0, 1
	add $a0, $zero, $t2
	syscall

	and $t3, $t2, $t1

	li $v0, 4
	la $a0, outAnd
	syscall

	li $v0, 1
	add $a0, $zero, $t3
	syscall

	or $t3, $t2, $t1

	li $v0, 4
	la $a0, outOr
	syscall

	li $v0, 1
	add $a0, $zero, $t3
	syscall

	li $v0, 10
	syscall