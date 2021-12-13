	.data
data1:  .double 3.14
data2:  .double 3.0
msg1:   .asciiz "data1 and data2 are equal"
msg2:   .asciiz "data1 and data2 are not equal"
	
    .text
main:	
    l.d $f0, data1
	l.d $f2, data2
	c.eq.d $f0, $f2
	bc1t L1
	la $a0, msg2
	j L2

L1:	
    la $a0, msg1

L2:	
    li $v0, 4
	syscall
    
	li $v0, 10
	syscall