# Sum of first "n" natural numbers

	.data

myN:	.word	0
mySum:	.word	0
prompt:	.asciiz	"Enter value for N: "
outText: .asciiz "\nSum: "

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
	li $t2, 0	# sum

sumLoop:
	add $t2, $t2, $t1	# adding the current value

	add $t1, 1		# increasing loop index
	ble $t1, $t0, sumLoop	# looping

	sw $t2, mySum	
	
	li $v0, 4
	la $a0, outText
	syscall

	li $v0, 1
	lw $a0, mySum
	syscall

	li $v0, 10
	syscall