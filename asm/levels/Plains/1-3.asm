; Original address was $AE09
; 1-3
	.word W103_CoinHeavL	; Alternate level layout
	.word W103_CoinHeavO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_180
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_13 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte (1) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $00, $00, $03, $18, $0B, $64, $1A, $00, $C0, $4F, $14, $07, $E3, $15, $0E, $84
	.byte $19, $04, $93, $10, $1B, $E2, $12, $15, $02, $19, $1D, $91, $37, $1E, $60, $12
	.byte $29, $02, $35, $20, $60, $35, $25, $13, $36, $20, $12, $36, $25, $11, $36, $28
	.byte $10, $37, $20, $14, $57, $22, $07, $37, $28, $20, $38, $20, $11, $38, $24, $14
	.byte $39, $20, $12, $39, $26, $12, $36, $2D, $43, $38, $21, $20, $35, $26, $0A, $35
	.byte $27, $10, $38, $25, $07, $E2, $77, $80, $11, $34, $E2, $14, $38, $E3, $34, $3F
	.byte $82, $17, $36, $01, $19, $3A, $90, $36, $34, $40, $37, $34, $40, $38, $34, $40
	.byte $39, $34, $40, $57, $3C, $05, $38, $3C, $40, $39, $3C, $40, $11, $43, $E4, $34
	.byte $47, $82, $16, $46, $00, $17, $4B, $01, $19, $40, $92, $36, $44, $40, $37, $44
	.byte $40, $38, $44, $40, $39, $44, $40, $36, $4C, $40, $37, $4C, $40, $38, $4C, $40
	.byte $39, $4C, $40, $1A, $51, $C0, $0A, $1A, $5D, $C0, $42, $12, $55, $02, $13, $5B
	.byte $E3, $11, $62, $74, $13, $6C, $84, $15, $67, $54, $16, $6E, $75, $17, $61, $65
	.byte $31, $6C, $82, $33, $68, $80, $35, $63, $80, $19, $67, $95, $12, $79, $43, $14
	.byte $74, $64, $19, $74, $91, $12, $83, $02, $17, $80, $01, $00, $81, $B5, $21, $83
	.byte $D4, $40, $8B, $09, $E9, $77, $80, $FF
