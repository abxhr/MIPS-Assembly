    .data
array: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length: .word 10
element: .word 74554
msgNotFound: .asciiz "Item is not in the array"
msgFound: .ascii "Index at which item is found in the array:"

    .text
main:
    la $a0, array               # $a0 has base address
    lw $a1, element             # Load item to search. $a1 = 5 
    lw $a2, length              # Load length of array into $a2
    jal linear_search

    move $t0, $v1		      # move index into $t0	
    beq $v0, $zero, NotFound    # if $v0 = 0; element not found
    la $a0, msgFound            # Load not found text into $a0
    li $v0, 4                   # Load print string syscall
    syscall                     # Print the string

    add $a0, $t0, $0            # Move $t0 into $a0
    li $v0, 1                   # Load print integer sys
    syscall                     # Print the integer
    j exit                      # Exit the program

NotFound:
    la $a0, msgNotFound         # Load not found text into $a0
    li $v0, 4                   # Load print string syscall
    syscall                     # Print the string

exit:
    li $v0, 10
    syscall

linear_search:
    li $t0, 0                   	# i = 0
    li $v0, 0                   	# element not found inittially

loop:
    bge $t0, $a2, out      	# If i > length
    lw $t1, 0($a0)              	# Load the element into t1
    beq $t1, $a1, out1         	# Found the element
    addi $a0, $a0, 4            	# Add 4 (1 word index) to the array
    addi $t0, $t0, 1            	# Add one to the index
    j loop 

out1: 
    li $v0, 1               # element found
    move $v1, $t0		# move index to $v1

out: 	
    jr $ra			# element not found
