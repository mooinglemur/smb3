.ifdef X16

.include "../inc/defines.inc"
.include "../inc/x16.inc"

.scope NESPort
	.import PPURESET
	.import bit_PPUSTATUS
	.import ldx_PPUSTATUS
	.import sta_MMC3_MIRROR
.endscope

.import bgbanks, bgpages
.import sprbanks, sprpages

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
.export X16_sta_PPU_SPR_ADDR
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

.segment "X16BSS"
X16_MMC3_COMMAND:
	.res 1
X16_MMC3_IRQCNT:
	.res 1
X16_MMC3_IRQ_ENABLED:
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
	jsr X16_init_dynamic_chr

	lda #4
	sta X16::Reg::ROMBank
	rts
nobin:
	jsr X16::Kernal::PRIMM
	.byte "UNABLE TO LOAD TANOOKI.BIN",13,0

	lda #4
	sta X16::Reg::ROMBank
	rts


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
	stp
	php
	sei
	sty READPAGE

	ldy #8 ; read 8 pages
	ldx #0
loop:
	lda $ff00,x
READPAGE = * - 1
	sta Vera::Reg::Data0
	inx
	bne loop
	inc READPAGE
	dey
	bne loop

	plp
	pla
	sta X16::Reg::RAMBank
	rts
.endproc

.segment "X16BRIDGE"
; stubs for now

X16_lda_JOYPAD_y:
X16_lda_PPU_STAT:
	rts

.proc X16_lda_PPU_VRAM_DATA
	; In SMB3, we never actually need to read out of VRAM.
	; it's used to tickle the vertical scroll mid-frame
	rts
.endproc

.proc X16_ldx_PPU_STAT
	JSRFAR NESPort::ldx_PPUSTATUS, 31
	rts
.endproc

X16_sta_FRAMECTR_CTL:
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
	JSRFAR NESPort::sta_MMC3_MIRROR, 31
	rts
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
	beq pt1a
	dec
	beq pt1b
	dec
	beq pt1c
	dec
	beq pt1d
	dec
	beq prgc
prga: ; switch RAM bank
	stx X16::Reg::RAMBank
	bra end
pt0a:
	php
	sei
	stx @CMP1
	; try to find a slot with the already loaded banks
	ldy #7
@loop1:
	lda X16_pt0a_loaded,y
	cmp #$ff
@CMP1 = * - 1
	bne @loop1

pt0b:
pt1a:
pt1b:
pt1c:
pt1d:





prgc:
	; changing NES $C000 bank is a no-op on X16
end:
	ply
	plx
	pla
	plp
	rts
.endproc

X16_sta_PAPU_CT1:
X16_sta_PAPU_CT1_x:
X16_sta_PAPU_CT2:
X16_sta_PAPU_CTL1:
X16_sta_PAPU_CTL2:
X16_sta_PAPU_EN:
X16_sta_PAPU_FT1:
X16_sta_PAPU_FT1_x:
X16_sta_PAPU_FT2:
X16_sta_PAPU_MODADDR:
X16_sta_PAPU_MODCTL:
X16_sta_PAPU_MODLEN:
X16_sta_PAPU_NCTL1:
X16_sta_PAPU_NFREQ1:
X16_sta_PAPU_NFREQ2:
X16_sta_PAPU_RAMP1:
X16_sta_PAPU_RAMP2:
X16_sta_PAPU_TCR1:
X16_sta_PAPU_TFREQ1:
X16_sta_PAPU_TFREQ2:
X16_sta_PPU_CTL1:
X16_sta_PPU_CTL2:
X16_sta_PPU_SCROLL:
X16_sta_PPU_SPR_ADDR:
X16_sta_PPU_VRAM_ADDR:
X16_sta_PPU_VRAM_DATA:
X16_sta_SPR_DMA:
X16_stx_PAPU_CT2:
X16_stx_PAPU_CTL1:
X16_stx_PAPU_CTL2:
X16_stx_PAPU_EN:
X16_stx_PAPU_NFREQ1:
X16_stx_PAPU_RAMP2:
X16_stx_PPU_CTL2:
X16_stx_PPU_VRAM_ADDR:
X16_sty_MMC3_IRQDISABLE:
X16_sty_PAPU_RAMP1:
X16_sty_PAPU_RAMP2:
X16_sty_PPU_SCROLL:
X16_sty_PPU_VRAM_ADDR:
	rts

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
; $7E/126 - sprite presumably unused
; $7F/127 - sprite (title)
