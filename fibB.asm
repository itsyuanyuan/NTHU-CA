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
	beq $a0, $zero, ret_zero # n==0 return 0
	li $t0, 1
	beq $t0, $a0, ret_one # n==1 return 1
	addi $sp , $sp , -12 # since we here three term to save we shift 4*3
	addi $a0, $a0, -1
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	jal fib
	sw $v0, 8($sp)#call fib(n-1) here

	lw $a0, 0($sp)
	addi $a0 , $a0, -1
	sw $a0, 0($sp)
	jal fib#call fib(n-2) here, since we have only one ra target , function didn't need to save another ra
	lw $s0 ,8($sp)
	lw $ra, 4($sp)
	addi $sp,$sp,12
	add $v0, $v0, $s0 # fib(n-1) + fib(n-2)
	jr $ra

ret_one:
	li $v0, 1
	jr $ra
ret_zero:
	li $v0, 0
	jr $ra

