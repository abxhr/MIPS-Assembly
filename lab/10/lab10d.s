    .data

units:      .asciiz "Enter the number of units: "
line:       .asciiz "\n"
notequal:   .asciiz "Not Equal!"

    .text

main:
    li.s $f1, 50.0
    li.s $f2, 150.0
    li.s $f3, 250.0

    li.s $f4, 0.50
    li.s $f5, 0.75
    li.s $f6, 1.20
    li.s $f7, 1.50

    li.s $f8, 25.0
    li.s $f9, 100.0
    li.s $f10, 220.0

    li.s $f11, 0.20

    li $v0,4
    la $a0, units
    syscall

    li $v0,6
    syscall

    c.le.s $f0, $f1
    bc1t L1
    c.le.s $f0, $f2
    bc1t L2
    c.le.s $f0, $f3
    bc1t L3
        
    sub.s $f0, $f0, $f3
    mul.s $f12, $f0, $f7
    add.s $f12, $f12, $f10

    mul.s $f13, $f12, $f11
    add.s $f12, $f12, $f13

    li $v0,2
    syscall

    li $v0,10
    syscall

L1:	
    mul.s $f12, $f0, $f4

    mul.s $f13, $f12, $f11
    add.s $f12, $f12, $f13

    li $v0,2
    syscall

    li $v0,10
    syscall

L2:	
    sub.s $f0, $f0, $f1
    mul.s $f12, $f0, $f5
    add.s $f12, $f12, $f8

    mul.s $f13, $f12, $f11
    add.s $f12, $f12, $f13

    li $v0,2
    syscall

    li $v0,10
    syscall

L3:	
    sub.s $f0, $f0, $f2
    mul.s $f12, $f0, $f6
    add.s $f12, $f12, $f9

    mul.s $f13, $f12, $f11
    add.s $f12, $f12, $f13

    li $v0,2
    syscall

    li $v0,10
    syscall