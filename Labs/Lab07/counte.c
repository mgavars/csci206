/**
 * Mitch Gavars
 * Lab07 - counte.c
 * 02/26/19
 */

#include <stdio.h>
#define MAX_SIZE 100

extern int counte(char c[]);

int main(void){
  
  char* input;
  char size[MAX_SIZE];
  int count;

  printf("Enter a string : ");
  fgets(str, MAX_SIZE, stdin);
  input = str

  count = counte(input);

  printf("There are %d e's", count);
}
  
