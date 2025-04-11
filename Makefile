
default: message

message:
	@printf 'Choose a target: use "make nes" or "make x16".\n'

nes:
	if [ -f obj/chrspr000.o ]; then $(MAKE) clean; fi
	$(MAKE) -f Makefile-nes

x16:
	if [ -f obj/chr000.o ]; then $(MAKE) clean; fi
	$(MAKE) -f Makefile-x16

clean:
	$(MAKE) -f Makefile-nes clean
	$(MAKE) -f Makefile-x16 clean

.PHONY: message clean
