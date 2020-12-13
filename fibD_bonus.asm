.data
str: .asciiz "Enter some number:\n"
str1: .asciiz "Invalid input\n"
.text
main:
	la $a0 , str
	li $v0 , 4
	syscall
	li $v0 , 5
	syscall
	move $a0 , $v0
	beqz $a0 , case1 #if input == 0 branch it to case1.
	beq $a0 , 1, case2 #elif input == 1 branch it to case2
	bltz $a0 , case3 # elif input < 0 branch it to case3
	j fib # call fib
	li $v0 ,10
	syscall
case1:
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
case2:
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
case3:
	li $v0 ,4
	la $a0 ,str1
	syscall
	li $v0 ,10
	syscall
fib:
	li $t0, 5 # A
	li $t1, 1 #B
	li $t2, 1 #C
	li $t3, 1 #D
	li $s0, 1 #i

loop:
	addi $s0, $s0, 1
	move $t4 ,$t0#buf
	mul $t0, $t0, $t2 # A*C
	mul $t5, $t1, $t3 #B*D
	mul $t5, $t5, 5 #B*D*5
	add $t0,$t0,$t5 # A += 5BD
	mul $t1,$t1,$t2 #B=BC
	mul $t5, $t4,$t3#bufD
	add $t1,$t1,$t5
	srl $t0 ,$t0 , 1
	srl $t1, $t1 , 1
	blt $s0, $a0 ,loop
	div $t0, $t0, 5
	move $a0 , $t0
	li $v0 , 1
	syscall
	li $v0, 10
	syscall
