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


