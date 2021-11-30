	.data
myL:	.word	1,2,3,4,5
prompt:	.asciiz	"Average = "
len:	.word	5

	.text
main:
	li $t1, 0	# Index i
	la $s0, myL	# Base address of L
	lw $t0, len	# Length
	li $t2, 0	# Sum

sum:
	bge $t1, $t0, next
	
	lw $a0, 0($s0)

	add $t2, $t2, $a0

	addi $s0, $s0, 4
	addi $t1, $t1, 1

	j sum

next:
	mtc1 $t2, $f6
	cvt.s.w $f8, $f6

	li.s $f2, 5.0

	div.s $f12, $f8, $f2

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 2
	syscall

	li $v0, 10
	syscall