# CSCI 206 Computer Organization & Programming
# Date: 2011-09-13
# Copyright (c) 2011 Bucknell University
#
# Permission is hereby granted  free of charge  to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software")  to use  copy  modify  and
# distribute without restriction  provided that this copyright and
# permission notice is maintained  intact  in all copies and
# supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS"  WITHOUT WARRANTY OF ANY
# KIND  EXPRESS OR IMPLIED  INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY  FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY
# CLAIM  DAMAGES OR OTHER LIABILITY  WHETHER IN AN ACTION OF CONTRACT 
# TORT OR OTHERWISE  ARISING FROM  OUT OF OR IN CONNECTION WITH
# THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Student name: Mitch Gavars
#
# This program calculates the sum of the squares from 0 to 99
.data	 
.align 2

sumstring:
.asciiz "\nSummation = "
	.data
	
A:	
.word 1 2 3 4 5 6 7 8 9 
10 11 12 13 14 15 16 17 18 19 
20 21 22 23 24 25 26 27 28 29 
30 31 32 33 34 35 36 37 38 39 
40 41 42 43 44 45 46 47 48 49  
50 51 52 53 54 55 56 57 58 59  
60 61 62 63 64 65 66 67 68 69  
70 71 72 73 74 75 76 77 78 79  
80 81 82 83 84 85 86 87 88 89  
90 91 92 93 94 95 96 97 98 99 0
	
.text

init: 
	li 	$s3, 0 		# store 0 in i
	la 	$s4, A

main: 
 	
 	add	$t1, $zero, $s3 	# $t1 = i
	sll	$t1, $t1, 2 		# convert index to byte addres (multiply $t1 by 4)
	add	$t1, $t1, $s4		# $t1 = &save[0] + $t1 (byte address of save[i])
	lw	$t2, 0($t1)		# $t2 = save[i]
	beq	$t2, 0, terminate
	mult	$t2, $t2
	mflo 	$s1			
	add	$s0, $s0, $s1
	addi 	$s3, $s3, 1
	j main
	
	
terminate:
	
	add	$a0, $zero, $s0		# print value of the count
	li	$v0, 1
	syscall
	
	li	$v0, 10		# system call for exit
	syscall			# Exit!
	
	
	
	