#include <mem.h>

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
  printf("physical memory area [0x%016lx, 0x%016lx]", PMEM_LEFT, PMEM_RIGHT);
}

word_t paddr_read(paddr_t addr, int len) {
  word_t data;
  if (likely(in_pmem(addr))) {
    data = pmem_read(addr, len);
    return data;

  }
  out_of_bound(addr);
  return 0;
}

void paddr_write(paddr_t addr, int len, word_t data) {
  if (likely(in_pmem(addr))) {
    pmem_write(addr, len, data); 
    return; 
  }
  out_of_bound(addr);
}
