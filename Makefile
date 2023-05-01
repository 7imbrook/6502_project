## 
# This is a hand written make file for the ben eater 6502 project
# with a goal of being able to link objects together. I am learning
# how to do this for the first time and want to share my learnings 
# with those who have never built binaries from nothing before.
## 
.DEFAULT_GOAL := main.bin
BUILD=./target

# These can be gotten from http://sun.hasenbraten.de/vasm/index.php?view=binrel
# and http://sun.hasenbraten.de/vlink/index.php?view=relsrc
# The linker needs to be built from source for macos.
CC=$(abspath ./bin/vasm6502_oldstyle) # the assember
LD=$(abspath ./bin/vlink) # The linker

# Common flags
CC_FLAGS=-dotdir -c02 -wdc02 -illegal

# These linker flags will bring in every .ld linker script
LD_FLAGS=$(patsubst %.ld,-T%.ld,$(wildcard *.ld)) -bbbc

# This is all WIP trying to get memory layout working
source=$(wildcard *.s)
objects := $(patsubst %.s,$(BUILD)/%.o,$(source))

$(BUILD)/%.o: %.s
	mkdir -p target/
	$(CC) $(CC_FLAGS) -Fvobj -o $@ $<

main.bin: $(objects)
	$(LD) $(LD_FLAGS) -o $(BUILD)/$@ $^ 
	hexdump -C $(BUILD)/main.bin

# TODO: Explain the minipro writing and stuff
flash: main.bin
	minipro -p AT28C256 -w $(BUILD)/main.bin

clean:
	rm -r target/
