/**
 * Mitch Gavars
 * Prelab 08 - snode.c
 * 03/04/19
 */

#include "snode.h"
#include <string.h>
#include <stdlib.h>

struct snode * snode_create(char *s, int length){
  struct snode *new = malloc(sizeof(struct snode));
  //new->str = malloc(sizeof(char) * (length + 1));
  strcpy(new->str, s);
  new->length = length;
  new->next = NULL;
  return new;
}
