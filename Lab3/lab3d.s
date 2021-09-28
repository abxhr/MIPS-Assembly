# Volume and Surface Area

	.data
volume:		.word	0
surfaceArea:	.word	0
prompta:	.asciiz	"Enter 'A' side: "
promptb:	.asciiz	"Enter 'B' side: "
promptc:	.asciiz	"Enter 'C' side: "
promptVol:	.asciiz "\nVolume: "
promptSA:	.asciiz "\nSurface Area: "

	.text
main:
# Side A ($t1)
	li $v0, 4
	la $a0, prompta
	syscall

	li $v0, 5
	syscall
	add $t1, $zero, $v0

# Side B ($t2)
	li $v0, 4
	la $a0, promptb
	syscall

	li $v0, 5
	syscall	
	add $t2, $zero, $v0

# Side C ($t3)
	li $v0, 4
	la $a0, promptc
	syscall

	li $v0, 5
	syscall	
	add $t3, $zero, $v0

# Volume
	mul $t4, $t1, $t2
	mul $t4, $t4, $t3
	sw $t4, volume

	li $v0, 4
	la $a0, promptVol
	syscall

	li $v0, 1
	lw $a0, volume
	syscall

# Surface Area
	mul $t5, $t1, $t2
	add $t4, $zero, $t5

	mul $t5, $t1, $t3
	add $t4, $t4, $t5

	mul $t5, $t2, $t3
	add $t4, $t4, $t5

	addi $t6, $zero, 2
	mul $t4, $t4, $t6

	sw $t4, surfaceArea

	li $v0, 4
	la $a0, promptSA
	syscall

	li $v0, 1
	lw $a0, surfaceArea
	syscall
	
# Exit
	li $v0, 10
	syscall