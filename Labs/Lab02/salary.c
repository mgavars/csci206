/* Mitch Gavars
 * Jan 22, 8am
 * lab 02 - salary.c
 * compile with: make salary
 * notes: none
 */
#include <stdio.h>
 
int main(void) {
   int hourlyWage = 20;
 
   printf("Annual salary is: ");
   printf("%d", hourlyWage * 40 * 50);
   printf("\n");
 
   return 0;
}
