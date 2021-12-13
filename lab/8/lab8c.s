    .data
n:    .word 5
sum:  .word 0

	.text
main:
    lw   $a1, n
    jal  Rsum
    sw   $v0, sum

    li   $v0, 1
    lw   $a0, sum
    syscall

    li   $v0, 10
    syscall

Rsum:
    addi $sp, $sp, -8     # adjust stack for 2 items
    sw $ra, 0($sp)        # save return address
    sw $a1, 4($sp)

    li $t1, 1             # $t1 = 1
    bgt  $a1, $t1, L1     # if $a1(=n) > $t1(=1) goto L1
    move $v0, $a1         # if $a1(=n) == $t1(=1), result is $a0(=n)
    addi $sp, $sp, 8      # pop 2 items from stack
    jr   $ra              # and return
L1: 
    addi $a1, $a1, -1     # decrement n
    jal  Rsum             # recursive call: $v0=power(a, n-1)
    lw   $a1, 4($sp)      # retrive n
    add  $v0, $a1, $v0    # 

    lw   $ra, 0($sp)      # retrive return address
    addi $sp, $sp, 8      # restore sp
    jr   $ra              # and return