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
#
# This simple program demonstrates writing very simple leaf procedures.
# The program computes an expression in the form of "4x - (2y + c)".
# You are to call the procedure "my_func", taking two parameters (x and y) and
# produce "4x - (2y + c)" within the procedure.

	.data
	.align 2
# Define the constant c here
C:	.word	1

Result1:
	.asciiz "Result for my_func(2,3): "
Result2:
	.asciiz "\nResult for my_func(5,6): "

	.text

main:
	addi $a2, $zero, 2
	addi $a3, $zero, 4

	# Call my_func(2, 3)
	addi	$a0, $zero, 2
	addi	$a1, $zero, 3
	jal	my_func
	add	$s0, $zero, $v0		# save result in $s0

	# Call my_func(5, 6)
	addi	$a0, $zero, 5
	addi	$a1, $zero, 6
	jal	my_func
	add	$s1, $zero, $v0     # save result in $s1

    	add $s1, $s1, $s0

    #
    # add code here to print the result of my_func(2,3) + my_func(5,6)
    #
    	la	$a0, Result1		
    	li	$v0, 4
    	syscall
    	
    	add 	$a0, $zero, $s0		#prints the result for 1
    	li	$v0, 1	
    	syscall
    	
    	la 	$a0, Result2
    	li 	$v0, 4
    	syscall
    	
    	add 	$a0, $zero, $s1		#prints the result for 2
    	li	$v0, 1
    	syscall    

	addi	$v0, $zero, 10				# system call for exit
	syscall

# my_func = 4x - (2y + 1)
my_func:
    #
    # your code for the procedure goes here 
    #
    	mul	$t0, $a3, $a0
    	mul 	$t1, $a2, $a1
    	addi	$t1, $t1, 1
    	sub	$v0, $t0, $t1
	jr $ra
