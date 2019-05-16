##################
#Assignment 2	 #
#Scott Carpenter #
#CSC 311         #
##################

	.data	# Data declaration section
	string1: .space 80	#sets bit size for first string
	string2: .space 80	#sets bit size for second string
	string3: .space 80
	
	EnterInput: .asciiz "Please enter a string: \n"
	Length1: .asciiz "\nThe length of the first string is: "
	Length2: .asciiz "\nThe length of the second string is: "
	NotEq: .asciiz "The two strings are not equal."
	YesEq: .asciiz "The two strings are equal."
	NewLine: .asciiz "\n"
	StringsAppended: .asciiz "\nThe strings appended is: "
	Bye: .asciiz "\nHave a good!\n"
	.text

main:
	li $t3, 0	#Sets the starting size of string 1
	li $t4, 0	#Sets the starting size of string 2
	
	jal UserInput
	
	move $t7, $t0
	jal Length	#Finds the length of the first string
	move $t3, $t2	#Puts the length into t3 for first string
	
	move $t7, $t1
	jal Length	#Finds the length of the second string
	move $t4, $t2	#Puts the length into t4 for second string
	
	jal PrintLength
	
	move $s2, $s0	#s2 recieves first string
	move $s3, $s1	#s3 recieves second string
	jal CMP
	
	move $t0, $s0	#t0 recieves first string
	move $t1, $s1	#t1 recieves second string
	la $a1, string1
	la $a2, string2
	jal AppendString
	
	jal End
	
		UserInput:
			#First String
			li $v0, 4		#Has user enter their input
			la $a0, EnterInput
			syscall
			
			li $v0, 8		#This is when the string can be loaded
			la $a0, string1		#This sets the size of a0
			li $a1, 80
			move $t0, $a0		#Saves the first string to t0
			move $s0, $a0
			syscall
			
			#Second String
			li $v0, 4		#Has user enter their input
			la $a0, EnterInput
			syscall
			
			li $v0, 8		#This is when the string can be loaded
			la $a0, string2		#This sets the size of a2
			li $a1, 80
			move $t1, $a0		#Saves the second string to t1
			move $s1, $a0
			syscall
			
			jr $ra

		Length:		#Gets the length of the string
			li $t2, 0	#Counts the length of the string
			li $t9, 0x0a	#End line character
			Loop:
				lb $t5, 0($t7)	#Loads bytes from a0
				beq $t9, $t5, EndLoop
				addi $t2, $t2, 1
				addiu $t7, $t7, 1	#adds one to the string
				b Loop
			EndLoop:	
			jr $ra
		
		CMP:			#Checks two string to see if the are equal
			bne $t3, $t4, NotEqual		#If lengths dont equal, they are not the same
			move $t8, $t3	#Max
			li $t9, 1	#counter
			CMPLoop:
				bgt $t9,$t8, Equal 	#Ends when count reaches the length
				lb $t5,($s2)		#Loads bytes from first string
				lb $t6,($s3)		#Loads bytes from second string
				bne $t5, $t6, NotEqual	#If it is not equal it will end here
				addiu $s2, $s2, 1	#Adds one for first string
				addiu $s3, $s3, 1	#Adds one for second string
				addi $t9, $t9, 1
				b CMPLoop
			NotEqual:		#Tells the user that the strings are not equal
				li $v0, 4
				la $a0, NotEq
				syscall
				jr $ra
			Equal:			#Tells the user that the strings are equal
				li $v0, 4	
				la $a0, YesEq
				syscall
				jr $ra
		
		AppendString:		#Combines two strings and puts a space between then
				la $a0, string3		#Allocates memory to a0
				move $s0, $a0
				li $t9, 0x0a		#Enter key
				
				AddString1:
					lb $t5,($a1)	
					beq $t9, $t5, AddString2
					beqz $t5, AddString2
					sb $t5, ($a0)
					addi $a1, $a1, 1	#adds one to the string
					addi $a0, $a0, 1
					b AddString1
				
				AddSpace:
					li $t0, ' '
					sb $t0, ($a0)
					addi $a0, $a0, 1
				
				AddString2:
					lb $t6,($a2)	
					beq $t9, $t6, EndAddition
					beqz $t6, EndAddition
					sb $t6, ($a0)
					addi $a2, $a2, 1	#adds one to the string
					addi $a0, $a0, 1
					b AddString2
				EndAddition:
					#move $s2,$a0 		#Stores the new string address in s2
					
					li $v0, 4
					la $a0, StringsAppended
					syscall
					move $a0, $s2
					syscall
					jr $ra
				
		
		PrintLength:
			#Prints first string
			li $v0, 4
			la $a0, Length1
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			
			#Prints second string
			li $v0, 4
			la $a0, Length2
			syscall
			li $v0, 1
			move $a0, $t4
			syscall
			
			li $v0, 4
			la $a0, NewLine
			syscall
			jr $ra
		
		End:				#Ends the program
			li $v0, 4
			la $a0, Bye
			syscall
			li $v0, 10
			syscall
	
# END OF PROGRAM