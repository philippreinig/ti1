#include <stdio.h>

/*Funktionsdeklaration für die Assemblerfunktionen*/
extern char* get_message ();

int main()
{
    /*Funktionsaufrufe*/
	char* text = get_message();

    /*Ausgabe der berechneten Werte*/
	printf("====TI1-Hello-World====\n");
	printf("Message: %s\n", text);
	printf("===========================\n");
}
