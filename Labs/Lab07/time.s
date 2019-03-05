# Mitch Gavars
# Lab 07 - time.s
# 03/04/19

.data

.text
	.global add_second

add_second:
	addi	$v0, $a0, 1
	jr	$ra
