.data
Q1: .word 1,1,1,0
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
	beqz $a0, case2
	bltz $a0, case1
	li $s0, 1
	beq $a0, $s0, case3
	jal fib
case1: # case1 -> print str1(invalid input) and terminate
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 10
	syscall
case2: # case2 -> print 0 and terminate
	li $v0, 1
	syscall
	li $v0, 10
	syscall
case3:# case3 -> print 1 and terminate
	li $v0, 1
	syscall
	li $v0, 10
	syscall
fib:
	move $s0,$a0
	li $s1,1
	la $a0,Q1
loop:
	la $a1,Q1 #put Q in to a for mm;
	jal mmul
	move $a0,$v0 # put reslut of mmul inorder to expect for next mmul
	addi $s1,$s1,1 # i++
	blt $s1,$s0,loop
	lw $a0 ,4($v0) # we use address for mmul ,hence we need to load it back
	li $v0, 1
	syscall
	li $v0, 10
	syscall
mmul:
	move $t0, $a0
	move $t1, $a1
	li $a0, 16
	li $v0, 9
	syscall

	lw $t2, 0($t0)
	lw $t3, 4($t0)
	lw $t4, 0($t1)
	lw $t5, 8($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 0($v0)

	lw $t4, 4($t1)
	lw $t5, 12($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 4($v0)
	#r3
	lw $t4, 8($t1)
	lw $t5, 12($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 12($v0)
	#r2
	lw $t4, 0($t1)
	lw $t5, 8($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 8($v0)

	jr $ra
