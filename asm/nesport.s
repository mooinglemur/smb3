
.ifdef X16

.include "../inc/defines.inc"
.include "../inc/x16.inc"
.macpack longbranch

.segment "NESPORT"

.import X16_pt1a_idx_active
.import X16_pt1b_idx_active
.import X16_pt1c_idx_active
.import X16_pt1d_idx_active

.import X16_current_blank_tile

.export PPUCTRL
.export PPUSTATUS

.export PPURESET
.export bit_PPUSTATUS
.export lda_PPUSTATUS
.export ldx_PPUSTATUS
.export sta_MMC3_MIRROR
.export sta_OAMDMA
.export sta_PPUADDR
.export sta_PPUCTRL
.export sta_PPUDATA
.export sta_PPUMASK
.export sta_PPUSCROLL
.export stx_PPUADDR
.export stx_PPUMASK
.export sty_PPUADDR
.export sty_PPUSCROLL

; Variables here
tmp0:
	.res 1
tmp1:
	.res 1
tmp2:
	.res 1
tmp3:
	.res 1

PPUADDR_LATCH:
	.res 1
PPUADDR_L:
	.res 1
PPUADDR_H:
	.res 1
PPUCTRL:
	.res 1
PPUCTRL_BGPT:
	.res 1
PPUCTRL_SPPT:
	.res 1
PPUCTRL_SP16:
	.res 1
PPUCTRL_HMIRROR:
	.res 1
PPUCTRL_HMIRROR_OLD:
	.res 1
PPUCTRL_NAMETABLE:
	.res 1
PPUDATA_BUFFER:
	.res 1
PPUMASK:
	.res 1
PPUSCROLL_LATCH:
	.res 1
PPUSCROLL_H:
	.res 1
PPUSCROLL_V:
	.res 1
PPUSTATUS:
	.res 2 ; old value too

;;;;;;;;;;;;;;;;;;;;;;;;
; MMC3 calls
;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;
; PPU calls
;;;;;;;;;;;;;;;;;;;;;;;;

.proc PPURESET
; Set VERA state to something sane
	stz Vera::Reg::Ctrl
	lda Vera::Reg::DCVideo
	and #%01101111 ; XXX
	sta Vera::Reg::DCVideo
	lda #2
	sta Vera::Reg::Ctrl
	stz Vera::Reg::DCHStart
	stz Vera::Reg::DCVStart
	lda #(640 >> 2)
	sta Vera::Reg::DCHStop
	lda #(480 >> 1)
	sta Vera::Reg::DCVStop
	stz Vera::Reg::Ctrl

; [7:6] Map height ; 64
; [5:4] Map width ; 64
; [3] T256C ; 0
; [2] Bitmap Mode ; 0
; [1:0] Color Depth ; 2bpp
	lda #%01010001
	sta Vera::Reg::L0Config

; Set Map Base address (equivalent to the PPU nametables)
	lda #<(VERA_MAP_BASE_NT0 >> 9)
	sta Vera::Reg::L0MapBase

; Set Tile Base (PPU pattern table equiv) (also tile height/width to 8px)
	lda #<(((VERA_TILE_BASE >> 11) << 2) | $00)
	sta Vera::Reg::L0TileBase


; [7:6] Map height ; 64
; [5:4] Map width ; 64
; [3] T256C ; 0
; [2] Bitmap Mode ; 0
; [1:0] Color Depth ; 2bpp
	lda #%01010001
	sta Vera::Reg::L1Config

; Set Map Base address (equivalent to the PPU nametables)
	lda #<(VERA_MAP_BASE_NT1 >> 9)
	sta Vera::Reg::L1MapBase

; Set Tile Base (PPU pattern table equiv) (also tile height/width to 8px)
	lda #<(((VERA_TILE_BASE >> 11) << 2) | $00)
	sta Vera::Reg::L1TileBase

; Set Layer 0 scroll (0)
	stz Vera::Reg::L0VScrollL
	stz Vera::Reg::L0VScrollH
; Set Layer 1 scroll (-240)
	lda #$10
	sta Vera::Reg::L1VScrollL
	lda #$0f
	sta Vera::Reg::L1VScrollH

	stz Vera::Reg::L0HScrollL
	stz Vera::Reg::L0HScrollH
	stz Vera::Reg::L1HScrollL
	stz Vera::Reg::L1HScrollH

	stz X16_current_blank_tile

	; zero both tilemaps
	VERA_SET_ADDR (VERA_MAP_BASE_NT0), 1
	inc Vera::Reg::Ctrl
	VERA_SET_ADDR (VERA_MAP_BASE_NT1), 1
	stz Vera::Reg::Ctrl
	; clear 8.5 pages
	ldx #32
	lda #0
clearloop:
.repeat 4
	stz Vera::Reg::Data0
	stz Vera::Reg::Data1
.endrepeat
	dec
	bne clearloop
	dex
	bpl clearloop

do_4_3:
; Set the horizontal zoom (40 tiles wide)
	stz Vera::Reg::Ctrl

	lda #64
	sta Vera::Reg::DCHScale

; Set the vertical zoom (30 tiles high)
	lda #64
	sta Vera::Reg::DCVScale

	lda #2
	sta Vera::Reg::Ctrl

	lda #(0 >> 2)
	sta Vera::Reg::DCHStart

	lda #(640 >> 2)
	sta Vera::Reg::DCHStop

	lda #(0 >> 1)
	sta Vera::Reg::DCVStart

	lda #(480 >> 1)
	sta Vera::Reg::DCVStop


	stz Vera::Reg::Ctrl
end:
	rts

.endproc

.proc bit_PPUSTATUS
	pha
	stz PPUADDR_LATCH
	stz PPUSCROLL_LATCH
	lda PPUSTATUS
	sta PPUSTATUS+1
	and #$7F
	sta PPUSTATUS
	pla
	bit PPUSTATUS+1
	rts
.endproc

.proc lda_PPUMASK
	lda PPUMASK
	rts 
.endproc

.proc lda_PPUSTATUS
	php
	stz PPUADDR_LATCH
	stz PPUSCROLL_LATCH
	lda Vera::Reg::ISR

	ror
	ror
	and #$80
	ora PPUSTATUS
	sta PPUSTATUS
	bpl :+
	lda #1
	sta Vera::Reg::ISR
:	lda PPUSTATUS
	sta PPUSTATUS+1
	and #$7F
	sta PPUSTATUS
	plp
	lda PPUSTATUS+1
	rts
.endproc

.proc ldx_PPUSTATUS
	pha
	jsr lda_PPUSTATUS
	tax
	pla
	rts
.endproc

.proc sta_MMC3_MIRROR
	php
	pha
	pha
	lda PPUCTRL_HMIRROR
	sta PPUCTRL_HMIRROR_OLD
	pla
	and #1
	ror
	ror
	sta PPUCTRL_HMIRROR
	pla
	plp
	rts
.endproc

.proc sta_OAMDMA
	php
	pha
	phx
	phy

	; .A contains the high byte of the OAM shadow
	sta OAM_1a
	sta OAM_1b
	sta OAM_2
	sta OAM_3
	sta OAM_4

	lda #$3f
	ldx PPUCTRL_SP16
	beq start
	dec
start:
	sta MASK
	VERA_SET_ADDR Vera::VRAM_sprattr, 1
	ldx #0
loop:
	clc
	lda $ff01,x
OAM_1a = (*-1)
	and #$3f ; $3f: 0-63 per region (or $3e: even numbers only if SP16).  Self-modded above.
MASK = (*-1)
	bit $ff01,x
OAM_1b = (*-1)
	bpl bottomhalf
	bvc third
fourth:
	ldy X16_pt1d_idx_active
	adc spr_addrl_offset,y
	bra spridx_cont
third:
	ldy X16_pt1c_idx_active
	adc spr_addrl_offset,y
	bra spridx_cont
bottomhalf:
	bvc first
second:
	ldy X16_pt1b_idx_active
	adc spr_addrl_offset,y
	bra spridx_cont
first:
	ldy X16_pt1a_idx_active
	adc spr_addrl_offset,y
spridx_cont:
	sta Vera::Reg::Data0
	lda spr_addrm_offset,y
	sta Vera::Reg::Data0 ; high index

	lda $ff03,x
OAM_2 = (*-1)
	sta Vera::Reg::Data0 ; X pos
	stz Vera::Reg::Data0 ; no high X position
	lda $ff00,x
OAM_3 = (*-1)
	inc ; sprites are a row late on NES
	sta Vera::Reg::Data0 ; Y pos
	stz Vera::Reg::Data0 ; high Y position
	lda $ff02,x ; [7] V-flip, [6] H-flip, [5] Priority, [1:0] Palette idx
OAM_4 = (*-1)
	pha ; save for palette idx
	rol
	rol
	rol
	and #3
	bcs background_sprite
	ora #%00001100
	bra continue
background_sprite:
	ora #%00000100
continue:
	sta Vera::Reg::Data0
	pla ; palette
	and #3
	clc
	adc #4
	ora PPUCTRL_SP16
	sta Vera::Reg::Data0
	inx
	inx
	inx
	inx
	bne loop

	ply
	plx
	pla
	plp
	rts

.endproc


.proc sta_PPUADDR
	php
	pha
	phx

	ldx PPUADDR_LATCH
	bne low
high:
	and #$3F
	sta PPUADDR_H
	inc PPUADDR_LATCH
	bra end
low:
	sta PPUADDR_L
	stz PPUADDR_LATCH
end:
	plx
	pla
	plp
	rts
.endproc

.proc sta_PPUCTRL
	php
	pha
	sta PPUCTRL
	lsr
	lsr
	lsr
	pha
	and #1
	sta PPUCTRL_SPPT
	pla
	lsr
	and #1
	sta PPUCTRL_BGPT
	lda PPUCTRL
	asl
	and #$40
	sta PPUCTRL_SP16
@end:
	pla
	plp
	rts
.endproc

.proc sta_PPUDATA ; this sub emulates a PPU write :D
				   ; makes use of tmp*
	php
	phx
	phy
	pha
	tax

	lda PPUADDR_H
	cmp #$3F
	jeq is_palette
	cmp #$20
	jcc is_chr_ram

	and #$03
	cmp #$03 ; if low nybble of high byte contains xx11, then this might be an attribute write
	bne not_attribute

	lda PPUADDR_L
	cmp #$C0 ; if >= $C0 (and earlier condition), this is an attribute write
	jcs is_attribute

not_attribute:
	;; Do all the nametable -> tile math here for tiles
	lda PPUADDR_L
	sta tmp0
	lda PPUADDR_H
	and #$07
	sta tmp1
	;remove bit 2 high and insert at bit 5 low, shift everything left in between
	and #$04
	asl
	asl
	asl
	sta tmp2 ; store new bit 5 of the low byte (temp)
	lda tmp0
	and #$1F
	ora tmp2
	sta tmp2 ; copy bits 0-4 of the low byte (temp)

	lda tmp0
	rol ; we're carrying bit 7 out and will be stored in the high byte
	and #$C0
	ora tmp2
	sta tmp0 ; store shifted original bits into bits 6-7 of the low byte

	lda tmp1
	rol ; carry from low byte is still here
	and #$07
	sta tmp1 ; store rotated and truncated high byte
	;; End nametable addr -> tile offset math.  tmp0 contains the low byte and tmp1 contains the high byte

	; low and high byte now contain the tile offset assuming vertical mirroring (horizontal arrangement)
	; now we need to double it for the sake of VERA's interleaved attribute bytes
	asl tmp0
	rol tmp1

	; if vertical mirroring/horizontal arrangement, we write this as is to NT0
	bit PPUCTRL_HMIRROR
	bmi hmirror

vmirror:
	lda #<VERA_MAP_BASE_NT0
	clc
	adc tmp0
	sta Vera::Reg::AddrL
	lda #>VERA_MAP_BASE_NT0
	adc tmp1
	sta Vera::Reg::AddrM
	lda #^VERA_MAP_BASE_NT0
	sta Vera::Reg::AddrH

	stx Vera::Reg::Data0

	bra auto_increment

hmirror:
	; if horizontal mirroring/vertical arrangement, we write this in both the left and right mirrors
	; in the appropriate nametable (tilemap)

	lda PPUADDR_H
	and #$08
	bne is_nt1
is_nt0:
	lda #<VERA_MAP_BASE_NT0
	clc
	adc tmp0
	sta Vera::Reg::AddrL
	lda #>VERA_MAP_BASE_NT0
	adc tmp1
	sta Vera::Reg::AddrM
	lda #^VERA_MAP_BASE_NT0
	sta Vera::Reg::AddrH

	bra nt_write
is_nt1:
	lda #<VERA_MAP_BASE_NT1
	clc
	adc tmp0
	sta Vera::Reg::AddrL
	lda #>VERA_MAP_BASE_NT1
	adc tmp1
	sta Vera::Reg::AddrM
	lda #^VERA_MAP_BASE_NT1
	sta Vera::Reg::AddrH
nt_write:
	stx Vera::Reg::Data0

	lda Vera::Reg::AddrL
	eor #$40
	sta Vera::Reg::AddrL
	stx Vera::Reg::Data0

is_chr_ram: ; no-op, just auto-increment
auto_increment:
	; now handle the increment based on the value of the control register
	lda PPUCTRL
	and #$04
	bne add32

	clc
	lda PPUADDR_L
	adc #1
	sta PPUADDR_L
	lda PPUADDR_H
	adc #0
	and #$3F
	sta PPUADDR_H
	bra end
add32:
	clc
	lda PPUADDR_L
	adc #32
	sta PPUADDR_L
	lda PPUADDR_H
	adc #0
	and #$3F
	sta PPUADDR_H
end:
	pla
	ply
	plx
	plp
	rts

is_palette:
	lda PPUADDR_L
	bit #%00001111
	bne :+
		lda #0
	:
	sta tmp1

	VERA_SET_ADDR Vera::VRAM_palette, 1
	lda tmp1
	and #%00011100
	asl
	asl
	sta tmp0
	lda tmp1
	and #%00000011
	ora tmp0

	asl
	sta Vera::Reg::AddrL

	txa
	asl
	tay
	lda palette,y
	sta Vera::Reg::Data0
	lda palette+1,y
	sta Vera::Reg::Data0

	bra auto_increment
is_attribute:
	; if horizontal mirroring / vertical arrangement
	; $23C0-23FF / $2BC0-2BFF = nametable 0
	; $27C0-27FF / $2FC0-2FFF = nametable 1
	; if vertical mirroring / horizontal arrangement
	; $23C0-23FF / $27C0-27FF = nametable 0
	; $2BC0-2BFF / $2FC0-2FFF = nametable 1
	;
	;PPUADDR_H  PPUADDR_L
	; %00000100 %00111111 <- these are the important bits of the input PPU address
	;       g      fedcba <- this is the original arrangement
	; %00000000 %01111111 <- rearrange
	;             fedgcba <- this is now in quad-metatile order
	;                        but now we need to map these onto
	;                        the upper left tile of each quad-metatile
	; %00000000 %01111111
	; %00000011 %11111000 <- multiply it all by 8 (4 tile column spacing, including color bytes)
	;        fe  dgcba
	;           %01111000 <- this is the final low byte, because bit d is about to be
	;             gcba       left-shifted out.
	; %00001110           <- we're going to point to every 4th row, so only bits "def"
	;      fed               are going to all be left-shifted twice
	;      ^-- this is the final high byte
	;
	; To get from the original arrangement to the final more directly
	lda PPUADDR_H
	; We only want to save bit g from this byte
	lsr
	lsr
	lsr
	lda #$04 ; carry moves to g, but we also plant a 1 in tmp0's low bit to point to the attr byte
	ror
	ror
	; store it into the low byte
	sta tmp0

	lda PPUADDR_L
	; let's take only the "fed" bits out of this byte
	lsr
	lsr
	and #%00001110
	; and store it into the high byte along with the map base
	sta tmp1

	lda PPUADDR_L
	; finally, let's take the "cba" bits out of this byte
	asl
	asl
	asl
	and #%00111000
	; and merge it into the low byte along with the map base
	tsb tmp0

	bit PPUCTRL_HMIRROR
	bmi attr_hmirror

attr_vmirror:
	lda tmp0
	clc
	adc #<VERA_MAP_BASE_NT0
	sta tmp0
	sta Vera::Reg::AddrL
	lda tmp1
	adc #>VERA_MAP_BASE_NT0
	sta tmp1
	sta Vera::Reg::AddrM
	lda #$20
	adc #^VERA_MAP_BASE_NT0
	sta Vera::Reg::AddrH

	jsr apply_palette_UL_UR
	jsr apply_palette_UL_UR
	jsr apply_palette_LL_LR
	jsr apply_palette_LL_LR

	jmp auto_increment
attr_hmirror:
	lda #$40
	trb tmp0

	lda PPUADDR_H
	and #$08
	bne attr_is_nt1
attr_is_nt0:
	lda #<VERA_MAP_BASE_NT0
	clc
	adc tmp0
	sta tmp0
	sta Vera::Reg::AddrL
	lda #>VERA_MAP_BASE_NT0
	adc tmp1
	sta tmp1
	sta Vera::Reg::AddrM
	lda #$20
	adc #^VERA_MAP_BASE_NT0
	sta Vera::Reg::AddrH

	bra attr_nt_write

attr_is_nt1:
	lda #<VERA_MAP_BASE_NT1
	clc
	adc tmp0
	sta tmp0
	sta Vera::Reg::AddrL
	lda #>VERA_MAP_BASE_NT1
	adc tmp1
	sta tmp1
	sta Vera::Reg::AddrM
	lda #$20
	adc #^VERA_MAP_BASE_NT1
	sta Vera::Reg::AddrH

attr_nt_write:

	jsr apply_palette_UL_UR_mirrored
	jsr apply_palette_UL_UR_mirrored
	jsr apply_palette_LL_LR_mirrored
	jsr apply_palette_LL_LR_mirrored

	jmp auto_increment

apply_palette_UL_UR:
	txa
	and #$03
	asl
	asl
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$0C
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

	jmp next_row

apply_palette_UL_UR_mirrored:
	txa
	and #$03
	asl
	asl
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$0C
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

	lda Vera::Reg::AddrL
	adc #56 ; carry is clear already
	sta Vera::Reg::AddrL

	txa
	and #$03
	asl
	asl
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$0C
	asl
	asl
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

	bra next_row

apply_palette_LL_LR:
	txa
	and #$30
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$C0
	lsr
	lsr
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

	bra next_row

apply_palette_LL_LR_mirrored:
	txa
	and #$30
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$C0
	lsr
	lsr
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

	lda Vera::Reg::AddrL
	adc #56 ; carry is clear already
	sta Vera::Reg::AddrL

	txa
	and #$30
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0
	txa
	and #$C0
	lsr
	lsr
	sta Vera::Reg::Data0
	sta Vera::Reg::Data0

next_row:
	lda tmp0
	clc
	adc #128
	sta tmp0
	sta Vera::Reg::AddrL
	lda tmp1
	adc #0
	sta tmp1
	sta Vera::Reg::AddrM
	rts

.endproc

.proc sta_PPUMASK
	php
	sei
	pha
	sta PPUMASK
	asl
	asl
	and #$60
	sta @TMP0
	lda PPUMASK
	asl
	and #$10
	ora @TMP0
	sta @TMP0
	stz Vera::Reg::Ctrl
	lda Vera::Reg::DCVideo
	and #%10001111
	ora #$ff
@TMP0 = * - 1
	sta Vera::Reg::DCVideo
	pla
	plp
	rts
.endproc

.proc sta_PPUSCROLL
	php
	sei
	pha
	pha

	lda PPUSCROLL_LATCH
	beq horiz
vert:
	stz PPUSCROLL_LATCH
	lda PPUCTRL
	and #2
	beq :+
		lda #240
	:
	sta @TMP0
	pla
	sta PPUSCROLL_V
	clc
	adc @TMP0
	sta @TMP0
	lda #0
	adc #0
	sta @TMP1
	lda PPUSCROLL_V
	cmp #240
	bcc @noinv
	dec @TMP1
	clc
	beq @noinv
	sec
@noinv:
	lda #$ff
@TMP0 = * - 1
	sta Vera::Reg::L0VScrollL
	lda #$ff
@TMP1 = * - 1
	sta Vera::Reg::L0VScrollH
	bcs @above
	lda @TMP0
	sec
	sbc #240
	sta Vera::Reg::L1VScrollL
	lda @TMP1
	sbc #0
	sta Vera::Reg::L1VScrollH
	bra end
@above:
	lda @TMP0
	clc
	adc #240
	sta Vera::Reg::L1VScrollL
	lda @TMP1
	adc #0
	sta Vera::Reg::L1VScrollH
	bra end
horiz:
	pla
	sta PPUSCROLL_H
	sta Vera::Reg::L0HScrollL
	sta Vera::Reg::L1HScrollL
	lda PPUCTRL
	and #1
	sta Vera::Reg::L0HScrollH
	sta Vera::Reg::L1HScrollH
	inc PPUSCROLL_LATCH
end:
	pla
	plp
	rts
.endproc

.proc stx_PPUADDR
	php
	phx
	pha
	txa
	jsr sta_PPUADDR
	pla
	plx
	plp
	rts
.endproc

.proc stx_PPUMASK
	php
	phx
	pha
	txa
	jsr sta_PPUMASK
	pla
	plx
	plp
	rts
.endproc

.proc sty_PPUADDR
	php
	phy
	pha
	tya
	jsr sta_PPUADDR
	pla
	ply
	plp
	rts
.endproc

.proc sty_PPUSCROLL
	php
	phy
	pha
	tya
	jsr sta_PPUSCROLL
	pla
	ply
	plp
	rts
.endproc


palette:
	.word $0555,$0027,$0119,$0309,$0406,$0603,$0500,$0420,$0230,$0140,$0040,$0040,$0034,$0000,$0000,$0000
	.word $0A9A,$015C,$033F,$062E,$091B,$0A16,$0A22,$0840,$0560,$0370,$0180,$0073,$0068,$0000,$0000,$0000
	.word $0FFF,$05AF,$088F,$0B6F,$0E5F,$0F6B,$0F76,$0D92,$0AB0,$07C0,$05D2,$04D7,$04BD,$0444,$0000,$0000
	.word $0FFF,$0BDF,$0CCF,$0DBF,$0FBF,$0FBD,$0FBB,$0EC9,$0DD8,$0BE8,$0BE9,$0AEB,$0ADE,$0AAA,$0000,$0000
; 84  84  84    0  30 116    8  16 144   48   0 136   68   0 100   92   0  48   84   4   0   60  24   0   32  42   0    8  58   0    0  64   0    0  60   0    0  50  60    0   0   0
;152 150 152    8  76 196   48  50 236   92  30 228  136  20 176  160  20 100  152  34  32  120  60   0   84  90   0   40 114   0    8 124   0    0 118  40    0 102 120    0   0   0
;236 238 236   76 154 236  120 124 236  176  98 236  228  84 236  236  88 180  236 106 100  212 136  32  160 170   0  116 196   0   76 208  32   56 204 108   56 180 204   60  60  60
;236 238 236  168 204 236  188 188 236  212 178 236  236 174 236  236 174 212  236 180 176  228 196 144  204 210 120  180 222 120  168 226 144  152 226 180  160 214 228  160 162 160    

spr_addrl_offset:
.repeat 32, i
	.byte <(i * 64)
.endrepeat

spr_addrm_offset:
.repeat 32, i
	.byte >(i * 64)
.endrepeat


.endif
