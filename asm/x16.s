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
; $5C-$5D/092-093 - background (princess/toad house/cards)
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
