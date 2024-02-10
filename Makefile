GCC=aarch64-linux-gnu-gcc
LD=aarch64-linux-gnu-ld
AS=aarch64-linux-gnu-as
BUILD=./build
BIN=./bin


kernel8.bin: $(BIN) kernel.elf
	aarch64-linux-gnu-objcopy -O binary $(BUILD)/kernel.elf $(BIN)/kernel8.img

kernel.elf: boot.o main.o
	$(LD) -T ./src/linker.ld -o $(BUILD)/kernel.elf $(BUILD)/boot.o $(BUILD)/main.o


main.o: $(BUILD)
	$(GCC) ./src/main.c -c -o $(BUILD)/main.o

boot.o: $(BUILD)
	$(AS) ./src/boot.s -o $(BUILD)/boot.o

$(BUILD):
	mkdir $(BUILD)

$(BIN):
	mkdir $(BIN)

.PHONY: clean
clean:
	rm -rf ./bin/* ./build/*