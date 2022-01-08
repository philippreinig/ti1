.data

f1: .float 0.5

.text
.globl circumference
# .globl area

main:
    li $a1, 1
    li $a0, 5   
    li $a2, 7
    
    jal circumference
    move $a0, $v0
    jal print_int
    
    li $v0, 10
    syscall


circumference:
	add $t1, $a0, $a1
	add $t1, $t1, $a2
	
	move $v0, $t1
	move $t1, $zero
	
	jr $ra

# Couldn't make this work
#area:
#    add $t0, $a0, $a1
#    mov.s $f0, f1
#    l.d  $f2, f1
#     
#    mul.d $f4, $f0, $f2
#    
#    move $v0, $f4
#
#   jr $ra


print_string:
    li $v0, 4
    syscall
    jr $ra


print_int:
    li $v0, 1
    syscall
    jr $ra


print_line:
    li $a0, '\n'
    jal print_string
    jr $ra
