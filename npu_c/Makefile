TOPNAME = top
TOP_V = $(BUILD_DIR)/$(TOPNAME).v
MAIN = top.topMain
VNAME = V$(TOPNAME)

BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/obj_dir

# Verilator
VERILATOR = verilator
# Generate C++ in executable form
VERILATOR_FLAGS += --top-module $(TOPNAME)
VERILATOR_FLAGS += --autoflush
VERILATOR_FLAGS += -Wno-style

# VERILATOR_FLAGS += --lint-only
# VERILATOR_FLAGS += -Wall 
# VERILATOR_FLAGS += -Wno-DECLFILENAME
# VERILATOR_FLAGS += --report-only 
# VERILATOR_FLAGS += -Werror-

VERILATOR_FLAGS += --timescale "1ns/1ns" --no-timing
VERILATOR_FLAGS += -cc --exe --build --trace -MMD \
				-O3 --x-assign fast --x-initial fast
# Accelerate speed
VERILATOR_FLAGS += -j 8

# NPC_FLAGS += $(ARGS)
NPC_FLAGS += --log=$(BUILD_DIR)/npc-log.txt
NPC_FLAGS += -b
NPC_FLAGS += -i $(IMAGE)

INC_PATH 	:= $(abspath ./csrc/include)
INCFLAGS 	:= $(addprefix -I, $(INC_PATH))
C_FLAGS 	:= -CFLAGS "$(INCFLAGS)"

CSRCS 		+= $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
SCALA_SRCS 	+= $(shell find ./scala/ -name '*.scala')
VSRCS 		+= $(shell find ./build/ -name '*.v')

LDFLAGS += -lLLVM-14 -lreadline 
LDFLAGS += -lSDL2 -lSDL2_image

INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""

default: run

$(TOP_V): $(SCALA_SRCS)
	@mkdir -p $(dir $(TOP_V))
	mill $(TOPNAME).runMain $(MAIN) -td $(dir $(TOP_V)) --output-file $(notdir $(TOP_V))

verilog: $(TOP_V)
	
compile: $(VSRCS) $(CSRCS)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(C_FLAGS) $(VERILATOR_FLAGS) $(VSRCS) $(CSRCS) \
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

clean:
	rm -rf $(BUILD_DIR)

.PHONY: default menuconfig clean run perf

