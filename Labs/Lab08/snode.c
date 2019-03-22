/**
 * Mitch Gavars
 * Prelab 08 - snode.c
 * 03/04/19
 */

#include "snode.h"
#include <string.h>
#include <stdlib.h>

struct snode * snode_create(char *s){
  struct snode *new = (struct snode*)malloc(sizeof(struct snode));
  new->str = malloc(sizeof(char) * (sizeof(s) + 1));
  strcpy(new->str, s);
  new->next = NULL;
  return new;
}

void snode_destroy(struct snode *n){
  n->next = NULL;
  free(n->str);
  free(n->next);
  free(n);
}
