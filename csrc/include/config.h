#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <stdint.h>
#include <inttypes.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

#include <macro.h>

#include <assert.h>
#include <stdlib.h>

typedef uint64_t paddr_t;
typedef uint64_t word_t;

#define CONFIG_MSIZE 0x8000000
#define CONFIG_MBASE 0x80000000
#define RESET_VECTOR 0x80000000
#define PMEM_LEFT  ((paddr_t)CONFIG_MBASE)
#define PMEM_RIGHT ((paddr_t)CONFIG_MBASE + CONFIG_MSIZE - 1)

#endif