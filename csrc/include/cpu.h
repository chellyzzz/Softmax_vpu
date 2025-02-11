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

#ifndef __CPU_H__
#define __CPU_H__

#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vtop.h"

//in cpu-exec
extern uint64_t cycles;
extern uint64_t ins_cnt;
extern uint64_t ifu_cnt;

// exec
void cpu_exec(uint64_t n);

int hit_goodtrap();
bool if_end();
void verilator_sync_init(VerilatedContext* contextp_sdb, Vtop* top_sdb, VerilatedVcdC* vcd_sdb);

#endif
