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
bool if_stop = false;

void reg_update(){  
  cpu.gpr[0] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_0;
  cpu.gpr[1] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_1;
  cpu.gpr[2] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_2;
  cpu.gpr[3] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_3;
  cpu.gpr[4] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_4;
  cpu.gpr[5] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_5;
  cpu.gpr[6] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_6;
  cpu.gpr[7] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_7;
  cpu.gpr[8] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_8;
  cpu.gpr[9] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_9;
  cpu.gpr[10] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_10;
  cpu.gpr[11] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_11;
  cpu.gpr[12] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_12;
  cpu.gpr[13] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_13;
  cpu.gpr[14] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_14;
  cpu.gpr[15] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_15;
  cpu.gpr[16] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_16;
  cpu.gpr[17] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_17;
  cpu.gpr[18] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_18;
  cpu.gpr[19] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_19;
  cpu.gpr[20] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_20;
  cpu.gpr[21] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_21;
  cpu.gpr[22] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_22;
  cpu.gpr[23] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_23;
  cpu.gpr[24] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_24;
  cpu.gpr[25] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_25;
  cpu.gpr[26] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_26;
  cpu.gpr[27] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_27;
  cpu.gpr[28] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_28;
  cpu.gpr[29] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_29;
  cpu.gpr[30] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_30;
  cpu.gpr[31] = top->rootp->top__DOT__cpu__DOT__regfile__DOT__regfile_31;
  // cpu.csr.mstatus = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mstatus;
  // cpu.csr.mepc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mepc;
  // cpu.csr.mtvec = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__Csrs__DOT__mtvec;
  if(top->rootp->top__DOT__cpu__DOT__wbu__DOT__o_pc_next != 0){
    cpu.pc = top->rootp->top__DOT__cpu__DOT__wbu__DOT__o_pc_next;
    if(cpu.pc == 0x80000068){
      if_stop = true;
    }
  }
  #ifdef PC_WAVE_START
  if(cpu.pc == PC_WAVE_START){
    wave_enable = true;
  }
  #endif
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
  reg_update();
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
      if(if_end() | contextp->gotFinish() | if_stop){
        printf("Program execution has ended. To restart the program, exit NPC and run again.\n");
        printf("npc: %s at pc = %lx\n", (hit_goodtrap() & if_end() ? "HIT GOOD TRAP" : "HIT BAD TRAP"), cpu.pc);
        break;
      }
      single_cycle();
    }
    return;
}
