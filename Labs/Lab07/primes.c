/* 
 * Mitch Gavars
 * Prelab 07
 * 02/25/19
 *
 *  real: 9.529s
 *  user: 3.908s
 *  sys: 4.884s
 */
#include <stdio.h>
 
#define MAX 10020
 
int is_prime(int n)
{
  int i;
   // return 1 if n is prime, 0 otherwise
  for (i = 2; i < n -1; i++) {
      if (n % i == 0) {
	return 0;
      }
  }

  return 1;
}

int main (void)
{
    int i, n = 0;
 
    for (i = 2; n < MAX; i++){
        if (is_prime(i)){
            if ((n % 10) == 0){
                printf("\n");
            }
            printf("%7d", i);
            n++;
        }
    }
    printf("\n");
 
    return 0;
}
