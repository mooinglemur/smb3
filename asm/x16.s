.ifdef X16

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



.segment "X16STARTUP"
start:
	rts





.segment "X16BRIDGE"
; stubs for now

X16_lda_JOYPAD_y:
X16_lda_PPU_STAT:
X16_lda_PPU_VRAM_DATA:
X16_ldx_PPU_STAT:
X16_sta_FRAMECTR_CTL:
X16_sta_JOYPAD:
X16_sta_MMC3_COMMAND:
X16_sta_MMC3_IRQCNT:
X16_sta_MMC3_IRQDISABLE:
X16_sta_MMC3_IRQENABLE:
X16_sta_MMC3_IRQLATCH:
X16_sta_MMC3_MIRROR:
X16_sta_MMC3_PAGE:
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
; $00 - sprite (credits, leaf mario)
; $01 - sprite (leaf mario)
; $02 - sprite (credits, leaf mario)
; $03 - sprite (leaf mario)
; $04 - sprite (credits, title)
; $05 - sprite (object group 1/2)
; $06 - sprite (end card twinkle)
; $07 - sprite (end card spin)
; $08-$09 - background (plains level)
; $0A - sprite (object group 0/1/2/3)
; $0B - sprite (object group 1/2/3/4)
; $0C-$0D - background (high up level)
; $0E - sprite (object group 1/2/4)
; $10-$11 - background (fortress level)
; $12 - sprite (object group 1/2/3/4, fort donut lift, laser)
; $13 - sprite (object group 0/1/2)
; $14-$15 - background (map animation 0/3)
; $16-$17 - background
; $18-$19 - background (ice level)
; $1A - sprite (object group 0/1/2)
; $1B - sprite (object group 2, lava lotus fire, the end)
; $1C-$1D - background (hills/underground)
; $1E - sprite (king W1/W6-W7)
; $1F - sprite (king W2-W5)
; $20 - sprite (title)
; $21 - sprite (title)
; $22 - sprite (map)
; $23 - sprite (map)
; $24-$25 - background (bonus room)
; $24 - sprite (princess letter?)
; $25 - sprite (princess letter?)
; $26 - sprite (king W4-W6)
; $27 - sprite (king W1-W3/W7)
; $28-$29 - background (throne room)
; $28 - sprite (n-spade)
; $29 - sprite (n-spade)
; $2A - sprite (yelling toad)
; $2B - sprite (n-spade)
; $2C-$2D - background (roulette)
; $2E-$2F - background (Pg2 roulette)
; $30-$31 - background (desert level)
; $32 - sprite (object group 4, time up, pause)
; $33 - sprite (object group 2)
; $34-$35 - background (airship/W8 level)
; $36 - sprite (object group 2/4, clouds, cannon/cannonball)
; $37 - sprite (object group 0/4, koopaling W1/W2/W4/W5/W7)
; $38-$39 - background (sky level)
; $3A - sprite (object group 0, bowser)
; $3B - sprite (bowser)
; $3C - sprite
; $3D - sprite (object group 3)
; $3E-$3F - background (Pg2 P-switch active/plant infestation)
; $3E - sprite (final door)
; $40 - sprite (tanooki mario)
; $41 - sprite (tanooki mario)
; $42 - sprite (tanooki mario)
; $43 - sprite (tanooki mario)
; $44 - sprite (credits, hammer mario)
; $45 - sprite (hammer mario)
; $46 - sprite (hammer mario)
; $47 - sprite (hammer mario)
; $48 - sprite (object group 0, koopaling W1/W4/W6, wand)
; $49 - sprite (koopaling W2/W5)
; $4A - sprite (koopaling W3/W7)
; $4B - sprite
; $4C - sprite (object group 0/4)
; $4D - sprite (boom boom)
; $4E - sprite (object group 3, boomerang)
; $4F - sprite (object group 1/2/3/4, microgoomba)
; $50 - sprite (small mario/frog)
; $51 - sprite (credits, small mario/frog)
; $52 - sprite (small mario/frog)
; $53 - sprite (credits, small mario/frog)
; $54 = sprite (credits, big mario)
; $55 - sprite (3 end card bonus, big mario)
; $56 - sprite (big mario)
; $57 - sprite (credits, big mario)
; $58-$59 - background (plant/pipe/underwater level, 2P vs)
; $5A - sprite (object group 2/4, vertical donut lift, n-spade)
; $5C-$5D - background (princess/toad house/cards)
; $5E-$5F - background (full alphabet text)
; $60-$61 - background (Pg2 general level)
; $62-$63 - background (Pg2 general level)
; $64-$65 - background (Pg2 general level)
; $66-$67 - background (Pg2 general level)
; $68-$69 - background (3-7 only)
; $6A-$6B - background (Pg2 airship)
; $6C-$6D - background (hills/underground alternate level)
; $6E-$6F - background (giant level)
; $70-$71 - background (map animation 1/3)
; $72-$73 - background (map animation 2/3)
; $74-$75 - background (map animation 3/3)
; $76 - sprite (credits)
; $76-$77 - background (floor)
; $78-$79 - background (title)
; $7A-$7B - background (title)
; $7C-$7D - backgtound (curtain/floor)
; $7F - sprite (title)