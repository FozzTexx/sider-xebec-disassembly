*Update 2019-Mar-2*: Michael McMaster was able to make the scsi2sd compatible with the Sider/Xebec card!

This is an attempt to disassemble the ROM and installation tools for a
First Class Peripherals Sider hard drive made for an Apple II and the
ROM on the Xebec SASI card that was included with the hard drive.

I'm working on trying to use the SASI card with a scsi2sd and it
doesn't quite work so in order to try to figure out why the tools
don't like the scsi2sd I decided to disassemble them. The SASI card
contains no controller and the 6502 on the Apple II is used to bit
bang all I/O on the data and control lines. Hopefully understanding
how the software works on the Apple II will make it possible to get
the scsi2sd card completely working.

You'll need my disassembler to create the .asm files:

* https://github.com/FozzTexx/disasm
