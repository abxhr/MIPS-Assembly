# Linear Search

	.data
myArray:		.word	1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
prompt:		.asciiz	"\tLinear Search:\n\n"
len:		.word	10
found:		.asciiz	"The element is found at index: "
notFound: 		.asciiz	"The element is not found"
check:		.word	90

	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall

	lw $t0, len		# Length of Array
	li $t1, 0		# Index i
	la $s0, myArray	# Base address of Array
	lw $s1, check

loop:
	bge $t1, $t0, out
	
	lw $a0, 0($s0)

	beq $a0, $s1, foundElement

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	
	j loop

foundElement:

	li $v0, 4
	la $a0, found
	syscall

	add $a0, $zero, $t1
	li $v0, 1
	syscall

	li $v0, 10		# syscall 10 (Exit)
	syscall		# System call

out:	

	li $v0, 4
	la $a0, notFound
	syscall

	li $v0, 10		# syscall 10 (Exit)
	syscall		# System call



