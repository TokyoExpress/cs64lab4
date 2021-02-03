# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	q1: .asciiz "Enter a number:\n"
	q2: .asciiz "Factorial of "
	q3: .asciiz " is:\n"
	q4: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:

	li $v0, 4
	la $a0, q1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	move $t2, $v0

	li $t1, 1

	j loop

loop:
	beq $t0, 0, exit
	mult $t1, $t0
	mflo $t1
	addi $t0, $t0, -1
	j loop

exit:
	li $v0, 4
	la $a0, q2
	syscall

	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, q3
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, q4
	syscall
	
	li $v0, 10
	syscall
