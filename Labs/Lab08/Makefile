# Mitch Gavars
# Lab 08 - Makefile
# 03/04/19

all: song_list snode_test
snode_test: snode.c snode_test.c
	gcc -Wall snode.c snode_test.c -o snode_test

song_list: slist.c song_list.c slist.h snode.h snode.c
	gcc -Wall slist.c song_list.c snode.c -o song_list
