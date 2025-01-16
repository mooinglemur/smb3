
default: message

message:
	@printf 'Choose a target: use "make nes" or "make x16".\n'

nes:
	make -f Makefile-nes clean all

x16:
	make -f Makefile-x16 clean all

.PHONY: message