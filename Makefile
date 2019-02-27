ROM=Xebec-103684C-1986.bin
AS=asl

all:: install-pt4.asm xebec-c800.asm xebec-iosel.asm

install-pt4.asm: install-pt4.bin labels.txt entry.txt data.txt
	disasm -o 0x4800 -e entry.txt -l labels.txt -d data.txt $< > $@

xebec-c800.asm: $(ROM) labels.txt entry-c800.txt data-c800.txt
	disasm -o 0xc800 -e entry-c800.txt -l labels.txt -d data-c800.txt $< > $@

xebec-iosel.bin: $(ROM)
	dd bs=256 skip=7 count=1 if=$< of=$@

xebec-iosel.asm: xebec-iosel.bin labels.txt entry-iosel.txt data-iosel.txt
	disasm -o 0xc700 -e entry-iosel.txt -l labels.txt -d data-iosel.txt $< > $@

install-pt4.lst: install-pt4.asm
	$(AS) -cpu 6502 -L $<
