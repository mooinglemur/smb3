# smb3
Disassembly of Super Mario Bros 3

Specifically for use with cc65 (https://github.com/cc65/cc65).

This is a conversion of the nesasm/DCC6502 disassembly by Southbird (https://github.com/captainsouthbird/smb3) into cc65 format.  With the `nes` target, this will reassemble into a byte-for-byte perfect clone of Super Mario Bros. 3 US (PRG1).  In addition, code has been added to allow the game to build and run on the Commander X16 using the `x16` target.

-------------

## NES build

To assemble, simply run:

`make nes`

This will create the file `SMB3-NES.NES`.

Requires:
* A recent version of python3 with the PIL module to let the conversion script interpret the PCX assets into CHR ROM format
* cc65 and make

## Commander X16 build

To assemble, simply run:

`make x16`

This will create the files `SMB3-X16.PRG` and `TANOOKI.BIN`.  Place both files in the same directory. Load and run `SMB3-X16.PRG` on the Commander X16 or X16 Emulator.

Requires:
* A recent version of python3 with the PIL module to let the conversion script interpret the PCX assets into VERA tile/sprite format
* cc65 and make

Known issues with the X16 build:
* Visual glitches:
 * The wrong tileset may show for a single frame immediately after a map or level is loaded
 * Player sprite is not properly occluded when entering or emerging from a pipe
 * Emerging powerups and piranha plants in pipes may show the wrong masking sprite
 * World map visuals are corrupted when scrolled.
 * When having fewer than 10 coins, the tens digit of the coin count may show the wrong glyph in place of a space on the world map
* Gameplay issues:
 * Directional lifts and donut blocks may misbehave in vertical levels
 * 2 player versus mode is not working (level loads and then soft-locks)
 * Sorry, the 7-1 wrong warp will not lead to the credits due to the vastly different memory layout. ;)
