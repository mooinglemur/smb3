# smb3
Disassembly of Super Mario Bros 3

Specifically for use with cc65 (https://github.com/cc65/cc65), this will reassemble into a byte-for-byte perfect clone of Super Mario Bros. 3 US (PRG1)

This is a conversion of the nesasm/DCC6502 disassembly by Southbird.

-------------

To assemble, simply run:

`make`

Requires:
* A recent version of python3 with the PIL module to let the conversion script interpret the PCX assets into CHR ROM format
* cc65 and make
