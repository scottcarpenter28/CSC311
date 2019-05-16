# UNTITLED PROGRAM

	.data	# Data declaration section
	Information: .asciiz "This program takes 2 numbers than returns the greates common denominator \n"
	askUser: .asciiz "Please enter a number: "
	GCDRes: .asciiz "The Result is: \n"
	Bye: .asciiz "Have a great day"
	.text

main:		# Start of code section
	li $t0, 2
	li $v0, 4
	la $a0, Information
	syscall
	jal AskNum
	jal GetNum
	move $t1, $v0
	jal AskNum
	jal GetNum
	move $t2, $v0
	b GCD
	
	AskNum:
		li $v0, 4
		la $a0,askUser
		syscall
		jr $ra
		
	GetNum:
		li $v0, 5
		syscall
		jr $ra
		
	GCD:
		beq $t1, $t2, PrintResult
		mult $t0, $t1
		mflo $t1
		mult $t0, $t2
		mflo $t2
		add $t0, $t0, 1
		b GCD
		
	PrintResult:
		li $v0 , 4
		la $a0, GCDRes
		syscall
		la $v0 1
		move $a0, $t1
		syscall
		b End
		
	End:
	li $v0, 4
	la $a0, Bye
	syscall
	li $v0 10
	syscall