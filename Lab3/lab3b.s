# Sum of digits

	.data
n:	.word	0
mysum:	.word	0
prompt:	.asciiz	"Enter a value: "
outtext: .asciiz "\nSum: "

	.text
main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	add $t3, $zero, $v0

	li $t1, 0
	li $t2, 0
	li $t4, 10

loop:
	bnez $t3, while
	j exit

# t1 - remainder	t2 - sum	t3 - N

while:
	div $t3, $t4
	mfhi $t1

	add $t2, $t2, $t1

	mflo $t3
	j loop

exit: 
	li $v0, 4
	la $a0, outtext
	syscall

	li $v0, 1
	add $a0, $zero, $t2
	syscall

	li $v0, 10
	syscall
	