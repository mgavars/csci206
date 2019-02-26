# Mitch Gavars
# Lab06 - collatz.s

.data

arrow: .asciiz " ==> "
newline: .asciiz "\n"

	# $s0 will be used as a counter

.text

main:
	li	$s0, 1		# initialize counter at 1
	li 	$s1, 100	# set $s1 to be the total collatz calls (0-99)
loop:
	beq	$s0, $s1, exit
	
	move	$a0, $s0	# move counter to parameter
	
	jal find_length
	
	move 	$s3, $v0	# move result of find_length to $s3
	
	# Print the index
	add 	$a0, $s0, $zero
	li 	$v0, 1
	syscall
	
	# Print the arrow
	la 	$a0, arrow
	li 	$v0, 4
	syscall
	
	# Print the collatz result
	li 	$v0, 1
	add 	$a0, $s3, $zero
	syscall

	# Print newline
	li 	$v0, 4
	la	$a0, newline
	syscall
	
	addi	$s0, $s0, 1	# increment
	
	j loop
	
	
exit:	# exit the program

	li 	$v0, 10
	syscall
	
find_length:
	
	addi 	$sp, $sp, -8	# allocate two words on the stack
	
	# store $ra and current n value to the stack
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)
	
	addi 	$t0, $zero, 1	# check if n is less than or equal to 1
	sle	$t1, $a0, $t0
	beq	$t1, 0, else	# branch to else if false
	
	li 	$v0, 1		# if it is true, return 1
	
	lw	$ra, 4($sp)	# pop $ra and current n value
	lw	$a0, 0($sp)
	addi	$sp, $sp, 8
	
	jr $ra
	
else:	
	# else is branched to when collatz will be called with a new n value
	jal collatz
	
	move	$a0, $v0	# move the result so find_length can be called
	jal find_length
	
	addi	$v0, $v0, 1
	lw	$ra, 4($sp)
	lw 	$a0, 0($sp)
	addi	$sp, $sp, 8
	
	jr $ra
	
collatz:
	
	addi 	$t0, $zero, 1	# if n=1, end the loop
	beq	$t0, $a0, finish_loop
	
	add 	$t1, $zero, 1	# check if n is even
	and	$t2, $a0, $t1
	bne 	$t2, $zero, odd	# branch to odd if n is odd, else go to even
	
even:
	
	sra	$v0, $a0, 1	# n / 2
	j end

odd:
	
	addi 	$t1, $zero, 3	# 3 * n + 1
	mul	$a0, $a0, $t1
	addi	$v0, $a0, 1
	j end
	
finish_loop:

	li	$v0, 1		# return 1
	
end:
	
	jr $ra			# jump back
	
	
	
	
	
	
	