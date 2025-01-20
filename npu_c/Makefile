TOPNAME = top
TOP_V = $(BUILD_DIR)/$(TOPNAME).v
MAIN = top.topMain
VNAME = V$(TOPNAME)

BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/obj_dir

$(shell mkdir -p $(BUILD_DIR))


# Verilator
VERILATOR = verilator
# Generate C++ in executable form
VERILATOR_FLAGS += --top-module $(TOPNAME) +incdir+vsrc/include
VERILATOR_FLAGS += +incdir+$(UART16550_DIR) +incdir+$(SPI_DIR)
VERILATOR_FLAGS += --autoflush
VERILATOR_FLAGS += -Wno-style

# VERILATOR_FLAGS += --lint-only
# VERILATOR_FLAGS += -Wall 
# VERILATOR_FLAGS += -Wno-DECLFILENAME
# VERILATOR_FLAGS += --report-only 
# VERILATOR_FLAGS += -Werror-

VERILATOR_FLAGS += --timescale "1ns/1ns" --no-timing
VERILATOR_FLAGS += -cc --exe --build --trace -MMD \
				-O3 --x-assign fast --x-initial fastsr
# Accelerate speed
VERILATOR_FLAGS += -j 8

C_FLAGS += -CFLAGS "$(INCFLAGS)"
C_FLAGS += -CFLAGS "-D__GUEST_ISA__=riscv32"

# NPC_FLAGS += $(ARGS)
NPC_FLAGS += --log=$(BUILD_DIR)/npc-log.txt
NPC_FLAGS += -b
NPC_FLAGS += -i $(IMAGE)

CSRCS += $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
SCALA_SRCS = $(shell find ./scala/ -name '*.scala')
VSRCS = $(TOP_V)

LDFLAGS += -lLLVM-14 -lreadline 
LDFLAGS += -lSDL2 -lSDL2_image

INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""

default: run

$(TOP_V): $(SCALA_SRCS)
	@mkdir -p $(@D)
	mill $(TOPNAME).runMain $(MAIN) -td $(@D) --output-file $(TOP_V)

verilog: $(TOP_V)
	
compile: $(TOP_V) $(CSRCS)
	@rm -rf $(OBJ_DIR)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	$(VERILATOR) $(C_FLAGS) $(VERILATOR_FLAGS) \
	--top-module $(TOPNAME) $^ \
	$(addprefix -CFLAGS , $(CXXFLAGS)) \
	--Mdir $(OBJ_DIR) --exe -o $(BUILD_DIR)/$(VNAME) \
	$(addprefix -LDFLAGS , $(LDFLAGS))\

run: compile
	$(BUILD_DIR)/$(VNAME) $(NPC_FLAGS)

wave:
	gtkwave $(BUILD_DIR)/wave.vcd

menuconfig:
	cd $(SOC_HOME)/csrc && make menuconfig && cd ..

sim: run wave

combined :
	cat $(find ./vsrc/ -name "*.v") > ysyx_23060124.v

clean:
	rm -rf $(BUILD_DIR)

.PHONY: default menuconfig clean run perf

