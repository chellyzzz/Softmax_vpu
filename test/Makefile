CC = riscv64-unknown-elf-gcc
TOP = main

BUILD_DIR = build
TARGET = $(BUILD_DIR)/$(TOP)

INCLUDE_DIR = src/include
SRC += $(shell find src/ -name "*.c")
SRC += $(INCLUDE_DIR)/start.S


# CFLAGS  += -O2 -march=rv64gv_zvfh -mabi=lp64d -I$(INCLUDE_DIR)
CFLAGS  += -O -march=rv32gv -mabi=ilp32d -I$(INCLUDE_DIR)

CFLAGS  += -nostdlib  -fPIC
LDFLAGS += -T $(INCLUDE_DIR)/linker.ld


$(TARGET): $(SRC) $(wildcard $(INCLUDE_DIR)/*.h)
	# make gen_data
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRC) -o $(TARGET)

compile: $(TARGET)
	riscv64-unknown-elf-objdump -D $(TARGET) > $(TARGET).txt
	riscv64-unknown-elf-objcopy -O binary $(BUILD_DIR)/$(TOP) $(BUILD_DIR)/$(TOP).bin

clean:
	rm -f $(BUILD_DIR)/*

gen_data:
	python3 gen_data.py	--dtype fp32


.PHONY: clean run default	