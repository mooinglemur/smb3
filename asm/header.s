.include "../inc/defines.inc"

.ifdef NES
.segment "INESHDR"                ;iNES header
	.byte "NES", $1A
	.byte PRG_16K_BANK_COUNT
	.byte CHR_8K_BANK_COUNT
	.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $0F) << 4)
	.byte (INES_MAPPER & %11110000)
.endif

.ifdef X16
.segment "CBMSTUB"
	.word $0801
	.word *+9
	.word $0000
	.byte $9e,"2061",$00 ; SYS 2061
	.byte $00,$00
.endif
