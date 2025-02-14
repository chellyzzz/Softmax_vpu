#ifndef __MEM_H__
#define __MEM_H__
#include "isa.h"

word_t paddr_read(paddr_t addr, int len);
void paddr_write(paddr_t addr, int len, word_t data);

void init_mem(int size);  

extern uint8_t *pmem;

word_t host_read(void *addr, int len);
void host_write(void *addr, int len, word_t data);
uint8_t* guest_to_host(paddr_t paddr);

void out_of_bound(paddr_t addr);
bool in_pmem(paddr_t addr);
void init_mem(int size);

#endif