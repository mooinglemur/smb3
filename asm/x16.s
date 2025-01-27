.ifdef X16

.include "../inc/defines.inc"
.include "../inc/macros.inc"
.include "../inc/x16.inc"
.macpack longbranch

.scope NESPort
	; vars
	.import PPUCTRL
	.import PPUSTATUS
	; functions
	.import PPURESET
	.import bit_PPUSTATUS
	.import lda_PPUSTATUS
	.import ldx_PPUSTATUS
	.import sta_MMC3_MIRROR
	.import sta_OAMDMA
	.import sta_PPUCTRL
	.import sta_PPUADDR
	.import sta_PPUDATA
	.import sta_PPUMASK
	.import sta_PPUSCROLL
	.import stx_PPUADDR
	.import stx_PPUMASK
	.import sty_PPUADDR
	.import sty_PPUSCROLL
.endscope

.import bgbanks, bgpages
.import sprbanks, sprpages

.import IntReset, IntIRQ, IntNMI

.export X16_PJFAR_outbound
.export X16_PJFAR_return

.export X16_lda_JOYPAD_y
.export X16_lda_PPU_STAT
.export X16_lda_PPU_VRAM_DATA

.export X16_ldx_PPU_STAT

.export X16_sta_FRAMECTR_CTL
.export X16_sta_JOYPAD
.export X16_sta_MMC3_COMMAND
.export X16_sta_MMC3_IRQCNT
.export X16_sta_MMC3_IRQDISABLE
.export X16_sta_MMC3_IRQENABLE
.export X16_sta_MMC3_IRQLATCH
.export X16_sta_MMC3_MIRROR
.export X16_sta_MMC3_PAGE
.export X16_sta_PAPU_CT1
.export X16_sta_PAPU_CT1_x
.export X16_sta_PAPU_CT2
.export X16_sta_PAPU_CTL1
.export X16_sta_PAPU_CTL2
.export X16_sta_PAPU_EN
.export X16_sta_PAPU_FT1
.export X16_sta_PAPU_FT1_x
.export X16_sta_PAPU_FT2
.export X16_sta_PAPU_MODADDR
.export X16_sta_PAPU_MODCTL
.export X16_sta_PAPU_MODLEN
.export X16_sta_PAPU_NCTL1
.export X16_sta_PAPU_NFREQ1
.export X16_sta_PAPU_NFREQ2
.export X16_sta_PAPU_RAMP1
.export X16_sta_PAPU_RAMP2
.export X16_sta_PAPU_TCR1
.export X16_sta_PAPU_TFREQ1
.export X16_sta_PAPU_TFREQ2
.export X16_sta_PPU_CTL1
.export X16_sta_PPU_CTL2
.export X16_sta_PPU_SCROLL
.export X16_sta_PPU_VRAM_ADDR
.export X16_sta_PPU_VRAM_DATA
.export X16_sta_SPR_DMA

.export X16_stx_PAPU_CT2
.export X16_stx_PAPU_CTL1
.export X16_stx_PAPU_CTL2
.export X16_stx_PAPU_EN
.export X16_stx_PAPU_NFREQ1
.export X16_stx_PAPU_RAMP2
.export X16_stx_PPU_CTL2
.export X16_stx_PPU_VRAM_ADDR

.export X16_sty_MMC3_IRQDISABLE
.export X16_sty_PAPU_RAMP1
.export X16_sty_PAPU_RAMP2
.export X16_sty_PPU_SCROLL
.export X16_sty_PPU_VRAM_ADDR

.export X16_pt1a_idx_active
.export X16_pt1b_idx_active
.export X16_pt1c_idx_active
.export X16_pt1d_idx_active

.export X16_nes_interrupt_inhibit

.segment "X16BSS"
X16_MMC3_COMMAND:
	.res 1
X16_MMC3_IRQCNT:
	.res 1
X16_MMC3_IRQ_ENABLED:
	.res 1
kernal_irq_handler:
	.res 2
X16_nes_interrupt_inhibit:
	.res 1

; These variables track what CHR banks are loaded in VERA VRAM
; and provides a way to handle dynamic loading

X16_pt0a_loaded:
	.res 8
X16_pt0b_loaded:
	.res 8
X16_pt0_lru:
	.res 8
X16_pt0_idx_active:
	.res 1

X16_pt1_loaded:
	.res 32
X16_pt1_lru:
	.res 32
X16_pt1_idx_active:   ; when treated as an array
X16_pt1a_idx_active:
	.res 1
X16_pt1b_idx_active:
	.res 1
X16_pt1c_idx_active:
	.res 1
X16_pt1d_idx_active:
	.res 1

.segment "X16STARTUP"
start:
	stz X16::Reg::ROMBank

	jsr X16_load_tanooki_bin
	bcs nobin

	jsr X16_PPURESET

	jsr X16_init_dynamic_chr

	jsr X16_setup_handler

	jmp IntReset ; Start Game

	lda #4
	sta X16::Reg::ROMBank
	rts
nobin:
	jsr X16::Kernal::PRIMM
	.byte "UNABLE TO LOAD TANOOKI.BIN",13,0

	lda #4
	sta X16::Reg::ROMBank
	rts

.proc X16_setup_handler
	php
	sei

	lda X16::Vec::IRQVec
	sta kernal_irq_handler
	lda X16::Vec::IRQVec+1
	sta kernal_irq_handler+1

	lda #<x16_irqhandler
	sta X16::Vec::IRQVec
	lda #>x16_irqhandler
	sta X16::Vec::IRQVec+1

	lda #$03
	tsb Vera::Reg::IEN

	stz X16_MMC3_IRQ_ENABLED
	lda #$ff
	sta MMC3_IRQCNT

	lda #$ff
	sta X16_nes_interrupt_inhibit

	plp
	rts
.endproc


.proc X16_load_tanooki_bin
	; Use last-used disk device to load bin
	lda #X16::ExtAPI::GETLFS
	jsr X16::Kernal::EXTAPI
	lda #1
	ldy #2
	jsr X16::Kernal::SETLFS

	lda #fnend-fn
	ldx #<fn
	ldy #>fn
	jsr X16::Kernal::SETNAM

	lda #1
	sta X16::Reg::RAMBank
	lda #0
	ldx #<$a000
	ldy #>$a000
	jmp X16::Kernal::LOAD
fn:
	.byte "TANOOKI.BIN"
fnend:
.endproc

.proc X16_init_dynamic_chr
	; initialize the loaded and lru structures
	; for the dynamic CHRROM management
	ldx #31
loop1:
	lda #$ff
	sta X16_pt1_loaded,x
	txa
	sta X16_pt1_lru,x
	dex
	bpl loop1

	ldx #7
loop2:
	lda #$ff
	sta X16_pt0a_loaded,x
	sta X16_pt0b_loaded,x
	txa
	sta X16_pt0_lru,x
	dex
	bpl loop2

	ldx #0
	ldy #$76
	sty X16_pt0a_loaded
	jsr X16_load_bgtiles_a

	ldx #0
	ldy #$78
	sty X16_pt0b_loaded
	jsr X16_load_bgtiles_b

	stz X16_pt0_idx_active

	ldx #0
	ldy #0
	jsr X16_load_sprtiles
	stz X16_pt1_loaded

	stz X16_pt1a_idx_active
	stz X16_pt1b_idx_active
	stz X16_pt1c_idx_active
	stz X16_pt1d_idx_active

	rts
.endproc

.proc X16_load_sprtiles
	lda #<VERA_SPRITE_BASE
	sta Vera::Reg::AddrL
	txa
	asl
	asl
	asl
	clc
	adc #>VERA_SPRITE_BASE
	sta Vera::Reg::AddrM
	lda #^(VERA_SPRITE_BASE) | $10
	adc #0
	sta Vera::Reg::AddrH

	lda X16::Reg::RAMBank
	pha

	lda sprbanks,y
	beq panic

	sta X16::Reg::RAMBank

	lda sprpages,y
	beq panic

	tay
	jmp X16_load_2k_to_VERA ; restores ram bank from stack
panic:
	stp
.endproc


.proc X16_load_bgtiles_a
	lda #<VERA_TILE_BASE
	sta Vera::Reg::AddrL
	txa
	asl
	asl
	asl
	clc
	adc #>VERA_TILE_BASE
	sta Vera::Reg::AddrM
	lda #^(VERA_TILE_BASE) | $10
	adc #0
	sta Vera::Reg::AddrH

	lda X16::Reg::RAMBank
	pha

	lda bgbanks,y
	beq panic

	sta X16::Reg::RAMBank

	lda bgpages,y
	beq panic

	tay
	jmp X16_load_2k_to_VERA ; restores ram bank from stack
panic:
	stp
.endproc

.proc X16_load_bgtiles_b
	lda #<VERA_TILE_BASE
	sta Vera::Reg::AddrL
	txa
	asl
	asl
	asl
	clc
	adc #>(VERA_TILE_BASE + $04)
	sta Vera::Reg::AddrM
	lda #^(VERA_TILE_BASE) | $10
	adc #0
	sta Vera::Reg::AddrH

	lda X16::Reg::RAMBank
	pha

	lda bgbanks,y
	beq panic

	sta X16::Reg::RAMBank

	lda bgpages,y
	beq panic

	tay
	jmp X16_load_2k_to_VERA ; restores ram bank from stack
panic:
	stp
.endproc

.proc X16_load_2k_to_VERA
	php
	sei

	sty READPAGE0
	sty READPAGE1
	sty READPAGE2
	sty READPAGE3

	ldy #8 ; read 8 pages
	ldx #0
	clc
loop:
	lda $ff00,x
READPAGE0 = * - 1
	sta Vera::Reg::Data0
	lda $ff01,x
READPAGE1 = * - 1
	sta Vera::Reg::Data0
	lda $ff02,x
READPAGE2 = * - 1
	sta Vera::Reg::Data0
	lda $ff03,x
READPAGE3 = * - 1
	sta Vera::Reg::Data0
	inx
	inx
	inx
	inx
	bne loop
	inc READPAGE0
	inc READPAGE1
	inc READPAGE2
	inc READPAGE3
	dey
	bne loop

	plp
	pla
	sta X16::Reg::RAMBank
	rts
.endproc

.segment "X16BRIDGE"

.proc x16_irqhandler
	;stp
	lda X16::Reg::RAMBank
	sta RAMBANK_RESTORE

	; are we vblank?
	lda Vera::Reg::ISR
	and #1
	beq notvblank

	lda Vera::Reg::Ctrl
	pha
	stz Vera::Reg::Ctrl
	lda Vera::Reg::AddrL
	pha
	lda Vera::Reg::AddrM
	pha
	lda Vera::Reg::AddrH
	pha

	; run the kernal handler first
	lda #>after_kernal_handler
	pha
	lda #<after_kernal_handler
	pha
	php
	pha
	phx
	phy

	jmp (kernal_irq_handler)
after_kernal_handler:
	lda #31
	sta X16::Reg::RAMBank
	lda #$80
	tsb NESPort::PPUSTATUS
	lda NESPort::PPUCTRL

	ldx #$ff
RAMBANK_RESTORE = * - 1
	stx X16::Reg::RAMBank
	tax

	bpl after_game_int_handler

	lda #>after_game_int_handler
	pha
	lda #<after_game_int_handler
	pha
	php

	jmp IntNMI
notvblank:
	lda #$02
	sta Vera::Reg::ISR

	bit X16_nes_interrupt_inhibit
	bmi end

	jsr X16_sta_MMC3_IRQLATCH

	lda X16_MMC3_IRQ_ENABLED
	beq end

	lda Vera::Reg::Ctrl
	pha
	stz Vera::Reg::Ctrl
	lda Vera::Reg::AddrL
	pha
	lda Vera::Reg::AddrM
	pha
	lda Vera::Reg::AddrH
	pha

	lda #>after_game_int_handler
	pha
	lda #<after_game_int_handler
	pha
	php

	jmp IntIRQ

after_game_int_handler:
	pla
	sta Vera::Reg::AddrH
	pla
	sta Vera::Reg::AddrM
	pla
	sta Vera::Reg::AddrL
	pla
	sta Vera::Reg::Ctrl
end:
	;stp
	ply
	plx
	pla
	rti
.endproc

X16_PJFAR_outbound:
	pha ; 2 outbound bank
	phx ; 1
	tsx
	lda $010b,x ; bring preserved flags to outbound
	sta $0104,x
	lda $010a,x ; bring preserved A to outbound
	sta $0103,x
	lda X16::Reg::RAMBank ; send preserved bank to return
	sta $0109,x
	plx ; 1
	pla ; 2
	sta X16::Reg::RAMBank ; set outbound bank
	pla ; 3
	plp ; 4
	rts ; return to call (5-6), leaving our return (7-8) and state (9-b)

X16_PJFAR_return:
	; 6 - return flags (was b)
	; 5 - return a (was a)
	; 4 - return bank (was 9)
	php ; 3
	pha ; 2
	phx ; 1
	tsx
	lda $0103,x
	sta $0106,x
	lda $0102,x
	sta $0105,x
	plx ; 1
	pla ; 2
	pla ; 3
	pla ; 4
	sta X16::Reg::RAMBank
	pla ; 5
	plp ; 6
	rts


X16_lda_JOYPAD_y:
	rts

X16_lda_PPU_STAT:
	JSRFAR NESPort::lda_PPUSTATUS, 31

.proc X16_lda_PPU_VRAM_DATA
	; In SMB3, we never actually need to read out of VRAM.
	; it's used to tickle the vertical scroll mid-frame
	rts
.endproc

.proc X16_ldx_PPU_STAT
	PJFAR NESPort::ldx_PPUSTATUS, 31

.endproc

X16_PPURESET:
	PJFAR NESPort::PPURESET, 31

X16_sta_FRAMECTR_CTL:
	rts

X16_sta_JOYPAD:
	rts

.proc X16_sta_MMC3_COMMAND
	sta X16_MMC3_COMMAND
	rts
.endproc

.proc X16_sta_MMC3_IRQCNT
	sta X16_MMC3_IRQCNT
	rts
.endproc

.proc X16_sta_MMC3_IRQDISABLE
	stz X16_MMC3_IRQ_ENABLED
	rts
.endproc

.proc X16_sta_MMC3_IRQENABLE
	pha
	lda #$80
	sta X16_MMC3_IRQ_ENABLED
	pla
	rts
.endproc

.proc X16_sta_MMC3_IRQLATCH
	php
	sei
	pha

	; get the current scanline (/2)

	bit Vera::Reg::IEN       ; set or clear V based on scanline (8)
redo:
	lda Vera::Reg::IRQLineL
	bvs hi
lo:
	bit Vera::Reg::IEN
	bvs redo                 ; we transitioned, check again
	clc
	bra cont
hi:
	bit Vera::Reg::IEN
	bvc redo                 ; we transitioned, check again
	sec
cont:
	ror ; current scanline/2 with relative certainty is in .A
	clc
	adc X16_MMC3_IRQCNT
	bcc :+
	sbc #15 ; wraparound
:	asl
	sta Vera::Reg::IRQLineL
	lda #$80
	bcs sethi
	trb Vera::Reg::IEN
	bra end
sethi:
	tsb Vera::Reg::IEN
end:
	pla
	plp
	rts
.endproc

.proc X16_sta_MMC3_MIRROR
	PJFAR NESPort::sta_MMC3_MIRROR, 31
.endproc

.proc X16_sta_MMC3_PAGE
	php
	pha
	phx
	phy
	tax

	lda X16_MMC3_COMMAND
	and #$07
	beq pt0a
	dec
	beq pt0b
	dec
	jeq pt1a
	dec
	jeq pt1b
	dec
	jeq pt1c
	dec
	jeq pt1d
	dec
	jeq prgc
prga: ; switch RAM bank
	stx X16::Reg::RAMBank
	jmp end
pt0a:
	php
	sei
	stx @CMP1
	; try to find a slot with the already loaded banks
	ldy #8
@loop1:
	dey
	bmi @nomatch
	lda X16_pt0a_loaded,y
	cmp #$ff
@CMP1 = * - 1
	bne @loop1
	ldx X16_pt0_idx_active
	lda X16_pt0b_loaded,x
	cmp X16_pt0b_loaded,y
	bne @loop1
	; we found it
@found:
	sty X16_pt0_idx_active
	jsr activate_tilemap
	plp
	jmp end
@nomatch:
	ldx X16_pt0_lru+7 ; grab the least recently used index
	lda @CMP1
	sta X16_pt0a_loaded,x
	tay
	jsr X16_load_bgtiles_a

	ldx X16_pt0_idx_active
	lda X16_pt0b_loaded,x
	ldx X16_pt0_lru+7
	sta X16_pt0b_loaded,x
	tay
	jsr X16_load_bgtiles_b

	ldy X16_pt0_lru+7
	bra @found
pt0b:
	php
	sei
	stx @CMP1
	; try to find a slot with the already loaded banks
	ldy #8
@loop1:
	dey
	bmi @nomatch
	lda X16_pt0b_loaded,y
	cmp #$ff
@CMP1 = * - 1
	bne @loop1
	ldx X16_pt0_idx_active
	lda X16_pt0a_loaded,x
	cmp X16_pt0a_loaded,y
	bne @loop1
	; we found it
@found:
	sty X16_pt0_idx_active
	jsr activate_tilemap
	plp
	bra end
@nomatch:
	ldx X16_pt0_lru+7 ; grab the least recently used index
	lda @CMP1
	sta X16_pt0b_loaded,x
	tay
	jsr X16_load_bgtiles_b

	ldx X16_pt0_idx_active
	lda X16_pt0a_loaded,x
	ldx X16_pt0_lru+7
	sta X16_pt0a_loaded,x
	tay
	jsr X16_load_bgtiles_a

	ldy X16_pt0_lru+7
	bra @found
pt1a:
	php
	sei
	lda #0
	bra pt1
pt1b:
	php
	sei
	lda #1
	bra pt1
pt1c:
	php
	sei
	lda #2
	bra pt1
pt1d:
	php
	sei
	lda #3
pt1:
	; A = pattern table 1 bank
	; X = chr rom bank
	pha
	stx @CMP1
	; try to find a slot with the already loaded bank
	ldy #32
@loop1:
	dey
	bmi @nomatch
	lda X16_pt1_loaded,y
	cmp #$ff
@CMP1 = * - 1
	bne @loop1
	; we found it
@found:
	tya ; dynamic slot
	plx ; MMC3 PT1 bank
	sta X16_pt1_idx_active,x

	; update the LRU
	ldx #32
@loop1s:
	dex
	bmi panic
	cmp X16_pt1_lru,x
	bne @loop1s
@loop2s:
	dex
	bmi @mrus
	lda X16_pt1_lru,x
	sta X16_pt1_lru+1,x
	bra @loop2s
@mrus:
	sty X16_pt1_lru

	plp
	bra end
@nomatch:
	ldx X16_pt1_lru+31 ; grab the least recently used index
	lda @CMP1
	sta X16_pt1_loaded,x
	tay
	jsr X16_load_sprtiles
	ldy X16_pt1_lru+31
	bra @found
prgc:
	; changing NES $C000 bank is a no-op on X16
end:
	ply
	plx
	pla
	plp
	rts
panic:
	stp
activate_tilemap:
	tya
	asl
	asl
	asl
	clc
	adc #<(((VERA_TILE_BASE >> 11) << 2) | $00)
	sta Vera::Reg::L0TileBase
	sta Vera::Reg::L1TileBase
	; update the LRU
	ldx #8
	tya
@loop1:
	dex
	bmi panic
	cmp X16_pt0_lru,x
	bne @loop1
@loop2:
	dex
	bmi @mru
	lda X16_pt0_lru,x
	sta X16_pt0_lru+1,x
	bra @loop2
@mru:
	sty X16_pt0_lru
	rts
.endproc

X16_sta_PAPU_CT1:
	rts

X16_sta_PAPU_CT1_x:
	rts

X16_sta_PAPU_CT2:
	rts

X16_sta_PAPU_CTL1:
	rts

X16_sta_PAPU_CTL2:
	rts

X16_sta_PAPU_EN:
	rts

X16_sta_PAPU_FT1:
	rts

X16_sta_PAPU_FT1_x:
	rts

X16_sta_PAPU_FT2:
	rts

X16_sta_PAPU_MODADDR:
	rts

X16_sta_PAPU_MODCTL:
	rts

X16_sta_PAPU_MODLEN:
	rts

X16_sta_PAPU_NCTL1:
	rts

X16_sta_PAPU_NFREQ1:
	rts

X16_sta_PAPU_NFREQ2:
	rts

X16_sta_PAPU_RAMP1:
	rts

X16_sta_PAPU_RAMP2:
	rts

X16_sta_PAPU_TCR1:
	rts

X16_sta_PAPU_TFREQ1:
	rts

X16_sta_PAPU_TFREQ2:
	rts

X16_sta_PPU_CTL1:
	PJFAR NESPort::sta_PPUCTRL, 31

X16_sta_PPU_CTL2:
	PJFAR NESPort::sta_PPUMASK, 31

X16_sta_PPU_SCROLL:
	PJFAR NESPort::sta_PPUSCROLL, 31

X16_sta_PPU_VRAM_ADDR:
	PJFAR NESPort::sta_PPUADDR, 31

X16_sta_PPU_VRAM_DATA:
	PJFAR NESPort::sta_PPUDATA, 31

X16_sta_SPR_DMA:
	PJFAR NESPort::sta_OAMDMA, 31

X16_stx_PAPU_CT2:
	rts

X16_stx_PAPU_CTL1:
	rts

X16_stx_PAPU_CTL2:
	rts

X16_stx_PAPU_EN:
	rts

X16_stx_PAPU_NFREQ1:
	rts

X16_stx_PAPU_RAMP2:
	rts

X16_stx_PPU_CTL2:
	PJFAR NESPort::stx_PPUMASK, 31

X16_stx_PPU_VRAM_ADDR:
	PJFAR NESPort::stx_PPUADDR, 31

X16_sty_MMC3_IRQDISABLE:
	stz X16_MMC3_IRQ_ENABLED
	rts

X16_sty_PAPU_RAMP1:
	rts

X16_sty_PAPU_RAMP2:
	rts

X16_sty_PPU_SCROLL:
	PJFAR NESPort::sty_PPUSCROLL, 31

X16_sty_PPU_VRAM_ADDR:
	PJFAR NESPort::sty_PPUADDR, 31

.endif


; CHR ROM banks
; $00/000 - sprite (credits, leaf mario)
; $01/001 - sprite (leaf mario)
; $02/002 - sprite (credits, leaf mario)
; $03/003 - sprite (leaf mario)
; $04/004 - sprite (credits, title)
; $05/005 - sprite (object group 1/2)
; $06/006 - sprite (end card twinkle)
; $07/007 - sprite (end card spin)
; $08-$09/008-009 - background (plains level)
; $0A/010 - sprite (object group 0/1/2/3)
; $0B/011 - sprite (object group 1/2/3/4)
; $0C-$0D/012-013 - background (high up level)
; $0E/014 - sprite (object group 1/2/4)
; $0F/015 - UNUSED
; $10-$11/016-017 - background (fortress level)
; $12/018 - sprite (object group 1/2/3/4, fort donut lift, laser)
; $13/019 - sprite (object group 0/1/2)
; $14-$15/020-021 - background (map animation 0/3)
; $16-$17/022-023 - background
; $18-$19/024-025 - background (ice level)
; $1A/026 - sprite (object group 0/1/2)
; $1B/027 - sprite (object group 2, lava lotus fire, the end)
; $1C-$1D/028-029 - background (hills/underground)
; $1E/030 - sprite (king W1/W6-W7)
; $1F/031 - sprite (king W2-W5)
; $20/032 - sprite (title)
; $21/033 - sprite (title)
; $22/034 - sprite (map)
; $23/035 - sprite (map)
; $24-$25/036-037 - background (bonus room)
; $24/036 - sprite (princess letter?)
; $25/037 - sprite (princess letter?)
; $26/038 - sprite (king W4-W6)
; $27/039 - sprite (king W1-W3/W7)
; $28-$29/040-041 - background (throne room)
; $28/040 - sprite (n-spade)
; $29/041 - sprite (n-spade)
; $2A/042 - sprite (yelling toad)
; $2B/043 - sprite (n-spade)
; $2C-$2D/044-045 - background (roulette)
; $2E-$2F/046-047 - background (Pg2 roulette)
; $30-$31/048-049 - background (desert level)
; $32/050 - sprite (object group 4, time up, pause)
; $33/051 - sprite (object group 2)
; $34-$35/052-053 - background (airship/W8 level)
; $36/054 - sprite (object group 2/4, clouds, cannon/cannonball)
; $37/055 - sprite (object group 0/4, koopaling W1/W2/W4/W5/W7)
; $38-$39/056-057 - background (sky level)
; $3A/058 - sprite (object group 0, bowser)
; $3B/059 - sprite (bowser)
; $3C/060 - sprite
; $3D/061 - sprite (object group 3)
; $3E-$3F/062-063 - background (Pg2 P-switch active/plant infestation)
; $3E/063 - sprite (final door)
; $40/064 - sprite (tanooki mario)
; $41/065 - sprite (tanooki mario)
; $42/066 - sprite (tanooki mario)
; $43/067 - sprite (tanooki mario)
; $44/068 - sprite (credits, hammer mario)
; $45/069 - sprite (hammer mario)
; $46/070 - sprite (hammer mario)
; $47/071 - sprite (hammer mario)
; $48/072 - sprite (object group 0, koopaling W1/W4/W6, wand)
; $49/073 - sprite (koopaling W2/W5)
; $4A/074 - sprite (koopaling W3/W7)
; $4B/075 - sprite
; $4C/076 - sprite (object group 0/4)
; $4D/077 - sprite (boom boom)
; $4E/078 - sprite (object group 3, boomerang)
; $4F/079 - sprite (object group 1/2/3/4, microgoomba)
; $50/080 - sprite (small mario/frog)
; $51/081 - sprite (credits, small mario/frog)
; $52/082 - sprite (small mario/frog)
; $53/083 - sprite (credits, small mario/frog)
; $54/084 - sprite (credits, big mario)
; $55/085 - sprite (3 end card bonus, big mario)
; $56/086 - sprite (big mario)
; $57/087 - sprite (credits, big mario)
; $58-$59/088-089 - background (plant/pipe/underwater level, 2P vs)
; $5A/090 - sprite (object group 2/4, vertical donut lift, n-spade)
; $5B/091 - probably sprite, unknown
; $5C-$5D/092-093 - background (princess/toad house/cards/inventory)
; $5E-$5F/094-095 - background (full alphabet text)
; $60-$61/096-097 - background (Pg2 general level)
; $62-$63/098-099 - background (Pg2 general level)
; $64-$65/100-101 - background (Pg2 general level)
; $66-$67/102-103 - background (Pg2 general level)
; $68-$69/104-105 - background (3-7 only)
; $6A-$6B/106-107 - background (Pg2 airship)
; $6C-$6D/108-109 - background (hills/underground alternate level)
; $6E-$6F/110-111 - background (giant level)
; $70-$71/112-113 - background (map animation 1/3)
; $72-$73/114-115 - background (map animation 2/3)
; $74-$75/116-117 - background (map animation 3/3)
; $76/118 - sprite (credits)
; $76-$77/118-119 - background (floor)
; $78-$79/120-121 - background (title)
; $7A-$7B/122-123 - background (title)
; $7C-$7D/124-125 - backgtound (curtain/floor)
; $7E/126 - sprite blank tiles over status bar
; $7F/127 - sprite (title)
