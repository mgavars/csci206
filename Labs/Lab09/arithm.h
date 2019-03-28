/**
 * Mitch Gavars
 * Professor Meng
 * Lab09 - Exercise 2
 * arithm.h
 * 3/19/19
 */

#ifndef _ARITH_H
#define _ARITH_H

#include <stdio.h>
#include <stdint.h>

#define WORD_LEN 32
#define BYTE_LEN 8

uint32_t full_adder( uint32_t a, uint32_t b );

uint32_t adder_32( uint32_t a, uint32_t b );

uint64_t multiplier_32( uint32_t a, uint32_t b );

uint32_t get_twoscomp_32( uint32_t a);

uint32_t subtractor_32( uint32_t a, uint32_t b );

uint64_t divider_32( uint32_t a, uint32_t b, uint32_t *rem );

#endif
