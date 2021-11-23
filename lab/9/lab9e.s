# Output of Polynomial

	.data
aVal:		.space	4
bVal:		.space	4
cVal:		.space 	4
xVal:		.space	4
inPromptx:	.asciiz	"Enter the value for x: "
inPrompta:	.asciiz	"Enter the value for a: "
inPromptb:	.asciiz	"Enter the value for b: "
inPromptc:	.asciiz	"Enter the value for c: "
outPrompt:	.asciiz	"Value: "
newl:		.asciiz	"\n"


	.text
main:
	li $v0, 4
	la $a0, inPromptx
	syscall

	li $v0, 6
	syscall
	s.s $f0, xVal

	li $v0, 4
	la $a0, inPrompta
	syscall

	li $v0, 6
	syscall
	s.s $f0, aVal

	li $v0, 4
	la $a0, inPromptb
	syscall

	li $v0, 6
	syscall
	s.s $f0, bVal

	li $v0, 4
	la $a0, inPromptc
	syscall

	li $v0, 6
	syscall
	s.s $f0, cVal

	li $v0, 4
	la $a0, newl
	syscall

	l.s $f1, xVal
	l.s $f3, aVal
	l.s $f5, bVal
	l.s $f7, cVal

	mul.s $f5, $f5, $f1
	add.s $f7, $f7, $f5
	mul.s $f1, $f1, $f1
	mul.s $f3, $f3, $f1
	add.s $f3, $f3, $f7

	li $v0, 4
	la $a0, outPrompt
	syscall

	mov.d $f12, $f3
	li $v0, 2
	syscall

	li $v0, 10
	syscall


	