TOP = top
MAIN = top.topMain
BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/OBJ_DIR
TOPNAME = top
TOP_V = $(BUILD_DIR)/$(TOPNAME).v

SCALA_FILE = $(shell find ./src/main/ -name '*.scala')

VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
# verilator flags
VERILATOR_FLAGS +=  -MMD --trace-fst --build -cc --exe \
	                                 -O3 --x-assign fast --x-initial fast --noassert -report-unoptflat

# timescale set
VERILATOR_FLAGS += --timescale 1us/1us

$(TOP_V): $(SCALA_FILE)
	@mkdir -p $(@D)
	mill $(TOP).runMain $(MAIN) -td $(@D) --output-file $(@F)

# C flags
INC_PATH += $(abspath ./src/test/csrc/include)
INCFLAGS = $(addprefix -I, $(INC_PATH))
CFLAGS += $(INCFLAGS) $(CFLAGS_SIM) -DTOP_NAME="V$(TOPNAME)"
CFLAGS += -DVCD

# source file
VSRCS = $(shell find $(abspath ./build) -name "*.v" -or -name "*.sv" )
CSRCS = $(shell find $(abspath ./src/test/csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

BIN = $(BUILD_DIR)/$(TOP)
NPC_EXEC := $(BIN)

default: sim	

$(BIN): $(CSRCS) $(TOP_V)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_FLAGS) -top $(TOPNAME) $(CSRCS) $(VSRCS) \
	$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
	--Mdir $(OBJ_DIR) -o $(abspath $(BIN))

sim: $(BIN)
	@echo
	@echo "------------ RUN --------------"
	$(NPC_EXEC)

clean:
	rm -rf $(BUILD_DIR)

clean_mill:
	rm -rf out

clean_all: clean clean_mill

new_wave:
	gtkwave $(BUILD_DIR)/$(TOPNAME).fst

old_wave:
	gtkwave $(BUILD_DIR)/$(TOPNAME).gtkw

.PHONY: clean clean_all clean_mill srun run sim verilog


# lu  carry_lookahead_adder  compar  cpu  dc.tcl  decode  edgedector  encode  lab.mk  lib  Makefile  minus  multi_A  multi_B  novas.conf  novas.rc  pc  pipe_adder  pt.tcl  README.md  regfile  serial_adder  top.v  verdiLog  wallace8bit  ysyx
# [host@IC_EDA /home/host/lab_digital]$cat lab.mk 
# RTLSRCS := $(wildcard ./rtl/*.v)
# RTLSRCS := $(filter-out %_sim.v, $(RTLSRCS))
# INCLUDE_DIRS = +incdir+./rtl/lib

# LIB_NAME := smic13_ss.db

# SIMSRCS = $(wildcard ./rtl/*_sim.v)
# LIBS := ../lib/Synopsys/$(LIB_NAME)

# BUILD_DIR = ./build

# sim: $(RTLSRCS) $(SIMSRCS)
# 	vcs $(INCLUDE_DIRS) -R -full64 +v2k -sverilog -debug_access +define+FSDB $(RTLSRCS) $(SIMSRCS)

# dc: $(RTLSRCS)
# 	make clean
# 	mkdir -p $(BUILD_DIR)
# 	export RTLSRCS="$(RTLSRCS)" ; \
# 	export LIBS="$(LIBS)" ; \
# 	export TOPNAME="$(TOPNAME)" ; \
# 	dc_shell -f ../dc.tcl >./build/info.log

# pt: $(RTLSRCS)
# 	rm -f $(BUILD_DIR)/time_pt.log
# 	export RTLSRCS="$(RTLSRCS)" ; \
# 	export LIBS="$(LIBS)" ; \
# 	export TOPNAME="$(TOPNAME)" ; \
# 	export LIB_NAME="$(LIB_NAME)" ; \
# 	pt_shell -f ../pt.tcl

# clean:
# 	rm -rf $(BUILD_DIR)

# # sim:
# # 	vcs $(INCLUDE_DIRS) ./rtl/cpu.v -o cpu_sim
# # 	./cpu_sim
# init:
# 	rm -rf csrc/ build/ simv.daidir/ verdiLog/ command.log default.svf
