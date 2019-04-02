/*
 * CSCI 206 Computer Organization & Programming
 * Author: Alan Marchiori
 * Date: 2014-03-01
 * Copyright (c) 2014 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * on files (the "Software"), to use, copy, modify, and
 * distribute without restriction, provided that this copyright and
 * permission notice is maintained, intact, in all copies and supporting
 * documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define EPSILON 0.1

/* Forward declaration for our assembly functions
 * so gcc knows the return type (the return type defaults
 * to int so, it would look in the $v0 register w/o this).
 * Knowning the return type is a float/double gcc will
 * look in the $f0 (float) or $f0-$f1 (double) registers.
 */
float one_half_single(void);
double one_half_double(void);

uint32_t f2u(float f);
float u2f(uint32_t);

int main()
{ 
    printf ("0.5 (single) = %f\n", one_half_single());
    inspect_float(0.5);
    printf ("0.5 (double) = %lf\n", one_half_double());
    inspect_double(0.5);
    show_precision();
    printf("%s\n", is_near(2,2.2,EPSILON) ? "true" : "false");
    printf("%s\n", is_near(2,2.05,EPSILON) ? "true" : "false");

    return 0;
}

void inspect_float(float i){
  uint32_t a;
  a = f2u(i);
  uint32_t sign = a >> 31;
  uint32_t exponent = a << 1;
  exponent = exponent >> 24;
  uint32_t mant = a << 9;
  mant = mant >> 9;
  printf("sign = %u, exponent = 0x%x, fraction = 0x%x\n", sign, exponent, mant);
}

void inspect_double(double d){
  uint64_t a;
  memcpy((void*) &a, &d, sizeof(a));
  uint64_t sign = a >> 63;
  uint64_t exponent = a << 1;
  exponent = exponent >> 53;
  uint64_t mant = a << 12;
  mant = mant >> 12;
  printf("sign = 0x%llx, exponent = 0x%llx, fraction = 0x%llx\n", sign, exponent, mant);
}

void show_precision(){
  inspect_float(1.0);
  inspect_double(u2f(f2u(1.0)+1));
}

void sum(){
  float a = 0.1;
  float sum = 0.0;
  int i;
  for (i = 0; i < 1000; i++){
    sum += a;
  }
  printf ("a = %1.28f, sum = %1.28f, sum == 100 ==> %s\n",
            a,
            sum,
            sum == 100 ? "TRUE":"FALSE");
 
    inspect_float(a);
    inspect_float(sum);
    inspect_float(100-sum);
}

bool is_near(float a, float b, float epsilon){
  float temp = fabsf(a-b);
  if(temp > epsilon){
    return false;
  }
  else {
    return true;
  }
}
