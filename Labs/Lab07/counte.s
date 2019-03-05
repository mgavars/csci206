# Mitch Gavars
# Lab 07 - counte.s
# 03/04/19

.data
	# $s2 will hold the iterator
	# $s4 will hold the e count
	
e:	 .asciiz "e"
	

.text
	.global counte

counte:
	li 	$t1, 0

	la 	$t2, e		# store value of e into $s3
	lb	$s3, 0($t2)

	la	$s5, $a0	# load address of string
	jal	efind		# call function convert
	nop

	add	$a0, $zero, $v0
	li 	$v0, 1
	syscall

	li 	$v0, 10		# exit to OS
	syscall

	
efind:
	add 	$s1, $s5, $t1	# load address of $a0 into
	lb	$s2, 0($s1)	# set $s2 equal to the first byte
	addi	$t1, $t1, 1	# increment
	nop
	beq	$s2, $s3, found	# if found e, jump to found
	nop
	beq	$s2, $zero, end
	nop
	j	efind
	nop

found:
	addi	$s4, $s4, 1
	nop
	j	efind
	nop

end:
	move	$v0, $s4
	jr	$ra
	nop
