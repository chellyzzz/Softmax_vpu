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

#ifndef _ISA_H_
#define _ISA_H_

#include "config.h"

// monitor
void init_sys(int argc,char *argv[]);
void init_isa();

typedef struct {
  word_t mtvec;
  word_t mepc;
  word_t mstatus;
  word_t mcause;
} CSRs;

typedef struct {
  word_t gpr[32];
  word_t pc;
  CSRs csr;
} CPU_state;

// decode
typedef struct {
  union {
    uint32_t val;
  } inst;
} Decode;

// reg
extern CPU_state cpu;
void isa_reg_display();
word_t isa_reg_str2val(const char *name, bool *success);
void isa_csr_display();

#endif