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
# This program uses a procedure xfind to find a particular character.
# See detailed instructions in lab handout
#
# $a0 will hold the starting memory address of the string
# $v0 will hold the result as a valid address or -1
# $ra is the return address for the procedure

	.data
# Define constants here

	li 	$t1, 0		# iterator
	
	.align 2


# These are the two test strings, use one at a time
string: .asciiz "Where is my xbox 360?"
#string: .asciiz "None of that character in here."
#string: .asciiz "Nonex of that character in here."

x:	.asciiz "x"

	.text

main:
	# Prepare for procedure call
	addi	$sp, $sp, -4		# saving registers
	sw	$ra, 0($sp)
	
	la 	$t2, x			# load x
	lb	$s3, 0($t2)	
	
	la	$a0, string		# load address of string
	jal	xfind			# call function convert
    	
    	
    	add 	$a0, $zero, $v0		# prints the address found
    	li	$v0, 34
    	syscall  


	lw	$ra, 0($sp)		# restoring registers
	addi	$sp, $sp, 4
	
	li	$v0, 10			# exit to OS
	syscall
	

# write the code of function xfind after this comment
xfind:
	add	$s1, $a0, $t1		# $s1 = string[i]
	lb 	$s2, 0($s1)
	beq	$s2, $s3, complete	# check to see if string[i] = x
	beq	$s2, $zero, failed
	addi	$t1, $t1, 1
	j 	xfind
	
failed:
	addi 	$a0, $zero, -1		#print -1 if failed to find x
    	li	$v0, 1
    	syscall    
    	
    	li	$v0, 10			# exit to OS
	syscall
	
complete:	
	move 	$v0, $s1		# move address into return value
	jr 	$ra

	
	
	
	
	
