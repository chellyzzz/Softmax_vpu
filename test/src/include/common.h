#ifndef __COMMON_H__
#define __COMMON_H__
#include <stddef.h>
#include <stdbool.h>

#define VLEN 2048
#define VLENB (VLEN / 8)
typedef float float32_t;
typedef double float64_t;
typedef _Float16 float16_t;

# define trap(code) asm volatile("mv a0, %0; ebreak" : :"r"(code))
#define LENGTH(arr)         (sizeof(arr) / sizeof((arr)[0]))


void halt(int code);
void check(bool cond);

#endif