# minimum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	q1: .asciiz "Enter the next number:\n"
	q2: .asciiz "Minimum: "
	q3: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	li $v0, 4
	la $a0, q1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, q1
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, q1
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 4
	la $a0, q2
	syscall

	blt $t0, $t1, fork1
	blt $t1, $t0, fork2

fork1:
	blt $t0, $t2, print0
	j print2

fork2: 
	blt $t1, $t2, print1
	j print2

print0:
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit

print1: 
	
	li $v0, 1
	move $a0, $t1
	syscall

	j exit

print2:

	li $v0, 1
	move $a0, $t2
	syscall

	j exit


exit:

	li $v0, 4
	la $a0, q3
	syscall

	li $v0, 10
	syscall
