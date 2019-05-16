# UNTITLED PROGRAM

	.data	# Data declaration section
	Menu: .asciiz "\n Please enter 0 to quit, 1 for circle, 2 for square, 3 for rectangle."
	Prompt1: .asciiz "\n Please input a value for x1 = "
	Prompt2: .asciiz "\n Please input a value for y1 = "
	Prompt3: .asciiz "\n Please input a value for x2 = "
	Prompt4: .asciiz "\n Please input a value for y2 = "
	ResultC: .asciiz "\n Area of the circle is: "
	ResultS: .asciiz "\n Area of the square is: "
	ResultR: .asciiz "\n Area of the rectangle is: "
	Bye: .asciiz "\n Bye"

	.text

main:
# Start of code section
	li $t1,0
	li $t2,1
	li $t3,2
	li $t4,3
	
	li $v0, 4 	#Prints String
	la $a0, Menu	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t0,$v0
	
	beq $t0,$t1, End #Goes to end
	beq $t0,$t2, Circle #Goes to circle
	beq $t0,$t3, Square #Goes to square
	beq $t0,$t4, Rectangle #Goes to square
	
	Circle:
	li $v0, 4 	#Prints String
	la $a0, Prompt1	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t0,$v0
	
	
	li $v0, 4 	#Prints String
	la $a0, Prompt2	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t1,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt3	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t2,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt4	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t3,$v0
	
		sub $t5,$t2,$t0 #x2-x1
		mult $t5,$t5 #x^2
		mflo $t5
		
		sub $t6,$t3,$t1 #y2-y1
		mult $t6,$t6 #y^2
		mflo $t6
		
		add $t7, $t5, $t6 # adds x and y
		
		li $t8, 314156	#pi
		mult $t8,$t7
		mflo $t8
		
		li $t9, 100000
		div $t8,$t9
		mflo $t8
		
		li $v0,4 
		la $a0, ResultC
		syscall
		li $v0, 1
		move $a0, $t8
		syscall
		b main
		
		
	Square:
	li $v0, 4 	#Prints String
	la $a0, Prompt1	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t0,$v0
	
	
	li $v0, 4 	#Prints String
	la $a0, Prompt2	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t1,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt3	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t2,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt4	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t3,$v0
	
	sub $t5,$t2,$t0 #x2-x1
		mult $t5,$t5 #x^2
		mflo $t5
		
		sub $t6,$t3,$t1 #y2-y1
		mult $t6,$t6 #y^2
		mflo $t6
		
		add $t7, $t5, $t6 # adds x and y
		
		li $v0,4 
		la $a0, ResultS
		syscall
		li $v0, 1
		move $a0, $t7
		syscall
		b main
		
	
	Rectangle:
	li $v0, 4 	#Prints String
	la $a0, Prompt1	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t0,$v0
	
	
	li $v0, 4 	#Prints String
	la $a0, Prompt2	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t1,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt3	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t2,$v0
	
	li $v0, 4 	#Prints String
	la $a0, Prompt4	#Loads prompt
	syscall		#Prints the prompt
	li $v0, 5	#Read integer
	syscall		#Reads value into $v0
	move $t3,$v0
	
		sub $t5,$t2,$t0 #x2-x1
		
		sub $t6,$t3,$t1 #y2-y1
		
		mult $t5, $t6 # multiplies x and y
		mflo $t7
		
		li $v0,4 
		la $a0, ResultR
		syscall
		li $v0, 1
		move $a0, $t7
		syscall
		b main
	
	End:
	li $v0, 4	#Loads print string
	la $a0, Bye	
	syscall		#prints string bye
	li $v0, 10	
	syscall 	#Ends program
# END OF PROGRAM