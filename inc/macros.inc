; Handy pseudo instructions... only make sense in the context of CMPing a number...
.macro BLT arg1
	BCC arg1     ; A < CMP (unsigned)
.endmacro

.macro BGE arg1
	BCS arg1     ; A >= CMP (unsigned)
.endmacro

.macro BLS arg1
	BMI arg1	; A < CMP (signed)
.endmacro

.macro BGS arg1
	BPL arg1    ; A >= CMP (signed)
.endmacro

; Clarifying pseudo instructions
.macro NEG      ; RegEx S&R "EOR #\$ff.*\n.*ADD #\$01" -> "NEG"
	EOR #$ff
	CLC
	ADC #$01
.endmacro

; This is used in video update streams; since the video address register
; takes the address high-then-low (contrary to 6502's normal low-then-high),
; this allows a 16-bit value but "corrects" it to the proper endianness.
.macro vaddr arg1
	.byte >arg1
	.byte <arg1
.endmacro

; Provides a compilation-failing boundary check
.macro BoundCheck arg1, arg2, arg3
	.assert arg1 <= arg2, error, arg3
.endmacro

; The address are $C000 | (value << 6)
.macro MADR arg1
	.byte <(((arg1) & $3FFF) >> 6)
.endmacro

; The length is (value << 4) + 1 (minimum 1 byte long to $FF1 bytes long)
.macro MLEN arg1, arg2
	.byte <((arg2 - arg1) >> 4)
.endmacro

; The status bar comes in three identical versions with different VRAM start addresses
; Might as well make a macro out of that, eh?

; NOTE!! If you want to edit the status bar, you should also sync up
; with the "flip" data in PRG026 as noted below...
.macro StatusBar arg1
	; Sync next three with PRG026 Flip_TopBarCards
	vaddr (arg1 + $00)
	.byte $02, $FC, $A0		; Upper left corner

	vaddr (arg1 + $02)
	.byte VU_REPEAT | $12, $A1	; Bar across the top

	vaddr (arg1 + $14)
	.byte $0C, $A2, $A0, $A1, $A1, $A3, $A1, $A1, $A3, $A1, $A1, $A2, $FC	; top of card slots

	; Sync this with PRG026 Flip_MidTStatCards
	vaddr (arg1 + $20)
	.byte $20, $FC, $A6, $70, $71, $72, $73, $FE, $FE, $EF, $EF, $EF, $EF, $EF, $EF, $3C	; |WORLD  >>>>>>[P] $  | |  | |  | |  | |
	.byte $3D, $FE, $EC, $F0, $F0, $A7, $A6, $FE, $FE, $AA, $FE, $FE, $AA, $FE, $FE, $A7, $FC
	; Discrepency --------^  (Pattern is ... $FE, $F0 ... in PRG026 status bar graphics)

	; Sync this with PRG026 Flip_MidBStatCards
	vaddr (arg1 + $40)
	; Discrepency --------v  (Pattern is ... $FE, $FE ... in PRG030 status bar)  Unimportant; inserts <M> which is replaced anyway
	.byte $20, $FC, $A6, $FE, $FE, $FB, $FE, $F3, $FE, $F0, $F0, $F0, $F0, $F0, $F0, $F0	; [M/L]x  000000 c000| etc.
	.byte $FE, $ED, $F4, $F0, $F0, $A7, $A6, $FE, $FE, $AA, $FE, $FE, $AA, $FE, $FE, $A7, $FC
	; Discrepency --------^  (Pattern is ... $F4, $F0 ... in PRG030 status bar graphics)

	; Sync next three with PRG026 Flip_BottomBarCards
	vaddr (arg1 + $60)
	.byte $02, $FC, $A8	; Lower corner

	vaddr (arg1 + $62)
	.byte VU_REPEAT | $12, $A4	; Bottom bar

	vaddr (arg1 + $74)
	.byte $0C, $A5, $A8, $A4, $A4, $A9, $A4, $A4, $A9, $A4, $A4, $A5, $FC	; lower corner and card bottoms

	; End PRG026 sync

	vaddr (arg1 + $80)
	.byte VU_REPEAT | $20, $FC	; black space

	vaddr (arg1 + $A0)
	.byte VU_REPEAT | $20, $FC	; black space

	; Terminator
	.byte $00
.endmacro

	; Each segment header is 7 bytes long:
.macro MusSeg arg1, arg2, arg3, arg4, arg5, arg6
   .byte arg1	; Music_RestH_Base value (always divisible by $10; base part of index into PRG031's Music_RestH_LUT)
   .word arg2	; Address of music segment data (all tracks this segment, offsets to follow, except implied Square 2 zero)
   .byte arg3	; Triangle track starting offset ($00 means disabled)
   .byte arg4	; Square 1 track starting offset (cannot be disabled)
   .byte arg5	; Noise track starting offset ($00 means disabled)
   .byte arg6	; DCM track starting offset ($00 means disabled)
.endmacro	; Square 2 cannot be disabled and always starts at offset $00

.ifdef X16
.macro PJFAR addr, bank
	php
	sei
	JSRFAR addr, bank
	plp
	rts
.endmacro
.endif
