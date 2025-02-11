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
VERILATOR_FLAGS += -j 33
VERILATOR_FLAGS += --Mdir $(OBJ_DIR)
VERILATOR_FLAGS += -x-assign fast
# VERILATOR_FLAGS += -Wall
VERILATOR_FLAGS += --top-module $(TOPNAME)
VERILATOR_FLAGS += --cc --exe -o $(BUILD_DIR)/$(VNAME)


INC_PATH 	:= $(abspath ./csrc/include)
INCFLAGS 	:= $(addprefix -I, $(INC_PATH))
C_FLAGS 	:= -CFLAGS "$(INCFLAGS)"

CSRCS 		+= $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
SCALA_SRCS 	+= $(shell find ./scala/ -name '*.scala')
VSRCS 		+= $(shell find ./build/ -name '*.v')


default: run

$(TOP_V): $(SCALA_SRCS)
	@mkdir -p $(dir $(TOP_V))
	mill $(TOPNAME).runMain $(MAIN) -td $(dir $(TOP_V)) --output-file $(notdir $(TOP_V))
	
compile: $(VSRCS) $(CSRCS) $(TOP_V)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(C_FLAGS) $(VERILATOR_FLAGS) $(VSRCS) $(CSRCS)

run: compile
	$(BUILD_DIR)/$(VNAME)

wave:
	gtkwave $(BUILD_DIR)/wave.vcd

menuconfig:
	cd csrc && make menuconfig && cd ..

sim: run wave

clean:
	rm -rf $(BUILD_DIR)

.PHONY: default menuconfig clean run perf

