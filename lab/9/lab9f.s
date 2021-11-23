# Sum of elements in an array
	.data
len:	.word	10
arrayA:	.space	40
inPrompt:	.asciiz	"Enter 10 float values: "
outPrompt:	.asciiz	"Sum of the elements in the array: "

	.text
main:
	li $v0, 4
	la $a0, inPrompt
	syscall

	lw $t0, len

	li $t1, 0
	la $s0, arrayA

input:	
	bge $t1, $t0, findSum

	li $v0, 6
	syscall

	s.s $f0, 0($s0)
	
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j input

findSum:
	li $t1, 0	# Index i
	la $s0, arrayA	# Base address of Array
	li.d $f2, 0.0	# Sum

loop: 
	bge $t1, $t0, out

	l.s $f4, 0($s0)

	add.s $f2, $f2, $f4

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop

out:
	li $v0, 4		
	la $a0, outPrompt
	syscall
	
	mov.d $f12, $f2
	li $v0, 3
	syscall

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call