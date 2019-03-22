/**
 * Mitch Gavars
 * Lab08 - slist.c
 * 3/20/19
 */

#include <stdint.h>
#include "snode.h"
#include "slist.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


/**
 * Allocates new slist dynamically.
 * 
 * @return pointer to the list
 */
struct slist *slist_create(){
  struct slist *new = (struct slist*)malloc(sizeof(struct slist));
  new->front = NULL;
  new->back = NULL;
  return new;
}

/** 
 * Inserts new node in slist after the last node.
 *
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct snode* slist_add_back(struct slist *l, char *str){
  struct snode *new;
  new = snode_create(str);
  if (slist_length(l) == 0) {
    l->back = new;
    l->front = new;
  }
  else {
    l->back->next = new;
    l->back = new;
  }
  return new;
}

/** 
 * Inserts new node in slist before the first node.
 *
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct snode* slist_add_front(struct slist *l, char *str){
  struct snode *new;
  new = snode_create(str);
  new->next = l->front;
  l->front = new;
  return new;
}

/**
 * Returns the first snode with the given string.
 *  
 * @param l pointer to the list (non-NULL)
 * @parap str pointer to a string
 * @return struct snode* or NULL if no match
 */
struct snode* slist_find(struct slist *l, char *str){
  struct snode *new;
  new = l->front;
  while (new != NULL){
    if (strcmp(new->str, str) == 0){
      return new;
    }
    new = new->next;
  }
  return NULL;
}

/**
 * Deallocate a list and all snodes
 *
 * @param l pointer tot he list
 */
void slist_destroy(struct slist *l){
  struct snode *new;
  new = l->front;
  while (new != NULL){
    new = new->next;
  }

  free(l->front);
  free(l->back);
  free(l);
}

/**
 * Traverse the list and print the content of each node.
 *
 * @param l pointer to the list (non-NULL)
 */
void slist_traverse(struct slist *l){
  struct snode *new;
  new = l->front;
  while (new != NULL){
    printf("%s", new->str);
    new = new->next;
  }
}

/**
 * Returns the number of elements in the list (nodes).
 *
 * @param l pointer to the list (non-NULL)
 */
uint32_t slist_length(struct slist *l){
  int count = 0;
  struct snode *new;
  new = l->front;
  while (new != NULL){
    count += 1;
    new = new->next;
  }
  return count;
}
