/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#include <cpu.h> 

CPU_state cpu;

void reg_update(){  
  // for(int i = 0; i < 32; i++){
  //   cpu.gpr[i] = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__regfile1__DOT__rf[i];
  // }
  // cpu.csr.mstatus = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mstatus;
  // cpu.csr.mepc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mepc;
  // cpu.csr.mtvec = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mtvec;
  // cpu.pc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__ifu_pc_next;
  // #ifdef PC_WAVE_START
  // if(cpu.pc == PC_WAVE_START){
  //   wave_enable = true;
  // }
  // #endif
  return;
}

void decode_pc(){
  // s->pc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__exu2wbu_pc_next;
  // s->snpc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__exu2wbu_pc_next + 4;
  // s->dnpc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__ifu_pc_next;
  // s->isa.inst.val = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT____Vcellout__ifu2idu_regs__o_ins;
  // instr = s->isa.inst.val;
  return;
}

void single_cycle() {

  contextp->timeInc(1);
  top->clock = 0; top->eval();
  
  #ifdef VCD
  tfp->dump(contextp->time());
  #endif

  contextp->timeInc(1);
  top->clock = 1; top->eval();

  #ifdef VCD
  tfp->dump(contextp->time());
  #endif
}

int hit_goodtrap(){
  return (cpu.gpr[10] == 0);
}

bool if_end(){
  return (top->rootp->io_ebreak == 1);
}

void cpu_exec(uint64_t n){
    for(; n > 0; n--){
      if(if_end() | contextp->gotFinish()){
        printf("Program execution has ended. To restart the program, exit NPC and run again.\n");
        printf("npc: %s at pc = %lx\n", (hit_goodtrap() & if_end() ? "HIT GOOD TRAP" : "HIT BAD TRAP"), cpu.pc);
        break;
      }
      single_cycle();
    }
    return;
}
