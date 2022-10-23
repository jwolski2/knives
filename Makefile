all: doublefree halt mainonly halt

doublefree:
	gcc -o bin/doublefree doublefree/main.c

mainonly:
	gcc -o bin/mainonly mainonly/main.c

halt:
	gcc -o bin/halt halt/main.c
