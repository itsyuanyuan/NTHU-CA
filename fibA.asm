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
case1: # case 1-> print 0 and terminate
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
case2:# case 2-> print 1 and terminate
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
case3:# case3 -> print str1(invalid input) and terminate
	li $v0 ,4
	la $a0 ,str1
	syscall
	li $v0 ,10
	syscall
fib:#initail the loop head
	addi $t0,$zero , 0 # f0
	addi $t1,$zero , 1 #f1
	addi $t2,$zero , 1 #i
loop:#this is loop body
	addi $t2 ,$t2 ,1 #i++
	add  $t3 ,$t1 ,$t0 # f2 = f1 + f0
	move $t0 ,$t1 # f0 = f1
	move $t1 ,$t3 #f1 = f0
	bne  $a0 , $t2 ,loop # if i < j branch to loop
	move $a0 , $t3#if end loop just move the result into a0 to print
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
