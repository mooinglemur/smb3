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
SRCS	:= $(wildcard $(SRC)/*.s)
OBJS    := $(patsubst $(SRC)/%.s,$(OBJ)/%.o,$(SRCS))
EXE		:= $(call UC,$(PROJECT).PRG)
MAPFILE := ./$(PROJECT).map
SYMFILE := ./$(PROJECT).sym
CHRSRC  := $(addprefix ./asm/chr, $(addsuffix .s, $(printf "%03d" $(seq 0 127))))


default: all

all: $(EXE)

$(EXE): $(OBJS) $(CONFIG)
	$(LD) $(LDFLAGS) $(OBJS) -m $(MAPFILE) -Ln $(SYMFILE) -o $@

$(OBJ)/%.o: $(SRC)/%.s $(INC)/*.inc | $(OBJ)
	$(AS) $(ASFLAGS) $< -o $@

$(OBJ):
	$(MKDIR) $@

.PHONY: clean
clean:
	$(RM) $(EXE) $(OBJS) $(MAPFILE) $(SYMFILE)
