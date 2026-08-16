PACKAGE = package 
VERSION = ` date " +%Y.%m%d% `
RELEASE_DIR = ..
RELEASE_FILE = $(PACKAGE) - $(VERSION)

ifneq (,)
This makefile requires GNU Make.
endif

PROGRAM = main
C_FILES := $(wildcard *.c)
OBJS := $(patsubst %.c, %.o, $(C_FILES))
CC = gcc
CFLAGS = -Wall -pedantic
LDFLAGS =
LDLIBS = -lm

SRC = src/generator.c

all: $(PROGRAM)

$(PROGRAM): .depend $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(PROGRAM) $(LDLIBS)

depend: .depend

.depend: cmd = gcc -MM -MF depend $(var); cat depend >> .depend;
.depend:
	@echo "Generating dependencies..."
	@$(foreach var, $(C_FILES), $(cmd))
	@rm -f depend

-include .depend

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	$(CC) $(CFLAGS) -o $@ $<
# Make a release
dist:
	tar -cf  $(RELEASE_DIR)/$(RELEASE_FILE) && \
	gzip -9  $(RELEASE_DIR)/$(RELEASE_FILE).tar
clean:
	rm -f .depend $(OBJS)

.PHONY:
	clean depend
