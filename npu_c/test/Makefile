# 定义编译器
CC = riscv64-unknown-linux-gnu-gcc

# 编译选项
CFLAGS = -march=rv64gcv -mabi=lp64d -Iinclude

# 源文件和头文件目录
SRC = main.c
INCLUDE_DIR = include

# 可执行文件
TARGET = test

# 生成规则
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $< -o $@

# 清理规则
.PHONY: clean
clean:
	rm -f $(TARGET)
