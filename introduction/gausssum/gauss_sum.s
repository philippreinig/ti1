.data
.text
.globl gauss_sum_iter
.globl gauss_sum_formula

main:
	addi $a0, $zero, 5
	jal gauss_sum_iter
	move $a0, $v0
	jal print_int
	
	jal print_line
	
	addi $a0, $zero, 5
	jal gauss_sum_formula
	move $a0, $v0
	jal print_int
	
	
	jal exit

gauss_sum_iter:
	move $t1, $a0

	loop:
    		beq $t1, 0, after_loop
    		add $t2, $t2, $t1
    		addi $t1, $t1, -1
    		j loop  
    		
	after_loop:
    
	addi $t3, $zero, 17

	move $v0, $t2
    	
	jr $ra
	

gauss_sum_formula:
	move $t0, $a0
	mul $t1, $t0, $t0
	add $t1, $t1, $t0
	addi $t2, $zero, 2
	div $t1, $t1, $t2
	
	move $v0, $t1
	
	jr $ra


print_int:
    li $v0, 1
    syscall
    jr $ra
    
print_string:
    li $v0, 4
    syscall
    jr $ra

    
print_line:
    li $a0, '\n'
    li $v0, 4
    jr $ra  

exit:
	li $v0, 10
    syscall
    	