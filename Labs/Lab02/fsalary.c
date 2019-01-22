/* Mitch Gavars
 * Jan 22, 8am
 * lab 02 - isalary.c
 * compile with: make salary
 * notes: none
 */
#include <stdio.h>
 
int main(void) {
   float hourlyWage;
   int weeksWorked;

   printf("Enter hourly wage (float): ");
   scanf("%f" , &hourlyWage); 
   printf("Enter weeks worked (integer): ");
   scanf("%d" , &weeksWorked); 
   
   printf("Annual salary is: ");
   printf("%f", hourlyWage * 40 * weeksWorked );
   printf("\n");
 
   return 0;
}
