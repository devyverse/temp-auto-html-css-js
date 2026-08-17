PACKAGE = package 
VERSION = `date "+%Y.%m%d"`
RELEASE_DIR = ..
RELEASE_FILE = $(PACKAGE)-$(VERSION)

BIN_DIR = bin
OBJ_DIR = obj

PROGRAM = $(BIN_DIR)/main

C_FILES := main.c $(wildcard src/*.c)
OBJS := $(patsubst %.c, $(OBJ_DIR)/%.o, $(notdir $(C_FILES)))

CC = gcc
CFLAGS = -Wall -pedantic -Ilib
LDLIBS = -lm

# Silence total
.SILENT:

# Colors
GREEN=\033[1;32m
BLUE=\033[1;34m
YELLOW=\033[1;33m
RED=\033[1;31m
RESET=\033[0m

# Messages
SUCCESS = $(GREEN)[SUCCESS] Build terminé$(RESET)
ERROR = $(RED)[ERROR] Échec de la compilation$(RESET)
DEBUG_MSG = $(YELLOW)[DEBUG MODE ACTIVÉ]$(RESET)

# Logo DEVREAL animé
define DEVREAL_FRAME_1
$(BLUE)
██████╗ 
██╔════╝
██║     
██║     
╚██████╗
 ╚═════╝
$(RESET)
endef

define DEVREAL_FRAME_2
$(BLUE)
██████╗ ███████╗
██╔════╝ ██╔════╝
██║  ███╗█████╗  
██║   ██║██╔══╝  
╚██████╔╝███████╗
 ╚═════╝ ╚══════╝
$(RESET)
endef

define DEVREAL_FRAME_3
$(BLUE)
██████╗ ███████╗██╗   ██╗██████╗ ███████╗ █████╗ ██╗     
██╔════╝ ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██║     
██║  ███╗█████╗  ██║   ██║██████╔╝█████╗  ███████║██║     
██║   ██║██╔══╝  ██║   ██║██╔══██╗██╔══╝  ██╔══██║██║     
╚██████╔╝███████╗╚██████╔╝██║  ██║███████╗██║  ██║███████╗
 ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
$(RESET)
endef

define	DEVREAL_ANIM
	@echo "$$DEVREAL_FRAME_1"; sleep 0.1
	@echo "$$DEVREAL_FRAME_2"; sleep 0.1
	@echo "$$DEVREAL_FRAME_3"
endef

all:	$(PROGRAM)

run:	$(PROGRAM)
	$(DEVREAL_ANIM)
	@echo "$(SUCCESS)"
	./$(PROGRAM)

debug:	CFLAGS += -g -DDEBUG
debug:	run
	@echo "$(DEBUG_MSG)"

release:	CFLAGS += -O2 -DRELEASE
release:	all
	@echo "$(SUCCESS)"

$(PROGRAM): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(OBJS) -o $(PROGRAM) $(LDLIBS)

$(OBJ_DIR)/%.o: %.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o:	src/%.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "$(RED)[CLEAN] Nettoyage terminé$(RESET)"

.PHONY:		all run debug release clean

