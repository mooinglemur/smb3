	.inesprg 16  ; 16x 16KB PRG code (32 banks of 8KB)
	.ineschr 16  ; 16x  8KB CHR data (128 banks of 1KB)
	.inesmap 4   ; mapper 4 = MMC3, 8KB PRG, 1/2KB CHR bank swapping
	.inesmir 0   ; background mirroring


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SMB3 RAM DEFS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (.*?)\s*=.*?;
; \t\1:\t\t.ds 1\t;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ASM INCLUDES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Object support routines
	.bank 0
	.org $C000
	.include "PRG/prg000.asm"

	; Objects $00-$23
	.bank 1
	.org $A000
	.include "PRG/prg001.asm"

	; Objects $24-$47
	.bank 2
	.org $A000
	.include "PRG/prg002.asm"

	; Objects $48-$6B
	.bank 3
	.org $A000
	.include "PRG/prg003.asm"

	; Objects $6C-$8F
	.bank 4
	.org $A000
	.include "PRG/prg004.asm"

	; Objects $90-$B3 and special-function object placeholders ($B4-$BC, $D1-$D6)
	.bank 5
	.org $A000
	.include "PRG/prg005.asm"

	; Object placement/layout data (for levels)
	.bank 6
	.org $C000
	.include "PRG/prg006.asm"

	; Special Objects, Cannon Fire, and some miscellaneous routines
	.bank 7
	.org $A000
	.include "PRG/prg007.asm"

	; Most of Player control code
	.bank 8
	.org $A000
	.include "PRG/prg008.asm"

	; 2P Vs and Autoscroll
	.bank 9
	.org $A000
	.include "PRG/prg009.asm"

	; Handles map BG graphics and logic code; also stores a few DMC samples
	.bank 10
	.org $C000
	.include "PRG/prg010.asm"

	; Main map logic and map sprites
	.bank 11
	.org $A000
	.include "PRG/prg011.asm"

	; Tileset 0 (Map), Map object code, map level layouts (links to level layouts/object sets), 
	; completion code, Airship / bonus host room / toad shop / coin ship / unused map object $0C layout pointers
	.bank 12
	.org $A000
	.include "PRG/prg012.asm"

	; Tileset 14 (Underground style)
	.bank 13
	.org $A000
	.include "PRG/prg013.asm"

	; Tileset 18 (2P Vs), 2P Vs battlefields, and shared level load routines
	.bank 14
	.org $C000
	.include "PRG/prg014.asm"

	; Tileset 1 (Plains style)
	.bank 15
	.org $A000
	.include "PRG/prg015.asm"

	; Tileset 3 (Hills style)
	.bank 16
	.org $A000
	.include "PRG/prg016.asm"

	; Tileset 4 (High-Up style) / 12 (Ice)
	.bank 17
	.org $A000
	.include "PRG/prg017.asm"

	; Tileset 6 (Water level), 7 (Toad house), 8 (Vertical levels typical of World 7)
	.bank 18
	.org $A000
	.include "PRG/prg018.asm"

	; Tileset 5 (World 7 plant infestations), 11 (Giant World), 13 (Sky areas, inc. coin heaven)
	.bank 19
	.org $A000
	.include "PRG/prg019.asm"

	; Tileset 9 (Desert)
	.bank 20
	.org $A000
	.include "PRG/prg020.asm"

	; Tileset 2 (Fortress)
	.bank 21
	.org $A000
	.include "PRG/prg021.asm"

	; Bonus games (Spade, N-Spade, and the lost games)
	.bank 22
	.org $C000
	.include "PRG/prg022.asm"

	; Tileset 10 (Airship)
	.bank 23
	.org $A000
	.include "PRG/prg023.asm"

	; Title screen, ending (logic and images), Toad and King cinematic (Pre-wand-return only!)
	; Also home a large copy/paste error from PRG022, first half of sprite lists for ending
	.bank 24
	.org $A000
	.include "PRG/prg024.asm"

	; Contains mostly command buffer graphics for title screen / ending (large images), 
	; second half of sprite lists for ending, and a table to access them
	.bank 25
	.org $C000
	.include "PRG/prg025.asm"

	; Tileset 15, 16, 17 (Bonus games)
	; Status bar routines (draw, use items, etc.), level junctions
	; (inc. pointers for Big [?] block area and generic pipe exits), border draw, fade routines
	.bank 26
	.org $A000
	.include "PRG/prg026.asm"

	; Palettes, palette routines, Toad and King Cinematic (Post-wand-return only!)
	.bank 27
	.org $A000
	.include "PRG/prg027.asm"

	; First bank of the sound engine
	.bank 28
	.org $A000
	.include "PRG/prg028.asm"

	; Some of the music segments, tile/block change event, pipe movement code, Toad House code,
	; Player's draw and animation routines
	.bank 29
	.org $C000
	.include "PRG/prg029.asm"

	; This bank is ALWAYS active in ROM, sitting at 8000h-9FFFh
	; Contains interrupt handling code and other constantly reused functionality
	.bank 30
	.org $8000
	.include "PRG/prg030.asm"

	; This bank is ALWAYS active in ROM, sitting at E000h-FFFFh
	; Contains interrupt handling code and other constantly reused functionality
	.bank 31
	.org $E000
	.include "PRG/prg031.asm"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CHR ROM BEGINS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.incchr "CHR/chr000.pcx"
	.incchr "CHR/chr001.pcx"
	.incchr "CHR/chr002.pcx"
	.incchr "CHR/chr003.pcx"
	.incchr "CHR/chr004.pcx"
	.incchr "CHR/chr005.pcx"
	.incchr "CHR/chr006.pcx"
	.incchr "CHR/chr007.pcx"
	.incchr "CHR/chr008.pcx"
	.incchr "CHR/chr009.pcx"
	.incchr "CHR/chr010.pcx"
	.incchr "CHR/chr011.pcx"
	.incchr "CHR/chr012.pcx"
	.incchr "CHR/chr013.pcx"
	.incchr "CHR/chr014.pcx"
	.incchr "CHR/chr015.pcx"
	.incchr "CHR/chr016.pcx"
	.incchr "CHR/chr017.pcx"
	.incchr "CHR/chr018.pcx"
	.incchr "CHR/chr019.pcx"
	.incchr "CHR/chr020.pcx"
	.incchr "CHR/chr021.pcx"
	.incchr "CHR/chr022.pcx"
	.incchr "CHR/chr023.pcx"

	.incchr "CHR/chr024.pcx"
	.incchr "CHR/chr025.pcx"
	.incchr "CHR/chr026.pcx"
	.incchr "CHR/chr027.pcx"
	.incchr "CHR/chr028.pcx"
	.incchr "CHR/chr029.pcx"
	.incchr "CHR/chr030.pcx"
	.incchr "CHR/chr031.pcx"
	.incchr "CHR/chr032.pcx"
	.incchr "CHR/chr033.pcx"
	.incchr "CHR/chr034.pcx"
	.incchr "CHR/chr035.pcx"
	.incchr "CHR/chr036.pcx"
	.incchr "CHR/chr037.pcx"

	.incchr "CHR/chr038.pcx"
	.incchr "CHR/chr039.pcx"
	.incchr "CHR/chr040.pcx"
	.incchr "CHR/chr041.pcx"
	.incchr "CHR/chr042.pcx"
	.incchr "CHR/chr043.pcx"
	.incchr "CHR/chr044.pcx"
	.incchr "CHR/chr045.pcx"
	.incchr "CHR/chr046.pcx"
	.incchr "CHR/chr047.pcx"
	.incchr "CHR/chr048.pcx"
	.incchr "CHR/chr049.pcx"
	.incchr "CHR/chr050.pcx"
	.incchr "CHR/chr051.pcx"
	.incchr "CHR/chr052.pcx"
	.incchr "CHR/chr053.pcx"
	.incchr "CHR/chr054.pcx"
	.incchr "CHR/chr055.pcx"
	.incchr "CHR/chr056.pcx"
	.incchr "CHR/chr057.pcx"
	.incchr "CHR/chr058.pcx"
	.incchr "CHR/chr059.pcx"
	.incchr "CHR/chr060.pcx"
	.incchr "CHR/chr061.pcx"
	.incchr "CHR/chr062.pcx"
	.incchr "CHR/chr063.pcx"
	.incchr "CHR/chr064.pcx"
	.incchr "CHR/chr065.pcx"
	.incchr "CHR/chr066.pcx"
	.incchr "CHR/chr067.pcx"
	.incchr "CHR/chr068.pcx"
	.incchr "CHR/chr069.pcx"
	.incchr "CHR/chr070.pcx"
	.incchr "CHR/chr071.pcx"
	.incchr "CHR/chr072.pcx"
	.incchr "CHR/chr073.pcx"
	.incchr "CHR/chr074.pcx"
	.incchr "CHR/chr075.pcx"
	.incchr "CHR/chr076.pcx"
	.incchr "CHR/chr077.pcx"
	.incchr "CHR/chr078.pcx"
	.incchr "CHR/chr079.pcx"
	.incchr "CHR/chr080.pcx"
	.incchr "CHR/chr081.pcx"
	.incchr "CHR/chr082.pcx"
	.incchr "CHR/chr083.pcx"
	.incchr "CHR/chr084.pcx"
	.incchr "CHR/chr085.pcx"
	.incchr "CHR/chr086.pcx"
	.incchr "CHR/chr087.pcx"
	.incchr "CHR/chr088.pcx"
	.incchr "CHR/chr089.pcx"
	.incchr "CHR/chr090.pcx"
	.incchr "CHR/chr091.pcx"
	.incchr "CHR/chr092.pcx"
	.incchr "CHR/chr093.pcx"
	.incchr "CHR/chr094.pcx"
	.incchr "CHR/chr095.pcx"
	.incchr "CHR/chr096.pcx"
	.incchr "CHR/chr097.pcx"
	.incchr "CHR/chr098.pcx"
	.incchr "CHR/chr099.pcx"
	.incchr "CHR/chr100.pcx"
	.incchr "CHR/chr101.pcx"
	.incchr "CHR/chr102.pcx"
	.incchr "CHR/chr103.pcx"
	.incchr "CHR/chr104.pcx"
	.incchr "CHR/chr105.pcx"
	.incchr "CHR/chr106.pcx"
	.incchr "CHR/chr107.pcx"
	.incchr "CHR/chr108.pcx"
	.incchr "CHR/chr109.pcx"
	.incchr "CHR/chr110.pcx"
	.incchr "CHR/chr111.pcx"
	.incchr "CHR/chr112.pcx"
	.incchr "CHR/chr113.pcx"
	.incchr "CHR/chr114.pcx"
	.incchr "CHR/chr115.pcx"
	.incchr "CHR/chr116.pcx"
	.incchr "CHR/chr117.pcx"
	.incchr "CHR/chr118.pcx"
	.incchr "CHR/chr119.pcx"
	.incchr "CHR/chr120.pcx"
	.incchr "CHR/chr121.pcx"
	.incchr "CHR/chr122.pcx"
	.incchr "CHR/chr123.pcx"
	.incchr "CHR/chr124.pcx"
	.incchr "CHR/chr125.pcx"
	.incchr "CHR/chr126.pcx"
	.incchr "CHR/chr127.pcx"

