.data
	newline: .asciiz "\n"
.text
	.globl fibonacci_iter
	.globl faculty_rec

	main:
		#addi $a0, $zero, 10
		#jal fibonacci_iter
		#move $a0, $v0
		#jal print_int
		
		#jal print_newline
		
		addi $a0, $zero, 5
		jal faculty_rec
		move $a0, $v0
		jal print_int
		
		jal exit
	

	fibonacci_iter:
		bltz $a0, negative_value
		blt $a0, 1, zero_or_one
	
		addi $t0, $zero, 2
		addi $t1, $zero, 1
		addi $t2, $zero, 1
	
		loop:
			beq $a0, $t0, loop_end
			addi $t0, $t0, 1
			move $t3, $t2
			add $t2, $t1, $t2
			move $t1, $t3
			j loop	
		
		
		negative_value:
			move $v0, $zero
			jr $ra	
		
		
		zero_or_one:
			addi $t0, $zero, 1
			move $v0, $t0
			jr $ra
		
		loop_end:	
			move $v0, $t2
			jr $ra
		
	faculty_rec:
		#make space on the stack and store address and value
		addi $sp, $sp, -4
		sw $ra, ($sp)
		addi $sp, $sp, -4
		sw $s0, ($sp)
		
		li $v0, 1
		beq $a0, 0, base_case_hit
		#update values
		move $s0, $a0
		addi $a0, $a0, -1
		#call function again
		jal faculty_rec
		mul $v0, $s0, $v0 
		#base case hit behaviour
		base_case_hit:
			lw $s0, ($sp)
			addi $sp, $sp, 4
			lw $ra, ($sp)
			addi $sp, $sp, 4
			jr $ra	
		
	print_int:
    		li $v0, 1
    		syscall
    		jr $ra
   
   
   	print_newline:
   		la $a0, newline		# load address of the string
   		li $v0, 4       	# call
		syscall
		
		jr $ra

	exit:
		li $v0, 10
    		syscall
    	
