# UNTITLED PROGRAM

	.data	# Data declaration section
	newLine: .asciiz "\n"
	Spacek: .asciiz " "
	.text

main:		# Start of code section
	
	li $t0, 1		#mask
	li $t1, 1 		#count
	li $t8, 0xaaaaaaaa	#Set one
	li $t2, 20
	
	b loop
	
	loop: 	bgt $t1, $t2, EndLoop
		and $t4, $t0, $t8
		beqz $t4, Next
		li $v0, 1
		move $a0, $t1
		syscall
		
		Next:
		sll $t0 $t0, 1
		addiu $t1, $t1, 1

	
	EndLoop:
		li $v0, 1
		move $a0, $t0
		syscall
	
	li $v0, 10
	syscall
# END OF PROGRAM