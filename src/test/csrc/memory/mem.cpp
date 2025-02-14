#include <mem.h>
#include <config.h>

uint8_t *pmem = NULL;

word_t host_read(void *addr, int len) {
  switch (len) {
    case 1: return *(uint8_t  *)addr;
    case 2: return *(uint16_t *)addr;
    case 4: return *(uint32_t *)addr;
    case 8: return *(uint64_t *)addr;
    default: assert(0); return 0;
  }
}

void host_write(void *addr, int len, word_t data) {
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

bool in_pmem(paddr_t addr) {
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


static word_t pmem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void pmem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

void init_mem(int size) {
  pmem = (uint8_t *)malloc(size);;
  assert(pmem);
  uint32_t *p = (uint32_t *)pmem;
  int i;
  for (i = 0; i < (int) (size / sizeof(p[0])); i ++) {
    p[i] = rand();
  }
  PRINTF("physical memory area [0x%016lx, 0x%016lx]\n", PMEM_LEFT, PMEM_RIGHT);
}

word_t paddr_read(paddr_t addr, int len) {
  word_t data;
  if (in_pmem(addr)) {
    data = pmem_read(addr, len);
    return data;

  }
  out_of_bound(addr);
  return 0;
}

void paddr_write(paddr_t addr, int len, word_t data) {
  if (in_pmem(addr)) {
    pmem_write(addr, len, data); 
    return; 
  }
  out_of_bound(addr);
}
