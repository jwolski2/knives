all: doublefree empty halt

doublefree:
	gcc -o bin/doublefree doublefree.c

empty:
	gcc -o bin/empty empty.c

halt:
	gcc -o bin/halt halt.c
