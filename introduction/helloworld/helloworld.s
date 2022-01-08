.section .text

.global get_message

/*Berechnung des Flaecheninhalt*/
get_message:
	la $v0, helloworld

    /*Rücksprung zum Hauptprogramm*/
	jr $ra
.section .data

helloworld: .asciiz "Hello World!"
