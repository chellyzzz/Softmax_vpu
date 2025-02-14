#include <cpu.h>
#include <isa.h>

VerilatedContext* contextp = new VerilatedContext;  
Vtop* top =new Vtop{contextp};  

#ifdef VCD
    #include "verilated_vcd_c.h"
    VerilatedVcdC* tfp = nullptr;
#endif


void init_sim(int argc, char *argv[]) {
    top->reset = 1;
    top->clock = 0;
#ifdef VCD
    Verilated::mkdir("logs");
    contextp->traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("logs/top.vcd");
#endif
    Verilated::commandArgs(argc,argv);
}

void sim_exit(){
    top->final();
    #if VCD
        tfp->close();
        tfp = nullptr;
    #endif
    delete top;
    delete contextp;
}

void reset(int n) {
    top->reset = 1;
    while (n-- > 0) single_cycle();
    top->reset = 0;
    top->eval();
}

int main(int argc,char *argv[]){
    init_sim(argc, argv);
    reset(10);
    init_sys(argc, argv);
    cpu_exec(1000);
    sim_exit();
    return 0;
}

