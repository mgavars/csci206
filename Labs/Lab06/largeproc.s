# CSCI 206 Computer Organization & Programming
# Date: 2011-09-19
# Copyright (c) 2011 Bucknell University
#
# Permission is hereby granted, free of charge, to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software"), to use, copy, modify, and
# distribute without restriction, provided that this copyright and
# permission notice is maintained, intact, in all copies and
# supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
# KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
# THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Student name: Mitch Gavars
#
# This program demonstrates passing a large number of arguments to a
# procedure which is not a leaf procedure.

	.data
	.align 2
A:	.word 3
B:	.word 7
C:	.word 4
D:	.word 9
E:	.word 3
F:	.word 8
Result1:.word 0xDEADBEEF
Result2:.word 0xDEADBEEF
result1:.asciiz "largeProc result 1: "
result2:.asciiz "\nlargeProc result 2: "

	.text

# The main() procedure calls largeProc, storing the results into
# Result1 and Result2 and also printing them out to the terminal.

main:
	lw 	$a0, A		# load the four passable arguments
	lw	$a1, B
	lw 	$a2, C
	lw 	$a3, D
	
	lw	$t0, E		# pass the other two arguments onto the stack
	lw	$t1, F
	
	addi	$sp, $sp, -8	# make room for the two values that cannot pass as arguments into the stack
	sw	$t1, 0($sp)	# add F to the stack
	sw	$t0, 4($sp)	# add E to the stack
# Prepare arguments to pass to largeProc


# Call largeProc

	jal largeProc

# Print the results returned from largeProc
	move 	$t0, $v0
	move 	$t1, $v1

	li 	$v0, 4
	la	$a0, result1
	syscall

	add	$a0, $zero, $t0		# print largeProc answer 1
    	li	$v0, 1
    	syscall  
    	
    	li 	$v0, 4
	la	$a0, result2
	syscall

	add	$a0, $zero, $t1		# print largeProc answer 2
    	li	$v0, 1
    	syscall  
# The program is finished. Terminate the execution.
	addi	$v0, $zero, 10		# system call for exit
	syscall

# This large complicated procedure takes 6 paramters and returns 2.
# Additionally this procedure calls another procedure.
# It is assumed that $fp has been set correctly

largeProc:

# your code goes here
	
	# Store registers which must be saved onto the stack
	addi 	$sp, $sp, -4
	sw	$ra, 0($sp)
	lw 	$t1, 4($sp)	# store F into $t1
	lw 	$t0, 8($sp)	# store E into $t0
	
	# Compute the first result
	add 	$t3, $a1, $a2
	add 	$v0, $t3, $t0
	
	# Compute the second result
	sub 	$t4, $a0, $a3
	add 	$v1, $t4, $t1

	
	# Call smallProc for the heck of it, but save $v0,
	# and $v1 because smallProc could possibly overwrite them!
	addi 	$sp, $sp, -8
	sw	$v0, 4($sp)
	sw	$v1, 0($sp)
	
	jal smallProc

	# Restore registers using the stack
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	lw	$v1, 0($sp)
	
	addi	$sp, $sp, 20

	jr	$ra

# This procedure computes nothing useful, it just returns

smallProc:

	jr	$ra
		
