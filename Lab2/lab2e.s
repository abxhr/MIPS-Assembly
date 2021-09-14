# Factorial of a number

	.data

myN:	.word	0
myFact:	.word	1
prompt:	.asciiz	"Enter value for N: "
outText: .asciiz "\nFactorial: "

	.text
main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	sw $v0, myN
	
	lw $t0, myN
	li $t1, 1	# loop index
	li $t2, 1	# fact

factLoop:
	mul $t2, $t2, $t1	# multiplying the current value

	add $t1, 1		# increasing loop index
	ble $t1, $t0, factLoop	# looping

	sw $t2, myFact
	
	li $v0, 4
	la $a0, outText
	syscall

	li $v0, 1
	lw $a0, myFact
	syscall

	li $v0, 10
	syscall