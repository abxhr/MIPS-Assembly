# Read and print a string

	.data

myString: .space 52 
prompt:	.asciiz	"Enter a string: "
outText: .asciiz "\nString entered: "

	.text
main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 8
	la $a0, myString
	li $a1, 52 
	syscall
	
	li $v0, 4
	la $a0, outText
	syscall

	li $v0, 4
	la $a0, myString
	syscall

	li $v0, 10
	syscall