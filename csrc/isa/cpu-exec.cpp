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

#include "Vtop.h"
#include "Vtop___024root.h"

static VerilatedContext* contextp;; 
static Vtop* top;
static VerilatedVcdC* vcd;

// #define MAX_DEADS 100000
#ifdef MAX_DEADS  
bool dead_detector = true;
int dead_cycles   = 0;
#endif

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

void verilator_sync_init(VerilatedContext* contextp_sdb, Vtop* top_sdb, VerilatedVcdC* vcd_sdb){
  contextp = contextp_sdb;
  top = top_sdb;  
  vcd = vcd_sdb;
}

void decode_pc(){
  // s->pc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__exu2wbu_pc_next;
  // s->snpc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__exu2wbu_pc_next + 4;
  // s->dnpc = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__ifu_pc_next;
  // s->isa.inst.val = top->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT____Vcellout__ifu2idu_regs__o_ins;
  // instr = s->isa.inst.val;
  return;
}

void exec_once(){
    cycles ++;
    top->reset = 0;
    top->clock = 0;
    top->eval();
    #ifdef CONFIG_WAVE
    if(wave_enable){
      contextp->timeInc(1);
      vcd->dump(contextp->time());
    }
    #endif  
    top->clock = 1;
    top->eval();
    #ifdef CONFIG_NVBOARD
    nvboard_update();
    #endif
    reg_update();
    decode_pc();
    #ifdef CONFIG_WAVE
    if(wave_enable){
      contextp->timeInc(1);
      vcd->dump(contextp->time());
    }
    #endif
    return;
}

void cpu_exec(uint64_t n){
    for(; n > 0; n--){
      if(if_end()){
        printf("Program execution has ended. To restart the program, exit NPC and run again.\n");
        printf("npc: %s at pc = %lx\n", (hit_goodtrap() ? "HIT GOOD TRAP" : "HIT BAD TRAP"), cpu.pc);
        break;
      }
      exec_once();
    }
    return;
}
bool if_end(){
  return (top->rootp->io_ebreak == 1);
}

int hit_goodtrap(){
  return (cpu.gpr[10] == 0);
}
