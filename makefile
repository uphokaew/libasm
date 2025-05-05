STATIC_NAME = libasm.a
SHARED_NAME = libasm.so

NASM = nasm
CC = gcc
AR = ar
ARFLAGS = rcs
RM = rm -rf


SRC_DIR = src
OBJ_DIR = obj
INC_DIR = include


FILE = ft_tolower.asm

SRC = $(addprefix $(SRC_DIR)/, $(FILE))
OBJ = $(addprefix $(OBJ_DIR)/, $(FILE:%.asm=%.o))

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    NASMFLAGS_STATIC = -f elf64
    NASMFLAGS_SHARED = -f elf64 -DPIC
    LDFLAGS = -shared
endif
ifeq ($(UNAME_S),Darwin)
    NASMFLAGS_STATIC = -f macho64
    NASMFLAGS_SHARED = -f macho64
    LDFLAGS = -dynamiclib
endif

# กฎทั้งหมด
.PHONY: all clean fclean re

all: $(SHARED_NAME)

# $(STATIC_NAME): $(OBJ_DIR)/static/ft_tolower.o
# 	@echo "Creating static library $@"
# 	$(AR) $(ARFLAGS) $@ $^
# 	@echo "Running ranlib on $@"
# 	ranlib $@

$(SHARED_NAME): $(OBJ_DIR)/shared/ft_tolower.o
	@echo "Creating shared library $@"
	$(CC) $(LDFLAGS) -o $@ $^

# $(OBJ_DIR)/static/%.o: $(SRC_DIR)/%.asm
# 	@echo "Assembling $< for static"
# 	@mkdir -p $(OBJ_DIR)/static
# 	$(NASM) $(NASMFLAGS_STATIC) -I$(INC_DIR) $< -o $@

$(OBJ_DIR)/shared/%.o: $(SRC_DIR)/%.asm
	@echo "Assembling $< for shared"
	@mkdir -p $(OBJ_DIR)/shared
	$(NASM) $(NASMFLAGS_SHARED) -I$(INC_DIR) $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)/static $(OBJ_DIR)/shared

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(STATIC_NAME) $(SHARED_NAME)

re: fclean all