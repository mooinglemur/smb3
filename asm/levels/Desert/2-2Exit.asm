; Original address was $BF18
; Pipe exit
	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte (9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $38, $03, $A1, $40, $0A, $09, $FF
