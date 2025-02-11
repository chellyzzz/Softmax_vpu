#ifndef __MEM_H__
#define __MEM_H__
#include "isa.h"

word_t paddr_read(paddr_t addr, int len);
void paddr_write(paddr_t addr, int len, word_t data);
void init_mem(int size);  

uint8_t *pmem = NULL;

static inline word_t host_read(void *addr, int len) {
  switch (len) {
    case 1: return *(uint8_t  *)addr;
    case 2: return *(uint16_t *)addr;
    case 4: return *(uint32_t *)addr;
    case 8: return *(uint64_t *)addr;
    default: assert(0); return 0;
  }
}

static inline void host_write(void *addr, int len, word_t data) {
  switch (len) {
    case 1: *(uint8_t  *)addr = data; return;
    case 2: *(uint16_t *)addr = data; return;
    case 4: *(uint32_t *)addr = data; return;
    case 8: *(uint64_t *)addr = data; return;
    default: assert(0); return ;
  }
}

void out_of_bound(paddr_t addr) {
  printf("address = 0x%016lx is out of bound of pmem [0x%016lx, 0x%016lx] at pc = 0x%016lx\n",
      addr, PMEM_LEFT, PMEM_RIGHT, cpu.pc);
}

inline bool in_pmem(paddr_t addr) {
  if(addr - CONFIG_MBASE <= CONFIG_MSIZE && addr >= CONFIG_MBASE){
    return 1;
  }
  else{
    out_of_bound(addr);
  }
  return 0;
}

uint8_t* guest_to_host(paddr_t paddr) { 
  if (in_pmem(paddr)) {
    return pmem + paddr - CONFIG_MBASE;
  }
  else {
    out_of_bound(paddr);
    return NULL;
  }
}

void init_mem(int size);

#endif