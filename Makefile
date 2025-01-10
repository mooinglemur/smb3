UC = $(shell echo '$1' | tr '[:lower:]' '[:upper:]')

PROJECT	:= smb3-nes
AS		:= ca65
LD		:= ld65
MKDIR	:= mkdir -p
RMDIR	:= rmdir -p
CONFIG  := ./$(PROJECT).cfg
ASFLAGS	:= --cpu 6502 -g
LDFLAGS	:= -C $(CONFIG)
SRC		:= ./asm
INC		:= ./inc
OBJ		:= ./obj
CHRS    = $(addprefix $(SRC)/chr, $(addsuffix .s, $(shell seq -w 0 127)))
SRCS	= $(wildcard $(SRC)/*.s)
OBJS    = $(sort $(patsubst $(SRC)/%.s,$(OBJ)/%.o,$(SRCS) $(CHRS)))
EXE		:= $(call UC,$(PROJECT).NES)
MAPFILE := ./$(PROJECT).map
SYMFILE := ./$(PROJECT).sym

default: all

all: $(EXE)

$(EXE): $(CHRS) $(OBJS) $(CONFIG)
	$(LD) $(LDFLAGS) $(OBJS) -m $(MAPFILE) -Ln $(SYMFILE) -o $@

$(SRC)/chr%.s:
	./scripts/pcx2ppu.py ./CHR/chr$*.pcx $@ CHR$*

$(OBJ)/%.o: $(SRC)/%.s $(INC)/*.inc | $(OBJ)
	$(AS) $(ASFLAGS) $< -o $@

$(OBJ):
	$(MKDIR) $@

.PHONY: clean
clean:
	$(RM) $(EXE) $(OBJS) $(MAPFILE) $(SYMFILE) $(CHRS)
