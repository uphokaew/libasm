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

FILES = ft_tolower.asm ft_islower.asm

SRC = $(addprefix $(SRC_DIR)/, $(FILES))
OBJ = $(addprefix $(OBJ_DIR)/shared/, $(FILES:%.asm=%.o))

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    NASMFLAGS_STATIC = -f elf64
    NASMFLAGS_SHARED = -f elf64 -DPIC
    LDFLAGS = -shared -Wall -Wextra -Werror
endif
ifeq ($(UNAME_S),Darwin)
    NASMFLAGS_STATIC = -f macho64
    NASMFLAGS_SHARED = -f macho64
    LDFLAGS = -dynamiclib
endif

.PHONY: all clean fclean re

all: $(SHARED_NAME)

$(SHARED_NAME): $(OBJ)
	@echo "Creating shared library $@"
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/shared/%.o: $(SRC_DIR)/%.asm
	@echo "Assembling $< for shared"
	@mkdir -p $(OBJ_DIR)/shared
	$(NASM) $(NASMFLAGS_SHARED) -I$(INC_DIR) $< -o $@
	@echo "Adding symbol type info to $@"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)/static $(OBJ_DIR)/shared

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(STATIC_NAME) $(SHARED_NAME)

re: fclean all