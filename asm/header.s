.include "../inc/defines.inc"

.segment "INESHDR"                ;iNES header
	.byte "NES", $1A
	.byte PRG_16K_BANK_COUNT
	.byte CHR_8K_BANK_COUNT
	.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $0F) << 4)
	.byte (INES_MAPPER & %11110000)

