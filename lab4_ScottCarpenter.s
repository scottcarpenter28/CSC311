# UNTITLED PROGRAM

	.data	# Data declaration section
	Set1: .asciiz "Set 1, "
	Set2: .asciiz "Set 2,  "
	newLine: .asciiz "\n"
	Spacek: .asciiz " "
	UserNum: .asciiz "\nPlease enter a number: "
	ContainsX: .asciiz "\nYes The number is in "
	DoesNotContainX: .asciiz "\nNo The number is in "
	IntersectionText: .asciiz "\nThe intersection of set 1 and set 2 is: "
	Bye: .asciiz "\nHave a great day!"
	.text

main:		# Start of code section

	li $t0, 0xaaaaaaaa	#Set one
	li $t1, 0x24924924	#Set two
	li $t6, 32
	
	li $v0, 4
	la $a0, Set1
	syscall
	move $t8, $t0
	jal PrintSet	#print first set
	
	li $v0, 4
	la $a0, Set2
	syscall
	move $t8, $t1	#prints second set
	jal PrintSet
	
	li $v0, 4
	la $a0, UserNum
	syscall		#Gets user number
	li $v0, 5
	syscall
	move $t7, $a0
	
	move $t8, $t0
	jal FindElement #Checks to see if it is in set 1
	li $v0, 4
	la $a0, Set1
	syscall
	
	move $t8, $t1
	jal FindElement	#Checks to see if it is in set 2
	li $v0, 4
	la $a0, Set2
	syscall
	
	#move $t8, $t0
	#move $t9, $t1
	#li $v0, 4
	#la $a0, IntersectionText
	#syscall
	#jal Intersection
	
	
	b End
	
	PrintSet:
		li $t2, 1		#Mask
		li $t3, 1		#Count
		
		Loop:
			bgt $t3, $t6, EndLoop
			and $t4, $t2, $t8
			beqz $t4, Next
		
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, Spacek
			syscall	
		
		Next:
			addi $t3,$t3,1
			sll $t2,$t2, 1 
			b Loop
		
		EndLoop:
		li $v0, 4
		la $a0, newLine
		syscall
		jr $ra	
	
	FindElement:
		and $t4, $t7, $t8
		beqz $t4, Next
		
		
		Yes:
			li $v0, 4
			la $a0, ContainsX
			syscall	
			jr $ra
		No:
			li $v0, 4
			la $a0, DoesNotContainX
			syscall	
			jr $ra
			
		jr $ra
		
		
	Intersection:
		li $t2, 1		#Mask
		li $t3, 1		#Count
		Loop2:
			bgt $t3, $t6, EndLoop2
			and $t4, $t2, $t8	#Ands set 1
			and $t5, $t2, $t9	#Ands set 2
			and $t5, $t4, $t5
			
			beqz $t5, Next
		
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, Spacek
			syscall	
		
		Next2:
			addi $t3,$t3,1
			sll $t2,$t2, 1 
			b Loop2
			
		EndLoop2:
		jr $ra
	
	End:
		li $v0, 4
		la $a0, Bye
		syscall
		li $v0, 10
		syscall
	
# END OF PROGRAM