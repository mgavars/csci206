/**
 * Mitch Gavars
 * Prelab 08 - snode_test.c
 * 03/04/19
 */

#include <stdio.h>
#include "snode.h"
#include <string.h>
 
// global variables (data segment)
 
struct snode *n1, *n2, *n3, *p;
 
//------------ MY MAIN FUNCTION --------------------
 
int main(int argc, char *argv[]) {
 
  // create snodes
  n1 = snode_create("hello");
  n2 = snode_create("there");
  n3 = snode_create("prof");
 
  printf("snode_test running...\n");
 
  // manually "link" the nodes together.
  n1->next = n2;
  n2->next = n3;
  n3->next = NULL;
 
  // p points to node n1 initially
  p = n1;
 
  while (p != NULL) {
    // Complete this line to print the current node's string and   
    // the stored length (do not use strlen!)
    printf("str: %s - length: %zu\n", p->str, strlen(p->str)); // TODO
	   
    p = p->next;
    // TODO: add code to move p to point to next node
    // until you add this line, this program will have an infinite loop.
  }

  snode_destroy(n1);
  snode_destroy(n2);
  snode_destroy(n3);
 
  return 0;
}
