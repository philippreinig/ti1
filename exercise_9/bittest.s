.data

.text
.globl bittest
	# Assumes that x is in a0 and n in a1
	# Stores the result in v0
	bittest:
		srl $a0, $a0, $a1
		andi $v0, $a0, 1
		
		jr $ra	
			