/**
 * Mitch Gavars
 * Professor Meng
 * Lab09 - Exercise 2
 * arithm.c
 * 3/19/19
 */

#include "arithm.h"
#include "bitlib.h"
#include <math.h>

uint32_t full_adder(uint32_t a, uint32_t b){
  uint32_t xor = a ^ b;
  uint32_t carry = a & b;
  uint32_t retValue = carry ^ xor;
  carry = (carry & xor) | (a & b);
  retValue = retValue + carry;
  return retValue;
}

uint32_t adder_32(uint32_t a, uint32_t b){
  uint32_t retValue = 0;
  int i = 0;
  for (i = 0; i < 32; ++i){
    retValue = full_adder(a,b);
  }
  return retValue;
}

uint64_t multiplier_32(uint32_t a, uint32_t b){
  uint64_t retValue = 0;
  while (b != 0){
    if((b & 1) != 0){
      retValue = retValue + a;
    }
    a = a << 1;
    b = b >> 1;
  }
  return retValue;
}

uint32_t get_twoscomp_32(uint32_t a){
  uint32_t twos_comp = ~a + 1;
  return twos_comp;
}

uint32_t subtractor_32(uint32_t a, uint32_t b){
  uint32_t retValue;
  uint32_t twos_comp = get_twoscomp_32(b);
  retValue = adder_32(a, twos_comp);
  return retValue;
}

uint64_t divider_32(uint32_t a, uint32_t b, uint32_t *rem){
  uint64_t remainder = a;
  uint64_t quotient = 0;
  int i; 
  for (i = 0; i < 32; ++i) {
    remainder = remainder - b;
    if (remainder & 0x8000) {
      remainder = remainder + b;
      quotient = quotient << 1;
    }
    else {
      quotient = (quotient >> 1) | 0x1;
    }
    b = b >> 1;
  }
  return quotient;
}
