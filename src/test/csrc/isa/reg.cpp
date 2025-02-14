// #include <isa.h>
// #include "Vtop.h"
// #include "verilated.h"
// #include "verilated_vcd_c.h"

// const char *regs[] = {
//   "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2", //7
//   "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
//   "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
//   "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
// };

// const char *csrs[] = {
//   "mtevc", "mepc", "mstatus", "mcause"
// };

// void isa_reg_display() {
//   for(int i = 0;i < sizeof(regs)/sizeof(regs[0]); i++){
//     printf("%3s[%02d]: 0x%08x\t", regs[i], i, cpu.gpr[i]);
//     if((i+1) % 4 == 0) printf("\n");
//   }
// }

// void isa_csr_display(){
//   // for(int i = 0;i < sizeof(csrs)/sizeof(csrs[0]); i++){
//   //   word_t *ptr = (word_t *)&cpu.csr + i;
//   //   printf("%3s: 0x%08x\t", csrs[i], *ptr);
//   //   if((i+1) % 4 == 0) printf("\n");
//   // }
//   return ;
// }

// word_t isa_reg_str2val(const char *s, bool *success) {

//   for(int i = 0; i < sizeof(regs) / sizeof(regs[0]); i++){
//       if(strncmp(s+1, regs[i], strlen(regs[i])) == 0){
//         *success =true;
//         return cpu.gpr[i];
//       }
//   }
//       *success =false;
//       return 0;
// }