#include "common.h"

int main();

void halt(int code) {
  trap(code);
  while (1);
}

void check(bool cond) {
  if (!cond) halt(1);
}


void _trm_init() {
  int ret = main();
  halt(ret);
}
