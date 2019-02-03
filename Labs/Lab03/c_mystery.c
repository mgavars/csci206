/* Mitch Gavars
 * Jan 29, 2019
 * lab03 - c_mystery.c
 * notes: translation of mystery.asm into C language
 *
 */

#include <stdio.h>

int main(void) {
  int t0 = 0;
  int t1 = 0;
  int unused = 0xdeadbeef;
  int x = 89;

  while (t0 <= 10) {
    t1 += t0;
    t0 += 1; 
  }

  x = t1;
  return x;

}
