# UNTITLED PROGRAM

	.data	# Data declaration section
	Prompt1: .asciiz "\nPlease enter a positive number, 0 to quit."
	NegNumb: .asciiz "\nNumber needs to be positive"
	ToTurnOff: .asciiz "\n Enter the number of which one to turn off(Example every two)."
	LightOn: .asciiz "\nThe last light is on."
	LightOff: .ascii "\nThe last light is off."
	Remainder: .asciiz "\n Remainder is "
	Bye: .asciiz "\nBye"
	.text

main:		# Start of code section
	b Loop
	
	Loop:
		li $t0,0 		#set to zero
		li $v0, 4
		la $a0, Prompt1		#Asks for number of lights
		syscall
		li $v0, 5
		syscall
		move $t1, $v0 		#number of lights
	
		bltz $t1, Negative	#If a negative number is input
		beq $t1, $t0, End	#Ends program
		bgez $t1, Lights 	#Starts solving light problem
	
	Negative:
		li$v0, 4
		la $a0, NegNumb		#Tells the user
		syscall			#Number must be >0
		b Loop
	
	Lights:
		li $v0, 4
		la $a0, ToTurnOff	#Asks the user what lights
		syscall			#can be turned off
		li $v0, 5
		syscall
		move $t2, $v0 		#ith number
		bltz $t2, Negative	#If a negative number is input
		bgez $t2, LightCheck
	
	LightCheck:
		div $t1, $t2
		mfhi $t3			#divs numbers then gets remainder
		beq $t3, $t0, LightIsOff	#Then will report if last light is on/off
		bgez $t3, LightIsOn
	
	LightIsOff:
		li$v0, 4
		la $a0, LightOff	#This is when the remainder is zero
		syscall
		b Loop
	
	LightIsOn:
		li$v0, 4
		la $a0, LightOn		#This is when the remainder is >0
		syscall
		b Loop
	
	End:
		li $v0, 4
		la $a0, Bye		#Ends the program
		syscall
		li $v0, 10
		syscall

# END OF PROGRAM