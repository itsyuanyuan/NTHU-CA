.data
str: .asciiz "Enter some number:\n"
str1: .asciiz "Invalid input\n"
.text
main:
	la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	bltz $a0, case1
	li $a1, 0#a
	li $a2, 1#b
	jal fib
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
case1: # case1 -> print str1(invalid input) and terminate
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 10
	syscall
fib:
	beq $a0, $zero, ret_a # n==0 return 0
	addi $a0, $a0, -1
	move $s0, $a2
	add $a2, $a2, $a1
	move $a1, $s0
	j fib
ret_a:
	move $v0 ,$a1
	jr $ra
