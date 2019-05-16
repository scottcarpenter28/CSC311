# UNTITLED PROGRAM

	.data	# Data declaration section
	PI: .double 3.14159
	Prompt: .asciiz "\n Please input a value(x1,y1,x2,y2):  "
	Area: .asciiz "\nArea is:"
	Bye: .asciiz "\nBye"
	.text

main:
# Start of code section
	jal PrintAsk
	jal EnterNum
	mov.d $f2, $f0 		#x1 val
	
	jal PrintAsk
	jal EnterNum
	mov.d $f4, $f0  	#y1 val
	
	jal PrintAsk
	jal EnterNum
	mov.d $f6, $f0  	#x2 val
	
	jal PrintAsk
	jal EnterNum
	mov.d $f8, $f0 		#y2 val
	
	b Circle
	
	PrintAsk:
		li $v0, 4 	#Prints String
		la $a0, Prompt	#Loads prompt
		syscall		#Prints the prompt
		jr $ra
	
	EnterNum:
		li $v0, 7	#Read double
		syscall		#Reads value into $v0
		jr $ra
		
	GetDist:
		mul.d $f10,$f10, $f10 #x^2
		mul.d $f12,$f12, $f12 #y^2
		jr $ra
	
	GetSides:
		#sub $t5,$t2,$t0 #x2-x1
		sub.d $f10, $f6, $f2
		#sub $t6,$t3,$t1 #y2-y1
		sub.d $f12, $f8,$f4
		jr $ra
		
	PrintRes:
		li $v0,4 
		la $a0, Area
		syscall
		li $v0, 3
		mov.d $f12, $f12
		syscall
		jr $ra
	
	Circle:
		jal GetSides
		jal GetDist
		
		add.d $f14, $f10, $f12 # adds x and y
		
		l.d $f30, PI
		mul.d  $f12, $f30 ,$f14
		jal PrintRes	
		b Square
		
		
	Square:	
		jal GetSides
		jal GetDist	
		add.d  $f12, $f12, $f10 # adds x and y	
		jal PrintRes	
		b Rectangle
		
	
	Rectangle:	
		jal GetSides
		mul.d  $f12, $f12, $f10 # adds x and 		
		jal PrintRes
		b End
	
	End:
		li $v0, 4	#Loads print string
		la $a0, Bye	
		syscall		#prints string bye
		li $v0, 10	
		syscall 	#Ends program
# END OF PROGRAM