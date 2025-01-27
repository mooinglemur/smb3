.ifdef X16

.import X16_lda_JOYPAD_y
.import X16_lda_PPU_STAT
.import X16_lda_PPU_VRAM_DATA

.import X16_ldx_PPU_STAT

.import X16_sta_FRAMECTR_CTL
.import X16_sta_JOYPAD
.import X16_sta_MMC3_COMMAND
.import X16_sta_MMC3_IRQCNT
.import X16_sta_MMC3_IRQDISABLE
.import X16_sta_MMC3_IRQENABLE
.import X16_sta_MMC3_IRQLATCH
.import X16_sta_MMC3_MIRROR
.import X16_sta_MMC3_PAGE
.import X16_sta_PAPU_CT1
.import X16_sta_PAPU_CT1_x
.import X16_sta_PAPU_CT2
.import X16_sta_PAPU_CTL1
.import X16_sta_PAPU_CTL2
.import X16_sta_PAPU_EN
.import X16_sta_PAPU_FT1
.import X16_sta_PAPU_FT1_x
.import X16_sta_PAPU_FT2
.import X16_sta_PAPU_MODADDR
.import X16_sta_PAPU_MODCTL
.import X16_sta_PAPU_MODLEN
.import X16_sta_PAPU_NCTL1
.import X16_sta_PAPU_NFREQ1
.import X16_sta_PAPU_NFREQ2
.import X16_sta_PAPU_RAMP1
.import X16_sta_PAPU_RAMP2
.import X16_sta_PAPU_TCR1
.import X16_sta_PAPU_TFREQ1
.import X16_sta_PAPU_TFREQ2
.import X16_sta_PPU_CTL1
.import X16_sta_PPU_CTL2
.import X16_sta_PPU_SCROLL
.import X16_sta_PPU_SPR_ADDR
.import X16_sta_PPU_VRAM_ADDR
.import X16_sta_PPU_VRAM_DATA
.import X16_sta_SPR_DMA

.import X16_stx_PAPU_CT2
.import X16_stx_PAPU_CTL1
.import X16_stx_PAPU_CTL2
.import X16_stx_PAPU_EN
.import X16_stx_PAPU_NFREQ1
.import X16_stx_PAPU_RAMP2
.import X16_stx_PPU_CTL2
.import X16_stx_PPU_VRAM_ADDR

.import X16_sty_MMC3_IRQDISABLE
.import X16_sty_PAPU_RAMP1
.import X16_sty_PAPU_RAMP2
.import X16_sty_PPU_SCROLL
.import X16_sty_PPU_VRAM_ADDR

.endif

.macro sta_PPU_CTL1
.ifdef NES
    sta PPU_CTL1
.endif
.ifdef X16
    jsr X16_sta_PPU_CTL1
.endif
.endmacro

.macro sta_PPU_CTL2
.ifdef NES
    sta PPU_CTL2
.endif
.ifdef X16
    jsr X16_sta_PPU_CTL2
.endif
.endmacro

.macro stx_PPU_CTL2
.ifdef NES
    stx PPU_CTL2
.endif
.ifdef X16
    jsr X16_stx_PPU_CTL2
.endif
.endmacro

.macro lda_PPU_STAT
.ifdef NES
    lda PPU_STAT
.endif
.ifdef X16
    jsr X16_lda_PPU_STAT
.endif
.endmacro

.macro ldx_PPU_STAT
.ifdef NES
    ldx PPU_STAT
.endif
.ifdef X16
    jsr X16_ldx_PPU_STAT
.endif
.endmacro

.macro sta_PPU_SPR_ADDR
.ifdef NES
    sta PPU_SPR_ADDR
.endif
.ifdef X16
    ; no op
.endif
.endmacro

.macro sta_PPU_SCROLL
.ifdef NES
    sta PPU_SCROLL
.endif
.ifdef X16
    jsr X16_sta_PPU_SCROLL
.endif
.endmacro

.macro sty_PPU_SCROLL
.ifdef NES
    sty PPU_SCROLL
.endif
.ifdef X16
    jsr X16_sty_PPU_SCROLL
.endif
.endmacro

.macro sta_PPU_VRAM_ADDR
.ifdef NES
    sta PPU_VRAM_ADDR
.endif
.ifdef X16
    jsr X16_sta_PPU_VRAM_ADDR
.endif
.endmacro

.macro stx_PPU_VRAM_ADDR
.ifdef NES
    stx PPU_VRAM_ADDR
.endif
.ifdef X16
    jsr X16_stx_PPU_VRAM_ADDR
.endif
.endmacro

.macro sty_PPU_VRAM_ADDR
.ifdef NES
    sty PPU_VRAM_ADDR
.endif
.ifdef X16
    jsr X16_sty_PPU_VRAM_ADDR
.endif
.endmacro

.macro lda_PPU_VRAM_DATA
.ifdef NES
    lda PPU_VRAM_DATA
.endif
.ifdef X16
    jsr X16_lda_PPU_VRAM_DATA
.endif
.endmacro

.macro sta_PPU_VRAM_DATA
.ifdef NES
    sta PPU_VRAM_DATA
.endif
.ifdef X16
    jsr X16_sta_PPU_VRAM_DATA
.endif
.endmacro

.macro sta_PAPU_CTL1
.ifdef NES
    sta PAPU_CTL1
.endif
.ifdef X16
    jsr X16_sta_PAPU_CTL1
.endif
.endmacro

.macro stx_PAPU_CTL1
.ifdef NES
    stx PAPU_CTL1
.endif
.ifdef X16
    jsr X16_stx_PAPU_CTL1
.endif
.endmacro

.macro sta_PAPU_CTL2
.ifdef NES
    sta PAPU_CTL2
.endif
.ifdef X16
    jsr X16_sta_PAPU_CTL2
.endif
.endmacro

.macro stx_PAPU_CTL2
.ifdef NES
    stx PAPU_CTL2
.endif
.ifdef X16
    jsr X16_stx_PAPU_CTL2
.endif
.endmacro

.macro sta_PAPU_NCTL1
.ifdef NES
    sta PAPU_NCTL1
.endif
.ifdef X16
    jsr X16_sta_PAPU_NCTL1
.endif
.endmacro

.macro sta_PAPU_TCR1
.ifdef NES
    sta PAPU_TCR1
.endif
.ifdef X16
    jsr X16_sta_PAPU_TCR1
.endif
.endmacro

.macro sta_PAPU_RAMP1
.ifdef NES
    sta PAPU_RAMP1
.endif
.ifdef X16
    jsr X16_sta_PAPU_RAMP1
.endif
.endmacro

.macro sty_PAPU_RAMP1
.ifdef NES
    sty PAPU_RAMP1
.endif
.ifdef X16
    jsr X16_sty_PAPU_RAMP1
.endif
.endmacro

.macro sta_PAPU_RAMP2
.ifdef NES
    sta PAPU_RAMP2
.endif
.ifdef X16
    jsr X16_sta_PAPU_RAMP2
.endif
.endmacro

.macro stx_PAPU_RAMP2
.ifdef NES
    stx PAPU_RAMP2
.endif
.ifdef X16
    jsr X16_stx_PAPU_RAMP2
.endif
.endmacro

.macro sty_PAPU_RAMP2
.ifdef NES
    sty PAPU_RAMP2
.endif
.ifdef X16
    jsr X16_sty_PAPU_RAMP2
.endif
.endmacro

.macro sta_PAPU_FT1
.ifdef NES
    sta PAPU_FT1
.endif
.ifdef X16
    jsr X16_sta_PAPU_FT1
.endif
.endmacro

.macro sta_PAPU_FT1_x
.ifdef NES
    sta PAPU_FT1,x
.endif
.ifdef X16
    jsr X16_sta_PAPU_FT1_x
.endif
.endmacro

.macro sta_PAPU_FT2
.ifdef NES
    sta PAPU_FT2
.endif
.ifdef X16
    jsr X16_sta_PAPU_FT2
.endif
.endmacro

.macro sta_PAPU_TFREQ1
.ifdef NES
    sta PAPU_TFREQ1
.endif
.ifdef X16
    jsr X16_sta_PAPU_TFREQ1
.endif
.endmacro

.macro sta_PAPU_TFREQ2
.ifdef NES
    sta PAPU_TFREQ2
.endif
.ifdef X16
    jsr X16_sta_PAPU_TFREQ2
.endif
.endmacro

.macro sta_PAPU_NFREQ1
.ifdef NES
    sta PAPU_NFREQ1
.endif
.ifdef X16
    jsr X16_sta_PAPU_NFREQ1
.endif
.endmacro

.macro stx_PAPU_NFREQ1
.ifdef NES
    stx PAPU_NFREQ1
.endif
.ifdef X16
    jsr X16_stx_PAPU_NFREQ1
.endif
.endmacro

.macro sta_PAPU_NFREQ2
.ifdef NES
    sta PAPU_NFREQ2
.endif
.ifdef X16
    jsr X16_sta_PAPU_NFREQ2
.endif
.endmacro

.macro sta_PAPU_CT1
.ifdef NES
    sta PAPU_CT1
.endif
.ifdef X16
    jsr X16_sta_PAPU_CT1
.endif
.endmacro

.macro sta_PAPU_CT1_x
.ifdef NES
    sta PAPU_CT1,x
.endif
.ifdef X16
    jsr X16_sta_PAPU_CT1_x
.endif
.endmacro

.macro sta_PAPU_CT2
.ifdef NES
    sta PAPU_CT2
.endif
.ifdef X16
    jsr X16_sta_PAPU_CT2
.endif
.endmacro

.macro stx_PAPU_CT2
.ifdef NES
    stx PAPU_CT2
.endif
.ifdef X16
    jsr X16_stx_PAPU_CT2
.endif
.endmacro

.macro sta_PAPU_MODCTL
.ifdef NES
    sta PAPU_MODCTL
.endif
.ifdef X16
    jsr X16_sta_PAPU_MODCTL
.endif
.endmacro

.macro sta_PAPU_MODADDR
.ifdef NES
    sta PAPU_MODADDR
.endif
.ifdef X16
    jsr X16_sta_PAPU_MODADDR
.endif
.endmacro

.macro sta_PAPU_MODLEN
.ifdef NES
    sta PAPU_MODLEN
.endif
.ifdef X16
    jsr X16_sta_PAPU_MODLEN
.endif
.endmacro

.macro sta_PAPU_EN
.ifdef NES
    sta PAPU_EN
.endif
.ifdef X16
    jsr X16_sta_PAPU_EN
.endif
.endmacro

.macro stx_PAPU_EN
.ifdef NES
    stx PAPU_EN
.endif
.ifdef X16
    jsr X16_stx_PAPU_EN
.endif
.endmacro

.macro sta_SPR_DMA
.ifdef NES
    sta SPR_DMA
.endif
.ifdef X16
    jsr X16_sta_SPR_DMA
.endif
.endmacro

.macro lda_JOYPAD_y
.ifdef NES
    lda JOYPAD,y
.endif
.ifdef X16
    jsr X16_lda_JOYPAD_y
.endif
.endmacro

.macro sta_JOYPAD
.ifdef NES
    sta JOYPAD
.endif
.ifdef X16
    jsr X16_sta_JOYPAD
.endif
.endmacro

.macro sta_FRAMECTR_CTL
.ifdef NES
    sta FRAMECTR_CTL
.endif
.ifdef X16
    jsr X16_sta_FRAMECTR_CTL
.endif
.endmacro

.macro sta_MMC3_COMMAND
.ifdef NES
    sta MMC3_COMMAND
.endif
.ifdef X16
    jsr X16_sta_MMC3_COMMAND
.endif
.endmacro

.macro sta_MMC3_PAGE
.ifdef NES
    sta MMC3_PAGE
.endif
.ifdef X16
    jsr X16_sta_MMC3_PAGE
.endif
.endmacro

.macro sta_MMC3_MIRROR
.ifdef NES
    sta MMC3_MIRROR
.endif
.ifdef X16
    jsr X16_sta_MMC3_MIRROR
.endif
.endmacro

.macro sta_MMC3_SRAM_EN
.ifdef NES
    sta MMC3_SRAM_EN
.endif
.ifdef X16
    ; noop
.endif
.endmacro

.macro sty_MMC3_SRAM_EN
.ifdef NES
    sty MMC3_SRAM_EN
.endif
.ifdef X16
    ; noop
.endif
.endmacro

.macro sta_MMC3_IRQCNT
.ifdef NES
    sta MMC3_IRQCNT
.endif
.ifdef X16
    jsr X16_sta_MMC3_IRQCNT
.endif
.endmacro

.macro sta_MMC3_IRQLATCH
.ifdef NES
    sta MMC3_IRQLATCH
.endif
.ifdef X16
    jsr X16_sta_MMC3_IRQLATCH
.endif
.endmacro

.macro sta_MMC3_IRQDISABLE
.ifdef NES
    sta MMC3_IRQDISABLE
.endif
.ifdef X16
    jsr X16_sta_MMC3_IRQDISABLE
.endif
.endmacro

.macro sty_MMC3_IRQDISABLE
.ifdef NES
    sty MMC3_IRQDISABLE
.endif
.ifdef X16
    jsr X16_sty_MMC3_IRQDISABLE
.endif
.endmacro

.macro sta_MMC3_IRQENABLE
.ifdef NES
    sta MMC3_IRQENABLE
.endif
.ifdef X16
    jsr X16_sta_MMC3_IRQENABLE
.endif
.endmacro

.macro INT_CLI
.ifdef NES
    cli
.endif
.ifdef X16
    stz X16_nes_interrupt_inhibit
.endif
.endmacro

.macro INT_SEI
.ifdef NES
    sei
.endif
.ifdef X16
    dec X16_nes_interrupt_inhibit
.endif
.endmacro
