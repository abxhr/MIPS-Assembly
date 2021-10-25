# Read two integers and print its sum
# Note: Call code - in register $v0

	.data

myInt1:	.word	0
myInt2: .word	0
mySum:	.word	0
prompt:	.asciiz	"Enter a value: "
outText: .asciiz "\nSum: "

	.text
main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	sw $v0, myInt1

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	sw $v0, myInt2
	
	lw $t0, myInt1
	lw $t1, myInt2 
	add $t2, $t0, $t1
	sw $t2, mySum

	li $v0, 4
	la $a0, outText
	syscall

	li $v0, 1
	lw $a0, mySum
	syscall

	li $v0, 10
	syscall