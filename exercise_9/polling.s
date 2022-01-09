# -*- asm -*-

.data
		
.text
.globl main

main:
	addi	$sp,$sp,-4	# Save $ra. 
	sw	$ra,0($sp)	

	lui	$t0,0xffff	# t0 = base addr for I/O register
	
	loop:
		# looping until receiver_ready bit is 1
		receiver_polling:
			# check receiver_ready bit
			lw $t1, ($t0)
			andi $t1, $t1, 1
			beqz $t1, receiver_polling # as long as the receiver_ready bit is 0 continue the loop
			lw $t2, 4($t0) # load the value and save it in t2
		
			jr $ra # exit function
		
		# looping until transmitter_ready bit is 1		
		transmitter_polling;
			# check transmitter_ready bit
			lw $t3, 8($t0)
			andi $t3, $t3, 1
			beqz $t3, transmitter_polling # same behaviour like receiver_polling	
			sw $t2, 12($t0) # store the value into memory at address of transmitter_data - receiver stored it in $t2
		
			jr $ra # exit function
		
		jal receiver_polling
		jal transmitter_polling
	j loop		# endless loop
