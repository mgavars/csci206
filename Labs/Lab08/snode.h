/**
 * Mitch Gavars
 * Prelab 08 - snode.h
 * 03/04/2019
 */

#ifndef _snode_H_
#define _snode_H_

struct snode {
  char *str;
  struct snode *next;
};

struct snode *snode_create(char *s);

void snode_destroy(struct snode *n);

#endif
