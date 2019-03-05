/* 
 * Mitch Gavars
 * Lab 07 - primes2.c
 * 02/26/19
 *
 *  real: 11.774s
 *  user: 1.384s
 *  sys: 4.284s
 */
#include <stdio.h>
 
#define MAX 10020
 
extern int is_prime(int);

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
