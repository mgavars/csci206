# Mitch Gavars
# Lab07 - matrix_sum.s
# 03/04/19
	
.data

.text
	.global matrix_sum

matrix_sum:
	li	$t2, 7

loop:
	lw	$t0, 0($a0)
	lw 	$t1, 0($a1)
	beqz	$t2, terminate
	nop
	add	$t3, $t0, $t1
	sw	$t3, 0($a2)
	addi	$a0, $a0, 4
	addi 	$a1, $a1, 4
	addi 	$a2, $a2, 4
	addi	$t2, t2, -1
	j 	loop
	nop

terminate:
	jr	$ra
	nop
	
