# Binary Search

	.data
inPrompt:	.asciiz	"Enter the values of the array (Sorted)(MAX: 10): "
searchPrompt:	.asciiz "Enter the value to search for: "
foundPrompt:	.asciiz "The element found at index: "
notFoundPrompt:	.asciiz "The element is not found"
myA:		.space 40
x:		.space 4
len:		.word 10

	.text
main:
	li $v0, 4
	la $a0, inPrompt
	syscall

	lw $t0, len

	li $t1, 0
	la $s0, myA

input:
	bge $t1, $t0, afterIn

	li $v0, 5
	syscall

	sw $v0, 0($s0)

	addi $t1, $t1, 1
	addi $s0, $s0, 4
	j input

afterIn:

	li $v0, 4
	la $a0, searchPrompt
	syscall

	li $v0, 5
	syscall

	addi $t1, $t1, -1

	lw $a0, myA			# The array
	add $a1, $zero, $v0	# The element to search for
	addi $a2, $zero, 0	# The lo value
	add $a3, $zero, $t1	# The high value
	jal binSearch
	
	bge $v0, $zero, found

	li $v0, 4
	la $a0, notFoundPrompt
	syscall
	
	j exit
found:	
	li $v0, 4
	la $a0, foundPrompt
	syscall

	li $v0, 1
	add $a0, $v1, $zero
	syscall

exit: 
	li $v0, 10
	syscall


binSearch:

# $a0 - Array
# $a1 - Element
# $a2 - Lo
# $a3 - High
# $t0 - mid
# $t1 - Array[mid]

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	bgt $a2, $a3, escape
	add $t0, $a2, $a3
	srl $t0, $t0, 1
	
	sll $t2, $t0, 2
	lw $t1, myA($t2)

	beq $a1, $t1, foundInIter
	
	blt $a1, $t1, lessThan
	addi $a2, $t0, 1
	jal binSearch
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

lessThan: 
	addi $a3, $t0, -1
	jal binSearch
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

foundInIter:
	add $v1, $t0, $zero
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

escape:
	addi $v0, $zero, -1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra