# Read and print an integer

	.data

myint:	.word	0
prompt:	.asciiz	"Enter a value: "
outtext: .asciiz "\nValue entered: "

	.text
main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	sw $v0, myint
	
	li $v0, 4
	la $a0, outtext
	syscall

	li $v0, 1
	lw $a0, myint
	syscall

	li $v0, 10
	syscall