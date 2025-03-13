#include "verilated_dpi.h"
#include <mem.h>
#include <isa.h>

// uint64_t load_cnt = 0;
// uint64_t store_cnt = 0;
// uint64_t brch_cnt = 0;
// uint64_t csr_cnt = 0;
// uint64_t jal_cnt = 0;
// uint64_t ifu_delay_start = 0;
// uint64_t ifu_delay_end = 0;
// uint64_t load_delay_start = 0;
// uint64_t load_delay_end = 0;
// uint64_t store_delay_start = 0;
// uint64_t store_delay_end = 0;
// uint32_t icache_miss = 0;


extern "C" void npc_pmem_read(int raddr,int *rdata, int ren, int len){
  // raddr = raddr & ~0x3u;  //clear low 2bit for 4byte align.
  if (ren){
    // printf("raddr: 0x%08x, len : %d\n", raddr, len);
    *rdata = paddr_read(raddr, 4);
  }
  else *rdata = 0;
  return ;
}

extern "C" void npc_pmem_write(int waddr, int wdata, int wen, int len){
  // waddr = waddr & ~0x3u;  //clear low 2bit for 4byte align.
  if(wen){
    switch (len)
    {
      case 1:   paddr_write(waddr, 1, wdata); break; // 0000_0001, 1byte.
      case 2:   paddr_write(waddr, 2, wdata); break; // 0000_0011, 2byte.
      case 4:   paddr_write(waddr, 4, wdata); break; // 0000_1111, 4byte.
      default:  break;
    }
  }
  // printf("waddr: 0x%08x\n", waddr);
  return ;
}
