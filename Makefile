all: doublefree/main mainonly/main halt/main

doublefree/main:
	gcc -o bin/doublefree doublefree/main.c

mainonly/main:
	gcc -o bin/mainonly mainonly/main.c

halt/main:
	gcc -o bin/halt halt/main.c
