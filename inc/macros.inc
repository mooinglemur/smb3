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
.macro ADD arg1 ; RegEx S&R "CLC.*\n.*?ADC" -> "ADD"
	CLC
	ADC arg1
.endmacro

.macro SUB arg1 ; RegEx S&R "SEC.*\n.*?SBC" -> "SUB"
	SEC
	SBC arg1
.endmacro

.macro NEG      ; RegEx S&R "EOR #\$ff.*\n.*ADD #\$01" -> "NEG"
	EOR #$ff
	ADD #$01
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
