# Change search loop to store four numbers at a time
# One giant loop

	.data	# Data declaration section
	InputSize: 	.space		80
	OutputSize:	.space		80
	StringInput: 	.asciiz 	"Please enter a string: "
	Input:		.asciiz		"\nThe base 64 input was: "
	Output:		.asciiz		"\nThe decoded ASCII output is: "
	Alphabet:	.asciiz		"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvqxyz0123456789+/"
	Bye: 		.asciiz 	"\nHave a great day"
	.text

main:		
	jal GetString
	jal DecodeFrom64
	
	la $a0, Input		#Puts input prompt into a0
	move $t0, $s1		#Puts input into t0
	jal PrintString
	
	la $a0, Output		#Puts output prompt into a0
	move $t0, $s2		#Puts output into t0
	jal PrintString
	
	jal End
	
	GetString:
		li $v0, 4
		la $a0, StringInput
		syscall
		li $v0, 8
		la $a0, InputSize
		move $s1, $a0	#Saves the string to s1
		move $t0, $a0	#Saves the string to t0
		syscall
		jr $ra
	
	DecodeFrom64:
		la $a0, OutputSize	#Sets the output size
		move $s2, $a0
			
			FindBase64Loop:
				li $t9, 0x0a
				
				lb $t3, ($t0)		#Loads the bit from the string into t3
				beq $t3, $t9, EndLoop	#Ends the loop when enter key is found
				add $t1, $t1, 1		#Increments t1 by 1
				add $t0, $t0, 1		#Increments t0 by 1
				
				
				lb $t4, ($t0)		#Loads the bit from the string into t4
				add $t1, $t1, 1		#Increments t1 by 1
				add $t0, $t0, 1		#Increments t0 by 1
				
				lb $t5, ($t0)		#Loads the bit from the string into t5
				add $t1, $t1, 1		#Increments t1 by 1
				add $t0, $t0, 1		#Increments t0 by 1
				
				lb $t6, ($t0)		#Loads the bit from the string into t6
				add $t1, $t1, 1		#Increments t1 by 1
				add $t0, $t0, 1		#Increments t0 by 1
				
				
			
				li $t1, 0		#Sets a counter to zero to go through alphabet
				la $t7, Alphabet	#Puts the alphabet into a temp register
				
				
				SearchAlphabetFirst:
					lb $t8,($t7)			#Get the bits from the alphabet
					beq $t8, $t3,FoundLetterFirst	#When letter is found this will end loop
					add $t1, $t1, 1			#Increments the Alphabet counter by 1
					add $t7, $t7, 1			#Increments t7 by 1
					b SearchAlphabetFirst
				
				FoundLetterFirst:
					move $t3, $t1		#Stores the characters location
					
					li $t1, 0		#Sets a counter to zero to go through alphabet
					la $t7, Alphabet	#Puts the alphabet into a temp register
					b SearchAlphabetSecond
				
				SearchAlphabetSecond:
					lb $t8,($t7)			#Get the bits from the alphabet
					beq $t8, $t4,FoundLetterSecond	#When letter is found this will end loop
					add $t1, $t1, 1			#Increments the Alphabet counter by 1
					add $t7, $t7, 1			#Increments t7 by 1
					b SearchAlphabetSecond
				
				FoundLetterSecond:
					move $t4, $t1		#Stores the characters location
					
					li $t1, 0		#Sets a counter to zero to go through alphabet
					la $t7, Alphabet	#Puts the alphabet into a temp register
					b SearchAlphabetThird
				
				SearchAlphabetThird:
					lb $t8,($t7)			#Get the bits from the alphabet
					beq $t8, $t5,FoundLetterThird	#When letter is found this will end loop
					add $t1, $t1, 1			#Increments the Alphabet counter by 1
					add $t7, $t7, 1			#Increments t7 by 1
					b SearchAlphabetThird
				
				FoundLetterThird:
					move $t5, $t1		#Stores the characters location
					
					li $t1, 0		#Sets a counter to zero to go through alphabet
					la $t7, Alphabet	#Puts the alphabet into a temp register
					b SearchAlphabetFourth
				
				SearchAlphabetFourth:
					lb $t8,($t7)			#Get the bits from the alphabet
					beq $t8, $t6,FoundLetterFourth	#When letter is found this will end loop
					add $t1, $t1, 1			#Increments the Alphabet counter by 1
					add $t7, $t7, 1			#Increments t7 by 1
					b SearchAlphabetFourth
				
				FoundLetterFourth:
					move $t6, $t1		#Stores the characters location
				
				AscIIShifting:
					sll $t3, $t3, 2		#Shifts first bite by 2
					srl $t7, $t4, 4		#shifts second bite by 4
					or $t9, $t7, $t3	#Or's the two bites together
					sb $t9, ($a0)		#Saves the or'ed bites 
					add $a0, $a0, 1		#Increments $a0
					
					sll $t4, $t4, 4		#Shifts first bite by 4
					srl $t7, $t5, 2		#shifts second bite by 2
					or $t9, $t4, $t7	#Or's the two bite together
					sb $t9, ($a0)		#Saves the or'ed bites 
					add $a0, $a0, 1		#Increments $a0
							
					sll $t5, $t5, 6		#Shifts first bite by 6	
					srl $t6, $t6, 0		#shifts second bite by 0
					or $t9, $t5, $t6	#Or's the two bites together
					sb $t9, ($a0)		#Saves the or'ed bites 
					add $a0, $a0, 1		#Increments $a0
					b FindBase64Loop
			
		EndLoop:
			jr $ra

	
	PrintString:		#prints the given strings
		li $v0, 4
		syscall
		move $a0, $t0
		syscall
		jr $ra
	
	End:
		li $v0, 4
		la $a0, Bye
		syscall
		li $v0, 10
		syscall