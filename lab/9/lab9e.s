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

	l.s $f2, xVal
	l.s $f4, aVal
	l.s $f6, bVal
	l.s $f8, cVal

	mul.s $f6, $f6, $f2
	add.s $f8, $f8, $f6
	mul.s $f2, $f2, $f2
	mul.s $f4, $f4, $f2
	add.s $f4, $f4, $f8

	li $v0, 4
	la $a0, outPrompt
	syscall

	mov.d $f12, $f4
	li $v0, 2
	syscall

	li $v0, 10
	syscall


	