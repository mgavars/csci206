/**
 * Mitch Gavars
 * Prelab 08 - snode.h
 * 03/04/2019
 */

struct snode {
  char *str;
  struct snode *next;
};

struct snode *snode_create(char *s);

void snode_destroy(struct snode *n);
