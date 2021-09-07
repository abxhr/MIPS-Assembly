# MALP to print a string

	.data

# For data declarations:
# <variableName>:	.<dataType>	<initialValue>

msg:	.asciiz "Hello World!!\n"
var:	.word	12

	.text

# li - Load Immediate
# la - Load Address
# lw - Load Word

main:	li $v0, 4	# syscall 4 (print_str)
	la $a0, msg	# argument: string
	syscall		# print the string
	
	li $v0, 1	# syscall 1 (print_int)
	lw $a0, var	# argument: int (32-bit)
	syscall 	# print the int

	li $v0, 10	# syscall 10 (Exit)
	syscall		# System call