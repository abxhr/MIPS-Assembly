# Print contents of (int) array

	.data

myArray:		.word	1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
prompt:		.asciiz	"Array: "
len:		.word	10
next:		.asciiz	", "

	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall

	lw $t0, len		# Length of Array
	li $t1, 0		# Index i
	la $s0, myArray	# Base address of Array	

loop:	bge $t1, $t0, out	# Loop
	lw $a0, 0($s0)
	li $v0, 1
	syscall

	addi $s0, $s0, 4
	addi $t1, $t1, 1

	li $v0, 4
	la $a0, next
	syscall

	j loop 

out:	
	li $v0, 10		# syscall 10 (Exit)
	syscall		# System call
	


	