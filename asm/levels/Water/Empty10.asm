; Original address was $B7E6
; 7-6
	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte (0) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERWATER | LEVEL5_TIME_300

	.byte $FF
