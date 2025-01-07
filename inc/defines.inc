; These are flags related to a video update stream value
VU_VERT		= $80	; Update in vertical (+32B) mode instead of horizontal (+1B) mode
VU_REPEAT	= $40	; Repeat following value several times instead of several raw values


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PPU I/O regs (CPU side)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	PPU_CTL1:
;	0-1: Name table address, changes between the four name tables at $2000 (0), $2400 (1), $2800 (2) and $2C00 (3).
;	2: Clear, PPU incs by 1 ("horizontal"); Set, PPU incs by 32 ("vertical")
;	3: Which pattern table holds for sprites; 0 for PT1 ($0000) or 1 for PT2 ($1000)
;	4: Which pattern table holds for BG; 0 for PT1 ($0000) or 1 for PT2 ($1000)
;	5: Set to use 8x16 sprites instead of 8x8
;	7: Set to generate VBlank NMIs
PPU_CTL1	= $2000		; Write only

;	PPU_CTL2:
;	0: Clear for color, set for mono
;	1: Clear to clip 8 left pixels of BG
;	2: Clear to clip 8 left pixels of sprites
;	3: If clear, BG hidden
;	4: If clear, sprites hidden
;	5-7: BG color in mono mode, "color intensity" in color mode (??)
PPU_CTL2	= $2001		; Write only

;	PPU_STAT:
;	4: if set, can write to VRAM, else writes ignored
;	5: if set, sprite overflow occurred on scanline
;	6: Set if any non-transparent pixel of sprite 0 is overlapping a non-transparent pixel of BG
;	7: VBlank is occurring (cleared after read)
PPU_STAT	= $2002

; Sprites: 256 bytes, each sprite takes 4, so 64 sprites total
; Only 8 sprites per scanline, sprite 0 is drawn on top (thus highest priority)
; PPU_SPR_ADDR / PPU_SPR_DATA
; * Byte 0 - Stores the y-coordinate of the top left of the sprite minus 1.
; * Byte 1 - Index number of the sprite in the pattern tables.
; * Byte 2 - Stores the attributes of the sprite.
;   * Bits 0-1 - Most significant two bits of the colour.  (Or "palette" 0-3)
;   * Bit 5 - Indicates whether this sprite has priority over the background.
;   * Bit 6 - Indicates whether to flip the sprite horizontally.
;   * Bit 7 - Indicates whether to flip the sprite vertically.
; * Byte 3 - X coordinate
PPU_SPR_ADDR	= $2003		; Set address sprite data
PPU_SPR_DATA	= $2004		; Read or write this sprite byte

PPU_SCROLL	= $2005		; Scroll register; read PPU_STAT, then write horiz/vert scroll
PPU_VRAM_ADDR	= $2006		; VRAM address (first write is high, next write is low)
PPU_VRAM_DATA	= $2007		; Data to read/write at this address

; Note that all transparent colors ($3F04, $3F08, $3F0C, $3F10, $3F14, $3F18 and $3F1C) are mirrored from 3F00
PPU_BG_PAL	= $3F00 	; 3F00-3F0F
PPU_SPR_PAL	= $3F10		; 3F10-3F1F


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SOUND I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; $4000(rct1)/$4004(rct2)/$400C(noise) bits
; ---------------------------------------
; 0-3	volume / envelope decay rate
; 4	envelope decay disable
; 5	length counter clock disable / envelope decay looping enable
; 6-7	duty cycle type (unused on noise channel)

; Duty cycles:
; 00 = a weak, grainy tone.  (12.5% Duty), 01 = a solid mid-strength tone. (25% Duty), 
; 10 = a strong, full tone (50% Duty), 11 = sounds a lot like 01 (25% Duty negated)

PAPU_CTL1	= $4000	; pAPU Pulse 1 Control Register.
PAPU_CTL2	= $4004	; pAPU Pulse 2 Control Register.
PAPU_NCTL1 	= $400C ; pAPU Noise Control Register 1.


; $4008(tri) bits
; ---------------
; 0-6	linear counter load register
; 7	length counter clock disable / linear counter start
PAPU_TCR1	= $4008	; pAPU Triangle Control Register 1.


; $4001(rct1)/$4005(rct2) bits
; --------------------------
; 0-2	right shift amount
; 3	decrease / increase (1/0) wavelength
; 4-6	sweep update rate
; 7	sweep enable
PAPU_RAMP1	= $4001	; pAPU Pulse 1 Ramp Control Register.
PAPU_RAMP2	= $4005	; pAPU Pulse 2 Ramp Control Register.


; $4002(rct1)/$4006(rct2)/$400A(Tri) bits
; -------------------------------------
; 0-7	8 LSB of wavelength
PAPU_FT1	= $4002	; pAPU Pulse 1 Fine Tune (FT) Register.
PAPU_FT2	= $4006	; pAPU Pulse 2 Fine Tune (FT) Register.
PAPU_TFREQ1	= $400A ; pAPU Triangle Frequency Register 1.


; $400E(noise) bits
; -----------------
; 0-3	playback sample rate
; 4-6	unused
; 7	random number type generation
PAPU_NFREQ1	= $400E ; pAPU Noise Frequency Register 1.

; $4003(rct1)/$4007(rct2)/$400B(tri)/$400F(noise) bits
; --------------------------------------------------
; 0-2	3 MS bits of wavelength (unused on noise channel) (the "high" frequency)
; 3-7	length of tone
PAPU_CT1	= $4003 ; pAPU Pulse 1 Coarse Tune (CT) Register.
PAPU_CT2	= $4007 ; pAPU Pulse 2 Coarse Tune (CT) Register.
PAPU_TFREQ2	= $400B ; pAPU Triangle Frequency Register 2.
PAPU_NFREQ2	= $400F ; pAPU Noise Frequency Register 2.


; $4010 - DMC Play mode and DMA frequency

; Bits 0-3:
;    f   period
;    ----------
;    0   $1AC
;    1   $17C
;    2   $154
;    3   $140
;    4   $11E
;    5   $0FE
;    6   $0E2
;    7   $0D6
;    8   $0BE
;    9   $0A0
;    A   $08E
;    B   $080
;    C   $06A
;    D   $054
;    E   $048
;    F   $036
; Bits 6-7: this is the playback mode.
;	00 - play DMC sample until length counter reaches 0 (see $4013)
;	x1 - loop the DMC sample (x = immaterial)
;	10 - play DMC sample until length counter reaches 0, then generate a CPU 
PAPU_MODCTL	= $4010 ; pAPU Delta Modulation Control Register.

PAPU_MODDA	= $4011 ; pAPU Delta Modulation D/A Register.
PAPU_MODADDR	= $4012 ; pAPU Delta Modulation Address Register.
PAPU_MODLEN	= $4013 ; pAPU Delta Modulation Data Length Register.

; read
; ----
; 0	rectangle wave channel 1 length counter status
; 1	rectangle wave channel 2 length counter status
; 2	triangle wave channel length counter status
; 3	noise channel length counter status
; 4	DMC is currently enabled (playing a stream of samples)
; 5	unknown
; 6	frame IRQ status (active when set)
; 7	DMC's IRQ status (active when set)
; 
; write
; -----
; 0	rectangle wave channel 1 enable
; 1	rectangle wave channel 2 enable
; 2	triangle wave channel enable
; 3	noise channel enable
; 4	enable/disable DMC (1=start/continue playing a sample;0=stop playing)
; 5-7	unknown
PAPU_EN		= $4015	; R/W pAPU Sound Enable


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OTHER I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPR_DMA		= $4014 ; Sprite DMA Register -- DMA from CPU memory at $100 x n to SPR-RAM (256 bytes)


; Read / Write Joypad 1/2:
;                   *  Bit 0 - Reads data from joypad or causes joypad strobe
;                      when writing.
;                   *  Bit 3 - Indicates whether Zapper is pointing at a sprite.
;                   *  Bit 4 - Cleared when Zapper trigger is released.
;                   Only bit 0 is involved in writing.
JOYPAD		= $4016

; Frame counter control
; Changes the frame counter that changes updates on sound; any write resets
; the frame counter, good for synchronizing sound with VBlank etc.
; 0        4, 0,1,2,3, 0,1,2,3,..., etc.
; 1        0,1,2,3,4, 0,1,2,3,4,..., etc. 
; bit 6 - enable frame IRQs (when zero)
; bit 7 - 0 = 60 IRQs a frame / 1 = 48 IRQs a frame (obviously need bit 6 clear to use)
; Interestingly, both of the above are clear on bootup, meaning IRQs are being generated,
; but the 6502 ignores NMIs on startup; also, need to read from $4015 (PAPU_EN) to acknowledge
; the interrupt, otherwise it holds the status on!
FRAMECTR_CTL	= $4017


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MMC3 regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MMC3_COMMAND:
;  Bits 0-2 - Command number:
;  * 0 - Swap two 1 KB VROM banks at PPU $0000.
;  * 1 - Swap two 1 KB VROM banks at PPU $0800.
;  * 2 - Swap one 1 KB VROM bank at PPU $1000.
;  * 3 - Swap one 1 KB VROM bank at PPU $1400.
;  * 4 - Swap one 1 KB VROM bank at PPU $1800.
;  * 5 - Swap one 1 KB VROM bank at PPU $1C00.
;  * 6 - Swap PRG-ROM bank at either $8000 or $C000 based on bit 6.
;  * 7 - Swap PRG-ROM bank at either $A000 
;
;  Bit 6 - If 0, enables swapping at $8000 and $A000, otherwise enables
;  swapping at $C000 and $A000.  (NOTE: This is what SMB3 uses, so we only
;  have defs for this mode!)
;
;  Bit 7 - If 1, causes addresses for commands 0-5 to be the exclusive-or
;  of the address stated and $1000.

; Note that bit 6 is set on all of these consistently since SMB3 uses the PRG switch this way
MMC3_2K_TO_PPU_0000	= %01000000	; 0
MMC3_2K_TO_PPU_0800	= %01000001	; 1
MMC3_1K_TO_PPU_1000	= %01000010	; 2
MMC3_1K_TO_PPU_1400	= %01000011	; 3
MMC3_1K_TO_PPU_1800	= %01000100	; 4
MMC3_1K_TO_PPU_1C00	= %01000101	; 5
MMC3_8K_TO_PRG_C000	= %01000110	; 6
MMC3_8K_TO_PRG_A000	= %01000111	; 7
MMC3_PPU_XOR_1000	= %10000000


MMC3_COMMAND	= $8000	; consult ref
MMC3_PAGE  	= $8001	; page number to MMC3_COMMAND
MMC3_MIRROR	= $A000	; bit 0 clear is horizontal mirroring, bit 0 set is vertical mirroring
MMC3_SRAM_EN	= $A001	; bit 7 set to enable SRAM at $6000-$7FFF
MMC3_IRQCNT	= $C000 ; Countdown to an IRQ
MMC3_IRQLATCH	= $C001 ; Store a temp val to be copied to MMC3_IRQCNT later
MMC3_IRQDISABLE	= $E000 ; Disables IRQ generation and copies MMC3_IRQLATCH to MMC3_IRQCNT
MMC3_IRQENABLE	= $E001 ; Enables IRQ generation


PAD_A		= $80
PAD_B		= $40
PAD_SELECT	= $20
PAD_START	= $10
PAD_UP		= $08
PAD_DOWN	= $04
PAD_LEFT	= $02
PAD_RIGHT	= $01


PLAYERSUIT_SMALL	= 0
PLAYERSUIT_BIG		= 1
PLAYERSUIT_FIRE		= 2
PLAYERSUIT_RACCOON	= 3
PLAYERSUIT_FROG		= 4
PLAYERSUIT_TANOOKI	= 5
PLAYERSUIT_HAMMER	= 6
PLAYERSUIT_SUPERSUITBEGIN = PLAYERSUIT_FROG	; Marker for when "Super Suits" begin
PLAYERSUIT_LAST		= PLAYERSUIT_HAMMER	; Marker for "last" suit (Debug cycler needs it)


SPR_PAL0	= %00000000
SPR_PAL1	= %00000001
SPR_PAL2	= %00000010
SPR_PAL3	= %00000011
SPR_BEHINDBG	= %00100000
SPR_HFLIP	= %01000000
SPR_VFLIP	= %10000000


UPDATERASTER_32PIXPART	= 1	; 32 pixel partition; common use is for levels with water along the bottom
UPDATERASTER_SPADEGAME	= 2	; Spade game sliders
UPDATERASTER_WATERLINE	= 3	; "Water line" mode (described at ObjHorzAutoScroller_Init)
UPDATERASTER_32PIXSHOWSPR= $80	; If NOT set, hides sprites that fall beneath the partition (i.e. for fixed water effect)


; The "unused" ones are just guesses (where even possible) based on the
; semi-translated "greetings" for the sake of tracking...
BONUS_UNUSED_KEYCOIN	= 0
BONUS_SPADE		= 1	; Line up images Spade game
BONUS_NSPADE		= 2	; Card matching N-Spade game
BONUS_UNUSED_CCCC	= 3
BONUS_UNUSED_DDDD	= 4	; Unused placeholder (I think), but does actually set something when it exits!
BONUS_UNUSED_ODDROULETTE= 5
BONUS_UNUSED_EVENCARD	= 6
BONUS_UNUSED_2RETURN	= 7	; MAY have been Koopa Troopa's "Prize" Game...


; Queue Player sound effects
SND_PLAYERJUMP	= $01	; Jump
SND_PLAYERBUMP	= $02	; Bump
SND_PLAYERSWIM	= $04	; Swim / Squish
SND_PLAYERKICK	= $08	; Kick
SND_PLAYERPIPE	= $10 	; Pipe / shrink
SND_PLAYERFIRE	= $20 	; Fireball
SND_PLAYERPOWER	= $40	; Full power ringing (must be constantly set or you don't hear it)
SND_PLAYERFROG	= $80 	; frog hop


; Queue Level sound effects 1
SND_LEVELCOIN	= $01	; Coin
SND_LEVELRISE	= $02 	; Powerup rising from block
SND_LEVELVINE	= $04 	; Vine rising
SND_LEVELBABOOM	= $08 	; Cannon fire
SND_LEVELBLIP	= $10 	; Text "type" sound / card select
SND_LEVELPOWER	= $20 	; Power up
SND_LEVEL1UP	= $40 	; 1-up
SND_LEVELPOOF	= $80 	; Lost suit / wand shot
SND_LEVELUNK	= $90	; Unknown / lost sound
SND_LEVELSHOE	= $A0	; Lost Kuirbo's Shoe
SND_LEVELTAILWAG= $B0	; Tail wag


; Queue Level sound effects 2
SND_LEVELCRUMBLE= $01	; Crumbling brick
SND_LEVELFLAME	= $02 	; Flame jet
SND_BOOMERANG	= $04 	; Boomerang
SND_LEVELAIRSHIP= $08	; Airship fly
SND_LEVELMARCH	= $10 	; Hammer Bros. march around
; $20 - Unused
; $40 - Unused
SND_LEVELSKID	= $80 	; Skid


; Queue music request 1
; The following I've grouped into "Set 1" (which play song index 0-7):
MUS1_PLAYERDEATH	= $01	; Player death
MUS1_GAMEOVER		= $02	; Game over
MUS1_BOSSVICTORY	= $04	; Victory normal
MUS1_WORLDVICTORY	= $08	; Victory super (King reverted, Bowser defeated, etc.)
MUS1_BOWSERFALL		= $10	; Bowser dramatic falling
MUS1_COURSECLEAR	= $20	; Course Clear
MUS1_TIMEWARNING	= $40	; Time Warning (attempts to speed up song playing)
MUS1_STOPMUSIC		= $80	; Stops playing any music


; Queue music request 2
; The following I've grouped into "Set 2A":
MUS2A_WORLD1		= $01	; World 1
MUS2A_WORLD2		= $02	; World 2
MUS2A_WORLD3		= $03	; World 3
MUS2A_WORLD4		= $04	; World 4
MUS2A_WORLD5		= $05	; World 5
MUS2A_WORLD6		= $06	; World 6
MUS2A_WORLD7		= $07	; World 7
MUS2A_WORLD8		= $08	; World 8
MUS2A_SKY		= $09	; Coin Heaven / Sky World / Warp Zone (World 9)
MUS2A_INVINCIBILITY	= $0A	; Invincibility
MUS2A_WARPWHISTLE	= $0B	; Warp whistle
MUS2A_MUSICBOX		= $0C	; Music box
MUS2A_THRONEROOM	= $0D	; King's room
MUS2A_BONUSGAME		= $0E	; Bonus game
MUS2A_ENDING		= $0F	; Ending music


; The following I've grouped into "Set 2B":
MUS2B_OVERWORLD		= $10	; Overworld 1
MUS2B_UNDERGROUND	= $20	; Underground
MUS2B_UNDERWATER	= $30	; Water
MUS2B_FORTRESS		= $40	; Fortress
MUS2B_BOSS		= $50	; Boss
MUS2B_AIRSHIP		= $60	; Airship
MUS2B_BATTLE		= $70	; Hammer Bros. battle
MUS2B_TOADHOUSE		= $80	; Toad House
MUS2B_ATHLETIC		= $90	; Overworld 2
MUS2B_PSWITCH		= $A0	; P-Switch
MUS2B_BOWSER		= $B0	; Bowser
MUS2B_WORLD8LETTER	= $C0	; Bowser's World 8 Letter
MUS2B_MASK		= $F0	; Not intended for use in code, readability/traceability only


; Queue map sound effects
SND_MAPENTERWORLD	= $01	; World begin starry entrance sound
SND_MAPPATHMOVE		= $02	; Path move
SND_MAPENTERLEVEL	= $04	; Enter level
SND_MAPINVENTORYFLIP	= $08	; Flip inventory
SND_MAPBONUSAPPEAR	= $10	; Bonus appears
; $20: ?? unused ?
; $40: ?? unused ?
SND_MAPDENY		= $80	; Denied


; Queue pause sound
PAUSE_STOPMUSIC		= $01	; Pause sound effect (like pressing START, pauses music!)
PAUSE_RESUMEMUSIC	= $02	; Resume sound (resumes music)


CHNGTILE_DELETECOIN	= $01
CHNGTILE_DELETETOBG	= $02
CHNGTILE_TOGNOTEBLOCK	= $03	; miscolored note block
CHNGTILE_TOBOUNCEWOOD	= $04
CHNGTILE_TONOTEBLOCK	= $05
CHNGTILE_COINHEAVEN	= $06
CHNGTILE_TOBRICK	= $07
CHNGTILE_TOMETALPLATE	= $08	; i.e. "plate" that appears after ? block is hit
CHNGTILE_PSWITCHSTOMP	= $09
CHNGTILE_TOBRICKCOIN	= $0B	; brick containing coin
CHNGTILE_DELETETOBGALT	= $0C
CHNGTILE_PIPEJCT	= $0E	; UNUSED replaces the unused TILE9_PIPEWORKS_JCT tile!
CHNGTILE_DELETEDONUT	= $0F
CHNGTILE_FROZENMUNCHER	= $10
CHNGTILE_FROZENCOIN	= $11
CHNGTILE_PSWITCHAPPEAR	= $12
CHNGTILE_DOORAPPEAR	= $13
CHNGTILE_TOADBOXOPEN	= $14
CHNGTILE_4WAYCANNON	= $15
CHNGTILE_GIANTBRICKBUST	= $16	; Giant World brick bust
CHNGTILE_GIANTBLOCKHIT	= $17	; Giant World [?] block hit to metal
CHNGTILE_GIANTBRICKFIX	= $18	; Giant World brick restore (small Mario hit giant brick)


; NOTE: Since Level_AScrlConfig checks are generally implemented as "BEQ/BNE", technically ANY
; value enables auto scroll adjustments, but officially ASCONFIG_ENABLE is used to enable it
ASCONFIG_ENABLE		= $01	; Enables auto scroll coordinate adjustments of any sort
ASCONFIG_HDISABLE	= $80	; Disables horizontal auto scroll coordinate adjustment (generally if Horz Auto Scroll is not in use)


; Objects_State
OBJSTATE_DEADEMPTY	= 0	; Dead/Empty
OBJSTATE_INIT		= 1	; Init
OBJSTATE_NORMAL		= 2	; Normal (typical operation)
OBJSTATE_SHELLED	= 3	; Shelled (shelled enemy post-stomp)
OBJSTATE_HELD		= 4	; Held (held by Player)
OBJSTATE_KICKED		= 5	; Kicked (kicked by Player / spinning shell)
OBJSTATE_KILLED		= 6	; Killed (flipped over and falling off screen)
OBJSTATE_SQUASHED	= 7	; Squashed (generally Goomba only)
OBJSTATE_POOFDEATH	= 8	; "Poof" Death (e.g. Piranha death)
