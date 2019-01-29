/* Mitch Gavars
 * Jan 22 8am
 * lab 02 - primefact.c
 * notes: Comparing performance of C vs Python
 *
 * The execution time for C is so much faster than Python. The execution time 
 * for Python was about 9.926 seconds and C was .133 seconds.
 *
 */

#include <stdio.h>

int main(void) {
  
  int n = 2147483645;
  int i = 2;

  while(i <= n) {
    if (n % i == 0) {
      printf("%d\n", i);
      n = (int)n / i;
      i -= 1;
    }
    
    i += 1;

  }
  return 0;
}
