.segment "COMMONZP": zeropage

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM COMMON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Common use zero page RAM.  Bytes in $75-$F3 are context-dependent
; For clarification, none of the other "Temp" vars are damaged by NMI,
; the NMI does employ Temp_Var1-3, and restores them when it's done.

Temp_Var1:            ; Temporary storage variable (protected from damage by NMI)
	.res 1
Temp_Var2:            ; Temporary storage variable (protected from damage by NMI)
	.res 1
Temp_Var3:            ; Temporary storage variable (protected from damage by NMI)
	.res 1
Temp_Var4:            ; Temporary storage variable
	.res 1
Temp_Var5:            ; Temporary storage variable
	.res 1
Temp_Var6:            ; Temporary storage variable
	.res 1
Temp_Var7:            ; Temporary storage variable
	.res 1
Temp_Var8:            ; Temporary storage variable
	.res 1
Temp_Var9:            ; Temporary storage variable
	.res 1
Temp_Var10:           ; Temporary storage variable
	.res 1
Temp_Var11:           ; Temporary storage variable
	.res 1
Temp_Var12:           ; Temporary storage variable
	.res 1
Temp_Var13:           ; Temporary storage variable
	.res 1
Temp_Var14:           ; Temporary storage variable
	.res 1
Temp_Var15:           ; Temporary storage variable
	.res 1
Temp_Var16:           ; Temporary storage variable
	.res 1


VBlank_Tick:          ; can be used for timing, or knowing when an NMI just fired off
	.res 1

; unused
	.res 1

Horz_Scroll_Hi:       ; Provides a "High" byte for horizontally scrolling, or could be phrased as "current screen"
	.res 1

PPU_CTL1_Mod:         ; NOT DURING GAMEPLAY, this is used as an additional modifier to PPU_CTL1
Vert_Scroll_Hi:       ; Provides a "High" byte for vertically scrolling (only used during vertical levels!)
	.res 1

Level_ExitToMap:      ; When non-zero, kicks back to map (OR to event when Player_FallToKing or Player_RescuePrincess is nonzero!)
	.res 1

Counter_1:            ; This value simply increments every frame, used for timing various things
	.res 1

PPU_CTL2_Copy:        ; Essentially a copy of PPU_CTL2, which updates it as well, though the sprite/BG visibility setting is usually (always?) forced on
	.res 1

Pad_Holding:          ; Active player's inputs (i.e. 1P or 2P, whoever's playing) buttons being held in (continuous)
	.res 1
Pad_Input:            ; Active player's inputs (i.e. 1P or 2P, whoever's playing) buttons newly pressed only (one shot)
	.res 1

Roulette_RowIdx:      ; Roulette Bonus Game only obviously
	.res 1

; Pal_Force_Set12:
; This overrides the normal palette routine of selecting by Level_Tileset and
; loading the color sets PalSel_Tile_Colors/PalSel_Obj_Colors.  Setting
; Pal_Force_Set12 to a non-zero value will select as the index instead of
; Level_Tileset, and then it will copy the first two sets of 16 colors from
; the palette data as bg / sprite colors.  FIXME is this used though??
Pal_Force_Set12:
	.res 1

PlantInfest_ACnt:     ; Plant infestation level animation counter
	.res 1

VBlank_TickEn:        ; Enables the VBlank_Tick decrement and typically other things like joypad reading
	.res 1

Map_Enter2PFlag:      ; If $00, entering level, otherwise set if entering 2P VS mode
	.res 1

Map_EnterViaID:       ; Overrides whatever spot on the map you entered with something special (see Map_DoEnterViaID)
	.res 1

;unused
	.res 1

; $20 has a lot of different uses on the World Map...
Map_EnterLevelFX:     ; When entering a level on the map, dictates the status of the entry (0=None, 1=Boxing in, 2=Boxing out [J only]) NOTE: Overlap/reuse
Map_IntBoxErase:      ; Used for determining where in erasing the "World X" intro box we are NOTE: Overlap/reuse
Map_ClearLevelFXCnt:  ; Counter for "clear level" FX occurring (1-6: Poof, 7-9: Flip) ("poof"/"panel flip") NOTE: Overlap/reuse
Map_ScrollOddEven:    ; Toggles odd/even column as it scrolls
	.res 1

;unused
	.res 1

Level_Width:          ; Width of current level, in screens (0 = don't move at all, max is 15H/16V)
	.res 1

; In horizontal "typical" levels, Scroll_ColumnR/L are a column and
; levels are rendered in vertical stripes by these start points
Scroll_ColumnR:       ; ($23) Current tile column (every 16px) of right side of screen (non-vertical level style ONLY)
	.res 1
Scroll_ColumnL:       ; ($24) Current tile column (every 16px) of left side of screen (non-vertical level style ONLY)
	.res 1

; NOTE, the following two are also $23/$24
; In vertical style levels, Scroll_VOffsetT/B are an offset into the
; visible tile grid, and levels are rendered in horizontal strips
Scroll_VOffsetT := Scroll_ColumnR  ; ($23) Current tile offset (every 16px) of top of screen (vertical level style ONLY)
Scroll_VOffsetB := Scroll_ColumnL  ; ($24) Current tile offset (every 16px) of bottom of screen (vertical level style ONLY)

Scroll_ColorStrip:    ; $25-$5A This stores a strip of just the upper 2 bits of a tile ($00, $40, $80, $C0) to produce attribute info
	.res 54

Scroll_LastDir:       ; 0=screen last moved right (or up, if vertical), 1=screen last moved left (or down, if vertical)
	.res 1

Scroll_RightUpd:      ; Indicates every 8 pixels update going to the right, or $FF if screen moves left
Scroll_VertUpd:       ; Indicates every 8 pixels update up or down, in vertical levels
	.res 1

Scroll_LeftUpd:       ; Indicates every 8 pixels update going to the left, or $FF if screen moves right
	.res 1

; Prepares to perform a Video_Update when possible, indexes the "Video_Upd_Table" 
; in PRG030 OR Video_Upd_Table2 in PRG025 (whichever is currently in context)
; Also resets the graphics buffer afterward, since the RAM buffer is
; constantly being called to possibly perform its own updates after this value
; resets to zero.
Graphics_Queue:
	.res 1

; unused ($5F-$60)
	.res 2

Level_LayPtr_AddrL:   ; Low byte of address to tile layout (ORIGINAL stored in Level_LayPtrOrig_AddrL)
	.res 1
Level_LayPtr_AddrH:   ; High byte of address to tile layout (ORIGINAL stored in Level_LayPtrOrig_AddrH)
	.res 1

; Typical use pair at $63/$64
Map_Tile_AddrL:       ; Low byte of tile address
	.res 1
Map_Tile_AddrH:       ; High byte of tile address
	.res 1

; NOTE, the following two are also $63/$64, bonus game context
BonusText_BaseL := Map_Tile_AddrL ; Instruction text base address low
BonusText_BaseH := Map_Tile_AddrH ; Instruction text base address high


Level_ObjPtr_AddrL:   ; Low byte of address to object set (ORIGINAL stored in Level_ObjPtrOrig_AddrL)
	.res 1
Level_ObjPtr_AddrH:   ; High byte of address to object set (ORIGINAL stored in Level_ObjPtrOrig_AddrH)
	.res 2

; unused ($67-68)
	.res 2

Video_Upd_AddrL:      ; Video_Misc_Updates routine uses this as an address, low byte
	.res 1
Video_Upd_AddrH:      ; Video_Misc_Updates routine uses this as an address, hi byte
	.res 1
Music_Base_L:         ; Current music segment base address low byte
	.res 1
Music_Base_H:         ; Current music segment base address high byte
	.res 1

Sound_Sqr_FreqL:      ; Calculated square wave frequency for Note On (low byte)
	.res 1
Sound_Sqr_FreqH:      ; Calculated square wave frequency for Note On (high byte)
	.res 1
Sound_Map_EntrV:      ; Current index into the volume ramp-down table used exclusively for the "level enter" sound
	.res 1
Sound_Map_EntV2:      ; Same as Sound_Map_EntrV, only for the second track
	.res 1

Music_PatchAdrL:      ; Music current patch address low byte
	.res 1
Music_PatchAdrH:      ; Music current patch address high byte
	.res 1
Sound_Map_Off:        ; Current "offset" within a map sound effect
	.res 1

.segment "COMMONHIZP": zeropage

Scroll_OddEven:      ; 0 or 1, depending on what part of 8 pixels has crossed (need better description)
	.res 1

Controller1Press:    ; Player 1's controller "pressed this frame only" (see Controller1 for values)
	.res 1
Controller2Press:    ; Player 2's controller "pressed this frame only" (see Controller2 for values)
	.res 1
Controller1:         ; Player 1's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80
	.res 1
Controller2:         ; Player 2's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80
	.res 1

; unused ($F9-FB)
	.res 3

Vert_Scroll:         ; Vertical scroll of name table; typically at $EF (239, basically showing the bottom half)
	.res 1
Horz_Scroll:         ; Horizontal scroll of name table
	.res 1

; unsued ($FE)
	.res 1

PPU_CTL1_Copy:       ; Holds PPU_CTL1 register data 
	.res 1
