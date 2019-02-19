# CSCI 206 Computer Organization & Programming
# Date: 2011-09-13
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
# This program calculates the sum of the values in array A and counts
# the number of values in the array.
#
# Similarly to a C-string, the array is terminated by sentinel value
# equal to zero.
#
# The sum is stored in $s0 and the count in $s1
.data	 
.align 2

countstring:
.asciiz "Number of elements = "
sumstring:
.asciiz "\nSummation = "
	.data
A:	
.word 5 4 3 2 4 1 0	# declare array int A[]={5,4,3,2,4,1,0};

.text	

init: 
	li 	$s3, 0 		# store 0 in i
	la 	$s4, A
 	
main:					# This symbols marks the first instruction of your program
					# The sum is stored in $s0 and the count in $s1	
	add	$t1, $zero, $s3 	# $t1 = i
	sll	$t1, $t1, 2 		# convert index to byte addres (multiply $t1 by 4)
	add	$t1, $t1, $s4		# $t1 = &save[0] + $t1 (byte address of save[i])
	lw	$t2, 0($t1)		# $t2 = save[i]
	add	$s0, $s0, $t2				
	beq	$t2, 0, terminate
	addi 	$s1, $s1, 1
	addi 	$s3, $s3, 1
	j main
	
terminate:
	
	la	$a0, countstring
	li	$v0, 4
	syscall
	
	add	$a0, $zero, $s1		# print value of the count
	li	$v0, 1
	syscall
	
	la	$a0, sumstring
	li	$v0, 4
	syscall
	
	add	$a0, $zero, $s0		# print value of the sum
	li	$v0, 1
	syscall
	
#
# Add your code here
#

	li	$v0, 10		# system call for exit
	syscall			# Exit!

