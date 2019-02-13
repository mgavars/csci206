# Mitch Gavars
# Lab04 Makefile
# 02/12/19

all: head2 head3 string_token

head3: head3.c fileio.c
	gcc -Wall head3.c fileio.c -o head3

head2: head2.c fileio.o
	gcc -Wall head2.o fileio.o -o head2

head2.o: head2.c fileio.h
	gcc -Wall fileio.c -o fileio.o -c

make string_token;
