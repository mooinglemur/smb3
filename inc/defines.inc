; These are flags related to a video update stream value
VU_VERT         = $80 ; Update in vertical (+32B) mode instead of horizontal (+1B) mode
VU_REPEAT       = $40 ; Repeat following value several times instead of several raw values


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PPU I/O regs (CPU side)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PPU_CTL1:
; 0-1: Name table address, changes between the four name tables at $2000 (0), $2400 (1), $2800 (2) and $2C00 (3).
; 2: Clear, PPU incs by 1 ("horizontal"); Set, PPU incs by 32 ("vertical")
; 3: Which pattern table holds for sprites; 0 for PT1 ($0000) or 1 for PT2 ($1000)
; 4: Which pattern table holds for BG; 0 for PT1 ($0000) or 1 for PT2 ($1000)
; 5: Set to use 8x16 sprites instead of 8x8
; 7: Set to generate VBlank NMIs
PPU_CTL1        = $2000 ; Write only

; PPU_CTL2:
; 0: Clear for color, set for mono
; 1: Clear to clip 8 left pixels of BG
; 2: Clear to clip 8 left pixels of sprites
; 3: If clear, BG hidden
; 4: If clear, sprites hidden
; 5-7: BG color in mono mode, "color intensity" in color mode (??)
PPU_CTL2        = $2001 ; Write only

; PPU_STAT:
; 4: if set, can write to VRAM, else writes ignored
; 5: if set, sprite overflow occurred on scanline
; 6: Set if any non-transparent pixel of sprite 0 is overlapping a non-transparent pixel of BG
; 7: VBlank is occurring (cleared after read)
PPU_STAT        = $2002

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
PPU_SPR_ADDR    = $2003 ; Set address sprite data
PPU_SPR_DATA    = $2004 ; Read or write this sprite byte

PPU_SCROLL      = $2005 ; Scroll register; read PPU_STAT, then write horiz/vert scroll
PPU_VRAM_ADDR   = $2006 ; VRAM address (first write is high, next write is low)
PPU_VRAM_DATA   = $2007 ; Data to read/write at this address

; Note that all transparent colors ($3F04, $3F08, $3F0C, $3F10, $3F14, $3F18 and $3F1C) are mirrored from 3F00
PPU_BG_PAL      = $3F00 ; 3F00-3F0F
PPU_SPR_PAL     = $3F10 ; 3F10-3F1F


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SOUND I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; $4000(rct1)/$4004(rct2)/$400C(noise) bits
; ---------------------------------------
; 0-3   volume / envelope decay rate
; 4     envelope decay disable
; 5     length counter clock disable / envelope decay looping enable
; 6-7   duty cycle type (unused on noise channel)

; Duty cycles:
; 00 = a weak, grainy tone.  (12.5% Duty), 01 = a solid mid-strength tone. (25% Duty), 
; 10 = a strong, full tone (50% Duty), 11 = sounds a lot like 01 (25% Duty negated)

PAPU_CTL1       = $4000 ; pAPU Pulse 1 Control Register.
PAPU_CTL2       = $4004 ; pAPU Pulse 2 Control Register.
PAPU_NCTL1      = $400C ; pAPU Noise Control Register 1.


; $4008(tri) bits
; ---------------
; 0-6   linear counter load register
; 7     length counter clock disable / linear counter start
PAPU_TCR1       = $4008 ; pAPU Triangle Control Register 1.


; $4001(rct1)/$4005(rct2) bits
; --------------------------
; 0-2   right shift amount
; 3     decrease / increase (1/0) wavelength
; 4-6   sweep update rate
; 7     sweep enable
PAPU_RAMP1      = $4001 ; pAPU Pulse 1 Ramp Control Register.
PAPU_RAMP2      = $4005 ; pAPU Pulse 2 Ramp Control Register.


; $4002(rct1)/$4006(rct2)/$400A(Tri) bits
; -------------------------------------
; 0-7   8 LSB of wavelength
PAPU_FT1        = $4002 ; pAPU Pulse 1 Fine Tune (FT) Register.
PAPU_FT2        = $4006 ; pAPU Pulse 2 Fine Tune (FT) Register.
PAPU_TFREQ1     = $400A ; pAPU Triangle Frequency Register 1.


; $400E(noise) bits
; -----------------
; 0-3   playback sample rate
; 4-6   unused
; 7     random number type generation
PAPU_NFREQ1     = $400E ; pAPU Noise Frequency Register 1.

; $4003(rct1)/$4007(rct2)/$400B(tri)/$400F(noise) bits
; --------------------------------------------------
; 0-2   3 MS bits of wavelength (unused on noise channel) (the "high" frequency)
; 3-7   length of tone
PAPU_CT1        = $4003 ; pAPU Pulse 1 Coarse Tune (CT) Register.
PAPU_CT2        = $4007 ; pAPU Pulse 2 Coarse Tune (CT) Register.
PAPU_TFREQ2     = $400B ; pAPU Triangle Frequency Register 2.
PAPU_NFREQ2     = $400F ; pAPU Noise Frequency Register 2.


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
;       00 - play DMC sample until length counter reaches 0 (see $4013)
;       x1 - loop the DMC sample (x = immaterial)
;       10 - play DMC sample until length counter reaches 0, then generate a CPU 
PAPU_MODCTL     = $4010 ; pAPU Delta Modulation Control Register.

PAPU_MODDA      = $4011 ; pAPU Delta Modulation D/A Register.
PAPU_MODADDR    = $4012 ; pAPU Delta Modulation Address Register.
PAPU_MODLEN     = $4013 ; pAPU Delta Modulation Data Length Register.

; read
; ----
; 0     rectangle wave channel 1 length counter status
; 1     rectangle wave channel 2 length counter status
; 2     triangle wave channel length counter status
; 3     noise channel length counter status
; 4     DMC is currently enabled (playing a stream of samples)
; 5     unknown
; 6     frame IRQ status (active when set)
; 7     DMC's IRQ status (active when set)
; 
; write
; -----
; 0     rectangle wave channel 1 enable
; 1     rectangle wave channel 2 enable
; 2     triangle wave channel enable
; 3     noise channel enable
; 4     enable/disable DMC (1=start/continue playing a sample;0=stop playing)
; 5-7   unknown
PAPU_EN         = $4015 ; R/W pAPU Sound Enable


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OTHER I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPR_DMA         = $4014 ; Sprite DMA Register -- DMA from CPU memory at $100 x n to SPR-RAM (256 bytes)


; Read / Write Joypad 1/2:
;                   *  Bit 0 - Reads data from joypad or causes joypad strobe
;                      when writing.
;                   *  Bit 3 - Indicates whether Zapper is pointing at a sprite.
;                   *  Bit 4 - Cleared when Zapper trigger is released.
;                   Only bit 0 is involved in writing.
JOYPAD          = $4016

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
FRAMECTR_CTL    = $4017


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
MMC3_2K_TO_PPU_0000     = %01000000     ; 0
MMC3_2K_TO_PPU_0800     = %01000001     ; 1
MMC3_1K_TO_PPU_1000     = %01000010     ; 2
MMC3_1K_TO_PPU_1400     = %01000011     ; 3
MMC3_1K_TO_PPU_1800     = %01000100     ; 4
MMC3_1K_TO_PPU_1C00     = %01000101     ; 5
MMC3_8K_TO_PRG_C000     = %01000110     ; 6
MMC3_8K_TO_PRG_A000     = %01000111     ; 7
MMC3_PPU_XOR_1000       = %10000000


MMC3_COMMAND    = $8000 ; consult ref
MMC3_PAGE       = $8001 ; page number to MMC3_COMMAND
MMC3_MIRROR     = $A000 ; bit 0 clear is horizontal mirroring, bit 0 set is vertical mirroring
MMC3_SRAM_EN    = $A001 ; bit 7 set to enable SRAM at $6000-$7FFF
MMC3_IRQCNT     = $C000 ; Countdown to an IRQ
MMC3_IRQLATCH   = $C001 ; Store a temp val to be copied to MMC3_IRQCNT later
MMC3_IRQDISABLE = $E000 ; Disables IRQ generation and copies MMC3_IRQLATCH to MMC3_IRQCNT
MMC3_IRQENABLE  = $E001 ; Enables IRQ generation


PAD_A           = $80
PAD_B           = $40
PAD_SELECT      = $20
PAD_START       = $10
PAD_UP          = $08
PAD_DOWN        = $04
PAD_LEFT        = $02
PAD_RIGHT       = $01


PLAYERSUIT_SMALL        = 0
PLAYERSUIT_BIG          = 1
PLAYERSUIT_FIRE         = 2
PLAYERSUIT_RACCOON      = 3
PLAYERSUIT_FROG         = 4
PLAYERSUIT_TANOOKI      = 5
PLAYERSUIT_HAMMER       = 6
PLAYERSUIT_SUPERSUITBEGIN = PLAYERSUIT_FROG     ; Marker for when "Super Suits" begin
PLAYERSUIT_LAST         = PLAYERSUIT_HAMMER     ; Marker for "last" suit (Debug cycler needs it)


SPR_PAL0        = %00000000
SPR_PAL1        = %00000001
SPR_PAL2        = %00000010
SPR_PAL3        = %00000011
SPR_BEHINDBG    = %00100000
SPR_HFLIP       = %01000000
SPR_VFLIP       = %10000000


UPDATERASTER_32PIXPART  = 1     ; 32 pixel partition; common use is for levels with water along the bottom
UPDATERASTER_SPADEGAME  = 2     ; Spade game sliders
UPDATERASTER_WATERLINE  = 3     ; "Water line" mode (described at ObjHorzAutoScroller_Init)
UPDATERASTER_32PIXSHOWSPR= $80  ; If NOT set, hides sprites that fall beneath the partition (i.e. for fixed water effect)


; The "unused" ones are just guesses (where even possible) based on the
; semi-translated "greetings" for the sake of tracking...
BONUS_UNUSED_KEYCOIN    = 0
BONUS_SPADE             = 1     ; Line up images Spade game
BONUS_NSPADE            = 2     ; Card matching N-Spade game
BONUS_UNUSED_CCCC       = 3
BONUS_UNUSED_DDDD       = 4     ; Unused placeholder (I think), but does actually set something when it exits!
BONUS_UNUSED_ODDROULETTE= 5
BONUS_UNUSED_EVENCARD   = 6
BONUS_UNUSED_2RETURN    = 7     ; MAY have been Koopa Troopa's "Prize" Game...


; Queue Player sound effects
SND_PLAYERJUMP  = $01   ; Jump
SND_PLAYERBUMP  = $02   ; Bump
SND_PLAYERSWIM  = $04   ; Swim / Squish
SND_PLAYERKICK  = $08   ; Kick
SND_PLAYERPIPE  = $10   ; Pipe / shrink
SND_PLAYERFIRE  = $20   ; Fireball
SND_PLAYERPOWER = $40   ; Full power ringing (must be constantly set or you don't hear it)
SND_PLAYERFROG  = $80   ; frog hop


; Queue Level sound effects 1
SND_LEVELCOIN   = $01   ; Coin
SND_LEVELRISE   = $02   ; Powerup rising from block
SND_LEVELVINE   = $04   ; Vine rising
SND_LEVELBABOOM = $08   ; Cannon fire
SND_LEVELBLIP   = $10   ; Text "type" sound / card select
SND_LEVELPOWER  = $20   ; Power up
SND_LEVEL1UP    = $40   ; 1-up
SND_LEVELPOOF   = $80   ; Lost suit / wand shot
SND_LEVELUNK    = $90   ; Unknown / lost sound
SND_LEVELSHOE   = $A0   ; Lost Kuirbo's Shoe
SND_LEVELTAILWAG= $B0   ; Tail wag


; Queue Level sound effects 2
SND_LEVELCRUMBLE= $01   ; Crumbling brick
SND_LEVELFLAME  = $02   ; Flame jet
SND_BOOMERANG   = $04   ; Boomerang
SND_LEVELAIRSHIP= $08   ; Airship fly
SND_LEVELMARCH  = $10   ; Hammer Bros. march around
; $20 - Unused
; $40 - Unused
SND_LEVELSKID   = $80   ; Skid


; Queue music request 1
; The following I've grouped into "Set 1" (which play song index 0-7):
MUS1_PLAYERDEATH        = $01   ; Player death
MUS1_GAMEOVER           = $02   ; Game over
MUS1_BOSSVICTORY        = $04   ; Victory normal
MUS1_WORLDVICTORY       = $08   ; Victory super (King reverted, Bowser defeated, etc.)
MUS1_BOWSERFALL         = $10   ; Bowser dramatic falling
MUS1_COURSECLEAR        = $20   ; Course Clear
MUS1_TIMEWARNING        = $40   ; Time Warning (attempts to speed up song playing)
MUS1_STOPMUSIC          = $80   ; Stops playing any music


; Queue music request 2
; The following I've grouped into "Set 2A":
MUS2A_WORLD1            = $01   ; World 1
MUS2A_WORLD2            = $02   ; World 2
MUS2A_WORLD3            = $03   ; World 3
MUS2A_WORLD4            = $04   ; World 4
MUS2A_WORLD5            = $05   ; World 5
MUS2A_WORLD6            = $06   ; World 6
MUS2A_WORLD7            = $07   ; World 7
MUS2A_WORLD8            = $08   ; World 8
MUS2A_SKY               = $09   ; Coin Heaven / Sky World / Warp Zone (World 9)
MUS2A_INVINCIBILITY     = $0A   ; Invincibility
MUS2A_WARPWHISTLE       = $0B   ; Warp whistle
MUS2A_MUSICBOX          = $0C   ; Music box
MUS2A_THRONEROOM        = $0D   ; King's room
MUS2A_BONUSGAME         = $0E   ; Bonus game
MUS2A_ENDING            = $0F   ; Ending music


; The following I've grouped into "Set 2B":
MUS2B_OVERWORLD         = $10   ; Overworld 1
MUS2B_UNDERGROUND       = $20   ; Underground
MUS2B_UNDERWATER        = $30   ; Water
MUS2B_FORTRESS          = $40   ; Fortress
MUS2B_BOSS              = $50   ; Boss
MUS2B_AIRSHIP           = $60   ; Airship
MUS2B_BATTLE            = $70   ; Hammer Bros. battle
MUS2B_TOADHOUSE         = $80   ; Toad House
MUS2B_ATHLETIC          = $90   ; Overworld 2
MUS2B_PSWITCH           = $A0   ; P-Switch
MUS2B_BOWSER            = $B0   ; Bowser
MUS2B_WORLD8LETTER      = $C0   ; Bowser's World 8 Letter
MUS2B_MASK              = $F0   ; Not intended for use in code, readability/traceability only


; Queue map sound effects
SND_MAPENTERWORLD       = $01   ; World begin starry entrance sound
SND_MAPPATHMOVE         = $02   ; Path move
SND_MAPENTERLEVEL       = $04   ; Enter level
SND_MAPINVENTORYFLIP    = $08   ; Flip inventory
SND_MAPBONUSAPPEAR      = $10   ; Bonus appears
; $20: ?? unused ?
; $40: ?? unused ?
SND_MAPDENY             = $80   ; Denied


; Queue pause sound
PAUSE_STOPMUSIC         = $01   ; Pause sound effect (like pressing START, pauses music!)
PAUSE_RESUMEMUSIC       = $02   ; Resume sound (resumes music)


CHNGTILE_DELETECOIN     = $01
CHNGTILE_DELETETOBG     = $02
CHNGTILE_TOGNOTEBLOCK   = $03   ; miscolored note block
CHNGTILE_TOBOUNCEWOOD   = $04
CHNGTILE_TONOTEBLOCK    = $05
CHNGTILE_COINHEAVEN     = $06
CHNGTILE_TOBRICK        = $07
CHNGTILE_TOMETALPLATE   = $08   ; i.e. "plate" that appears after ? block is hit
CHNGTILE_PSWITCHSTOMP   = $09
CHNGTILE_TOBRICKCOIN    = $0B   ; brick containing coin
CHNGTILE_DELETETOBGALT  = $0C
CHNGTILE_PIPEJCT        = $0E   ; UNUSED replaces the unused TILE9_PIPEWORKS_JCT tile!
CHNGTILE_DELETEDONUT    = $0F
CHNGTILE_FROZENMUNCHER  = $10
CHNGTILE_FROZENCOIN     = $11
CHNGTILE_PSWITCHAPPEAR  = $12
CHNGTILE_DOORAPPEAR     = $13
CHNGTILE_TOADBOXOPEN    = $14
CHNGTILE_4WAYCANNON     = $15
CHNGTILE_GIANTBRICKBUST = $16   ; Giant World brick bust
CHNGTILE_GIANTBLOCKHIT  = $17   ; Giant World [?] block hit to metal
CHNGTILE_GIANTBRICKFIX  = $18   ; Giant World brick restore (small Mario hit giant brick)


; NOTE: Since Level_AScrlConfig checks are generally implemented as "BEQ/BNE", technically ANY
; value enables auto scroll adjustments, but officially ASCONFIG_ENABLE is used to enable it
ASCONFIG_ENABLE         = $01   ; Enables auto scroll coordinate adjustments of any sort
ASCONFIG_HDISABLE       = $80   ; Disables horizontal auto scroll coordinate adjustment (generally if Horz Auto Scroll is not in use)


; Objects_State
OBJSTATE_DEADEMPTY      = 0     ; Dead/Empty
OBJSTATE_INIT           = 1     ; Init
OBJSTATE_NORMAL         = 2     ; Normal (typical operation)
OBJSTATE_SHELLED        = 3     ; Shelled (shelled enemy post-stomp)
OBJSTATE_HELD           = 4     ; Held (held by Player)
OBJSTATE_KICKED         = 5     ; Kicked (kicked by Player / spinning shell)
OBJSTATE_KILLED         = 6     ; Killed (flipped over and falling off screen)
OBJSTATE_SQUASHED       = 7     ; Squashed (generally Goomba only)
OBJSTATE_POOFDEATH      = 8     ; "Poof" Death (e.g. Piranha death)


; 2P Vs Object IDs
VSOBJID_SPINY           = 0     ; Spiny
VSOBJID_SIDESTEPPER     = 2     ; Sidestepper
VSOBJID_FIGHTERFLY      = 3     ; Fighter Fly
VSOBJID_FIREBALL_HORZ   = 4     ; Horizontal Fireball that spawns to keep Players from hiding down at the bottom
VSOBJID_FIREBALL_ENDER  = 5     ; Game Ender Fireball (bounces around, attempts to kill Players who've stuck around too long!)
VSOBJID_FIREBALL_FOUNTAIN= 6    ; Fountain Fireball
VSOBJID_COIN            = 7     ; Coin (from [?] block)
VSOBJID_MUSHROOMCARD    = 8     ; Mushroom card
VSOBJID_FLOWERCARD      = 9     ; Flower card
VSOBJID_STARCARD        = 10    ; Star card
VSOBJID_KICKEDBLOCK     = 11    ; Kicked block (from [?] block match)


; "Cannon Fire" are sort of objects that exist to repeatedly fire off cannon balls
; or other such armaments.  They are created by

CFIRE_BULLETBILL        = $01   ; Bullet Bill cannon
CFIRE_MISSILEBILL       = $02   ; Missile Bill (homing Bullet Bill)
CFIRE_ROCKYWRENCH       = $03   ; (Re-)Creates Rocky Wrench on timer
CFIRE_4WAY              = $04   ; 4-way cannon
CFIRE_GOOMBAPIPE_L      = $05   ; Goomba pipe (left output)
CFIRE_GOOMBAPIPE_R      = $06   ; Goomba pipe (right output)
CFIRE_HLCANNON          = $07   ; Fires cannonballs horizontally left
CFIRE_HLBIGCANNON       = $08   ; Fires BIG cannonballs horizontally left
CFIRE_ULCANNON          = $09   ; Fires cannonballs diagonally, upper left
CFIRE_URCANNON          = $0A   ; Fires cannonballs diagonally, upper right
CFIRE_LLCANNON          = $0B   ; Fires cannonballs diagonally, lower left
CFIRE_LRCANNON          = $0C   ; Fires cannonballs diagonally, lower right
CFIRE_HLCANNON2         = $0D   ; ?? Same as CFIRE_HLCANNON?
CFIRE_ULCANNON2         = $0E   ; ?? Same as CFIRE_ULCANNON?
CFIRE_URCANNON2         = $0F   ; ?? Same as CFIRE_URCANNON?
CFIRE_LLCANNON2         = $10   ; ?? Same as CFIRE_LLCANNON?
CFIRE_HRCANNON          = $11   ; Fires cannonballs horizontally right
CFIRE_HRBIGCANNON       = $12   ; Fires BIG cannonballs horizontally right
CFIRE_LBOBOMBS          = $13   ; Launches fused Bob-ombs to the left
CFIRE_RBOBOMBS          = $14   ; Launches fused Bob-ombs to the right
CFIRE_LASER             = $15   ; Laser fire


CARD_MUSHROOM   = 0
CARD_FLOWER     = 1
CARD_STAR       = 2
CARD_1UP        = 3
CARD_10COIN     = 4
CARD_20COIN     = 5
CARD_WILD       = 8     ; UNUSED Wild card (can match any other!)


; Map_Objects_IDs: ID of all 8 map objects
MAPOBJ_EMPTY            = $00   ; None
MAPOBJ_HELP             = $01   ; HELP
MAPOBJ_AIRSHIP          = $02   ; Airship
MAPOBJ_HAMMERBRO        = $03   ; Hammer Bro
MAPOBJ_BOOMERANGBRO     = $04   ; Boomerang Bro
MAPOBJ_HEAVYBRO         = $05   ; Heavy Bro
MAPOBJ_FIREBRO          = $06   ; Fire Bro
MAPOBJ_W7PLANT          = $07   ; World 7 Plant
MAPOBJ_UNK08            = $08   ; Unknown marching glitch object
MAPOBJ_NSPADE           = $09   ; N-Spade
MAPOBJ_WHITETOADHOUSE   = $0A   ; White Toad House
MAPOBJ_COINSHIP         = $0B   ; Coin Ship
MAPOBJ_UNK0C            = $0C   ; Unknown white colorization of $0F (goes to World 7 level??)
MAPOBJ_BATTLESHIP       = $0D   ; World 8 Battleship
MAPOBJ_TANK             = $0E   ; World 8 Tank
MAPOBJ_W8AIRSHIP        = $0F   ; World 8 Airship
MAPOBJ_CANOE            = $10   ; Canoe

MAPOBJ_TOTALINIT        = $08   ; Total number of map objects initialized per world
MAPOBJ_TOTAL            = $0E   ; Total POSSIBLE map objects


        ; Special Object IDs:
SOBJ_HAMMER             = $01   ; Hammer Bro hammer
SOBJ_BOOMERANG          = $02   ; Boomerangs
SOBJ_UNKNOWN            = $03   ; ??? Floats around, back and forth, some other strange movements (uses bits of boomerang code)
SOBJ_NIPPERFIREBALL     = $04   ; Nipper fireball (falls)
SOBJ_PIRANHAFIREBALL    = $05   ; Piranha fireball
SOBJ_MICROGOOMBA        = $06   ; Micro goombas
SOBJ_SPIKEBALL          = $07   ; Spike's or Patooie's spike ball
SOBJ_WANDBLAST          = $08   ; Koopaling wand blast
SOBJ_KURIBOSHOE         = $09   ; Lost Kuribo shoe that "flies off" (NOTE: In Japanese original, this also featured super suits)
SOBJ_WRENCH             = $0A   ; Rocky's Wrench
SOBJ_CANNONBALL         = $0B   ; Cannonball
SOBJ_FIREBROFIREBALL    = $0C   ; Fire bro bouncing fireball
SOBJ_EXPLOSIONSTAR      = $0D   ; Explosion star
SOBJ_BUBBLE             = $0E   ; Bubble
SOBJ_LAVALOTUSFIRE      = $0F   ; Lava Lotus fire
SOBJ_RECOVEREDWAND      = $10   ; Recovered wand
SOBJ_POPPEDOUTCOIN      = $11   ; Popped out coin
SOBJ_FIRECHOMPFIRE      = $12   ; Fire Chomp's fire
SOBJ_BRICKDEBRIS        = $13   ; Brick debris (used for busting e.g. Piledriver Microgroomba, OR giant world brick busting)
SOBJ_BLOOPERKID         = $14   ; Blooper kid
SOBJ_LASER              = $15   ; Laser
SOBJ_POOF               = $16   ; Poof


; The objects are broken up into groups of 36 IDs across 5 ROM banks (1 - 5)
; These lookup table addresses are common, even though their banks are not,
; and so I define these constants for lack of a better solution:
ObjectGroup_InitJumpTable       = $A000
ObjectGroup_NormalJumpTable     = $A048
ObjectGroup_CollideJumpTable    = $A090
ObjectGroup_Attributes          = $A0D8
ObjectGroup_Attributes2         = $A0FC
ObjectGroup_Attributes3         = $A120
ObjectGroup_PatTableSel         = $A144
ObjectGroup_KillAction          = $A168
ObjectGroup_PatternStarts       = $A18C

ObjectGroup_PatternSets         = $A1B0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GAME CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Size of level (width or height, if vertical)
LEVEL1_SIZE_01          = %00000000
LEVEL1_SIZE_02          = %00000001
LEVEL1_SIZE_03          = %00000010
LEVEL1_SIZE_04          = %00000011
LEVEL1_SIZE_05          = %00000100
LEVEL1_SIZE_06          = %00000101
LEVEL1_SIZE_07          = %00000110
LEVEL1_SIZE_08          = %00000111
LEVEL1_SIZE_09          = %00001000
LEVEL1_SIZE_10          = %00001001
LEVEL1_SIZE_11          = %00001010
LEVEL1_SIZE_12          = %00001011
LEVEL1_SIZE_13          = %00001100
LEVEL1_SIZE_14          = %00001101
LEVEL1_SIZE_15          = %00001110
LEVEL1_SIZE_16          = %00001111

; Player Y Start positions (also selects appropriate starting vertical position)
LEVEL1_YSTART_170       = %00000000
LEVEL1_YSTART_040       = %00100000
LEVEL1_YSTART_000       = %01000000
LEVEL1_YSTART_140       = %01100000
LEVEL1_YSTART_070       = %10000000
LEVEL1_YSTART_0B0       = %10100000
LEVEL1_YSTART_0F0       = %11000000
LEVEL1_YSTART_180       = %11100000

LEVEL1_2PVS             = %00010000     ; Unknown purpose flag set on 2P Vs levels

; Palettes (full 16 colors in category) are defined by tileset; objects are rooted at index 8
; BG palette set
LEVEL2_BGPAL_00         = %00000000
LEVEL2_BGPAL_01         = %00000001
LEVEL2_BGPAL_02         = %00000010
LEVEL2_BGPAL_03         = %00000011
LEVEL2_BGPAL_04         = %00000100
LEVEL2_BGPAL_05         = %00000101
LEVEL2_BGPAL_06         = %00000110
LEVEL2_BGPAL_07         = %00000111

; Object palette set
LEVEL2_OBJPAL_08        = %00000000
LEVEL2_OBJPAL_09        = %00001000
LEVEL2_OBJPAL_10        = %00010000
LEVEL2_OBJPAL_11        = %00011000

; Player X Start positions
LEVEL2_XSTART_18        = %00000000
LEVEL2_XSTART_70        = %00100000
LEVEL2_XSTART_D8        = %01000000
LEVEL2_XSTART_80        = %01100000

; Sets "Level_UnusedFlag", which is apparently not used for anything
LEVEL2_UNUSEDFLAG       = %10000000


; Sets "Level_AltTileset", the tileset of the "alternate" level
LEVEL3_TILESET_00       = %00000000     ; Included for completeness, but not valid (for the world map only)
LEVEL3_TILESET_01       = %00000001
LEVEL3_TILESET_02       = %00000010
LEVEL3_TILESET_03       = %00000011
LEVEL3_TILESET_04       = %00000100
LEVEL3_TILESET_05       = %00000101
LEVEL3_TILESET_06       = %00000110
LEVEL3_TILESET_07       = %00000111
LEVEL3_TILESET_08       = %00001000
LEVEL3_TILESET_09       = %00001001
LEVEL3_TILESET_10       = %00001010
LEVEL3_TILESET_11       = %00001011
LEVEL3_TILESET_12       = %00001100
LEVEL3_TILESET_13       = %00001101
LEVEL3_TILESET_14       = %00001110
LEVEL3_TILESET_15       = %00001111     ; Included for completeness, but not valid (bonus game, can't jump in this way)

; Sets "Level_7Vertical", i.e. states object is a vertical oriented one
LEVEL3_VERTICAL         = %00010000


; Sets the vertical scroll lock
LEVEL3_VSCROLL_LOCKLOW  = %00000000     ; Screen locked at $EF (lowest point) unless flying or climbing a vine
LEVEL3_VSCROLL_FREE     = %00100000     ; Free vertical scroll
LEVEL3_VSCROLL_LOCKED   = %01000000     ; Locks either high (0) or low ($EF) depending on value of Vert_Scroll

; Sets Level_PipeNotExit
LEVEL3_PIPENOTEXIT      = %10000000


; BG pattern bank index
;LEVEL4_BGBANK_INDEX     .func (\1 & %00011111)

; Level initial action
LEVEL4_INITACT_NOTHING  = %00000000     ; Do nothing
LEVEL4_INITACT_SLIDE    = %00100000     ; Start level sliding (if able by power-up)
LEVEL4_INITACT_PIPE_T   = %01000000     ; Start by exiting top of pipe
LEVEL4_INITACT_PIPE_B   = %01100000     ; Start by exiting bottom of pipe
LEVEL4_INITACT_PIPE_R   = %10000000     ; Start by exiting right of pipe
LEVEL4_INITACT_PIPE_L   = %10100000     ; Start by exiting left of pipe
LEVEL4_INITACT_AIRSHIP  = %11000000     ; Airship intro run & jump init
LEVEL4_INITACT_AIRSHIPB = %11100000     ; Boarding the Airship

; Select "Music 2" set BGM (from table GamePlay_BGM)
LEVEL5_BGM_OVERWORLD    = %00000000
LEVEL5_BGM_UNDERGROUND  = %00000001
LEVEL5_BGM_UNDERWATER   = %00000010
LEVEL5_BGM_FORTRESS     = %00000011
LEVEL5_BGM_BOSS         = %00000100
LEVEL5_BGM_AIRSHIP      = %00000101
LEVEL5_BGM_BATTLE       = %00000110
LEVEL5_BGM_TOADHOUSE    = %00000111
LEVEL5_BGM_ATHLETIC     = %00001000
LEVEL5_BGM_THRONEROOM   = %00001001
LEVEL5_BGM_SKY          = %00001010

; Bits 4-5 are free apparently

; Set starting clock time
LEVEL5_TIME_300         = %00000000     ; Clock at 300
LEVEL5_TIME_400         = %01000000     ; Clock at 400
LEVEL5_TIME_200         = %10000000     ; Clock at 200
LEVEL5_TIME_UNLIMITED   = %11000000     ; Clock at 000, unlimited


; Special values that go into the Collide Jump Table
OCSPECIAL_HIGHSCORE     = $0400         ; Stomp-killing this enemy gives you 1000 pts instead of 100 pts base score
OCSPECIAL_KILLCHANGETO  = $0800         ; When enemy is killed, it changes to the object ID in the lower 8 bits (requires OA3_DIESHELLED)

; Object Attributes Set 1 Flags

OA1_PAL0                = %00000000     ; Object uses sprite palette 0
OA1_PAL1                = %00000001     ; Object uses sprite palette 1
OA1_PAL2                = %00000010     ; Object uses sprite palette 2
OA1_PAL3                = %00000011     ; Object uses sprite palette 3
OA1_PALMASK             = %00000011     ; Not intended for use in attribute table, readability/traceability only

; NOTE: The width and heights here are for sprite visibility testing
; For the object's bounding box, see OAT_BOUNDBOXxx

OA1_HEIGHT16            = %00000000     ; Object is 16 pixels tall
OA1_HEIGHT32            = %00000100     ; Object is 32 pixels tall
OA1_HEIGHT48            = %00001000     ; Object is 48 pixels tall
OA1_HEIGHT64            = %00001100     ; Object is 64 pixels tall
OA1_HEIGHTMASK          = %00001100     ; Not intended for use in attribute table, readability/traceability only

OA1_WIDTH8              = %00000000     ; Object is 8 pixels wide
OA1_WIDTH16             = %00010000     ; Object is 16 pixels wide
OA1_WIDTH24             = %00100000     ; Object is 24 pixels wide
OA1_WIDTH32             = %00110000     ; Object is 32 pixels wide
OA1_WIDTH40             = %01000000     ; Object is 40 pixels wide
OA1_WIDTH48             = %01010000     ; Object is 48 pixels wide
OA1_WIDTHMASK           = %01110000     ; Not intended for use in attribute table, readability/traceability only


; Object Attributes Set 2 Flags

OA2_NOSHELLORSQUASH     = %00000001     ; Enemy does not go into shell (state 3) or squash (state 7) states when stomped on
OA2_GNDPLAYERMOD        = %00000010     ; "Grounded Player Mod"; Subtly modifies Player detection response; see comments in PRG000_D205
OA2_STOMPDONTCARE       = %00000100     ; Object "doesn't care" about being stomped (indifferent, not same as OA3_NOTSTOMPABLE)
OA2_USE16BITX           = %00001000     ; When applying X velocity, calculate "X Hi" position (applies to vertical levels only; if not set, Object_XHi will be fixed at zero)


; This selects what X/Y offsets are used by an object to detect a tile
; For tile detection groups, see Object_TileDetectOffsets in PRG000
OA2_TDOGRP0             = %00000000     ; Use "Group 0" tile detection offsets
OA2_TDOGRP1             = %00010000     ; Use "Group 1" tile detection offsets
OA2_TDOGRP2             = %00100000     ; Use "Group 2" tile detection offsets
OA2_TDOGRP3             = %00110000     ; Use "Group 3" tile detection offsets
OA2_TDOGRP4             = %01000000     ; Use "Group 4" tile detection offsets
OA2_TDOGRP5             = %01010000     ; Use "Group 5" tile detection offsets
OA2_TDOGRP6             = %01100000     ; Use "Group 6" tile detection offsets
OA2_TDOGRP7             = %01110000     ; Use "Group 7" tile detection offsets
OA2_TDOGRP8             = %10000000     ; Use "Group 8" tile detection offsets
OA2_TDOGRP9             = %10010000     ; Use "Group 9" tile detection offsets
OA2_TDOGRP10            = %10100000     ; Use "Group 10" tile detection offsets
OA2_TDOGRP11            = %10110000     ; Use "Group 11" tile detection offsets
OA2_TDOGRP12            = %11000000     ; Use "Group 12" tile detection offsets
OA2_TDOGRPMASK          = %11110000     ; Not intended for use in attribute table, readability/traceability only

; Object Attributes Set 3 Flags

; This selects what action should occur with the object when gameplay is halted (e.g. Player died)
;
; TIP: The most commonly used one is OA3_HALT_NORMALONLY, which means to continue executing the
;      object's "Normal" state if the object is in state 2, otherwise not do anything at all.
;      This does not mean that the other states will be ignored (i.e. object in shell state will
;      continue to use the built-in shell type drawing code) but no handling is performed.
;
;      Typically then the "Normal" state will have some kind of code to deal with halted gameplay,
;      e.g. calling its own draw routine.  The fact that there are enemy specific "special" halts
;      is ugly and hackish, and I fully recommend using OA3_HALT_NORMALONLY and handle gameplay
;      halts in the "Normal" state standard subroutine instead as much as possible.
OA3_HALT_HOTFOOTSPECIAL = %00000000     ; 0: Bank2/Hotfoot ONLY
OA3_HALT_JUSTDRAW       = %00000001     ; 1: Standard draw
OA3_HALT_JUSTDRAWTALL   = %00000010     ; 2: Draw tall 16x32 sprite
OA3_HALT_SPIKESPECIAL   = %00000011     ; 3: Bank2/Spike ONLY
OA3_HALT_DONOTHING      = %00000100     ; 4: Do nothing
OA3_HALT_NORMALONLY     = %00000101     ; 5: If object is in "normal" state, do its normal routine, otherwise do nothing (COMMON)
OA3_HALT_JUSTDRAWWIDE   = %00000110     ; 6: Draw wide 48x16 sprite
OA3_HALT_DONOTHING2     = %00000111     ; 7: Do nothing
OA3_HALT_KURIBOSPECIAL  = %00001000     ; 8: Bank2/Kuribo's Shoe ONLY
OA3_HALT_DONOTHING3     = %00001001     ; 9: Do nothing
OA3_HALT_JUSTDRAWMIRROR = %00001010     ; 10: Draw mirrored 16x16 sprite
OA3_HALT_ENDCARDSPECIAL = %00001011     ; 11: Bank2/End Level Card ONLY
OA3_HALT_DONOTHING4     = %00001100     ; 12: Do nothing
OA3_HALT_BUSTERSPECIAL  = %00001101     ; 13: Bank2/Buster Beatle ONLY
OA3_HALT_PIRANHASPECIAL = %00001110     ; 14: Bank2/Piranha Spike Ball ONLY
OA3_HALT_MASK           = %00001111     ; Not intended for use in attribute table, readability/traceability only

OA3_SQUASH              = %00010000     ; Enemy should "squash" (state 7) not "shell" (state 3), or "killed" (state 6) in case of statue/Kuribo's shoe stomp; requires OA2_NOTSHELLED to be NOT SET
OA3_NOTSTOMPABLE        = %00100000     ; If the Player tries to stomp this enemy, he will be HURT!  (E.g. Spikey enemy)
OA3_DIESHELLED          = %01000000     ; The CollideJumpTable entry MAY contain the "special" entry; see CollideJumpTable; also "dies" into "shell" (state 3) (i.e. object "bumps" into shell when hit from beneath)
OA3_TAILATKIMMUNE       = %10000000     ; Object cannot be Raccoon tail attacked


; Object Attribute Common Flags

; Selects a bounding box from Object_BoundBox
OAT_BOUNDBOX00          = %00000000
OAT_BOUNDBOX01          = %00000001
OAT_BOUNDBOX02          = %00000010
OAT_BOUNDBOX03          = %00000011
OAT_BOUNDBOX04          = %00000100
OAT_BOUNDBOX05          = %00000101
OAT_BOUNDBOX06          = %00000110
OAT_BOUNDBOX07          = %00000111
OAT_BOUNDBOX08          = %00001000
OAT_BOUNDBOX09          = %00001001
OAT_BOUNDBOX10          = %00001010
OAT_BOUNDBOX11          = %00001011
OAT_BOUNDBOX12          = %00001100
OAT_BOUNDBOX13          = %00001101
OAT_BOUNDBOX14          = %00001110
OAT_BOUNDBOX15          = %00001111
OAT_BOUNDBOXMASK        = %00001111     ; Not intended for use in attribute table, readability/traceability only

OAT_BOUNCEOFFOTHERS     = %00010000     ; Turn away from other enemies if their paths collide
OAT_WEAPONIMMUNITY      = %00100000     ; Object is immune to Player's weapon (i.e. fireballs/hammers)
OAT_FIREIMMUNITY        = %01000000     ; Object is immune to Player's fireballs
OAT_HITNOTKILL          = %10000000     ; Object will run collision routine instead of standard "Kick"-sound/100 points/OBJSTATE_KILLED [i.e. object not killed by being rammed with held object]


; Flags for the ObjectGroup_PatTableSel table
OPTS_NOCHANGE           = 0             ; Don't set a pattern table
OPTS_SETPT5             = $00           ; Set pattern table bank 5
OPTS_SETPT6             = $80           ; Set pattern table bank 6

; Determines what action is taken when object is in "Killed" state (6)
; See Object_DoKillAction for the jump table
; NOTE: Any action type other than zero always sets the frame to 2 (unless object is not general purpose, i.e. index >= 5)
KILLACT_STANDARD        = 0     ; 0: Standard kill (does not set frame 2)
KILLACT_JUSTDRAW16X16   = 1     ; 1: Standard sprite draw and kill
KILLACT_JUSTDRAWMIRROR  = 2     ; 2: Draw mirrored sprite
KILLACT_JUSTDRAW16X32   = 3     ; 3: Draw tall sprite
KILLACT_JUSTDRAWTALLFLIP= 4     ; 4: Draw tall object horizontally flipped
KILLACT_NORMALANDKILLED = 5     ; 5: Do "Normal" state and killed action (sinking/vert flip)
KILLACT_GIANTKILLED     = 6     ; 6: Giant enemy death
KILLACT_POOFDEATH       = 7     ; 7: Do "poof" dying state while killed
KILLACT_DRAWMOVENOHALT  = 8     ; 8: Draw and do movements unless gameplay halted
KILLACT_NORMALSTATE     = 9     ; 9: Just do "Normal" state while killed

; Object IDs

OBJ_BOUNCEDOWNUP        = $06   ; Down/up block bounce effect object
OBJ_WARPHIDE            = $07   ; Hidden object that jumps you to the secret warp whistle in 1-3
OBJ_PSWITCHDOOR         = $08   ; Door that appears under influence of P-Switch
OBJ_AIRSHIPANCHOR       = $09   ; Airship anchor
OBJ_POWERUP_1UP         = $0B   ; 1-Up Mushroom
OBJ_POWERUP_STARMAN     = $0C   ; Starman (primarily, but also the super suits -- Tanooki, Frog, Hammer)
OBJ_POWERUP_MUSHROOM    = $0D   ; Super Mushroom
OBJ_BOSS_KOOPALING      = $0E   ; Koopaling (as appropriate to current world)
OBJ_SPINYCHEEP          = $17   ; Spiny cheep
OBJ_BOSS_BOWSER         = $18   ; King Bowser
OBJ_POWERUP_FIREFLOWER  = $19   ; Fire flower
OBJ_BOUNCELEFTRIGHT     = $1B   ; Left/right block bounce effect object
OBJ_POWERUP_SUPERLEAF   = $1E   ; Falling super leaf
OBJ_GROWINGVINE         = $1F   ; Growing vine
OBJ_POWERUP_MUSHCARD    = $21   ; Free mushroom card ????
OBJ_POWERUP_FIRECARD    = $22   ; Free flower card ????
OBJ_POWERUP_STARCARD    = $23   ; Free star card ????
OBJ_CLOUDPLATFORM_FAST  = $24   ; Fast cloud platform
OBJ_PIPEWAYCONTROLLER   = $25   ; "Pipe Way" Controller (World Map pipe-to-pipe location setter)
OBJ_WOODENPLAT_RIDER    = $26   ; Log that rides you to the right after stepping on it
OBJ_OSCILLATING_H       = $27   ; Horizontal oscillating log platform
OBJ_OSCILLATING_V       = $28   ; Vertical Oscillating log platform
OBJ_SPIKE               = $29   ; Spike (the spike ball barfer)
OBJ_PATOOIE             = $2A   ; Patooie
OBJ_GOOMBAINSHOE        = $2B   ; Goomba in Kuribo's Shoe (yes, I know Kuribo = Goomba, quiet)
OBJ_CLOUDPLATFORM       = $2C   ; Cloud platform
OBJ_BIGBERTHA           = $2D   ; Big Bertha that eats you
OBJ_INVISIBLELIFT       = $2E   ; Invisible (until touched) lift that goes up to fixed position of Y/Hi = 64
OBJ_BOO                 = $2F   ; Boo Diddly
OBJ_HOTFOOT_SHY         = $30   ; Hot Foot (returns to flame if looked at)
OBJ_BOOSTRETCH          = $31   ; "Stretch" Boo, upright
OBJ_BOOSTRETCH_FLIP     = $32   ; "Stretch" Boo, upside-down
OBJ_NIPPER              = $33   ; Stationary nipper plant
OBJ_TOAD                = $34   ; Toad and his house message
OBJ_TOADHOUSEITEM       = $35   ; Item that pops out of a treasure box in a Toad House
OBJ_WOODENPLATFORM      = $36   ; Floating wooden platform
OBJ_OSCILLATING_HS      = $37   ; left/right short-oscillation log
OBJ_OSCILLATING_VS      = $38   ; Up/down short-oscillation log
OBJ_NIPPERHOPPING       = $39   ; Hopping nipper plant
OBJ_FALLINGPLATFORM     = $3A   ; Falling donut lift type platform
OBJ_CHARGINGCHEEPCHEEP  = $3B   ; Charging, hopping cheep cheep
OBJ_WOODENPLATFORMFALL  = $3C   ; Falling wooden platform
OBJ_NIPPERFIREBREATHER  = $3D   ; Fire belching nipper plant
OBJ_WOODENPLATFORMFLOAT = $3E   ; Floating (on water) log
OBJ_DRYBONES            = $3F   ; Dry Bones
OBJ_BUSTERBEATLE        = $40   ; Buster Beatle
OBJ_ENDLEVELCARD        = $41   ; End-of-level card
OBJ_CHEEPCHEEPPOOL2POOL = $42   ; Pool-to-pool-to-pool hopping cheep cheep
OBJ_CHEEPCHEEPPOOL2POOL2= $43   ; Pool-to-pool hopping cheep cheep
OBJ_WOODENPLATUNSTABLE  = $44   ; Fall-after-touch log platform
OBJ_HOTFOOT             = $45   ; Hot Foot (randomly walks and stops, doesn't care if you stare)
OBJ_PIRANHASPIKEBALL    = $46   ; Tall plant carrying spike ball
OBJ_GIANTBLOCKCTL       = $47   ; Enables Giant World blocks to function
OBJ_TINYCHEEPCHEEP      = $48   ; Tiny cheep cheep
OBJ_FLOATINGBGCLOUD     = $49   ; Floating background cloud
OBJ_BOOMBOOMQBALL       = $4A   ; Boom Boom (?) end-level ball
OBJ_BOOMBOOMJUMP        = $4B   ; Jumping Boom-Boom (can actually hit ? blocks!)
OBJ_BOOMBOOMFLY         = $4C   ; Flying Boom-boom
OBJ_CHAINCHOMPFREE      = $4F   ; Jumping chain chomp head after he breaks free
OBJ_BOBOMBEXPLODE       = $50   ; Ready-to-explode Bob-Omb
OBJ_ROTODISCDUAL        = $51   ; Dual Rotodisc, sync, clockwise
OBJ_TREASUREBOX         = $52   ; Treasure box
OBJ_PODOBOOCEILING      = $53   ; Podoboo from ceiling
OBJ_DONUTLIFTSHAKEFALL  = $54   ; Donut lift shake and fall object
OBJ_BOBOMB              = $55   ; Bob-Omb
OBJ_PIRANHASIDEWAYSLEFT = $56   ; Sideways left-facing red piranha
OBJ_PIRANHASIDEWAYSRIGHT= $57   ; Sideways right-facing red piranha
OBJ_FIRECHOMP           = $58   ; Fire chomp
OBJ_FIRESNAKE           = $59   ; Fire snake
OBJ_ROTODISCCLOCKWISE   = $5A   ; Standard Rotodisc clockwise
OBJ_ROTODISCCCLOCKWISE  = $5B   ; Standard Rotodisc counter-clockwise
OBJ_ICEBLOCK            = $5C   ; Iceblock as held by Mario or Buster Beatle
OBJ_TORNADO             = $5D   ; Tornado
OBJ_ROTODISCDUALOPPOSE  = $5E   ; Dual Rotodisc, opposites, horizontal meeting
OBJ_ROTODISCDUALOPPOSE2 = $5F   ; Dual Rotodisc, opposites, vertical meeting
OBJ_ROTODISCDUALCCLOCK  = $60   ; Dual Rotodisc, sync, counter-clockwise
OBJ_BLOOPERWITHKIDS     = $61   ; Blooper w/ kids
OBJ_BLOOPER             = $62   ; Blooper
OBJ_BIGBERTHABIRTHER    = $63   ; Big Bertha with spit-out child
OBJ_CHEEPCHEEPHOPPER    = $64   ; Cheep Cheep water hopper
OBJ_WATERCURRENTUPWARD  = $65   ; upward current
OBJ_WATERCURRENTDOWNARD = $66   ; Downward current
OBJ_LAVALOTUS           = $67   ; Underwater lava plant
OBJ_TWIRLINGBUZZY       = $68   ; Twirling, upside down buzzy beatle
OBJ_TWIRLINGSPINY       = $69   ; Twirling, upside down spiny
OBJ_BLOOPERCHILDSHOOT   = $6A   ; Blooper (shoots off children)
OBJ_PILEDRIVER          = $6B   ; Pile driver micro goomba
OBJ_GREENTROOPA         = $6C   ; green koopa troopa
OBJ_REDTROOPA           = $6D   ; red koopa troopa
OBJ_PARATROOPAGREENHOP  = $6E   ; Hopping green paratroopa
OBJ_FLYINGREDPARATROOPA = $6F   ; Flying up/down red winged turtle
OBJ_BUZZYBEATLE         = $70   ; Buzzy beatle
OBJ_SPINY               = $71   ; Spiny
OBJ_GOOMBA              = $72   ; Regular goomba
OBJ_PARAGOOMBA          = $73   ; Hopping red flying goomba
OBJ_PARAGOOMBAWITHMICROS= $74   ; Micro goomba dropping flying goomba
OBJ_BOSSATTACK          = $75   ; Lemmy's ball, Wendy's ring, Bowser's fireball, depends
OBJ_JUMPINGCHEEPCHEEP   = $76   ; Jumping Cheep Cheep
OBJ_GREENCHEEP          = $77   ; Green Cheep Cheep
OBJ_BULLETBILL          = $78   ; Regular Bullet bill
OBJ_BULLETBILLHOMING    = $79   ; Homing Bullet Bill
OBJ_BIGGREENTROOPA      = $7A   ; Big Green Turtle
OBJ_BIGREDTROOPA        = $7B   ; Big Red Turtle
OBJ_BIGGOOMBA           = $7C   ; Big Goomba
OBJ_BIGGREENPIRANHA     = $7D   ; Big Green Piranha
OBJ_BIGGREENHOPPER      = $7E   ; Big, bouncing turtle
OBJ_BIGREDPIRANHA       = $7F   ; Big Red Pirahana
OBJ_FLYINGGREENPARATROOPA=$80   ; Flying left/right green winged turtle
OBJ_HAMMERBRO           = $81   ; Classic Hammer Brother
OBJ_BOOMERANGBRO        = $82   ; Boomerang Brother
OBJ_LAKITU              = $83   ; Lakitu throwing red spiny eggs
OBJ_SPINYEGG            = $84   ; Working red spiny egg
OBJ_SPINYEGGDUD         = $85   ; Rolling "dud" spiny egg
OBJ_HEAVYBRO            = $86   ; Heavy brother
OBJ_FIREBRO             = $87   ; Fire Brother
OBJ_ORANGECHEEP         = $88   ; "Lost" orange cheep cheep
OBJ_CHAINCHOMP          = $89   ; Chain chomp
OBJ_THWOMP              = $8A   ; Standard Thwomp
OBJ_THWOMPLEFTSLIDE     = $8B   ; Left sliding Thwomp
OBJ_THWOMPRIGHTSLIDE    = $8C   ; Right sliding Thwomp
OBJ_THWOMPUPDOWN        = $8D   ; Up-down sliding Thwomp
OBJ_THWOMPDIAGONALUL    = $8E   ; Diagonal up-left Thwomp
OBJ_THWOMPDIAGONALDL    = $8F   ; Diagonal down-left Thwomp
OBJ_TILTINGPLATFORM     = $90   ; Tilting platform
OBJ_TWIRLINGPLATCWNS    = $91   ; Twirling platform, clockwise, non-stop
OBJ_TWIRLINGPLATCW      = $92   ; Twirling platform, clockwise
OBJ_TWIRLINGPERIODIC    = $93   ; Twirling platform, periodic
OBJ_BIGQBLOCK_3UP       = $94   ; Big ? block (3 1-ups)
OBJ_BIGQBLOCK_MUSHROOM  = $95   ; Big ? block (biggie)
OBJ_BIGQBLOCK_FIREFLOWER= $96   ; Big ? block (-flashing??- fireflower)
OBJ_BIGQBLOCK_SUPERLEAF = $97   ; Big ? block (-green??- leaf)
OBJ_BIGQBLOCK_TANOOKI   = $98   ; Big ? block (tanooki)
OBJ_BIGQBLOCK_FROG      = $99   ; Big ? block (frog suit)
OBJ_BIGQBLOCK_HAMMER    = $9A   ; Big ? block (hammer suit)
OBJ_FIREJET_UPWARD      = $9D   ; upward fire jet
OBJ_PODOBOO             = $9E   ; Podoboo
OBJ_PARABEETLE          = $9F   ; Parabeetle
OBJ_GREENPIRANHA        = $A0   ; short pipe muncher
OBJ_GREENPIRANHA_FLIPPED= $A1   ; upside down short pipe muncher
OBJ_REDPIRANHA          = $A2   ; tall pipe muncher
OBJ_REDPIRANHA_FLIPPED  = $A3   ; upside down tall pipe muncher
OBJ_GREENPIRANHA_FIRE   = $A4   ; short green fire plant
OBJ_GREENPIRANHA_FIREC  = $A5   ; short, upside down, green fire plant
OBJ_VENUSFIRETRAP       = $A6   ; Tall red fire plant
OBJ_VENUSFIRETRAP_CEIL  = $A7   ; upside down tall fire plant
OBJ_ARROWONE            = $A8   ; One direction arrow platform in motion
OBJ_ARROWANY            = $A9   ; Changeable direction arrow platform in motion
OBJ_AIRSHIPPROP         = $AA   ; Airship Propellar
OBJ_FIREJET_LEFT        = $AC   ; Left fire jet
OBJ_ROCKYWRENCH         = $AD   ; Rocky wrench (red)
OBJ_BOLTLIFT            = $AE   ; Bolt
OBJ_ENEMYSUN            = $AF   ; Enemy sun
OBJ_BIGCANNONBALL       = $B0   ; BIG cannon ball
OBJ_FIREJET_RIGHT       = $B1   ; right fire jet
OBJ_FIREJET_UPSIDEDOWN  = $B2   ; upside down fire jet

; NOTE: Starting here, all object IDs are now handled specially (see PRG005_B8DB or just before PRG005_BB5F)
OBJ_CHEEPCHEEPBEGIN     = $B4   ; (Level_Event = 1) Begins swarm of cheep cheeps
OBJ_GREENCHEEPBEGIN     = $B5   ; (Level_Event = 2) Begins Spike Cheeps floating by
OBJ_LAKITUFLEE          = $B6   ; (Level_Event = 3) Causes active Lakitu to flee
OBJ_PARABEETLESBEGIN    = $B7   ; (Level_Event = 4) Begins Green and red parabeetles flyby
OBJ_CLOUDSINBGBEGIN     = $B8   ; (Level_Event = 5) Begins floating clouds in background 
OBJ_WOODPLATFORMBEGIN   = $B9   ; (Level_Event = 6) Begins random wooden platforms 
OBJ_TREASUREBOXAPPEAR   = $BA   ; (Level_Event = 7) Causes treasure box to appear
OBJ_CANCELEVENT         = $BB   ; (Level_Event = 8) Cancels Level_Event (sets to zero)

; Objects $BC to $D0 create Cannon Fires
OBJ_CFIRE_BULLETBILL    = $BC + CFIRE_BULLETBILL - 1    ; Bullet Bill cannon
OBJ_CFIRE_MISSILEBILL   = $BC + CFIRE_MISSILEBILL - 1   ; Missile Bill (homing BUllet Bill)
OBJ_CFIRE_ROCKYWRENCH   = $BC + CFIRE_ROCKYWRENCH - 1   ; Creates Rocky Wrench (um why?)
OBJ_CFIRE_4WAY          = $BC + CFIRE_4WAY - 1          ; 4-way cannon
OBJ_CFIRE_GOOMBAPIPE_L  = $BC + CFIRE_GOOMBAPIPE_L - 1  ; Goomba pipe (left output)
OBJ_CFIRE_GOOMBAPIPE_R  = $BC + CFIRE_GOOMBAPIPE_R - 1  ; Goomba pipe (right output)
OBJ_CFIRE_HLCANNON      = $BC + CFIRE_HLCANNON - 1      ; Fires cannonballs horizontally left
OBJ_CFIRE_HLBIGCANNON   = $BC + CFIRE_HLBIGCANNON - 1   ; Fires BIG cannonballs horizontally left
OBJ_CFIRE_ULCANNON      = $BC + CFIRE_ULCANNON - 1      ; Fires cannonballs diagonally, upper left
OBJ_CFIRE_URCANNON      = $BC + CFIRE_URCANNON - 1      ; Fires cannonballs diagonally, upper right
OBJ_CFIRE_LLCANNON      = $BC + CFIRE_LLCANNON - 1      ; Fires cannonballs diagonally, lower left
OBJ_CFIRE_LRCANNON      = $BC + CFIRE_LRCANNON - 1      ; Fires cannonballs diagonally, lower right
OBJ_CFIRE_HLCANNON2     = $BC + CFIRE_HLCANNON2 - 1     ; Fires cannonballs horizontally left
OBJ_CFIRE_ULCANNON2     = $BC + CFIRE_ULCANNON2 - 1     ; Fires cannonballs diagonally, upper left
OBJ_CFIRE_URCANNON2     = $BC + CFIRE_URCANNON2 - 1     ; Fires cannonballs diagonally, upper right
OBJ_CFIRE_LLCANNON2     = $BC + CFIRE_LLCANNON2 - 1     ; Fires cannonballs diagonally, lower left
OBJ_CFIRE_HRCANNON      = $BC + CFIRE_HRCANNON - 1      ; Fires cannonballs horizontally right
OBJ_CFIRE_HRBIGCANNON   = $BC + CFIRE_HRBIGCANNON - 1   ; Fires BIG cannonballs horizontally right
OBJ_CFIRE_LBOBOMBS      = $BC + CFIRE_LBOBOMBS - 1      ; Launches fused Bob-ombs to the left
OBJ_CFIRE_RBOBOMBS      = $BC + CFIRE_RBOBOMBS - 1      ; Launches fused Bob-ombs to the right
OBJ_CFIRE_LASER         = $BC + CFIRE_LASER - 1         ; Laser fire

; Objects in $D1+ appear to trigger special events
OBJ_SPAWN3GREENTROOPAS  = $D1   ; Spawns up to 3 (depending on available slots) hopping green paratroops
OBJ_SPAWN3ORANGECHEEPS  = $D2   ; Spawns up to 3 (depending on available slots) "lost" orange cheep cheeps (a school)
OBJ_AUTOSCROLL          = $D3   ; Activates auto scrolling for e.g. World 1-4, World 8 Tank, etc.
OBJ_BONUSCONTROLLER     = $D4   ; Handles the judgement of whether you get a White Toad House / Coin Ship
OBJ_TOADANDKING         = $D5   ; Toad and the king from the end of the world
OBJ_TREASURESET         = $D6   ; Sets the treasure box item (Level_TreasureItem) based on what row this object is placed at

; Miscellaneous Player frames
PF_KICK_SMALL           = $42   ; Foot out kick when small
PF_KICK_BIG             = $2D   ; Foot out kick when big
PF_DIE                  = $4B   ; Dying
PF_MIDGROW_SMALL        = $0B   ; When going from small to big, "Mid-grow" showing small
PF_MIDGROW_HALFWAY      = $27   ; When going from small to big, "Mid-grow" showing something in between
PF_SKID_SMALL           = $41   ; Skidding while small
PF_SKID_BIG             = $30   ; Skidding while not small
PF_SLIDE_SMALL          = $33   ; Sliding down a slope while small
PF_SLIDE_BIG            = $31   ; Sliding down a slope otherwise
PF_STATUE               = $1E   ; Tanooki statue frame

; Jump / fall
PF_FALLBIG              = $06   ; Falling when not small
PF_FASTJUMPBIG          = $38   ; "Fast" jump frame when not small
PF_JUMPFALLSMALL        = $40   ; Standard jump/fall frame when small
PF_FASTJUMPFALLSMALL    = $4E   ; "Fast" jump/fall frame when small
PF_JUMPBIG              = $4F   ; Jump as not small (except raccoon)
PF_JUMPRACCOON          = $50   ; Jump frame as raccoon
PF_SOMERSAULT_BASE      = $1A   ; $1A-$1D Invincibility somersault base frame

; Walking frames
PF_WALKSMALL_BASE       = $3E   ; $3E-$3F Base frame of walking while "small"
PF_WALKBIG_BASE         = $0C   ; $0C-$0E Base frame of walking while big/fire/hammer
PF_WALKSPECIAL_BASE     = $00   ; $00-$02 Base frame of walking as Raccoon, Frog, or Tanooki
PF_FROGHOP_BASE         = $15   ; $15-$17 Base frame for frog suit hopping along

; In-pipe frames
PF_INPIPE_SMALL         = $32   ; "Small", in pipe
PF_INPIPE_SMALLKURIBO   = $43   ; "Small", in pipe with Kuribo's shoe
PF_INPIPE_BIG           = $05   ; "Not small", in pipe
PF_INPIPE_BIGKURIBO     = $18   ; "Not small", in pipe with Kuribo's shoe

; Swim frames
PF_SWIMACTIVE_SMALL     = $46   ; $46-$48 Base frame of actively swimming while small
PF_SWIMACTIVE_BIG       = $34   ; $34-$36 Base frame of actively swimming while not small

PF_FROGSWIM_UPBASE      = $12   ; $12-$14 Base frame for frog suit swimming up
PF_FROGSWIM_IDLEBASE    = $1F   ; $1F-$20 Base frame for idling frog suit in the water (kick kick kick ...)
PF_FROGSWIM_LRBASE      = $21   ; $21-$23 Base frame for frog suit swimming left/right
PF_FROGSWIM_DOWNBASE    = $24   ; $24-$26 Base frame for frog suit swimming down

; Swim frames
PF_SWIMIDLE_SMALL       = $46   ; $46,$49 Base frame of idle swimming while small
PF_SWIMIDLE_BIG         = $3C   ; $34,$3C-$3D Base frame of idle swimming while not small

; Tail attack frames
PF_TAILATKGROUND_BASE   = $03   ; $03-$05 Base frame of tail attack while on the ground
PF_TAILATKINAIR_BASE    = $09   ; $04,$05,$09 Base frame of tail attack while in the air (okay not really the "base" I guess)

; Kuribo's Shoe
PF_KURIBO_SMALL         = $43   ; Kuribo's shoe when small
PF_KURIBO_BIG           = $18   ; Kuribo's shoe when big

; Ducking
PF_DUCK_NOTRACCOON      = $0F   ; Ducking, not raccoon
PF_DUCK_RACCOON         = $07   ; Ducking, raccoon

; Player throw (fire/hammer)
PF_THROWONGROUND_BASE   = $0E   ; $0E,$10-$11 Base frame of throwing fire/hammer while on ground
PF_THROWINAIR_BASE      = $34   ; $34-$36 Base frame oft hrowing fire/hammer while in air

; Player running spread-eagle
PF_RUNSMALL_BASE        = $4C   ; $4C-$4D Base frame of running when small
PF_RUNBIG_BASE          = $39   ; $39-$3B Base frame of running when not small

; Player tail wag
PF_TAILWAGFLY_BASE      = $36   ; $36-$38 Base frame of flying tail wag
PF_TAILWAGFALL          = $08   ; $08-$0A Base frame of fluttering tail wag

; Player holding frames
PF_HOLDSMALL_BASE       = $2E   ; $2E-$2F Base frame of holding an object when small
PF_HOLDBIG_BASE         = $29   ; $29-$2B Base frame of holding an object when not small

; Player spinning around (inside the desert land twister) (I don't like the determination by "suits that can slide", but that's what it is)
PF_SPINSMALLORFROG_BASE = $32   ; $32,$3E Base frame of "spinning" when small or in frog suit
PF_SPINSLIDESUITS_BASE  = $04   ; $04-$05,$0E Base frame of "spinning" when in a suit that can slide (I guess that's just not hammer then)
PF_SPINOTHER_BASE       = $02   ; $02,$04-$05 Base frame of "spinning" when in a suit that can't slide (just hammer suit I think)

; Airship "caught anchor" frame or general vine climbing (animation is mirroring this frame)
PF_CLIMB_SMALL          = $4A   ; When small
PF_CLIMB_FROG           = $28   ; When frog
PF_CLIMB_BIG            = $2C   ; Otherwise


; Velocity affects for Player -- note they are in 4.4 fixed point, so divide them by 16 for pixels/frame
PLAYER_TOPWALKSPEED     = $18   ; Highest X velocity considered as Player "walking"
PLAYER_TOPRUNSPEED      = $28   ; Highest X velocity when Player runs
PLAYER_TOPPOWERSPEED    = $38   ; Highest X velocity hit when Player is at full "power"
PLAYER_MAXSPEED         = $40   ; Player's maximum speed
PLAYER_JUMP             = <-$38  ; Player's root Y velocity for jumping (further adjusted a bit by Player_SpeedJumpInc)
PLAYER_TAILWAG_YVEL     = $10   ; The Y velocity that the tail wag attempts to lock you at
PLAYER_FLY_YVEL         = <-$18  ; The Y velocity the Player flies at
PLAYER_SWIMSTART_YVEL   = <-$20  ; The Y velocity the Player starts swimming at (or applied when sinking too fast)
PLAYER_SWIM_YVEL        = $20   ; The swim Y velocity the rest of the time
PLAYER_FROG_MAXYVEL     = <-$20

; Applies only to objects following Object_Move's standard movements, but most write their own physics
OBJECT_FALL             = $03
OBJECT_FALLINWATER      = $01
OBJECT_MAXFALL          = $40
OBJECT_MAXFALLINWATER   = $10
OBJECT_MAXWATERUPWARD   = <-$18
OBJECT_FALLRATE         = $03
OBJECT_FALLRATEINWATER  = $01

; Some key map tiles defined
TILE_MARIOCOMP_P        = $00   ; Mario Completed, standard panel
TILE_LUIGICOMP_P        = $01   ; Luigi Completed, standard panel
TILE_PANEL1             = $03   ; Level Panel 1
TILE_MARIOCOMP_O        = $40   ; Mario Completed, orange color
TILE_LUIGICOMP_O        = $41   ; Luigi Completed, orange color
TILE_HORZPATH           = $45   ; Standard horizontal path
TILE_VERTPATH           = $46   ; Standard vertical path
TILE_DOCK               = $4B   ; Docking spot for canoe
TILE_BORDER3            = $4E
TILE_BORDER1            = $4F
TILE_TOADHOUSE          = $50   ; Toad House
TILE_ROCKBREAKH         = $51   ; Rock which breaks into horizontal path
TILE_ROCKBREAKV         = $52   ; Rock which breaks into vertical path
TILE_ROCK               = $53   ; Rock which does not break
TILE_LOCKVERT           = $54   ; Mini-Fortress lock, removed to vertical path

TILE_LOCKHORZ           = $56   ; Mini-Fortress lock, removed to horizontal path
TILE_SPIRAL             = $5F   ; World 5 Spiral Castle
TILE_FORTRUBBLE         = $60   ; Mini-Fortress Rubble
TILE_PATHANDNUB         = $66   ; Path with nub (I think this is unused... in fact, you can "enter" it!)
TILE_FORT               = $67   ; Mini-Fortress
TILE_LARGEFORT          = $6A   ; UNUSED "Large Fortress" tile (usually gets visually corrupt by map animation)
TILE_MARIOCOMP_G        = $80   ; Mario Completed, green color
TILE_LUIGICOMP_G        = $81   ; Luigi Completed, green color
TILE_WATER_INVT         = $82   ; Water meeting at inverted 'T' shape
TILE_RIVERVERT          = $9D   ; Vertical river segment (gets bridged)
TILE_VERTPATHWLU        = $AA   ; Standard vertical path over water, land on upper
TILE_VERTPATHWLL        = $AB   ; Standard vertical path over water, land on lower
TILE_HORZPATHW          = $AC   ; Standard horizontal path over water
TILE_VERTPATHW          = $B0   ; Standard vertical path over water
TILE_DRAWBRIDGEV        = $B1   ; World 3 Draw Bridge (Vertical)
TILE_DRAWBRIDGEH        = $B2   ; World 3 Draw Bridge (Horizontal)
TILE_BRIDGE             = $B3   ; Bridge
TILE_DANCINGBUSH        = $B4   ; Dancing Bush
TILE_HORZPATHWLL        = $B7   ; Standard horizontal path over water, land on left end
TILE_HORZPATHWLR        = $B8   ; Standard horizontal path over water, land on right end
TILE_HORZPATHWLB        = $B9   ; Standard horizontal path over water, land on both ends
TILE_VERTPATHWLB        = $BA   ; Standard vertical path over water, land on both ends
TILE_DANCINGPALM        = $BB   ; Dancing Palm Tree (World 2)
TILE_PIPE               = $BC   ; Pipe
TILE_DANCINGFLOWER      = $BD   ; Dancing Flower
TILE_POOL               = $BF   ; Pool / Oasis
TILE_MARIOCOMP_R        = $C0   ; Mario Completed, red color
TILE_LUIGICOMP_R        = $C1   ; Luigi Completed, red color
TILE_CASTLEBOTTOM       = $C9   ; Bottom of world castle
TILE_BOWSERCASTLELL     = $CC   ; Bowser's castle lower left
TILE_HORZPATHSKY        = $DA   ; World 5 Sky Horizontal path
TILE_VERTPATHSKY        = $DB   ; World 5 Sky Vertical path
TILE_ALTSPIRAL          = $DF   ; World 5 Spiral Castle Alternate Color (not used)
TILE_ALTTOADHOUSE       = $E0   ; Alternate color Toad House
TILE_ALTRUBBLE          = $E3   ; Alternate color Mini-Fortress Rubble
TILE_ALTLOCK            = $E4   ; Alternate color lock
TILE_START              = $E5   ; START panel
TILE_HANDTRAP           = $E6   ; World 8 Hand Trap
TILE_BORDER2            = $E7
TILE_SPADEBONUS         = $E8   ; Spade bonus panel
TILE_WORLD5STAR         = $E9   ; Star used on World 5 Sky map
TILE_ALTFORT            = $EB   ; Alternate color Mini-Fortress


; Commons (not really comprehensive)
TILEA_NOTEINVIS         = $03   ; Invisible (until hit) note block
TILEA_PSWITCHCOIN       = $05   ; Coins invisible unless P-Switch is active

TILEA_NOTE              = $2E   ; Standard note block
TILEA_NOTEFLOWER        = $2F   ; Note block with fire flower
TILEA_NOTELEAF          = $30   ; Note block with leaf
TILEA_NOTESTAR          = $31   ; Note block with star
TILEA_ICEBRICK          = $32   ; Ice block

TILEA_ICEBLOCK          = $32

TILEA_COIN              = $40   ; Coin
TILEA_COINREMOVED       = $41   ; Tile used after coin has been collected
TILEA_DOOR1             = $42   ; Doorway 1, typically black in appearance (apparently wired to only work in fortresses)
TILEA_DOOR2             = $43   ; Doorway 2, typically red in appearance
TILEA_INVISCOIN         = $44   ; Invisible coin block
TILEA_INVIS1UP          = $45   ; Invisible 1-up
TILEA_NOTECOINHEAVEN    = $46   ; Placeholder for invisible note block that takes you to coin heaven

TILEA_BLOCKEMPTY        = $5F   ; Used up ? block type empty block

TILEA_QBLOCKFLOWER      = $60   ; ? block with fire flower
TILEA_QBLOCKLEAF        = $61   ; ? block with leaf
TILEA_QBLOCKSTAR        = $62   ; ? block with star
TILEA_QBLOCKCOIN        = $63   ; ? block with coin
TILEA_QBLOCKCOINSTAR    = $64   ; ? block with coin OR star
TILEA_QBLOCKCOIN2       = $65   ; ? block with coin (again??)
TILEA_MUNCHER           = $66   ; Muncher plant!
TILEA_BRICK             = $67   ; Standard brick
TILEA_BRICKFLOWER       = $68   ; Brick containing fire flower
TILEA_BRICKLEAF         = $69   ; Brick containing leaf
TILEA_BRICKSTAR         = $6A   ; Brick containing star
TILEA_BRICKCOIN         = $6B   ; Brick containing single coin
TILEA_BRICKCOINSTAR     = $6C   ; Brick containing single coin OR star
TILEA_BRICK10COIN       = $6D   ; Brick with 10 coins
TILEA_BRICK1UP          = $6E   ; Brick with 1-up
TILEA_BRICKVINE         = $6F   ; Brick with vine
TILEA_BRICKPSWITCH      = $70   ; Brick with P Switch
TILEA_HNOTE             = $71   ; Coin Heaven launcher note block
TILEA_WOODBLOCKBOUNCE   = $72   ; Wood block which bounces (no contents)
TILEA_WOODBLOCKFLOWER   = $73   ; Wood block which bounces and contains fire flower
TILEA_WOODBLOCKLEAF     = $74   ; Wood block which bounces and contains leaf
TILEA_WOODBLOCKSTAR     = $75   ; Wood block which bounces and contains star

TILEA_WOODBLOCK         = $79   ; Standard solid wood block

TILEA_GNOTE             = $BC   ; Green note block (functions like standard white, just colored wrong)

TILEA_PSWITCH_BLANK     = $C1   ; Blank tile used to hide a P-Switch after it has been used on level reload

TILEA_PATH_HORZ         = $C8   ; Horizontal path (typical)
TILEA_PATH_VERT         = $C9   ; Vertical path (typical)
TILEA_PATH_45T2B        = $CA   ; 45 degree path top-to-bottom (typical)
TILEA_PATH_45B2T        = $CB   ; 45 degree path bottom-to-top (typical)
TILEA_PATH_625T2B_U     = $CC   ; 62.5 degree path top-to-bottom, upper half (typical)
TILEA_PATH_625T2B_L     = $CD   ; 62.5 degree path top-to-bottom, lower half (typical)
TILEA_PATH_625B2T_U     = $CE   ; 62.5 degree path bottom-to-top, upper half (typical)
TILEA_PATH_625B2T_L     = $CF   ; 62.5 degree path bottom-to-top, lower half (typical)

TILEA_PSWITCH_PRESSED   = $D7   ; Referenced pressed P-Switch
TILEA_PSWITCH           = $F2   ; P-Switch
TILEA_BLOCKBUMP_CLEAR   = $F3   ; Tile used when a "bump" block (e.g. ? blocks, note block, etc.) is hit

; Tileset 1 (Plains style)
TILE1_GOALBLACK         = $00   ; Black background of goal area
TILE1_GOALEDGE          = $01   ; > shape goal edge
TILE1_SKYALT            = $02   ; ?? Referenced, appears as sky?

TILE1_LITTLEFENCE       = $04   ; Little fence (runs atop the 'oo' type cheep-cheep bridge)
TILE1_LILBGCLOUD        = $06   ; Little background cloud
TILE1_WBLOCKLV          = $07   ; White big block left vertical runner
TILE1_WBLOCKRV          = $08   ; White big block right vertical runner
TILE1_WBLOCKM           = $09   ; White big block center
TILE1_WBLOCKBH          = $0A   ; White big block bottom horizontal runner
TILE1_WBLOCK_SHUR       = $0B   ; White big block shadowed on by another
TILE1_WBLOCKSM          = $0C   ; White big block shadow middle
TILE1_WBLOCKLL          = $0D   ; White big block lower-left
TILE1_WBLOCKLR          = $0E   ; White big block lower-right
TILE1_WBLOCKSB          = $0F   ; White big block shadow bottom

TILE1_PUPCLOUD_M        = $10   ; "Power Up Cloud" Mushroom
TILE1_PUPCLOUD_F        = $11   ; "Power Up Cloud" Flower
TILE1_PUPCLOUD_S        = $12   ; "Power Up Cloud" Star

TILE1_CLOUD_UL          = $1F   ; Cloud upper left
TILE1_CLOUD_UM          = $20   ; Cloud upper middle
TILE1_CLOUD_UR          = $21   ; Cloud upper right
TILE1_CLOUD_LL          = $22   ; Cloud lower left
TILE1_CLOUD_LM          = $23   ; Cloud lower middle
TILE1_CLOUD_LR          = $24   ; Cloud lower right

TILE1_WBLOCKUL          = $26   ; White big block upper-left
TILE1_WBLOCKTH          = $25   ; White big block top horizontal runner
TILE1_WBLOCKUR          = $27   ; White big block upper-right

TILE1_JCLOUD            = $2C   ; Judgem's style cloud, solid on top only
TILE1_JCLOUDSOLID       = $2D   ; Judgem's style cloud, solid all around

TILE1_OBLOCKLV          = $47   ; Orange big block left vertical runner
TILE1_OBLOCKRV          = $48   ; Orange big block right vertical runner
TILE1_OBLOCKM           = $49   ; Orange big block center
TILE1_OBLOCKBH          = $4A   ; Orange big block bottom horizontal runner
TILE1_OBLOCK_SHUR       = $4B   ; Orange big block shadowed on by another
TILE1_OBLOCKSM          = $4C   ; Orange big block shadow middle
TILE1_OBLOCKLL          = $4D   ; Orange big block lower-left
TILE1_OBLOCKLR          = $4E   ; Orange big block lower-right
TILE1_OBLOCKSB          = $4F   ; Orange big block shadow bottom
TILE1_OBLOCKUL          = $51   ; Orange big block upper-left
TILE1_OBLOCKTH          = $50   ; Orange big block top horizontal runner
TILE1_OBLOCKUR          = $52   ; Orange big block upper-right

TILE1_GROUNDTM          = $53   ; Ground top middle
TILE1_GROUNDMM          = $54   ; Ground middle-middle
TILE1_GROUNDTL          = $55   ; Ground top left
TILE1_GROUNDML          = $56   ; Ground middle-left
TILE1_GROUNDTR          = $57   ; Ground top right
TILE1_GROUNDMR          = $58   ; Ground middle-right

TILE1_CANNONTOP1        = $76   ; Upper top of cannon
TILE1_CANNONTOP2        = $77   ; Lower top of cannon
TILE1_CANNONMID         = $78   ; Mid part to ground

TILE1_SANDTOP           = $7A   ; Solid sand ground, top
TILE1_SANDMID           = $7B   ; Solid sand ground, middle

TILE1_SKY               = $80   ; Official sky tile

TILE1_VINE              = $85   ; Vine
TILE1_LITTLE_BUSH       = $86   ; The little green bush

TILE1_GBLOCKLV          = $87   ; Green big block left vertical runner
TILE1_GBLOCKRV          = $88   ; Green big block right vertical runner

TILE1_GBLOCKM           = $89   ; Green big block center
TILE1_GBLOCKBH          = $8A   ; Green big block bottom horizontal runner
TILE1_GBLOCK_SHUR       = $8B   ; Green big block shadowed on by another
TILE1_GBLOCKSM          = $8C   ; Green big block shadow middle
TILE1_GBLOCKLL          = $8D   ; Green big block lower-left
TILE1_GBLOCKLR          = $8E   ; Green big block lower-right
TILE1_GBLOCKSB          = $8F   ; Green big block shadow bottom

TILE1_BUSH_UL           = $90   ; Bush upper left
TILE1_BUSH_UR           = $91   ; Bush upper right
TILE1_BUSH_FUL          = $92   ; Bush front (of another bush) upper left
TILE1_BUSH_FUR          = $93   ; Bush front (of another bush) upper right
TILE1_BUSH_BL           = $94   ; Bush bottom/middle left
TILE1_BUSH_BR           = $95   ; Bush bottom/middle right
TILE1_BUSH_FBL          = $96   ; Bush front (of another bush) bottom left
TILE1_BUSH_FBR          = $97   ; Bush front (of another bush) bottom right
TILE1_BUSH_MID          = $98   ; Bush middle
TILE1_BUSH_SUL          = $99   ; Bush shadowed upper left
TILE1_BUSH_SUR          = $9A   ; Bush shadowed upper right
TILE1_BUSH_SFUL         = $9B   ; Bush shadowed front (of another bush) upper left
TILE1_BUSH_SFUR         = $9C   ; Bush shadowed front (of another bush) upper right
TILE1_BUSH_SHUR         = $9D   ; Bush with shadow of big block
TILE1_BUSH_SBL          = $9E   ; Bush shadowed bottom/middle left
TILE1_BUSH_SBR          = $9F   ; Bush shadowed bottom/middle right

TILE1_GBLOCKTH          = $A0   ; Green big block top horizontal runner
TILE1_GBLOCKUL          = $A1   ; Green big block upper-left
TILE1_GBLOCKUR          = $A2   ; Green big block upper-right

TILE1_PIPETB1_L         = $AD   ; Pipe top/bottom 1 left (alt level)
TILE1_PIPETB1_R         = $AE   ; Pipe top/bottom 1 right
TILE1_PIPETB2_L         = $AF   ; Pipe top/bottom 2 left (Big [?] area)
TILE1_PIPETB2_R         = $B0   ; Pipe top/bottom 2 right
TILE1_PIPETB3_L         = $B1   ; Pipe top/bottom 3 left (not enterable)
TILE1_PIPETB3_R         = $B2   ; Pipe top/bottom 3 right
TILE1_PIPETB4_L         = $B3   ; Pipe top/bottom 4 left (within level transit)
TILE1_PIPETB4_R         = $B4   ; Pipe top/bottom 4 right
TILE1_PIPEH1_B          = $B5   ; Pipe horizontal 1 bottom (alt level)
TILE1_PIPEH2_B          = $B6   ; Pipe horizontal 2 bottom (not enterable)
TILE1_PIPEH_T           = $B7   ; Pipe horizontal top (common)
TILE1_PIPEHT            = $B8   ; Pipe horizontal middle top
TILE1_PIPEHB            = $B9   ; Pipe horizontal middle bottom
TILE1_PIPEVL            = $BA   ; Pipe middle vertical left
TILE1_PIPEVR            = $BB   ; Pipe middle vertical right

TILE1_BLOCK_SHUR        = $C0   ; Big block shadow upper-right
TILE1_BLOCK_SHUL        = $C1   ; Big block shadow upper-left (actually none, also used as a cleared P-Switch on level reload, AKA TILEA_PSWITCH_BLANK)
TILE1_BLOCK_SHLL        = $C2   ; Big block shadow lower-left
TILE1_BLOCK_SHLR        = $C3   ; Big block shadow lower-right
TILE1_BLOCK_SHADOW      = $C4   ; Big block general side-shadow
TILE1_BLOCK_SHADOWB     = $C5   ; Big block general bottom shadow
TILE1_BBLOCKLV          = $C7   ; Blue big block left vertical runner
TILE1_BBLOCKRV          = $C8   ; Blue big block right vertical runner
TILE1_BBLOCKM           = $C9   ; Blue big block center
TILE1_BBLOCKBH          = $CA   ; Blue big block bottom horizontal runner
TILE1_BBLOCK_SHUR       = $CB   ; Blue big block shadowed on by another
TILE1_BBLOCKSM          = $CC   ; Blue big block shadow middle
TILE1_BBLOCKLL          = $CD   ; Blue big block lower-left
TILE1_BBLOCKLR          = $CE   ; Blue big block lower-right
TILE1_BBLOCKSB          = $CF   ; Blue big block shadow bottom

TILE1_WATERBUMPS1       = $D8   ; Water ... not sure how to describe it
TILE1_WATERBUMPS2       = $D9   ; Water ... not sure how to describe it
TILE1_WATERBUMPSSH      = $D9   ; Water ... not sure how to describe it, shaded
TILE1_WATERWAVEL        = $DB   ; Water waving to the left
TILE1_WATERWAVE         = $DC   ; Water waving but with no apparent current
TILE1_WATERWAVER        = $DD   ; Water waving to the right

TILE1_WATER             = $DE   ; Water

TILE1_WFALLTOP          = $E0   ; Top of waterfall
TILE1_WFALLMID          = $E1   ; Middle of water, extending downward

TILE1_BBLOCKUL          = $E3   ; Blue big block upper-left
TILE1_BBLOCKTH          = $E2   ; Blue big block top horizontal runner
TILE1_BBLOCKUR          = $E4   ; Blue big block upper-right

TILE1_DIAMOND           = $F0   ; Diamond block
TILE1_CCBRIDGE          = $F1   ; Cheep-cheep 'oo' bridge
TILE1_WGROUNDTM         = $F4   ; Underwater ground top middle
TILE1_WGROUNDMM         = $F5   ; Underwater ground middle-middle
TILE1_WGROUNDTL         = $F6   ; Underwater ground top left
TILE1_WGROUNDML         = $F7   ; Underwater ground middle-left
TILE1_WGROUNDTR         = $F8   ; Underwater ground top right
TILE1_WGROUNDMR         = $F9   ; Underwater ground middle-right


; Tileset 2 (Fortress style)
TILE2_BLACK             = $02   ; Solid black background

TILE2_WINDOWTOP         = $06   ; Top of window
TILE2_WINDOWMID         = $07   ; Middle of window
TILE2_WINDOWBOT         = $08   ; Bottom of window

; NOTE: The path (for a moving platform to follow) is typically a
; different value for every Level_Tileset EXCEPT 2)
TILE2_PATH_HORZ         = $09   ; Horizontal path (TS 2 only)
TILE2_PATH_VERT         = $0A   ; Vertical path (TS 2 only)
TILE2_PATH_45T2B        = $0B   ; 45 degree path top-to-bottom (TS 2 only)
TILE2_PATH_45B2T        = $0C   ; 45 degree path bottom-to-top (TS 2 only)
TILE2_PATH_625T2B_U     = $0D   ; 62.5 degree path top-to-bottom, upper half (TS 2 only)
TILE2_PATH_625T2B_L     = $0E   ; 62.5 degree path top-to-bottom, lower half (TS 2 only)
TILE2_PATH_625B2T_U     = $0F   ; 62.5 degree path bottom-to-top, upper half (TS 2 only)
TILE2_PATH_625B2T_L     = $10   ; 62.5 degree path bottom-to-top, lower half (TS 2 only)

TILE2_GHOSTL            = $11   ; Ghost block left
TILE2_GHOSTM            = $12   ; Ghost block middle
TILE2_GHOSTR            = $13   ; Ghost block right

TILE2_CHECKERBOARDUL    = $14   ; Checkerboard floor pattern, upper left
TILE2_CHECKERBOARDUR    = $15   ; Checkerboard floor pattern, upper right
TILE2_CHECKERBOARDLL    = $16   ; Checkerboard floor pattern, lower left
TILE2_CHECKERBOARDLR    = $17   ; Checkerboard floor pattern, lower right


TILE2_CONVEYORL         = $34   ; Conveyor left

TILE2_CONVEYORR         = $35   ; Conveyor right

TILE2_UNSURE            = $5A   ; Not sure??  Complements TILE2_GHOST*
TILE2_DONUTLIFT         = $5B   ; Donut lift

TILE2_PILLAR_T          = $81   ; Background pillar top
TILE2_PILLAR_M          = $82   ; Background pillar middle
TILE2_PILLAR_B          = $83   ; Background pillar bottom

TILE2_PILLARSHADOW_T    = $84   ; Background pillar top, shadowed
TILE2_PILLARSHADOW_M    = $86   ; Background pillar middle, shadowed
TILE2_PILLARSHADOW_B    = $87   ; Background pillar bottom, shadowed


TILE2_HANGGLOBE_TOP     = $88   ; Cable ceiling connector for hanging globe thing
TILE2_HANGGLOBE_CABLE   = $89   ; Cable for hanging globe thing
TILE2_HANGGLOBE_GLOBE   = $8A   ; Hanging globe thing

TILE2_BGBRICK_SHADOW2   = $8B   ; Background brickwork pattern, shadowed (same as $8F?)
TILE2_BGBRICK_NOSHADOW  = $8C   ; Background brickwork pattern, non-shadowed
TILE2_BGBRICK_LSHADOW   = $8D   ; Background brickwork pattern, shadowed on left
TILE2_BGBRICK_TOPSHADOW = $8E   ; Background brickwork pattern, shadowed on top
TILE2_BGBRICK_SHADOW    = $8F   ; Background brickwork pattern, shadowed

TILE2_BGBRICK_UNDBRICK  = $90   ; Background brickwork pattern, under the TILE2_SOLIDBRICK
TILE2_BGBRICK_LDSHADOW  = $91   ; Background brickwork pattern, dark shadowed left
TILE2_BGBRICK_ULDSHADOW = $92   ; Background brickwork pattern, dark shadowed upper-left
TILE2_BGBRICK_TOPDSHADOW= $93   ; Background brickwork pattern, dark shadowed on top

TILE2_LAVATOP           = $94   ; Top lava tile
TILE2_LAVABOTTOM        = $95   ; Bottom lava tile

TILE2_ENDDOOR_UL        = $97   ; The final door to the princess, upper left
TILE2_ENDDOOR_UR        = $98   ; The final door to the princess, upper right
TILE2_ENDDOOR_LL        = $99   ; The final door to the princess, lower left
TILE2_ENDDOOR_LR        = $9A   ; The final door to the princess, lower right

TILE2_CANDLE            = $9B   ; Candle (for Hot Foot)
TILE2_SOLIDBRICK        = $9C   ; Solid Bowser's Castle style brick
TILE2_DARKREDDIAMOND    = $9D   ; Dark red diamond block
TILE2_ROTODISCBLOCK     = $9E   ; Roto disc block

TILE2_SHADOW            = $A2   ; Black

TILE2_SPIKEUP           = $E2   ; Spikes pointing upward
TILE2_SPIKEDOWN         = $E3   ; Spikes pointing downward
TILE2_DIAMONDBRIGHT     = $E4   ; Bright color diamond block
TILE2_DIAMONDDARK       = $E5   ; Dark color diamond block

TILE2_BOWSERSTATUEU     = $E8   ; Bowser statue upper
TILE2_BOWSERSTATUEL     = $E9   ; Bowser statue lower

TILE2_SOLIDBLACK        = $F4   ; Black tile which is solid


; Tileset 3 (Hills style)
TILE3_UNK2              = $88   ; Background referenced, but unknown; possibly belongs to another tileset?
TILE3_UNK3              = $89   ; Background referenced, but unknown; possibly belongs to another tileset?
TILE3_UNK               = $C0   ; Background referenced, but unknown; possibly belongs to another tileset?


TILE3_SKY               = $02   ; Sky

TILE3_CLOUD_UL          = $06   ; Cloud upper left
TILE3_CLOUD_UM          = $07   ; Cloud upper middle
TILE3_CLOUD_UR          = $08   ; Cloud upper right
TILE3_CLOUD_LL          = $09   ; Cloud lower left
TILE3_CLOUD_LM          = $0A   ; Cloud lower middle
TILE3_CLOUD_LR          = $0B   ; Cloud lower right
TILE3_LILCLOUD          = $0C   ; Little BG cloud

TILE3_ALTDIAMOND        = $48   ; Alternate diamond type block, not apparently used (a blue version at $F0 is, but not this one!)
TILE3_QUICKSAND_TOP     = $49   ; Quicksand top
TILE3_QUICKSAND_MID     = $4A   ; Quicksand middle

TILE3_BGBUSH_L          = $81   ; Background bush left
TILE3_BGBUSH_M          = $82   ; Background bush middle
TILE3_BGBUSH_R          = $83   ; Background bush right
TILE3_UNDERGROUND       = $86   ; Underground speckled
TILE3_TUNNEL            = $87   ; "Tunnel" under grassy ground
TILE3_SLOPE45B2T        = $99   ; 45 degree slope, bottom-to-top
TILE3_HORZGROUND        = $9A   ; Horizontal ground
TILE3_SLOPE45T2B        = $9B   ; 45 degree slope, top-to-bottom
TILE3_SLOPE225B2T_L     = $9C   ; 22.5 degree slope, bottom-to-top, lower
TILE3_SLOPE225B2T_U     = $9D   ; 22.5 degree slope, bottom-to-top, upper
TILE3_SLOPE225T2B_U     = $9E   ; 22.5 degree slope, top-to-bottom, lower
TILE3_SLOPE225T2B_L     = $9F   ; 22.5 degree slope, top-to-bottom, upper
TILE3_CEILING           = $A6   ; Ceiling
TILE3_ULCORNERGROUND    = $A7   ; Upper left corner ground
TILE3_VERTGROUNDL       = $A8   ; Vertical ground, left edge
TILE3_URCORNERGROUND    = $A9   ; Upper right corner ground
TILE3_VERTGROUNDR       = $AA   ; Vertical ground, right edge
TILE3_MIDGROUND         = $AB   ; Middle ground
TILE3_LLCORNERGROUND    = $AC   ; Lower left corner ground

TILE3_PIPETB5_L         = $BD   ; Pipe top/bottom 5 left (exit to common end area)
TILE3_PIPETB5_R         = $BE   ; Pipe top/bottom 5 right (exit to common end area)

TILE3_LRCORNERGROUND    = $BF   ; Lower right corner ground

TILE3_WATERTOP          = $C2   ; Top of water
TILE3_WATER             = $C3   ; Mid water

TILE3_WSLOPE45B2T       = $E2   ; Underwater 45 degree slope, bottom-to-top
TILE3_WHORZGROUND       = $E3   ; Underwater Horizontal ground
TILE3_WSLOPE45T2B       = $E4   ; Underwater 45 degree slope, top-to-bottom
TILE3_WSLOPE225B2T_L    = $E5   ; Underwater 22.5 degree slope, bottom-to-top, lower
TILE3_WSLOPE225B2T_U    = $E6   ; Underwater 22.5 degree slope, bottom-to-top, upper
TILE3_WSLOPE225T2B_U    = $E7   ; Underwater 22.5 degree slope, top-to-bottom, lower
TILE3_WSLOPE225T2B_L    = $E8   ; Underwater 22.5 degree slope, top-to-bottom, upper
TILE3_WCEILING          = $F4   ; Underwater ceiling
TILE3_WCORNER_UL        = $F5   ; Underwater upper-left corner ground
TILE3_WVERTGROUND_L     = $F6   ; Underwater vertical ground, left edge
TILE3_WCORNER_UR        = $F7   ; Underwater upper-right corner ground
TILE3_WVERTGROUND_R     = $F8   ; Underwater vertical ground, right edge
TILE3_WMIDGROUND        = $F9   ; Underwater middle ground
TILE3_WCORNER_LL        = $FA   ; Underwater lower-left corner ground
TILE3_WCORNER_LR        = $FB   ; Underwater lower-right corner ground


; Tileset 4 (High-Up style, technically shares with Tileset 12)
TILE4_LONGCLOUD_UL      = $02   ; Long cloud upper left
TILE4_LONGCLOUD_UM      = $06   ; Long cloud upper middle
TILE4_LONGCLOUD_UR      = $07   ; Long cloud upper right
TILE4_LONGCLOUD_LL      = $1F   ; Long cloud lower left
TILE4_LONGCLOUD_LM      = $20   ; Long cloud lower middle
TILE4_LONGCLOUD_LR      = $21   ; Long cloud lower right

TILE4_FATTRUNK          = $47   ; Fat trunk (?) tile

TILE4_LONGWOOD_L        = $4A   ; Long wooden block, left
TILE4_LONGWOOD_M        = $4B   ; Long wooden block, middle
TILE4_LONGWOOD_R        = $4C   ; Long wooden block, right

TILE4_LARGEWOOD_UL      = $4D   ; Large wooden block, upper left
TILE4_LARGEWOOD_UM      = $4E   ; Large wooden block, upper middle
TILE4_LARGEWOOD_UR      = $4F   ; Large wooden block, upper right
TILE4_LARGEWOOD_LL      = $50   ; Large wooden block, lower left
TILE4_LARGEWOOD_LM      = $51   ; Large wooden block, lower middle
TILE4_LARGEWOOD_LR      = $52   ; Large wooden block, lower right


; Unverified, this is actually garbage in Tileset 4
TILE4_LARGEBLOCK_LL     = $53   ; Large platform, lower left
TILE4_LARGEBLOCK_LM     = $54   ; Large platform, lower middle
TILE4_LARGEBLOCK_LR     = $55   ; Large platform, lower right

TILE4_MUNCHER           = $66   ; Muncher

TILE4_SKY               = $80   ; Sky
TILE4_LITTLEBUSH        = $81   ; Little background bush
TILE4_BUSHBUNCH_L       = $82   ; Bush bunch left
TILE4_BUSHBUNCH_M       = $83   ; Bush bunch middle
TILE4_BUSHBUNCH_R       = $84   ; Bush bunch right

TILE4_SKY_STOPGEN       = $86   ; Appears as sky, used to stop runaway "to ground" generators (I think)

TILE4_GREENBLOCK_LL     = $87   ; Green platform, upper left
TILE4_GREENBLOCK_LM     = $88   ; Green platform, upper middle
TILE4_GREENBLOCK_LR     = $89   ; Green platform, upper right

TILE4_GREENBLOCK_UL     = $8A   ; Green platform, upper left
TILE4_GREENBLOCK_UM     = $8B   ; Green platform, upper middle
TILE4_GREENBLOCK_UR     = $8C   ; Green platform, upper right

TILE4_UNKNOWN           = $8D   ; UNKNOWN, referenced with TILE4_PLATFORMPULLER

TILE4_BGCLOUD_L         = $C0   ; Wide BG cloud
TILE4_BGCLOUD_R         = $C2   ; Wide BG cloud
TILE4_LILCLOUD          = $C3   ; Little background cloud

TILE4_CABLE_MIDR        = $C4   ; Suspension cable middle right side
TILE4_CABLE_CONR        = $C5   ; Suspension cable connector right side
TILE4_CABLE_MIDL        = $C6   ; Suspension cable middle left side
TILE4_CABLE_CONL        = $C7   ; Suspension cable connector left side

TILE4_PLATFORMPULLER    = $D0   ; Platform puller thingy


TILE4_JELECTRO          = $F4   ; Jelectro


; Tileset 5 (World 7 plant infestations)
TILE5_SKY               = $80   ; Common sky background tile
TILE5_MINIPIPE_TOP1     = $98   ; Mini pipe top 1 (as seen in World 7 plant infested levels)
TILE5_MINIPIPE_MID      = $99   ; Mini pipe mid section
TILE5_MINIPIPE_TOP2     = $9A   ; Mini pipe top 2 (as seen in World 7 plant infested levels)
TILE5_PIPEH3_B          = $BF   ; Pipe horizontal 3 bottom (not enterable)

TILE5_MUNCHER_1         = $C0   ; Muncher 1 (the kind that move up and down the mini pipe)
TILE5_MUNCHER_2         = $C2   ; Muncher 2 (the kind that move up and down the mini pipe)


; Tileset 6 (Water level)
TILE6_ORANGEBLK_UL      = $5D   ; Orange block upper left
TILE6_ORANGEBLK_UM      = $5E   ; Orange block upper middle
TILE6_ORANGEBLK_UR      = $7C   ; Orange block upper right
TILE6_ORANGEBLK_LL      = $7D   ; Orange block lower left
TILE6_ORANGEBLK_LM      = $7E   ; Orange block lower middle
TILE6_ORANGEBLK_LR      = $7F   ; Orange block lower right
TILE6_SKY               = $8A   ; Sky
TILE6_WATERTOP          = $8B   ; Top of water

TILE6_WATER             = $8C   ; Water
TILE6_UNDERWATERPLANT_T = $8F   ; Underwater plant thing top
TILE6_UNDERWATERPLANT_M = $90   ; Underwater plant thing middle
TILE6_GRAYPLATFORM_MM   = $CF   ; Gray platform mid middle
TILE6_UNDERWATERCIRCLE  = $E2   ; Underwater circle thing
TILE6_GRAYPLATFORM_UL   = $E7   ; Gray platform upper left
TILE6_GRAYPLATFORM_UM   = $E8   ; Gray platform upper middle
TILE6_GRAYPLATFORM_UR   = $E9   ; Gray platform upper right
TILE6_GRAYPLATFORM_ML   = $EA   ; Gray platform mid left
TILE6_GRAYPLATFORM_MR   = $EB   ; Gray platform mid right

; Tileset 7 (Toad house)
TILE7_BLACK             = $09   ; The black background
TILE7_CHECKERBOARDUL    = $0A   ; Checkerboard floor pattern, upper left
TILE7_CHECKERBOARDUR    = $0B   ; Checkerboard floor pattern, upper right
TILE7_SKY               = $42   ; Not visible, but appears as sky (or maybe the text box's BG?)
TILE7_TOADHOUSEBG       = $48   ; Toad house background
TILE7_TOADHOUSEBGSHAD   = $49   ; Toad house background, shadowed
TILE7_TOADHOUSEBGSHADUR = $4A   ; Toad house background, shadow upper-right
TILE7_TOADHOUSEBGSHADR  = $4B   ; Toad house background, shadow right
TILE7_CHEST_UL          = $81   ; Toad house chest upper left

TILE7_CHEST_UR          = $82   ; Toad house chest upper right
TILE7_CHEST_LL          = $83   ; Toad house chest lower left
TILE7_CHEST_LR          = $84   ; Toad house chest lower right
TILE7_CHEST_OPEN_UL     = $86   ; Toad house chest opened upper left
TILE7_CHEST_OPEN_UR     = $87   ; Toad house chest opened upper right
TILE7_MINICHEST         = $88   ; UNUSED mini chest tile?!
TILE7_MINICHEST_OPEN    = $89   ; UNUSED mini chest OPENED tile?!
TILE7_UNK               = $E3   ; Unknown background block; unsure who'd use it anyway...
TILE7_TOADHOUSEBLOCK    = $E6   ; Main building block of Toad House

; Tileset 8 (Vertical levels typical of World 7)
TILE8_SPIKE_DOWN        = $0C   ; Downward pointing spikes
TILE8_SPIKE_UP          = $0D   ; Upward pointing spikes
TILE8_PIPEELBOW_UL      = $4C   ; Pipe elbow upper left
TILE8_PIPEELBOW_UR      = $4D   ; Pipe elbow upper right
TILE8_PIPEELBOW_LL      = $4E   ; Pipe elbow lower left
TILE8_PIPEELBOW_LR      = $4F   ; Pipe elbow lower right
TILE8_PIPEELBOW_CUL     = $50   ; Pipe elbow corner upper left
TILE8_PIPEELBOW_CUR     = $51   ; Pipe elbow corner upper right
TILE8_PIPEELBOW_CLL     = $52   ; Pipe elbow corner lower left
TILE8_PIPEELBOW_CLR     = $53   ; Pipe elbow corner lower right
TILE8_ARROWLIFT_UPL     = $54   ; Arrow lift UP left tile
TILE8_ARROWLIFT_UPR     = $55   ; Arrow lift UP right tile
TILE8_ARROWLIFT_RIGHTL  = $56   ; Arrow lift RIGHT left tile
TILE8_ARROWLIFT_RIGHTR  = $57   ; Arrow lift RIGHT right tile
TILE8_ARROWLIFT_LEFTL   = $58   ; Arrow lift LEFT left tile
TILE8_ARROWLIFT_LEFTR   = $59   ; Arrow lift LEFT right tile
TILE8_ARROWLIFT_RANDOML = $5A   ; Arrow lift RANDOM left tile
TILE8_ARROWLIFT_RANDOMR = $5C   ; Arrow lift RANDOM right tile
TILE8_BLACK             = $80   ; Black space
TILE8_SCENPIPE_ENDVL    = $91   ; Scenery pipe end vertical left
TILE8_SCENPIPE_ENDVR    = $92   ; Scenery pipe end vertical right
TILE8_MINIPIPE_VT       = $93   ; Minipipe vertical top
TILE8_MINIPIPE_VM       = $94   ; Minipipe vertical middle
TILE8_MINIPIPE_VB       = $95   ; Minipipe vertical bottom
TILE8_MINIPIPE_HL       = $96   ; Minipipe horizontal left
TILE8_MINIPIPE_HM       = $97   ; Minipipe horizontal middle
TILE8_MINIPIPE_HR       = $98   ; Minipipe horizontal right
TILE8_SCENPIPE_HT       = $99   ; Scenery pipe horizontal top
TILE8_SCENPIPE_ENDH1T   = $9A   ; Scenery pipe end horizontal 1 top
TILE8_SCENPIPE_ENDH2T   = $9B   ; Scenery pipe end horizontal 2 top
TILE8_SCENPIPE_ENDH3T   = $9C   ; Scenery pipe end horizontal 3 top
TILE8_SCENPIPE_ENDH1B   = $9E   ; Scenery pipe end horizontal 1 bottom (level transit)
TILE8_SCENPIPE_ENDH2B   = $9F   ; Scenery pipe end horizontal 2 bottom (no entry)
TILE8_SCENPIPE_HB       = $9D   ; Scenery pipe horizontal bottom
TILE8_SCENPIPE_VL_HMC   = $A1   ; Scenery pipe vertical left with horizontal minipipe crossing
TILE8_SCENPIPE_VR_HMC   = $A2   ; Scenery pipe vertical right with horizontal minipipe crossing
TILE8_SCENPIPE_VL_HTC   = $A3   ; Scenery pipe vertical left with horizontal top crossing
TILE8_SCENPIPE_VR_HTC   = $A4   ; Scenery pipe vertical right with horizontal top crossing
TILE8_SCENPIPE_HT_VLC   = $A5   ; Scenery pipe horizontal top with vertical left crossing
TILE8_SCENPIPE_HT_VRC   = $A6   ; Scenery pipe horizontal top with vertical right crossing
TILE8_SCENPIPE_HT_VMC   = $A7   ; Scenery pipe horizontal top with vertical minipipe crossing
TILE8_SCENPIPE_VL_HBC   = $A8   ; Scenery pipe vertical left with horizontal bottom crossing
TILE8_SCENPIPE_VR_HBC   = $A9   ; Scenery pipe vertical right with horizontal bottom crossing
TILE8_SCENPIPE_HB_VLC   = $AA   ; Scenery pipe horizontal bottom with vertical left crossing
TILE8_SCENPIPE_HB_VRC   = $AB   ; Scenery pipe horizontal bottom with vertical right crossing
TILE8_SCENPIPE_HB_VMC   = $AC   ; Scenery pipe horizontal bottom with vertical minipipe crossing
TILE8_PIPEH3_B          = $BF   ; Pipe horizontal 3 bottom (not enterable)
TILE8_BGPIPE_HT         = $C0   ; Background pipe horizontal top
TILE8_BGPIPE_ENDHT      = $C2   ; Background pipe horizontal end top
TILE8_BGPIPE_HB         = $C3   ; Background pipe horizontal top
TILE8_BGPIPE_ENDHB      = $C4   ; Background pipe horizontal end top
TILE8_BGPIPE_ENDVL      = $C5   ; Background pipe vertical end left
TILE8_BGPIPE_ENDVR      = $C6   ; Background pipe vertical end right
TILE8_BGPIPE_VL         = $C7   ; Background pipe vertical left
TILE8_BGPIPE_VR         = $C8   ; Background pipe vertical right
TILE8_BGPIPE_MVT        = $C9   ; Background pipe minipipe vertical top
TILE8_BGPIPE_MVM        = $CA   ; Background pipe minipipe vertical middle
TILE8_BGPIPE_MVB        = $CB   ; Background pipe minipipe vertical bottom
TILE8_BGPIPE_MHL        = $CC   ; Background pipe minipipe horizontal left
TILE8_BGPIPE_MHM        = $CD   ; Background pipe minipipe horizontal middle
TILE8_BGPIPE_MHR        = $CE   ; Background pipe minipipe horizontal right


; Tileset 9 (desert)
TILE9_THINGROUND_LEDGE  = $07   ; blue thin ground left edge (UNUSED?)
TILE9_THINGROUND_REDGE  = $08   ; blue thin ground right edge (UNUSED?)
TILE9_CLOUD_L           = $12   ; Cloud left
TILE9_CLOUD_R           = $13   ; Cloud right
TILE9_THINGROUND_BLUE   = $33   ; blue thin ground (UNUSED?)
TILE9_PYRAMID_SLOPE     = $4C   ; Pyramid sloped edge
TILE9_PYRAMID           = $4D   ; Pyramid fill
TILE9_CHAIN_LEFT_PILLAR = $51   ; Pillar to left of the chain tile (no different than TILE9_CHAIN_RIGHT_PILLAR)
TILE9_CHAIN_LEFT        = $52   ; Chain on left side (UNUSED?)
TILE9_CHAIN_RIGHT       = $53   ; Chain on right side (UNUSED?)
TILE9_CHAIN_RIGHT_PILLAR= $54   ; Pillar to right of the chain tile (no different than TILE9_CHAIN_LEFT_PILLAR)
TILE9_BRICK_UL          = $55   ; Sand brick upper left
TILE9_BRICK_UM          = $56   ; Sand brick upper middle (also desert ground)
TILE9_BRICK_UR          = $57   ; Sand brick upper right
TILE9_BRICK_ML          = $58   ; Sand brick middle left
TILE9_BRICK_MM          = $59   ; Sand brick middle middle
TILE9_BRICK_MR          = $5A   ; Sand brick middle right
TILE9_BRICK_LL          = $5B   ; Sand brick lower left
TILE9_BRICK_LM          = $5C   ; Sand brick lower middle
TILE9_BRICK_LR          = $5D   ; Sand brick lower right
TILE9_SPIKEDOWN         = $7D   ; Spikes pointing downward
TILE9_SPIKEUP           = $7E   ; Spikes pointing upward
TILE9_BLOCK             = $7F   ; A simple orange block
TILE9_SKY               = $80   ; Sky
TILE9_BIGBLOCK_ML       = $81   ; Big block middle left
TILE9_BIGBLOCK_MM       = $82   ; Big block middle middle
TILE9_BIGBLOCK_MR       = $83   ; Big block middle right
TILE9_BIGBLOCK_LL       = $84   ; Big block lower left
TILE9_BIGBLOCK_LM       = $86   ; Big block lower middle
TILE9_BIGBLOCK_LR       = $87   ; Big block lower right
TILE9_THINVBLOCK_B      = $88   ; Thin vertical block bottom
TILE9_PYRAMIDSH_SLOPE   = $8B   ; Pyramid shaded sloped edge
TILE9_PYRAMIDSH         = $8C   ; Pyramid shaded fill
TILE9_TREETOP_LEFT      = $8F   ; Tree top left


TILE9_TREETOP_MIDDLE    = $90   ; Tree top middle
TILE9_TREETOP_RIGHT     = $91   ; Tree top right
TILE9_TREE              = $92   ; Tree trunk
TILE9_CACTUS            = $93   ; BG cactus
TILE9_ALTBACKGROUND     = $97   ; Alternate background?
TILE9_BIGBLOCK_UL       = $98   ; Big block upper left
TILE9_BIGBLOCK_UM       = $99   ; Big block upper middle
TILE9_BIGBLOCK_UR       = $9A   ; Big block upper right
TILE9_THINVBLOCK_T      = $9B   ; Thin vertical block top
TILE9_THINHBLOCK_L      = $9C   ; Thin horizontal block left

TILE9_THINHBLOCK_R      = $9D   ; Thin horizontal block right
TILE9_PIPEWORKS_CRACK   = $C8   ; Cracked pipe hole
TILE9_PIPEWORKS_GROUNDL = $C9   ; Pipeworks left ground connection
TILE9_PIPEWORKS_GROUNDR = $CA   ; Pipeworks right ground connection
TILE9_PIPEWORKS_JCT     = $E2   ; Pipeworks breakable junction (UNUSED)
TILE9_PIPEWORKS_CORNER  = $E3   ; Pipeworks corner
TILE9_PIPEWORKS_H       = $E4   ; Pipeworks horizontal
TILE9_PIPEWORKS_V       = $E5   ; Pipeworks vertical
TILE9_CANNONBLOCK       = $E6   ; Block which surrounds cannon
TILE9_PIPEWORKS_GROUND  = $E7   ; Pipeworks ground connection
TILE9_CANNONTOP1        = $ED   ; Upper top of cannon
TILE9_CANNONTOP2        = $EE   ; Lower top of cannon
TILE9_CANNONMID         = $ED   ; Mid part to ground

; Tileset 10 (Airship)
TILE10_SKY              = $06   ; Sky
TILE10_UPRIGHTCANNON_L  = $24   ; Upright cannon pointing left
TILE10_UPRIGHTCANNON_R  = $25   ; Upright cannon pointing right
TILE10_CEILINGCANNON_L  = $26   ; Ceiling cannon pointing left
TILE10_CEILINGCANNON_R  = $27   ; Ceiling cannon pointing right
TILE10_BIGCANNONMID_T   = $28   ; Big cannon middle top
TILE10_BIGCANNONEND_T   = $29   ; Big cannon end top
TILE10_BIGCANNONMID_B   = $2A   ; Big cannon middle bottom
TILE10_BIGCANNONEND_B   = $2B   ; Big cannon end bottom
TILE10_LILCANNON_END    = $2C   ; Little cannon end
TILE10_LILCANNON_MID    = $2D   ; Little cannon mid
TILE10_WARGROUND_UL     = $33   ; "War ground" upper left
TILE10_WARGROUND_UR     = $34   ; "War ground" upper right
TILE10_WARGROUND_LL     = $35   ; "War ground" lower left
TILE10_WARGROUND_LR     = $36   ; "War ground" lower right
TILE10_INVISSOLID       = $37   ; Generally solid in other tilsets, invisible here?
TILE10_CRATE_ML         = $49   ; Crate middle left
TILE10_CRATE_MM         = $4A   ; Crate middle middle
TILE10_CRATE_MR         = $4B   ; Crate middle right
TILE10_CRATE_LL         = $4C        ; Crate lower left
TILE10_CRATE_LM         = $4D   ; Crate lower middle
TILE10_CRATE_LR         = $4E   ; Crate lower right
TILE10_SUPPORT_UL       = $4F   ; Wooden supports upper left
TILE10_SUPPORT_UM       = $50   ; Wooden supports upper middle
TILE10_SUPPORT_UR       = $51   ; Wooden supports upper right
TILE10_SUPPORT_LL       = $52   ; Wooden supports lower left
TILE10_SUPPORT_LM       = $53   ; Wooden supports lower middle
TILE10_SUPPORT_LR       = $54   ; Wooden supports lower right
TILE10_SUPPORT_ML       = $55   ; Wooden supports middle left
TILE10_SUPPORT_MR       = $56   ; Wooden supports middle right
TILE10_WOODFLOOR_THK_L  = $57   ; Wood floor thick left
TILE10_WOODFLOOR_THK_R  = $58   ; Wood floor thick right
TILE10_WOODFLOOR_1      = $59   ; Wood floor misc 1
TILE10_WOODFLOOR_2      = $5A   ; Wood floor misc 2
TILE10_WOODFLOOR_3      = $5B   ; Wood floor misc 3
TILE10_CRATE_UL         = $5C   ; Crate upper left
TILE10_CRATE_UM         = $5D   ; Crate upper middle
TILE10_CRATE_UR         = $5E   ; Crate upper right
TILE10_BLACK            = $80   ; Black
TILE10_THREAD_H         = $81   ; Thread horizontal
TILE10_THREAD_V         = $82   ; Thread vertical
TILE10_SCREW_H          = $83   ; Screw horizontal
TILE10_SCREW_V          = $84   ; Screw vertical
TILE10_METALBG          = $86   ; Metal background
TILE10_METSUPPORT_LT    = $87   ; Metal support left top
TILE10_METSUPPORT_LM    = $88   ; Metal support left mid
TILE10_METSUPPORT_LB    = $89   ; Metal support left bottom
TILE10_METSUPPORT_RT    = $8A   ; Metal support right top
TILE10_METSUPPORT_RM    = $8B   ; Metal support right mid
TILE10_METSUPPORT_RB    = $8C   ; Metal support right bottom
TILE10_METSUPPORT_ML    = $8D   ; Metal support middle left
TILE10_METSUPPORT_MR    = $8E   ; Metal support middle left
TILE10_METALPLATE_LL    = $8F   ; Metal plate lower left
TILE10_METALPLATE_LM    = $90   ; Metal plate lower middle
TILE10_METALPLATE_LR    = $91   ; Metal plate lower right
TILE10_4WAYCANNON_90_UL = $92   ; 4-way cannon at 90 degrees upper left
TILE10_4WAYCANNON_90_UR = $93   ; 4-way cannon at 90 degrees upper right
TILE10_4WAYCANNON_90_LL = $94   ; 4-way cannon at 90 degrees lower left
TILE10_4WAYCANNON_90_LR = $95   ; 4-way cannon at 90 degrees lower right
TILE10_4WAYCANNON_45_UL = $96   ; 4-way cannon at 45 degrees upper left
TILE10_4WAYCANNON_45_UR = $97   ; 4-way cannon at 45 degrees upper right
TILE10_4WAYCANNON_45_LL = $98   ; 4-way cannon at 45 degrees lower left
TILE10_4WAYCANNON_45_LR = $99   ; 4-way cannon at 45 degrees lower right
TILE10_4WAYCANNON_MNT_L = $9A   ; 4-way cannon ceiling mount left
TILE10_4WAYCANNON_MNT_R = $9B   ; 4-way cannon ceiling mount right
TILE10_BOLT_V           = $9C   ; Bolt vertical
TILE10_BOLT_H           = $9D   ; Bolt horizontal
TILE10_METSUPPORT_UM    = $9E   ; Metal support upper middle
TILE10_METSUPPORT_UL    = $9F   ; Metal support upper left
TILE10_METSUPPORT_UR    = $A0   ; Metal support upper right
TILE10_METSUPPORT_LL    = $A1   ; Metal support lower left
TILE10_METSUPPORT_LR    = $A2   ; Metal support lower right
TILE10_METALPLATE_UL    = $A3   ; Metal plate upper left
TILE10_METALPLATE_UM    = $A4   ; Metal plate upper middle
TILE10_METALPLATE_UR    = $A5   ; Metal plate upper right
TILE10_FLAMEJET_H       = $A6   ; Flamejet horizontal
TILE10_FLAMEJET_V       = $A7   ; Flamejet vertical
TILE10_WALLCANNONF_UL   = $A8   ; Wall cannon "forward" (a la the slash) upper left
TILE10_WALLCANNONF_LL   = $A9   ; Wall cannon "forward" (a la the slash) lower left
TILE10_WALLCANNONF_UR   = $AA   ; Wall cannon "forward" (a la the slash) upper right
TILE10_WALLCANNONF_LR   = $AB   ; Wall cannon "forward" (a la the slash) lower right
TILE10_WALLCANNONB_UL   = $AC   ; Wall cannon "backward" (a la the slash) upper left
TILE10_WALLCANNONB_UR   = $BD   ; Wall cannon "backward" (a la the slash) upper right
TILE10_WALLCANNONB_LL   = $BE   ; Wall cannon "backward" (a la the slash) lower left
TILE10_WALLCANNONB_LR   = $BF   ; Wall cannon "backward" (a la the slash) lower right
TILE10_WOODUNDERCURVE_L = $C0   ; Wood underside curve left
TILE10_WOODUNDERCURVE_R = $C2   ; Wood underside curve right
TILE10_ROCKYWRENCH_HOLE = $C3   ; Rocky Wrench's hole
TILE10_ROPERAIL         = $C6   ; Rope railing (near end pipe)
TILE10_ROPERAIL_END     = $C7   ; Rope railing end
TILE10_STOWEDANCHOR     = $C8   ; Stowed anchor at front of ship
TILE10_PORTHOLE         = $C9   ; Port hole (circular window)
TILE10_WOODH_L          = $E2   ; Wood log horizontal left
TILE10_WOODH_M1         = $E3   ; Wood log horizontal middle 1
TILE10_WOODH_M2         = $E4   ; Wood log horizontal middle 2
TILE10_WOODH_R          = $E5   ; Wood log horizontal right
TILE10_WOODV_T          = $E6   ; Wood log vertical top
TILE10_WOODV_M1         = $E7   ; Wood log vertical middle 1
TILE10_WOODV_M2         = $E8   ; Wood log vertical middle 2
TILE10_WOODV_B          = $E9   ; Wood log vertical bottom
TILE10_WOODTHICK_UL     = $EA   ; Wood thick upper left
TILE10_WOODTHICK_UR     = $EB   ; Wood thick upper left
TILE10_WOODTHICK_M1L    = $EC   ; Wood thick middle 1 left
TILE10_WOODTHICK_M1R    = $ED   ; Wood thick middle 1 right
TILE10_WOODTHICK_M2L    = $EE   ; Wood thick middle 2 left
TILE10_WOODTHICK_M2R    = $EF   ; Wood thick middle 2 right
TILE10_WOODTHICK_LL     = $F4   ; Wood thick lower left
TILE10_WOODTHICK_LR     = $F5   ; Wood thick lower left
TILE10_WOODTIP_SHORT    = $F6   ; Wood tip short
TILE10_WOODTIP_LONGL    = $F7   ; Wood tip long left
TILE10_WOODTIP_LONGR    = $F8   ; Wood tip long right
TILE10_WOODBOTTOM_L     = $F9   ; Wood bottom left
TILE10_WOODBOTTOM_M1    = $FA   ; Wood bottom middle 1
TILE10_WOODBOTTOM_M2    = $FB   ; Wood bottom middle 2
TILE10_WOODBOTTOM_R     = $FC   ; Wood bottom right
TILE10_LEDGE            = $FD   ; Wood ledge
TILE10_REARTIP          = $FE   ; Wood rear tip

; Tileset 11 (Giant World)
TILE11_JCLOUD_LL        = $02   ; Giant Judgem's Cloud Lower Left
TILE11_JCLOUD_LR        = $06   ; Giant Judgem's Cloud Lower Right
TILE11_JCLOUD_UL        = $1F   ; Giant Judgem's Cloud Upper Left
TILE11_JCLOUD_UR        = $20   ; Giant Judgem's Cloud Upper Right

TILE11_BRICK_UL         = $47   ; Giant brick upper left
TILE11_BRICK_UR         = $48   ; Giant brick upper right
TILE11_BRICK_LL         = $49   ; Giant brick lower left
TILE11_BRICK_LR         = $4A   ; Giant brick lower right
TILE11_QBLOCKC_UL       = $4B   ; Giant [?] block (with coin) upper left
TILE11_QBLOCKC_UR       = $4C   ; Giant [?] block (with coin) upper right
TILE11_QBLOCKC_LL       = $4D   ; Giant [?] block (with coin) lower left
TILE11_QBLOCKC_LR       = $4E   ; Giant [?] block (with coin) lower right
TILE11_WOOD_UL          = $4F   ; Giant wood block upper left
TILE11_WOOD_UR          = $50   ; Giant wood block upper right
TILE11_WOOD_LL          = $51   ; Giant wood block lower left
TILE11_WOOD_LR          = $52   ; Giant wood block lower right
TILE11_METAL_UL         = $53   ; Hit block metal plate upper left
TILE11_METAL_UR         = $54   ; Hit block metal plate upper right
TILE11_METAL_LL         = $55   ; Hit block metal plate lower left
TILE11_METAL_LR         = $56   ; Hit block metal plate lower right
TILE11_GROUND_UL        = $57   ; Giant ground upper left
TILE11_GROUND_UR        = $58   ; Giant ground upper left
TILE11_GROUND_LL        = $59   ; Giant ground upper left
TILE11_GROUND_LR        = $5A   ; Giant ground upper left
TILE11_QBLOCKP_UL       = $5B   ; Giant [?] block (with leaf) upper left
TILE11_QBLOCKP_UR       = $5C   ; Giant [?] block (with leaf) upper right
TILE11_QBLOCKP_LL       = $5D   ; Giant [?] block (with leaf) lower left
TILE11_QBLOCKP_LR       = $5E   ; Giant [?] block (with leaf) lower right

TILE11_SKY              = $80

TILE11_HILL_PEAK        = $89   ; Giant hill peak 
TILE11_HILL_LSLOPE      = $8A   ; Giant hill left slope
TILE11_HILL_MID         = $8B   ; Giant hill filler
TILE11_HILL_RSLOPE      = $8C   ; Giant hill right slope

TILE11_PIPE_UL          = $A4   ; Giant Pipe Upper Left
TILE11_PIPE_UM          = $A5   ; Giant Pipe Upper Middle
TILE11_PIPE_UR          = $A6   ; Giant Pipe Upper Right
TILE11_PIPE_ML          = $A7   ; Giant Pipe Middle Left
TILE11_PIPE_MM          = $A8   ; Giant Pipe Middle Middle
TILE11_PIPE_MR          = $A9   ; Giant Pipe Middle Right
TILE11_PIPE_LL          = $AA   ; Giant Pipe Lower Left
TILE11_PIPE_LM          = $AB   ; Giant Pipe Lower Middle
TILE11_PIPE_LR          = $AC   ; Giant Pipe Lower Right

TILE11_CORAL_UL         = $F4   ; Giant coral upper left
TILE11_CORAL_UR         = $F5   ; Giant coral upper right

TILE11_CORAL_LL         = $F6   ; Giant coral lower left
TILE11_CORAL_LR         = $F7   ; Giant coral lower right

; Tileset 12 (Ice, technically shares with Tileset 4)
TILE12_CLOUD_UL         = $08   ; Cloud upper left
TILE12_CLOUD_UM         = $09   ; Cloud upper middle
TILE12_CLOUD_UR         = $0A   ; Cloud upper right
TILE12_CLOUD_LL         = $0B   ; Cloud lower left
TILE12_CLOUD_LM         = $0C   ; Cloud lower middle
TILE12_CLOUD_LR         = $0D   ; Cloud lower right

TILE12_SNOWBLOCK_LL     = $0E   ; Snow platform, lower left
TILE12_SNOWBLOCK_LM     = $0F   ; Snow platform, lower middle
TILE12_SNOWBLOCK_LR     = $10   ; Snow platform, lower right

TILE12_SNOWBLOCK_UL     = $22   ; Snow platform, upper left
TILE12_SNOWBLOCK_UM     = $23   ; Snow platform, upper middle
TILE12_SNOWBLOCK_UR     = $24   ; Snow platform, upper right

TILE12_SNOWY_M          = $25   ; Middle of large snowy platform

TILE12_LARGEICEBLOCK_UL = $36   ; Large 2x2 ice block, upper left
TILE12_LARGEICEBLOCK_UR = $37   ; Large 2x2 ice block, upper right
TILE12_LARGEICEBLOCK_LL = $38   ; Large 2x2 ice block, lower left
TILE12_LARGEICEBLOCK_LR = $39   ; Large 2x2 ice block, lower right

TILE12_ICEBLOCK         = $3A   ; Ice block

TILE12_GROUND_L         = $4A   ; Solid bottom ground left
TILE12_GROUND_M         = $4B   ; Solid bottom ground middle
TILE12_GROUND_R         = $4C   ; Solid bottom ground right

TILE12_FROZENCOIN       = $55   ; Frozen coin
TILE12_FROZENMUNCHER    = $56   ; Frozen muncher

TILE12_SKY              = $80   ; Sky
TILE12_SNOWGREEN_UL     = $8E   ; Frosty green platform, upper left
TILE12_SNOWGREEN_UM     = $8F   ; Frosty green platform, upper middle
TILE12_SNOWGREEN_UR     = $90   ; Frosty green platform, upper right


; Tileset 13 (Sky areas, inc. coin heaven)
TILE13_GOALBLACK        = $00   ; Goal darkness
TILE13_GOALEDGE         = $01   ; Goal edge
TILE13_STARS1           = $07   ; Stars!  (Lost level)
TILE13_STARS2           = $08   ; Stars!  (Lost level)
TILE13_STARS3           = $09   ; Stars!  (Lost level)
TILE13_DBLCLOUD_UM      = $0A   ; Double cloud upper middle
TILE13_DBLCLOUD_BM      = $0B   ; Double cloud bottom middle
TILE13_DBLCLOUD_BR      = $0C   ; Double cloud bottom right
TILE13_DBLCLOUD_BL      = $0D   ; Double cloud bottom left
TILE13_DBLCLOUD_UL      = $0E   ; Double cloud upper left
TILE13_DBLCLOUD_UR      = $0F   ; Double cloud upper right
TILE13_GOALBLACKCLOUD   = $10   ; Goal darkness on top of cloud
TILE13_GOALEDGECLOUD    = $11   ; Goal edge on top of cloud
TILE13_DBLCLOUD_LM      = $21   ; Double cloud lower middle
TILE13_DBLCLOUD_MM      = $22   ; Double cloud middle middle
TILE13_DBLCLOUD_LR      = $23   ; Double cloud lower right
TILE13_DBLCLOUD_MR      = $24   ; Double cloud middle right
TILE13_DBLCLOUD_LL      = $25   ; Double cloud lower left
TILE13_DBLCLOUD_ML      = $26   ; Double cloud middle left
TILE13_THICKCLOUD_LM    = $36   ; Thick cloud lower middle

; As far as I know, NONE of these are used, and they would have provided a fade
; from the bright skies of below into increasingly darker and eventually black
; sky... going into space perhaps?  Ultimately would have employed TILE13_STARS1/2/3
TILE13_SKY_DARKTOBLACK  = $81   ; Gradient dark to black
TILE13_SKY_LIGHTTODARK  = $82   ; Gradient light to dark
TILE13_SKY_BLACK        = $83   ; Black sky
TILE13_SKY_DARK         = $84   ; Dark sky
TILE13_SKY_LIGHT        = $86   ; Light sky
TILE13_SKY_DARKSTAR     = $87   ; Like TILE13_SKY_DARK, but one star visible
TILE13_SKY_DARKTOBLACKS = $88   ; Like TILE13_SKY_DARKTOBLACK, but one star visible

TILE13_ROUNDCLOUDBLU_T  = $C3   ; Round cloud (blue sky BG) top
TILE13_ROUNDCLOUDWHT_T  = $C4   ; Round cloud (white cloud BG) top
TILE13_CLOUD            = $C5   ; General white cloud filler
TILE13_BALLCLOUD_UL     = $C6   ; "Ball cloud" formation with ball formation upper left
TILE13_BALLCLOUD_UR     = $C7   ; "Ball cloud" formation with ball formation upper right
TILE13_BALLCLOUD_LL     = $C8   ; "Ball cloud" formation with ball formation lower left
TILE13_BALLCLOUD_LR     = $C9   ; "Ball cloud" formation with ball formation lower right
TILE13_ROUNDCLOUDLAR_LT = $CA   ; Round cloud (large round cloud BG) left top
TILE13_ROUNDCLOUDLAR_RT = $CB   ; Round cloud (large round cloud BG) right top
TILE13_SKY              = $CC   ; Sky

TILE13_LARGEROUND_UL    = $CD   ; Large round cloud upper left
TILE13_LARGEROUND_UR    = $CE   ; Large round cloud upper right
TILE13_LARGEROUND_LL    = $CF   ; Large round cloud lower left
TILE13_LARGEROUND_LR    = $D0   ; Large round cloud lower right

TILE13_LONGCLOUDWHIT_UL = $D1   ; Long cloud (white cloud BG) upper left
TILE13_LONGCLOUDWHIT_UM = $D2   ; Long cloud (white cloud BG) upper middle
TILE13_LONGCLOUDWHIT_UR = $D3   ; Long cloud (white cloud BG) upper right
TILE13_LONGCLOUDBLUE_UL = $D4   ; Long cloud (blue sky BG) upper left
TILE13_LONGCLOUDBLUE_UM = $D5   ; Long cloud (blue sky BG) upper middle
TILE13_LONGCLOUDBLUE_UR = $D6   ; Long cloud (blue sky BG) upper right

TILE13_POINTYCLOUDBLU_L = $E2   ; Pointy-end cloud platform (blue sky BG) left
TILE13_POINTYCLOUDBLU_M = $E3   ; Pointy-end cloud platform (blue sky BG) middle
TILE13_POINTYCLOUDBLU_R = $E4   ; Pointy-end cloud platform (blue sky BG) right
TILE13_POINTYCLOUDWHT_L = $E5   ; Pointy-end cloud platform (white cloud BG) left
TILE13_POINTYCLOUDWHT_M = $E6   ; Pointy-end cloud platform (white cloud BG) middle
TILE13_POINTYCLOUDWHT_R = $E7   ; Pointy-end cloud platform (white cloud BG) right

TILE13_LONGCLOUDWHIT_LL = $E8   ; Long cloud (white cloud BG) lower left
TILE13_LONGCLOUDWHIT_LM = $E9   ; Long cloud (white cloud BG) lower middle
TILE13_LONGCLOUDWHIT_LR = $EA   ; Long cloud (white cloud BG) lower right
TILE13_LONGCLOUDBLUE_LL = $EB   ; Long cloud (blue sky BG) lower left
TILE13_LONGCLOUDBLUE_LM = $EC   ; Long cloud (blue sky BG) lower middle
TILE13_LONGCLOUDBLUE_LR = $ED   ; Long cloud (blue sky BG) lower right
TILE13_ROUNDCLOUDLAY_T  = $EE   ; Round cloud (cloud overlay BG) top

; Tileset 14 (Underground style)
TILE14_SKY              = $02   ; Sky
TILE14_ABOVE_SLOPE45B2T = $25   ; Above ground 45 degree slope, bottom-to-top
TILE14_ABOVE_HORZGROUND = $26   ; Above ground horizontal ground
TILE14_ABOVE_SLOPE45T2B = $27   ; Above ground 45 degree slope, top-to-bottom
TILE14_ABOVE_SLOPE225B2T_L= $28 ; Underwater 22.5 degree slope, bottom-to-top, lower
TILE14_ABOVE_SLOPE225B2T_U= $29 ; Underwater 22.5 degree slope, bottom-to-top, upper


TILE14_ABOVE_SLOPE225T2B_U= $2A ; Underwater 22.5 degree slope, top-to-bottom, lower
TILE14_ABOVE_SLOPE225T2B_L= $2B ; Underwater 22.5 degree slope, top-to-bottom, upper
TILE14_ABOVE_CORNER_UL  = $33   ; Above ground upper left corner
TILE14_ABOVE_CORNER_UR  = $35   ; Above ground upper right corner

TILE14_ABOVE_VERTGROUNDL= $34   ; Above ground vertical ground left edge
TILE14_ABOVE_VERTGROUNDR= $36   ; Above ground vertical ground right edge
TILE14_ABOVE_MIDGROUND  = $37   ; Above ground Middle ground
TILE14_SLOPE45T2B_CEIL  = $A0   ; Ceiling slope 45 degrees, top-to-bottom
TILE14_SLOPE45B2T_CEIL  = $A1   ; Ceiling slope 45 degrees, bottom-to-top
TILE14_SLOPE225T2B_L_CEIL= $A2  ; Ceiling 22.5 degree slope, top-to-bottom, lower
TILE14_SLOPE225T2B_U_CEIL= $A3  ; Ceiling 22.5 degree slope, top-to-bottom, upper
TILE14_SLOPE225B2T_U_CEIL= $A4  ; Ceiling 22.5 degree slope, bottom-to-top, lower
TILE14_SLOPE225B2T_L_CEIL= $A5  ; Ceiling 22.5 degree slope, bottom-to-top, upper
TILE14_WSLOPE45T2B_CEIL = $E9   ; Underwater Ceiling slope 45 degrees, top-to-bottom
TILE14_WSLOPE45B2T_CEIL = $EA   ; Underwater Ceiling slope 45 degrees, bottom-to-top
TILE14_WSLOPE225T2B_L_CEIL= $EB ; Underwater Ceiling 22.5 degree slope, top-to-bottom, lower
TILE14_WSLOPE225T2B_U_CEIL= $EC ; Underwater Ceiling 22.5 degree slope, top-to-bottom, upper
TILE14_WSLOPE225B2T_U_CEIL= $ED ; Underwater Ceiling 22.5 degree slope, bottom-to-top, lower
TILE14_WSLOPE225B2T_L_CEIL= $EE ; Underwater Ceiling 22.5 degree slope, bottom-to-top, upper

; Tileset 15/16/17 (Bonus Games)
TILE15_BLACK            = $09   ; Black
TILE15_WHITESPACE_PAL0  = $0A   ; White space tile in palette 0

TILE15_BRICKBG          = $40   ; White/pink brick in the background

TILE15_PLAYERRAC_TOPM   = $41   ; Middle of Top of Raccoon Player at table
TILE15_PLAYERRAC_TOPR   = $42   ; Right of Top of Raccoon Player at table

TILE15_PLAYERBIG_HEADL  = $43   ; Left Head of Big Player at table
TILE15_PLAYERBIG_HEADM  = $44   ; Middle Head of Big Player at table
TILE15_PLAYERBIG_HEADR  = $45   ; Right Head of Big Player at table
TILE15_PLAYERBIG_RACL   = $46   ; Bottom left of Raccoon Player at table
TILE15_PLAYERBIG_TOPM   = $47   ; Middle of Top of Big Player at table
TILE15_PLAYERBIG_TOPR   = $48   ; Right of Top of Big Player at table
TILE15_PLAYERBIG_BOTL   = $49   ; Bottom left of Big Player at table
TILE15_PLAYERSM_TOP     = $4A   ; Top of Small Player at table

TILE15_UNKTALL_UL       = $4B   ; Tile for unknown tall thing top upper left
TILE15_UNKTALL_UR       = $4C   ; Tile for unknown tall thing top upper right
TILE15_UNKTALL_R1L      = $4D   ; Tile for unknown tall thing top row 1 left
TILE15_UNKTALL_R1R      = $4E   ; Tile for unknown tall thing top row 1 right
TILE15_UNKTALL_R2L      = $4F   ; Tile for unknown tall thing top row 2 left
TILE15_UNKTALL_R2R      = $50   ; Tile for unknown tall thing top row 2 right
TILE15_UNKTALL_LL       = $51   ; Tile for unknown tall thing top lower left
TILE15_UNKTALL_LR       = $52   ; Tile for unknown tall thing top lower right

TILE15_PLAYERBIG_TORL   = $80   ; Left Torso of Big Player at table
TILE15_PLAYERBIG_TORM   = $81   ; Middle Torso of Big Player at table
TILE15_PLAYERBIG_TORR   = $82   ; Right Torso of Big Player at table

TILE15_PLAYERBIG_RACM   = $83   ; Bottom middle of Raccoon Player at table
TILE15_PLAYERBIG_BOTR   = $84   ; Bottom right of Big Player at table
TILE15_PLAYERBIG_BOTM   = $85   ; Bottom middle of Big Player at table
TILE15_PLAYERSM_BOTTOM  = $86   ; Bottom of Small Player at table

TILE15_BRICKFLOOR       = $C0   ; Orange brick making up the floor
TILE15_BORDER_UL        = $C1   ; Host greet border upper left
TILE15_BORDER_ML        = $C2   ; Host greet border middle left
TILE15_BORDER_LL        = $C3   ; Host greet border lower left
TILE15_BORDER_UM        = $C4   ; Host greet border upper middle
TILE15_BORDER_LM        = $C5   ; Host greet border lower middle
TILE15_BORDER_UR        = $C6   ; Host greet border upper right
TILE15_BORDER_MR        = $C7   ; Host greet border middle right
TILE15_BORDER_LR        = $C8   ; Host greet border lower right
TILE15_WHITESPACE_PAL3  = $CD   ; White space tile in palette 3
TILE15_TABLE_UL         = $CE   ; Table upper left
TILE15_TABLE_UM         = $CF   ; Table upper middle
TILE15_TABLE_UR         = $D0   ; Table upper left

TILE15_TABLE_LL         = $D1   ; Table lower left
TILE15_TABLE_LM         = $D2   ; Table lower middle
TILE15_TABLE_LR         = $D3   ; Table lower left


; Tileset 18 (2P Vs)
; NOTE: Several tiles 
TILE18_BLACK            = $02   ; Black tile

TILE18_MSTATUS_UL       = $44
TILE18_STATUS_UM        = $45
TILE18_MSTATUS_UR       = $46
TILE18_LSTATUS_UL       = $47
TILE18_LSTATUS_UR       = $48

TILE18_MSTATUS_LL       = $49
TILE18_MSTATUS_LML      = $4A
TILE18_STATUS_LM        = $4B
TILE18_MSTATUS_LR       = $4C
TILE18_LSTATUS_LL       = $4D
TILE18_LSTATUS_LML      = $4E
TILE18_LSTATUS_LR       = $4F


TILE18_BRICKFLOOR       = $50   ; Brick floor tiles
TILE18_DIAMOND          = $51   ; NOT USED SMB1-ish diamond blocks
TILE18_QBLOCK           = $BC
TILE18_LADDER           = $C0   ; Ladder (used in final variation)
TILE18_BOUNCEBLOCK      = $C1   ; Block that bounces when Player hits underneath it
TILE18_BOUNCEDBLOCK     = $C2   ; Temporary tile for when block has been bounced

BANK_Tile_Layout_TS0           = 12
BANK_Tile_Layout_TS1           = 15
BANK_Tile_Layout_TS2           = 21
BANK_Tile_Layout_TS3           = 16
BANK_Tile_Layout_TS4_TS12      = 17
BANK_Tile_Layout_TS5_TS11_TS13 = 19
BANK_Tile_Layout_TS6_TS7_TS8   = 18
BANK_Tile_Layout_TS9           = 20
BANK_Tile_Layout_TS10          = 23
BANK_Tile_Layout_TS14          = 13

; Some constants specific to title screen; they don't really match up with the gameplay
FALL_NORMAL                    = 5 ; Normal fall rate added to 'Y'
FALL_TAILWAG                   = 1 ; Adjusted fall rate for when wagging raccoon tail
FALL_OBJECT                    = 4 ; Fall rate for objects

FALLRATE_TAILWAGMAX            = 8 ; Maximum Y velocity falling rate when wagging raccoon tail
FALLRATE_MAX                   = $40 ; Maximum Y velocity falling rate
FALLRATE_OBJECTMAX             = $60 ; Maximum Y velocity falling rate of an object
