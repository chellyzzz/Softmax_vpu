#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <stdint.h>
#include <inttypes.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

#include <assert.h>
#include <stdlib.h>

typedef uint32_t paddr_t;
typedef uint32_t word_t;

#define CONFIG_MSIZE 0x8000000
#define CONFIG_MBASE 0x80000000
#define RESET_VECTOR 0x80000000
#define PMEM_LEFT  ((paddr_t)CONFIG_MBASE)
#define PMEM_RIGHT ((paddr_t)CONFIG_MBASE + CONFIG_MSIZE - 1)

// #define CONFIG_WAVE

// 定义颜色
#define RESET      "\x1b[0m"
#define RED        "\x1b[31m"
#define GREEN      "\x1b[32m"
#define YELLOW     "\x1b[33m"
#define BLUE       "\x1b[34m"
#define MAGENTA    "\x1b[35m"
#define CYAN       "\x1b[36m"
#define WHITE      "\x1b[37m"

#define PRINTF(format, ...) \
    do { \
        printf(GREEN format RESET, ##__VA_ARGS__); \
    } while(0)

#endif