CC=$(abspath ./bin/vasm6502_oldstyle) 
LD=$(abspath ./bin/vlink)
CC_FLAGS=-Fvobj -dotdir -c02 -wdc02 -illegal
LD_FLAGS=-bo65-02
BUILD=./target

.DEFAULT_GOAL := flash
objects := $(patsubst %.s,$(BUILD)/%.o,$(wildcard *.s))


$(BUILD)/%.o: %.s
	mkdir -p target/
	$(CC) $(CC_FLAGS) -o $@ $<

main.bin: $(objects) 
	$(LD) $(LD_FLAGS) -o $(BUILD)/$@ $^ 

flash: main.bin
	hexdump -C $(BUILD)/main.bin
	# minipro -p AT28C256 -w main.bin

clean:
	rm -r target/
