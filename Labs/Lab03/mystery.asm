
# CSCI 206 Computer Organization & Programming
# Date: 2011-08-29
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
# Student name:


	.data
	
unused:	.word 0xDEADBEEF			
						
x:	.word 89				
						
	.text	
main:						# This tells the simulator
						# where start your program

	
	add		$t0, $zero, $zero	# assign $t0 to 0
	add		$t1, $zero, $zero	# assign $t1 to 0	

loop:						# start of the loop
	add		$t1, $t1, $t0		# add $t0 to $t1
	addi		$t0, $t0, 1		# increment $t0
	ble		$t0, 10, loop		# branch to loop if $t0 less than or equal to 10

	la		$t2, x			# copy address of x into $t2
	sw		$t1, 0($t2)		# store word in register $t1 from address ($t2 + 0)
	
	li		$v0, 10			# system call for exit
	syscall					# Exit!

