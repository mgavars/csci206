# Mitch Gavars
# Lab07 - isprime.s
# 02/26/19
	
.data
	
# $s0 will be used as a counter
# $s1 will be used as the inputted n value	
# $s3 will hold the remainder values	
	
.text
	.global is_prime


is_prime:
	li $s0, 2		# initialize counter to start at 2
	
	move $s1, $a0		# load the int into $s1

loop:
	beq $s0, $s1, prime		# branching when the loop is completed
	nop
	
	rem $s3, $s1, $s0	# set $s3 to be the remainder of n / i

	beq $s3, $zero, not_prime	# branch if remainder is 0
	nop
	
	addi $s0, $s0, 1

	j loop

not_prime:
	li $v0, 0		# return 0 if not prime

	j exit

prime:
	li $v0, 1		# return 1 if prime
	
exit:
	jr $ra
	
	
	
