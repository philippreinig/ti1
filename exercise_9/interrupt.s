# -*- asm -*-
  
  ##########################################################
  # main program
  ##########################################################
  # Main runs in an  infinite loop, which continuosly 
  # outputs '.' characters, and starts a new line every 32 
  # characters.
  ##########################################################
  
  .ktext  
  .globl main
main:
  addi  $sp, $sp, -4  # save $ra. 
  sw    $ra, 0($sp)  

  lui   $t0, 0xffff  # t0 = base addr for I/O register
  li    $t1,32       # initialize character counter
  li    $t2, 46      # load $t2 with '.' (ASCII 46)
  
  # setup interrupts #########################################
  # (a) enable interrupt for receive register
  # (b) enable interrupts for CPU, enable HW interrupts level 1
  
  # **** YOUR CODE GOES HERE ****
      
loop:
  addiu $t1, $t1, -1 # decrement character counter

poll_tx:
  lw    $t3, 8($t0)  # read transmitter control reg
  andi  $t3, $t3,1   # mask bit 0 (ready)
  beqz  $t3, poll_tx
  sw    $t2, 12($t0) # write data to transmitter
  li    $t2, 46      # load $t2 with '.' (ASCII 46)
  bgtz  $t1, loop    # if character couter > 0 jmp loop 
  li    $t1, 32      # reset character counter
  li    $t2, 10      # load $t2 with newline (ASCII 10)
  j     loop         # endless loop

  #################################################################
  # Interrupt Handler
  #################################################################

  .ktext 0x80000180  # Forces interrupt routine below to be
                     # located at address 0x80000180.

interrupt:
  # save registers
  # read received data
  # transmit received data (polling for transmitter ready)
  # reset interrupt
  # restore registers
  
  .set noat	     	# tell assembler to stop using assembly temporary ($at)
  sw	$at, save_at    # now we can safely use it
  .set at	     	# give back $at to the assembler

    # **** YOUR CODE GOES HERE ****

  .set noat 
  lw    $at, save_at
  .set at 

  eret 

  # In the exception handler, registers shall not be saved to 
  # the stack but to fixed memory locations. Hence, we reserve 
  # memory to save the registers used by the interrupt handler
  .kdata
  save_at: .word 0
  save_t0: .word 0
  save_t1: .word 0
  save_t2: .word 0
  save_t3: .word 0
  
  ##########################################################
  # startup code
  # Invoke the routine "main" with arguments: main(argc, argv, envp)
  ##########################################################
  .ktext
  .globl __start
__start:
  lw    $a0, 0($sp)  # argc
  addiu $a1, $sp, 4  # argv
  addiu $a2, $a1, 4  # envp
  sll   $v0, $a0, 2
  addu  $a2, $a2, $v0
  jal   main
  nop
  li    $v0, 10
  syscall            # syscall 10 (exit)
