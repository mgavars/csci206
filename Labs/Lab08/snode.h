/**
 * Mitch Gavars
 * Prelab 08 - snode.h
 * 03/04/2019
 */

struct snode {
  char str[100];
  int length;
  struct snode *next;
};

struct snode *snode_create(char *s, int length);
