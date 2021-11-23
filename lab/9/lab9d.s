# Farenheit to Celsius

	.data
inPrompt:	.asciiz	"Enter the Fahrenheit Value: "
outPrompt:	.asciiz "Celsius: "
newl:		.asciiz	"\n"

	.text
main:
	li $v0, 4
	la $a0, inPrompt
	syscall

	li $v0, 7
	syscall	

	li.d $f6, 32.0
	sub.d $f0, $f0, $f6

	li.d $f6, 5.0
	li.d $f8, 9.0
	div.d $f6, $f6, $f8
	
	mul.d $f12, $f0, $f6

	li $v0, 4
	la $a0, outPrompt
	syscall

	li $v0, 3
	syscall

	li $v0, 10
	syscall