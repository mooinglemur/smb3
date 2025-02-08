
default: message

message:
	@printf 'Choose a target: use "make nes" or "make x16".\n'

nes:
	if [ -f obj/chrspr000.o ]; then make clean; fi
	make -f Makefile-nes

x16:
	if [ -f obj/chr000.o ]; then make clean; fi
	make -f Makefile-x16

clean:
	make -f Makefile-nes clean
	make -f Makefile-x16 clean

.PHONY: message clean
