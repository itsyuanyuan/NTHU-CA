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
	addi $a0, $v0, 0
	bltz $a0, case1 #branch if number < 0
	jal fib
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
case1:
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 10
	syscall
fib:
	beq	$a0, $zero, ret_zero
	li	$s0, 1	#i
	li	$s1, 1	#fi
	li	$s2, 1	#fi1
	srl $s7, $a0, 1	#n>>1
loop:
	beq $a0, $s0, ret #endloop
	bgt $s0,$s7,case2
	mul $s4, $s1, $s1
	mul $s5, $s2, $s2
	add $s3, $s4, $s5 #F2i1 = Fi*Fi+Fi1*Fi1;
	sll $s5, $s2, 1	  #2*Fi1
	sub $s5, $s5, $s1 #2*Fi1-Fi
	mul $s5, $s1, $s5 #Fi*(2*Fi1-Fi);
	addi $s1, $s5, 0 #Fi=F2i;
	addi $s2, $s3, 0#Fi1=F2i1;
	sll $s0, $s0, 1 #i = i*2
	j loop
case2:
	add  $s6, $s2, $s1 #Fi2 = Fi1+Fi;
	addi $s1, $s2, 0 #Fi = Fi1;
	addi $s2, $s6, 0
	addi $s0, $s0, 1 #i++
	j loop
ret:
	move $v0, $s1
	jr $ra
ret_zero:
	li $v0, 0
	jr $ra
