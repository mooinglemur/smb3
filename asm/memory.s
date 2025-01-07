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

Scroll_OddEven:       ; 0 or 1, depending on what part of 8 pixels has crossed (need better description)
	.res 1

Controller1Press:     ; Player 1's controller "pressed this frame only" (see Controller1 for values)
	.res 1
Controller2Press:     ; Player 2's controller "pressed this frame only" (see Controller2 for values)
	.res 1
Controller1:          ; Player 1's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80
	.res 1
Controller2:          ; Player 2's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80
	.res 1

; unused ($F9-FB)
	.res 3

Vert_Scroll:          ; Vertical scroll of name table; typically at $EF (239, basically showing the bottom half)
	.res 1
Horz_Scroll:          ; Horizontal scroll of name table
	.res 1

; unsued ($FE)
	.res 1

PPU_CTL1_Copy:        ; Holds PPU_CTL1 register data 
	.res 1

; NOTE: CONTEXT -- Page 0 RAM changes meaning depending on the "context", i.e. what state
; of the game we're currently in!  This means that variables are defined with overlapping
; addresses, and care must be taken to use the correct labels depending on the code!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: TITLE SCREEN / ENDING CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "TITLEZP": zeropage

; Title screen "objects", which includes Mario, Luigi, and the assortment of other things
; The following are the offsets from any of the object arrays:
; 0 = Mario, 1 = Luigi, 2 = Starman, 3 = Mushroom, 4 = Super Leaf, 5 = Goomba, 6 = Buzzy Beatle, 7 = Koopa shell

; Note that some of this is used for the engine (especially in the Princess's chamber) but some of it is
; different (especially during the montage) so consider the overlapped variables in the next section

Title_XPosHi:         ; $75-$7C "High" part of the extended precision X position for all objects
	.res 8
Title_YPosHi:         ; $7D-$84 "High" part of the extended precision X position for all objects
	.res 8
Title_ObjX:           ; $85-$8C Title screen object X positions
	.res 8
Title_ObjY:           ; $8D-$94 Title screen object Y positions
	.res 8
Title_ObjXVel:        ; $95-$9C X velocities of title screen objects (4.4FP)
	.res 8
Title_ObjYVel:        ; $9D-$A3 Y velocities of title screen objects 
	.res 8
Title_XPosFrac:       ; $A5-$AC X position extended precision of objects (provides 4-bit fixed point)
	.res 8
Title_YPosFrac:       ; $AD-$B4 Y position extended precision of objects (provides 4-bit fixed point)
	.res 8
Title_ObjYVelChng:    ; $B5-$B6 Mario / Luigi change in Y velocity flag
	.res 2
Title_ObjMLFlags:     ; $B7-$B8 Mario / Luigi Sprite flags
	.res 2
Title_ObjMLMoveDir:   ; 0 = No move, 1 = Left, 2 = Right
	.res 1

; unused $BA
	.res 1

Title_ObjMLAnimFrame: ; $BB-$BC Mario / Luigi animation frame
	.res 2
Title_ObjMLDirTicks:  ; $BD-$BE Mario / Luigi animation ticks
	.res 2
Title_ObjMLSprite:    ; $BF-$C0 Mario / Luigi next sprite to display
	.res 2
Title_ObjMLPower:     ; $C1-$C2 Mario / Luigi current powerup (0 = Small, 1 = Big, 2 = Leaf)
	.res 2
Title_ObjMLSprRAMOff: ; $C3-$C4 Mario / Luigi Defines a Sprite_RAM offset for Mario / Luigi
	.res 2
Title_ObjMLSprVis:    ; $C5-$C6 Mario / Luigi sprite sliver visibility bits (generated by Title_MLDetermineSpriteVis)
	.res 2
Title_ObjMLTailTick:  ; $C7-$C8 Mario / Luigi tail wagging tick
	.res 2
Title_ObjMLHold:      ; $C9-$CA Mario / Luigi holding something flag (when non-zero)
	.res 2
Title_ObjMLBonkTick:  ; $CB-$CC Mario / Luigi use "bonked" frame while > 0
	.res 2
Title_ObjMLKickTick:  ; $CD-$CE Mario / Luigi use kicking frame while > 0
	.res 2
Title_ObjMPowerDown:  ; Mario power down animation counter
	.res 1
Title_ObjMLStop:      ; Flag used briefly to "hold" Mario/Luigi from moving so they get a "running start"
	.res 1
Title_CurMLIndex:     ; 0 for Mario, 1 for Luigi
	.res 1
Title_ObjFlags:       ; $D2-$D7 Minor objects' sprite flags
	.res 6
Title_ObjStates:      ; $D8-$DD Title screen array of states for the individual objects (NOT including Mario/Luigi)
	.res 6
Title_State:          ; 00 = Prior to red curtain rise, 01 = Rising curtain...
	.res 1
Title_ResetCnt:       ; Title reset counter -- when on the menu, once this hits zero, the title sequence restarts
	.res 1
Title_ResetCnt2:      ; when this goes to zero, it decrements Title_ResetCnt
	.res 1
Title_ResetTrig:      ; when non-zero, resets title screen
	.res 1
Title_UnusedFlag:     ; doesn't seem to do anything useful but not do the "skip" state if Player presses START early on the title screen
	.res 1
Title_Ticker:         ; Tick counter for title screen intro "movie"
	.res 1
Title_MActScriptPos:  ; Offset within Mario's action script
	.res 1
Title_LActScriptPos:  ; Offset within Luigi's action script
	.res 1
Title_MActScriptDelay: ; Mario's action script delay until next event
	.res 1
Title_LActScriptDelay: ; Luigi's action script delay until next event
	.res 1
Title_MActScriptDirSet: ; Mario's action script Buffer for last queue command (sets respective "Title_ObjMLDir" variable)
	.res 1
Title_LActScriptDirSet: ; Luigi's action script Buffer for last queue command (sets respective "Title_ObjMLDir" variable)
	.res 1
Title_ObjMLDir:       ; $EA-$EB Mario / Luigi vector direction bitfield (1 = Left, 2 = Right, 4 = Down, 8 = Up, $10 = Sprite behind BG, $80 = Tail wagging)
	.res 2
Title_ObjMLQueue:     ; $EC-$ED Mario / Luigi queue to do something ($04 = Luigi's rebound off Mario, $10 = Kick shell, $20 = Begin carrying, $40 = Clear carry/bonk, do kick)
	.res 2
Title_EventIndex:     ; Title background event index (dynamic jump index for events on the title 
	.res 1
Title_EventGrafX:     ; Title background current graphic index to load (loads items from Video_Upd_Table2 in PRG025)
	.res 1
Title_ObjInitIdx:     ; Current title screen "event" ID during the intro scene with Mario and Luigi
	.res 1
Title_ObjInitDly:     ; Timer count before next object init
	.res 1
Title_3GlowFlag:      ; When non-zero, begins the "glowing" effect for the big '3'
	.res 1
Title_3GlowIndex:     ; Index into an array of colors to cause the big '3' on the title screen to glow
	.res 1

; Ending-specific vars -- NOTE that Ending system uses some of the Title Screen code, so these variables overlap some of the above
; Basically don't assume anything here is free space without consulting above as well...

.segment "ENDINGZP1": zeropage
Ending2_PicState:     ; Ending part 2 picture loader state
	.res 1
Ending2_ClearLen:     ; Length of clear run
	.res 1
Ending2_ClearPat:     ; Pattern to clear the screen with
	.res 1
Ending2_PicVRAMH:     ; Ending part 2 picture VRAM Hi
	.res 1
Ending2_PicVRAML:     ; Ending part 2 picture VRAM Hi
	.res 1
Ending2_QCmdEnd:      ; Ending2_QueueCmd is incremented to this point
	.res 1
Ending2_FadeTimer:    ; Timer which controls the speed of the fade between worlds
	.res 1
Ending2_QueueCmd:     ; incremented after posting, up to Ending2_QCmdEnd
	.res 1
Ending2_TimerH:       ; Ending part 2 timer "high" part
	.res 1
Ending2_TimerL:       ; Ending part 2 timer "low" part
	.res 1
Ending2_CurWorld:     ; Current world we're showing (8 = THE END)
	.res 1

.segment "ENDINGZP2": zeropage
Ending_Timer:         ; $D2-$D3 Twin ending timers, generally one for Mario and one for Princess
	.res 2
EndText_Timer:        ; Timer used for the ending text display
	.res 1
Ending_State:         ; Current state value for initial part of ending (the princess, prior to curtain)
	.res 1

EndText_VL:           ; Princess speech VRAM Address Low
	.res 1
EndText_VH:           ; Princess speech VRAM Address High
	.res 1
EndText_CPos:         ; Princess speech Character Position
	.res 1
EndText_State:        ; Princess speech state variable
	.res 1

.segment "ENDINGZP3": zeropage
Ending2_IntCmd:       ; used during ending to buffer out the ending picture data on the interrupt.  Triggers "Do_Ending2_IntCmd" in PRG024 in interrupt context.
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: WORLD MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "WORLDMAPZP": zeropage

World_Map_Y:          ; $75-$76 (Mario/Luigi) Y pixel coordinate position of Mario on world map
	.res 2
World_Map_XHi:        ; $77-$78 (Mario/Luigi) X pixel (hi byte) coordinate position of Mario on world map
	.res 2
World_Map_X:          ; $79-$7A (Mario/Luigi) X pixel (lo byte) coordinate position of Mario on world map
	.res 2
World_Map_Move:       ; $7B-$7C (Mario/Luigi) Movement left in specified direction (even numbers only!)
	.res 2
World_Map_Dir:        ; $7D-$7E (Mario/Luigi) Specified travel direction (8=Up, 4=Down, 2=Left, 1=Right)
	.res 2

Map_UnusedPlayerVal:  ; $7F-$80 (Mario/Luigi) Set for each Player to $20 when returning to map, but apparently unused otherwise!
	.res 2

; unused ($81-$83)
	.res 3

Map_UnusedPlayerVal2: ; $84-$85 (Mario/Luigi) Apparently unused at all, but backed up and persisted on the world map
	.res 2

; All the WarpWind vars are shared with the HandTrap; they share code, too...
Map_WWOrHT_Y:         ; Warp Whistle wind or Hand Trap Y position
	.res 1
Map_HandTrap_XHi:     ; Hand Trap X Hi (most vars are shared with warp wind, but technically not this one!)
	.res 1
Map_WWOrHT_X:         ; Warp Whistle wind or Hand Trap X position
	.res 1
Map_WWOrHT_Cnt:       ; Warp Whistle wind or Hand Trap counter 
	.res 1
Map_WWOrHT_Dir:       ; Direction the Warp Whistle wind travels (0 = right, 1 = left)
	.res 1

; Double use
Map_WarpWind_FX:      ; 1 - 4 is the warp whistle effect
Map_StarFX_State:     ; 0 - 2 NOTE: Shared with Map_WarpWind_FX
	.res 1

World_Map_Twirl:      ; If set, Mario is "twirling"
	.res 1

; unused ($8D)
	.res 1

; When Player is "skidding" backward (from death or "twirling" from game over continuation)
Map_Skid_DeltaY:      ; Delta applied directly to Y
	.res 1
Map_Skid_DeltaFracY:  ; Fractional delta Y
	.res 1
Map_Skid_FracY:       ; Fractional Y accumulator
	.res 1

; unused ($91)
	.res 1

Map_Skid_DeltaX:      ; Delta applied directly to X
	.res 1
Map_Skid_DeltaFracX:  ; Fractional delta X
	.res 1
Map_Skid_FracX:       ; Fractional X accumulator
	.res 1
Map_Skid_FracCarry:   ; Fractional carry over accumulator (I think?)
	.res 1
Map_Skid_Count:       ; Just a ticker controlling the display frame of the twirl
	.res 1
Map_Skid_Counter:
	.res 1

; Map_Skid_TravDirs -- specifies which way Player must "twirl" to get to the destination
; Bit 0 Set = Player must travel to the right versus the left
; Bit 1 Set = Player must travel downward versus upward
Map_Skid_TravDirs:
	.res 1

; unused ($99-$9A)
	.res 2

Map_StarsX:           ; $9B-$A2 During World Intro, X position of each star
	.res 8
Map_StarsY:           ; $A3-$AA During World Intro, Y position of each star
	.res 8
Map_StarsOutRad:      ; During World Intro, stars take off radius (0 = smallest, increments for larger)
	.res 1

; unused ($AC-$AE)
	.res 3

Map_StarsXSteps:      ; During World Intro, number of "steps" remaining in the X position adjustment
	.res 1
Map_StarsRadCnt:      ; During World Intro, adds $70 per display frame and adds 1 to the radius when it overflows
	.res 1
Map_StarsCenterX:     ; During World Intro, X center of stars 
	.res 1
Map_StarsCenterY:     ; During World Intro, Y center of stars
	.res 1
Map_StarsDeltaR:      ; During World Intro, delta to the star radii
	.res 1
Map_StarsConst9:      ; During World Intro, ... Constant 9?
	.res 1

; unused ($B5)
	.res 1

Map_StarsAnimCnt:     ; During World Intro, a simple counter that adds 32 per frame and toggles Map_StarsFrame when it overflows
	.res 1
Map_StarsFrame:       ; During World Intro, "frame" of stars (0/1)
	.res 1
Map_StarsPattern:     ; During World Intro, stars current VROM pattern
	.res 1
Map_StarsLandRad:     ; During World Intro, stars landing radius (0 = largest, increments for smaller)
	.res 1
Map_StarsYSteps:      ; During World Intro, number of "steps" remaining in the Y position adjustment
	.res 1

; unused ($BB)
	.res 1

Map_StarsRadius:      ; $BC-$C3 During World Intro, each star's "radius" position (each radius position is 0-31)
	.res 8
Map_StarsState:       ; 0 = Stars coming out from center, 1 = Stars moving in towards Player start
	.res 1
Map_SkidBack:         ; Player is skidding back (Map_Player_SkidBack stores whether they skidded on their last turn at all)
	.res 1

; unused ($C6)
	.res 1

Map_UnusedGOFlag:     ; Set at map initialization or if Player gets Game Over and selects CONTINUE/END, no apparent purpose
	.res 1

; unused ($C8-$CB)
	.res 4

Map_Intro_CurStripe:  ; Current stripe of the "World X" intro box to be erased (0 - 7)
	.res 1
Map_Intro_NTOff:      ; Offset into nametable for erasing the "World X" intro box
	.res 1
Map_Intro_ATOff:      ; Offset into the attribute table for erasing the "World X" intro box
	.res 1

Map_Airship_DC:       ; set to 1 when the Airship knows where it's going
	.res 1
Map_Airship_DY:       ; Airship delta between current and target Y coordinate
	.res 1
Map_Airship_YNib:     ; Map_Airship_DY shifts out its lower 4 bits as upper 4 bits to this value
	.res 1
Map_Airship_YAcc:     ; Additional Y accumulator when traveling
	.res 1
Map_Airship_DXHi:     ; Airship delta between current and target X Hi coordinate
	.res 1
Map_Airship_DX:       ; Airship delta between current and target X coordinate
	.res 1
Map_Airship_XNib:     ; Map_Airship_DXHi/Map_Airship_DX shifts out its lower 4 bits as upper 4 bits to this value
	.res 1
Map_Airship_Dir:      ; Airship horizontal travel direction in bit 0, vertical direction in bit 1
	.res 1
Map_HideObj:          ; used for completion)
	.res 1

MapPoof_Y:            ; When using a power-up, "poof" appears at this Y coordinate
	.res 1
MapPoof_X:            ; When using a power-up, "poof" appears at this X coordinate
	.res 1
Map_UseItem:          ; Flag to signal that item is to be used
	.res 1

; unused ($DB-$E4)
	.res 10

World_Map_Tile:      ; Current tile index Mario is standing on
	.res 1

; unused ($E6-$E8)
	.res 3

Scroll_Temp:         ; Scroll hold value
	.res 1

; unused ($EA-$EB)
	.res 2

Player_WalkFrame:    ; relative, not the same as Player_Frame
	.res 1

; unused ($ED-$F3)
	.res 7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "BONUSGAMEZP": zeropage
; unused ($75-$8A)
	.res 22

BonusCoins_State:
	.res 1

; unused ($8C-$C6)
	.res 59

BonusDie_Y:           ; UNUSED Bonus Game Die (1-6) Y position
	.res 1
BonusDie_X:           ; UNUSED Bonus Game Die (1-6) X position
	.res 1
BonusDie_YVel:        ; UNUSED Bonus Game Die Y Velocity (when it departs)
	.res 1
BonusDie_YVelFrac:    ; UNUSED Bonus Game Die Y Velocity fractional accumulator
	.res 1

; unused ($CB-$F3)
	.res 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: 2P VS CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "VSZP": zeropage
Vs_State:             ; 2P Vs Mode state
	.res 1
Vs_IsPaused:          ; If set, 2P Vs is paused
	.res 1

; unused ($77-$F3)
	.res 125

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GAMEPLAYZP": zeropage

; There's a consistent difference of $12 between X and Y; this consistent distancing is meant to be maintained, so leave it alone!

Player_XHi:           ; Player X Hi
	.res 1
Objects_XHi:          ; $76-$7D Other object's X Hi positions
	.res 8

; unused ($7E)
	.res 1

; Reuse of $7F
CineKing_DialogState: ; Toad & King Cinematic: When 1, we're doing the text versus the dialog box itself
; NOTE!! This object var is OBJECT SLOT 0 - 4 ONLY!
Objects_Var4:         ; $7F-$83 Generic variable 4 for objects SLOT 0 - 4 ONLY
	.res 5

; Pipe_PlayerX/Y variables in use when traveling through pipes
Pipe_PlayerX:         ; Stores Player's X when they went into pipe (non-transit)
	.res 1
Pipe_PlayerY:         ; Stores Player's Y when they went into pipe (non-transit, aligned to nearest 16, minus 1)
	.res 1

; Otherwise, they are replaced with a lookup address
Level_GndLUT_Addr := Pipe_PlayerX

; unused ($86)
	.res 1

Player_YHi:           ; Player Y Hi
	.res 1
Objects_YHi:          ; $88-$8F Other object's Y Hi positions
	.res 8
Player_X:             ; Player X
	.res 1
Objects_X:            ; $91-$98 Other object's X positions
	.res 8

; unused ($99)
	.res 1

; Reuse of $9A
CineKing_Var:         ; General variable
Objects_Var5:         ; $9A-$A1 Generic variable 5 for objects
	.res 8
Player_Y:             ; Player Y
	.res 1
Objects_Y:            ; $A3-$A9 Other object's Y positions
	.res 8

Player_SpriteX:       ; Player's sprite X
	.res 1
Objects_SpriteX:      ; $AC-$B3 Other object's sprite X positions
	.res 8
Player_SpriteY:       ; Player's sprite Y
	.res 1
Objects_SpriteY:      ; $B5-$BC Other object's sprite Y positions
	.res 8

; WARNING: The distance between Player/Objects_XVel and Player/Objects_YVel must be same as Player/Objects_X/YVelFrac!
Player_XVel:          ; Player's X Velocity (negative values to the left) (max value is $38)
	.res 1
Objects_XVel:         ; $BE-$C5 Other object's X velocities
	.res 8

Objects_VarBSS:       ; $C6-$CC OBJECT SLOTS 0 - 5 ONLY ... uncleared var??
	.res 7
SlotIndexBackup:      ; Used as a backup for the slot index (e.g. current object, current score, etc.)
	.res 1
Player_HaltGame:      ; Player is halting game (e.g. dying, shrinking/growing, etc.)
	.res 1

; WARNING: The distance between Player/Objects_XVel and Player/Objects_YVel must be same as Player/Objects_X/YVelFrac!
Player_YVel:          ; Player's Y Velocity (negative values upward)
	.res 1
Objects_YVel:         ; $D0-$D7 Other object's Y velocities
	.res 8

Player_InAir:         ; When set, Player is in the air
	.res 1

; Reuse of $D9
CineKing_Frame2:      ; Used only by the World 6 King (Seal juggling a crown, the crown's frame)
; Objects_DetStat:
; Object's detection bits:
;	$01-hit wall right
;	$02-hit wall left
;	$04-hit ground
;	$08-hit ceiling
;	$80-object touching "32 pixel partition" floor (if active)
Objects_DetStat:      ; $D9-$E0  on screen
	.res 8

Player_SprWorkL:      ; Sprite work address low
	.res 1
Player_SprWorkH:      ; Sprite work address high
	.res 1

; unused ($E3)
	.res 1

Level_TileOff:        ; Tile mem offset
	.res 1
Level_Tile:           ; Temporary holding point for a detected tile index
	.res 1
; *NOTE: Code at PRG030_9EDB clears Player_Slopes+1 and Player_Slopes+2, but these are never used!
Player_Slopes:        ; for sloped levels only (3 bytes allocated, but only one actually used)
	.res 3

; unused ($E9-$EA)
	.res 2

Player_XStart:        ; Set to Player's original starting X position (also used to check if level has initialized)
	.res 1

; unused ($EC)
	.res 1

; Player_Suit -- Player's active powerup (see also: Player_QueueSuit)
Player_Suit:
	.res 1

Player_Frame:         ; Player display frame
	.res 1
Player_FlipBits:      ; Set to $00 for Player to face left, Set to $40 for Player to face right
	.res 1

Player_WagCount:      ; after wagging raccoon tail, until this hits zero, holding 'A' keeps your fall rate low
	.res 1
Player_IsDying:       ; 0 = Not dying, 1 = Dying, 2 = Dropped off screen, 3 = Death due to TIME UP
	.res 1

; unused ($F2)
	.res 1

Obj01_Flag:           ; Not sure what Obj01 is!! This blocks its left/right handler logic.
	.res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $1xx LOW STACK VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These are actually "bottom" of the stack; I don't think this is normally recommended.
; but this is probably to keep them "safe" from other RAM clearing routines, since they directly effect the IRQ.
; The debug flag in particular is pretty precariously placed, and under some kind of heavy call stack, seems like
; there's risk it could be set by accident... but I guess this never happens... ?

.segment "ONEPAGE"
Update_Select:        ; Changes which path of "update routines" are selected; $00 = ??, $20 = Title Screen, $40 = Spade Game, $80 = Vertical level, $A0 = 32 pixel partition, $C0 = Normal
	.res 1

Raster_Effect:        ; $00 is standard status bar, $20 is title/ending, $40 = 32 pixel partition, $60 = Spade Bonus Game (3 sliding rows), $80 is nothing (e.g. as in 2P versus), $A0 = ???
	.res 1

; unused ($102-$15F)
	.res 94

Debug_Flag:           ; Set to $80 by the debug menu, enables debug functionality like power level cycling and not dying from time over
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $2xx SPRITE RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "OAMSHADOW"

; Sprite memory is laid out in four bytes:
; Byte 0 - Stores the y-coordinate of the top left of the sprite minus 1.
; Byte 1 - Index number of the sprite in the pattern tables.
; Byte 2 - Stores the attributes of the sprite.
; * Bits 0-1 - Most significant two bits of the colour.
; * Bit 5 - Indicates whether this sprite has priority over the background.
; * Bit 6 - Indicates whether to flip the sprite horizontally.
; * Bit 7 - Indicates whether to flip the sprite vertically.
; Byte 3 - X coordinate
Sprite_RAM:           ; $0200 - $02FF; This is where sprite memory is stored locally prior to being DMA'ed
	.res 256


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $03xx RAM (Largely graphics updating / control)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GFXBSS"

Graphics_BufCnt:      ; first byte holds current position within buffer (Graphics_Buffer+) to store info
	.res 1
Graphics_Buffer:      ; $0301-$036B Simple (and small!) delayed write buffer; uses same format as Video_Upd_Table in PRG030, get format info there
	.res 107
TileChng_VRAM_H:      ; High part of VRAM address to change
	.res 1
TileChng_VRAM_L:      ; Low part of VRAM address to change
	.res 1
TileChng_Pats:        ; $036E-$0371 The four patterns required to change a tile (for Level_ChgTileEvent)
	.res 4
Level_SizeOrig:       ; Holds original size (width or height) of level (in screens)
	.res 1
Level_PipeExitDir:    ; Direction Player is going to exit from a pipe (1 = Up, 2 = Down, 3 = Right, 4 = Left, 5 = In-level Transit)
	.res 1
Level_7VertCopy:      ; Just seems to be an unmaintained copy of Level_7Vertical from level load, but that's it
	.res 1
Level_PipeNotExit:    ; If set, pipes do NOT exit to map (i.e. as in pipe junctions)
	.res 1
Level_PauseFlag:      ; Set to 0 when not paused, or 1 when paused
	.res 1
Level_SkipStatusBarUpd: ; When set, skips updating the status bar for one frame (priority graphics buffer changes I think)
	.res 1
Raster_State:         ; This variable's meaning depends on the Raster_Effect in use; typically 0 is first pass, then more for further scanlines
	.res 1

; unused ($379-$37F)
	.res 7

Scroll_ToVRAMHi:      ; High byte for when pushing a column of tile data to VRAM (Set to $20, Name Table 0, after scroll update)
	.res 1

; $381 dual use
Scroll_LastCol8:      ; Last 8x8 block column that was updated (non-vertical level ONLY)
Scroll_LastOff8:      ; Last 8x8 block offset that was updated (vertical level style ONLY)
	.res 1

Scroll_PatStrip:      ; $0382-$03B7 (may be less?) This stores a strip of 8x8 blocks, (non-vertical level: top to bottom with 2 columns), to render the next 16 pixel "sliver" of screen space
	.res 54
Scroll_ToVRAMHA:      ; High byte for when pushing attribute data to VRAM (Set to $23, attribute table 0)
	.res 1
Scroll_LastAttr:
	.res 1
Scroll_AttrStrip:     ; $03BA-$03C7 (may be less?) This stores a 2x2 block of attribute coloring data
	.res 14
World_Num_Debug:      ; When debug mode is activated (KKKZSPIU), this is the world you select to start on
	.res 1
Map_StarsDeltaX:      ; Delta the stars move in X to reach the Player (always positive, code figures direction)
	.res 1
Map_StarsDeltaY:      ; Delta the stars move in Y to reach the Player (always positive, code figures direction)
	.res 1

; unused ($3CB-$3DA)
	.res 16

Map_Stars_PRelX:      ; During world intro, screen relative position of Player X
	.res 1
Map_Stars_PRelY:      ; During world intro, screen relative position of Player Y
	.res 1
Player_Power:         ; >>>>>>[P] charge level ($7F max)
	.res 1

; Level_JctCtl is configured when you enter a door or a pipe
; * When $80, use current values for Level_AltLayout and Level_AltObjects
; * When otherwise non-zero (inc $80), skips setting vertical start position
;
; Normal values for the junction:
;  0 - Disables junction (i.e. no junction occurring)
;  1 - Junction initialization
;  2 - Big Question Block bonus area
;  3 - General purpose junction (as specified by Level_AltLayout and Level_AltObjects)
;  4 - Generic level exit (where you come up from a pipe in the generic exit area)
;  5 - Special Toad House (used for the 1-3 warp whistle)
Level_JctCtl:
	.res 1

Level_JctFlag:        ; Toggles when you junction
	.res 1

; unused ($3E0)
	.res 1

Map_DrawPanState:     ; Map draw/pan state
	.res 1
ObjGroupRel_Idx:      ; Holds relative index of object within its group (see PRG000_CA51)
	.res 1
InvFlip_VAddrHi:      ; Hi byte of VRAM address during inventory flip modifications
	.res 1

; unused ($3E4)
	.res 1

; CLOSING
;  0: Erase old status bar complete, palette changed to blue
;  1: Draw top bar (at middle)
;  2: Draw bottom bar (at middle)
;  3: Erase top bar (at middle)
;  4: Draw top middle row of normal status bar/cards
;  5: Draw bottom middle row of normal status bar/cards
;  6: Draw top bar (at top)
;  7: Draw bottom bar (at bottom)

; OPENING
;  8: Erase old status bar complete, palette changed to yellow
;  9: Draw top bar (at middle)
; 10: Draw bottom bar (at middle)
; 11: Erase top bar (at middle)
; 12: Erase bottom bar (at middle)
; 13: Draw top middle row of inventory
; 14: Draw bottom middle row of inventory
; 15: Draw top bar (at top)
; 16: Draw bottom bar (at bottom)
InvFlip_Frame:        ; Sort of a "frame" of animation during flipping of the inventory box; 0-7 during closing, 8-15 during opening
	.res 1
InvFlip_Counter:      ; 0 = Closed, 4 = Fully Open
	.res 1
InvStart_Item:        ; Starting inventory item; typ. $00, $07, $0E, $15 (Rows 1-4)
	.res 1
InvHilite_X:          ; Current hilite position X coordinate
	.res 1
InvHilite_Item:       ; Which item in the current row is highlighted, 0-6
	.res 1

THouse_ID:            ; An unused ID value that would track boxes already opened in a Toad House (concept unused!)
	.res 1

; Treasure type you'll get at this Toad House
; 0 = INVALID
; 1 = Warp Whistle
; 2 = P-Wing
; 3 = Frog
; 4 = Tanooki
; 5 = Hammer
; 6 = Random Super Suit
; 7 = Random Basic Item
THouse_Treasure:
	.res 1

Coins_Earned:         ; A "buffer" of coins earned to be added to your total, actual coinage stored in Inventory_Coins[2]
	.res 1
Map_Powerup_Poof:     ; Counter that handles the "poof" effect when a powerup is used on the map (requires Inventory to be open, and forces it to close afterward)
	.res 1

; Level_FreeVertScroll
; 0 = Screen locked at $EF (lowest point) unless flying or climbing a vine
; 1 = Free vertical scroll
; 2 = Locked at arbitrary point (i.e. whatever Vert_Scroll is, it stays there)
Level_FreeVertScroll:
	.res 1

Level_7Vertical:      ; Set in World 7 vertical type levels
	.res 1
Level_SelXStart:      ; Selects X starting position when level begins (valid values 0-3)
	.res 1

Update_Request:       ; This changes the current Raster_Effect and Update_Select and doesn't persist
	.res 1
Map_Starman:          ; Player used a Starman!
	.res 1
Map_Power_Disp:       ; This is the powerup currently DISPLAYED on the map; it should be the same as $0746 World_Map_Power, except for Judgem's Cloud
	.res 1
Map_Warp_PrevWorld:   ; The world you're coming FROM when warping (also used as output from warp zone what world you're going to)
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx WORLD MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; $0400-$04CF (except $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE") is available for this context-dependent situation
.segment "WORLDMAPBSS"
; unused ($0400-$0443)
	.res 68
; NOTE: Memory is cleared from here to +$1C, $460
; For border arrays, 0-3: Top 0, bottom 1, right 2, left 3
Map_EntTran_VLHalf:   ; When 1, offset starts vertically "lower half" (at $F0 of first screen)
	.res 1
Map_EntTran_TBCnt:    ; decreasing counter as the transition moves inward top/bottom
	.res 1
Map_EntTran_LRCnt:    ; decreasing counter as the transition moves inward left/right
	.res 1
; W8D = World 8 Darkness; overlaps the vars used by the entrance transition
Map_W8D_VAddrH:       ; overlap $0447
Map_EntTran_BVAddrH:  ; $0447-$044A Each border's current high part of VRAM address
	.res 4
Map_W8D_VAddrL:       ; overlap $044B
Map_EntTran_BVAddrL:  ; $044B-$044E Each border's current low part of VRAM address
	.res 4
Map_EntTran_BorderLoop: ; Border loop counter
	.res 1
Map_EntTran_Cnt:
	.res 1
Map_W8D_VAddrH2:      ; overlap $0451
Map_EntTran_VAddrH:   ; high part of VRAM address to modify
	.res 1
Map_EntTran_VAddrHAdj: ; An adjusted version of the high address as needed to wrap (used in removed "box out" version only)
	.res 1
Map_W8D_VAddrL2:      ; overlap $0453
Map_EntTran_VAddrL:   ; low part of VRAM address to modify
	.res 1
Map_EntTran_TileOff:  ; Offset into tile memory (used in removed "box out" version only)
	.res 1
Map_W8D_TileOff:      ; overlap $0455
Map_EntTran_Tile8x8:  ; Offset to which 8x8 pattern of the tile we're grabbing that we need (used in removed "box out" version only)
	.res 1
Map_EntTran_VRAMGap:  ; Sets gap (i.e. 1 for vertical, 32 for horizontal; used in removed "box out" version only)
	.res 1
; unused ($457)
	.res 1
Map_W8D_YOff:         ; Y Offset from Player when doing darkness
	.res 1
Map_W8D_XOff:         ; X Offset from Player when doing darkness
	.res 1
Map_W8D_RC:           ; Row in the upper bits, column in the lower bits
	.res 1
Map_W8D_Dir:          ; Direction of travel in darkness (1 = Right, 2 = Left, 4 = Down, 8 = Up)
	.res 1
Map_W8D_X:
	.res 1
Map_W8D_Y:
	.res 1
Map_W8D_Idx:
	.res 1

Map_EntTran_Temp:     ; Seems to me a multi-purpose value in entrance transition
	.res 1
Map_EntTran_InitValIdx: ; Selects an index of values to initialize by
	.res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "BONUSGAMEBSS"
	; $0400-$04CF (except $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE") is available for this context-dependent situation
	; WARNING: $0400-$04CF gets cleared at end of bonus game!

Roulette_Pos:         ; $0400-$0402 horizontal position of each row
	.res 3
Roulette_PosHi:       ; $0403-$0405 Hi part of Roulette_Pos
	.res 3
Roulette_ShapeLock:   ; $0406-$0408 Locked position of each row (0 = Mushroom, 1 = Flower, 2 = Mushroom, 3 = Star)
	.res 3
Roulette_ConfigRun:   ; 0 = Configuring, 1 = Running
	.res 1
Roulette_ConfigState: ; Early configuration state
	.res 1
Roulette_RunState:    ; Running state of game
	.res 1

; NOTE: Watch the reuse here...
Roulette_StopState:   ; $040C-$040E Current "state" of each row while it is coming to a stop (1+)
Roulette_xUpY:        ; "x Up" display Y position (overlaps first byte of Roulette_StopState)
	.res 1
Roulette_LivesToGive: ; Lives left to give in reward (overlaps second byte of Roulette_StopState)
	.res 1
; Third byte of Roulette_StopState
	.res 1

Roulette_Speed:       ; $040F-$0411 Movement speed of each row (4.4FP)
	.res 3
Roulette_StopCnt:     ; $0412-$0414 Decrements to zero while each row is stopping
	.res 3
Roulette_PosFrac:     ; $0415-$0417 Fractional accumulator for position of row 1-3
	.res 3

; unused ($418)
	.res 1

Roulette_Turns:       ; UNUSED "Turns Remaining" (if > 0, and you lose Roulette, hit a button and spin again!)
	.res 1

; unused ($41A-$425)
	.res 12

; UNUSED "Prize" that appears in some varities of the lost bonus games
; (Or that's my best guess anyway.)  BMF54123's patch shows these as
; Mushroom, Flower, Star, or Judgem's Cloud.  Perhaps it was a situation
; like "Here's the prize on the table, if you can get it"...
Card_SelectX:         ; Card cursor X (NOTE: Shared with Bonus_PrizeX)
Bonus_PrizeX:         ; UNUSED Prize sprite X
	.res 1

Card_SelectY:         ; Card cursor Y (NOTE: Shared with Bonus_PrizeY)
Bonus_PrizeY:         ; UNUSED Prize sprite Y
	.res 1

Card_Index:           ; Currently selected card in "N-Spade" Card game (NOTE: Shared with Bonus_CurBufOffset)
Bonus_CurBufOffset:   ; Offset in graphics buffer while generating instruction box
	.res 1

Card_FirstIndex:      ; Card_Index of the first card you flipped (in case you get it wrong on the second...)
	.res 1

Bonus_Round2:         ; UNUSED Picks which "Round 2" game would be played (NOTE: Shared with Card_SelectXOrig)
Card_SelectXOrig:     ; Card cursor original X
	.res 1

Card_MoveDelay:       ; Decrements to zero; if not zero, can't move on N-Spade game
	.res 1
Card_SprRAMOff:       ; Sprite RAM offset after cursor is drawn; for drawing card flip
	.res 1
Card_AnimTick:        ; Animation tick, decrements to zero
	.res 1
Card_VRAM_L:          ; Low part of VRAM address of N-Spade card to modify
	.res 1
Card_VRAM_H:          ; High part of VRAM address of N-Spade card to modify
	.res 1

Card_FlipCount:       ; +1 for every card flip
	.res 1
Card_MatchCard:       ; Card to match, i.e. the first card you selected of the pair
	.res 1
Card_UnusedVL:        ; ?? Some VRAM Low; Seems to only be part of an unused routine
	.res 1
Card_UnusedVH:        ; ?? Some VRAM High; Seems to only be part of an unused routine
	.res 1

; Bonus_GameHost
;	0 = Toad Host: The only one we ever got
; All others are UNUSED...
;	1 = Koopa Troopa Host + "Prize" Game
;	2 = Koopa Troopa Host, no "Prize" Game
;	3 = Hammer Bro
Bonus_GameHost:       ; NOTE: Shared with Card_GameState
Card_GameState:       ; State of N-Spade card game
	.res 1
Card_TurnsRemain:     ; Number of turns remaining
	.res 1
Card_FlipFrame:       ; Frame of flipping card
	.res 1

; The next three vars belong to an unused routine @ PRG022:DA62; unclear what it did exactly
Card_UnusedArray:     ; $0437-$043A ??
	.res 4
Card_UnusedAttr:      ; Seems to only be part of an unused routine; attribute table offset of some sort
	.res 1
Card_UnusedArrIdx:    ; Seems to only be part of an unused routine; index for Card_UnusedArrIdx
	.res 1

Card_Matches:         ; Matches (local, this round; Seems to only be used as part of the unused routine)
	.res 1
Card_CoinsToGive:     ; If greater than zero, coins are being given
	.res 1

; unused ($43F)
	.res 1

; Bonus_GameState
;
; 0 = ?
; 1 = Giving instructions die game
; 2 = Rotating "die"
; 3 = Coin spurt prize
; 4 = Stopped die
; 5 = Die flies away
; 6 = ?? Initialize instructions?
; 7 = Giving instructions
; 8 = Pause before proceeding
; 9 = Exiting
Bonus_GameState:
	.res 1

Card_InitState:       ; Initialization state of N-Spade card game
	.res 1

; Bonus_GameType
; This appears to determine what game you're about to play.
; This also reveals some of the greatest questionable loss in SMB3...
; When this value is anything besides 1 or 2, it plays what I SUPPOSE
; was a "roulette" game?  With a fixed graphics patch, it appears to
; be a die cycling 1-6.
;
; 0 = Japanese text, translated as:
;	If "1" appears, 1 (?)
;	If "2" appears, I'll give you a key
;	Otherwise, I'll give you coins.
; 1 = Standard Spade game (UNUSED BONUS GAMES NOTE: May have once been the "odd" game spoken of in type 5)
; 2 = N-Spade (UNUSED BONUS GAMES NOTE: May have once been the "even" game spoken of in type 5)
	; 3:		.ds 1	; I suspect this is a placeholder ('C' being the 3rd)
	; 4:		.ds 1	; I suspect this is a placeholder ('D' being the 4th)
; 5 = Japanese: "If an odd number appears, I'll let you play the Roulette Game."
; 6 = Japanese: "If an even number appears, I'll let you play the Card Game."
; 7 = Japanese: "2, return (?)"
;
Bonus_GameType:
	.res 1

Bonus_KTPrize:        ; UNUSED Koopa Troopa's "Prize" Game Prize ID (0 = Mushroom, 1 = Star, 2 = Flower, 3 = Judgem's, by BMF54123's patch)
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GAMEPLAYBSS"
; unused ($400-$41A)
	.res 27

Fade_State:           ; 0 = Nothing, 1 = Fade in, 3 = Fade out
	.res 1
Fade_Tick:            ; Ticks down and then decrements Fade_Level
	.res 1
Fade_Level:           ; 4 to 0, fade in level
	.res 1
FadeOut_Cancel:       ; If set, the next attempted fade out will be cancelled, which then resets this to zero
	.res 1
Player_AllowAirJump:  ; Counts down to zero, but while set, you can jump in the air
	.res 1
Player_XVelAdj:       ; Applies additional value to the X Velocity
	.res 1

CineKing_Frame:       ; King's animation frame (NOTE: Shared with Objects_Var7 first byte)
Objects_Var7:         ; $0421-$0428 General object variable 7
	.res 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx RAM SOUND/MUSIC ENGINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "MUSICQBSS"

Level_MusicQueue:     ; Requests a song from Set 2A/B (used to allow delayed start)
	.res 1
Level_MusicQueueRestore: ; What to "restore" the BGM to when it changes (e.g. Starman, P-Switch, etc.)
	.res 1

.segment "SOUNDENGINEBSS"

Music_TriTrkPos:      ; Offset of triangle track in currently playing index
	.res 1
Music_NseTrkPos:      ; Offset of noise track in currently playing index
	.res 1
Music_PCMTrkPos:      ; Offset of DMC track in currently playing index
	.res 1
Music_Sq2RestH:       ; Square 2 Track hold for rest values to be applied after each event
	.res 1
Music_Sq2Rest:        ; Square 2 Track "Rest" period (counts down to zero)
	.res 1
Music_Sq2NoteLen:     ; Square 2 Track length of note (counts down to zero, cuts off sound)
	.res 1
Music_Sq1Rest:        ; Square 1 Track "Rest" period (counts down to zero)
	.res 1
Music_Sq1NoteLen:     ; Square 1 Track length of note (counts down to zero, cuts off sound)
	.res 1
Music_TriRestH:       ; Triangle Track hold for rest values to be applied after each event
	.res 1
Music_TriRest:        ; Triangle Track "Rest" period (counts down to zero)
	.res 1
Music_NoiseRest:      ; Noise Track "Rest" period (counts down to zero)
	.res 1
Music_NseRestH:       ; Noise Track hold for rest values to be applied after each event
	.res 1
Music_DMCRest:        ; DMC Track "Rest" period (counts down to zero)
	.res 1
Music_DMCRestH:       ; DMC Track hold for rest values to be applied after each event
	.res 1
Music_PCMStart:       ; Holds the starting offset of the DMC track
	.res 1
Music_NextIndex:      ; Next "index" to be played
	.res 1

SFX_Counter1:         ; Generic purpose SFX counter
	.res 1
SndCur_Player:        ; Currently playing Player sound (blocks music on Square 1)
	.res 1
SndCur_Level1:        ; Currently playing "level 1" sound (blocks music on Square 2)
	.res 1
SndCur_Level2:        ; Currently playing "level 2" sound
	.res 1
SndCur_Music1:        ; Currently playing BGM from Music 1 set
	.res 1
SndCur_Music2:        ; Currently playing BGM from Music 2 set
	.res 1
SndCur_Map:           ; Currently playing map sound (blocks music on Square 1)
	.res 1
SndCur_Pause:         ; Holds copy of Sound_QPause, to play sound while everything else is paused
	.res 1
SFX_Counter2:         ; Generic purpose SFX counter for level sounds
	.res 1
SFX_Counter3:         ; Generic purpose SFX counter
	.res 1
SFX_Counter4:         ; Generic purpose SFX counter
	.res 1

; unused ($4EB-$4EC)
	.res 2

Sound_IsPaused:       ; When set, sound processing is PAUSED
	.res 1

; unused ($4EE-$4F0)
	.res 3

; For any of these queues, the value is a bit value, which offers
; a simple prioritization system; lowest value plays over any other
Sound_QPlayer:
	.res 1

Sound_QLevel1:
	.res 1

Sound_QLevel2:
	.res 1

Sound_QMusic1:
	.res 1

Sound_QMusic2:
	.res 1

Sound_QMap:
	.res 1

Sound_QPause:
	.res 1

DMC_Time:             ; Time remaining on DMC sound
	.res 1
Music_Sq1RestH:       ; Square 1 Track hold for rest values to be applied after each event
	.res 1
Music_Sq1AltRamp:     ; When Square 1 track encounters a $00 byte, it actives a ramping mode, the value of which is stored here
	.res 1
Music_LOST4FB:        ; AFAIK, value in music engine that is "lost"; nothing seems to set it, and it doesn't do very much (possibly was a note length override??)
	.res 1
Music_LOST4FC:        ; AFAIK, value in music engine that is "lost"; nothing seems to set it, and it doesn't do very much
	.res 1

Music_RestH_Base:     ; Base offset into Music_RestH_LUT
	.res 1
Music_Sq2TrkOff:      ; Offset of square wave 2 track in currently playing index
	.res 1
Music_Sq1TrkOff:      ; Offset of square wave 1 track in currently playing index
	.res 1



; NOTE: CONTEXT -- RAM in the $500-$5FF range changes meaning depending on the "context", i.e. what
; state of the game we're currently in!  This means that variables are defined with overlapping
; addresses, and care must be taken to use the correct labels depending on the code!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $05xx TITLE SCREEN CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "TITLEBSS"
; $0500-$05FF is available for this context-dependent situation

; unused ($500-$50F)
	.res 16

; NOTE: All of this block is cleared by the title screen
Title_MLAccelCnt:     ; constant moving counter which overflows to provide a more "natural" acceleration to the Bros
	.res 1
Title_MarioPoof:      ; countdown of Mario's "poof" when he collects the power up
	.res 1
Title_MLHoldTick:     ; Set to $40 when Mario/Luigi are "held" (count down to zero)
	.res 1
Title_ObjVar:         ; $513-$518 Minor objects user-defined variable 1 (automatically decrements if not zero!)
	.res 6
Title_ObjVar2:        ; $519-$51E Minor objects user-defined variable 2
	.res 6
Title_ObjFrame:       ; $51F-$524 Minor object "frame"; adds 2x the value here to the pattern selection for the object's sprites
	.res 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "WORLDMAPBSS2"
; $0500-$05FF is available for this context-dependent situation

; NOTE: Most of the memory in this space is shared with Gameplay Context
; so don't assume that any value that should be spared is safe in here...

; NOTE: There are 8 defined "core" map objects, but up to 15 (?) can exist!
; *** Index 1 is assumed reserved for the Airship, however...
Map_Object_ActY:      ; $0500-$050E For map objects, their actual display Y coordinate (as it may modify, esp. with marchers)
	.res 15
Map_Object_ActX:      ; $050F-$051D For map objects, their actual display X coordinate (as it may modify, esp. with marchers)
	.res 15
Map_Object_ActXH:     ; $051E-$052C For map objects, their actual display X Hi byte (as it may modify, esp. with marchers)
	.res 15
Map_Object_Data:      ; $052D-$053B For marching objects, 0/1 for their direction, could be anything though
	.res 15
Map_March_Count:      ; $053C-$054A Simply counts and overflows, but used to determine position of marching map objects (PER ID, not object index ... Actually is seems they go back and forth on that??)
	.res 15

; unused ($54B-$586)
	.res 60

Map_Objects_Vis:      ; $0587-$058E Set for map objects as visible, clear if it's not
	.res 15
Map_MarchInit:        ; Set when marching data has been initialized (done once per marching cycle on the map)
	.res 1
Map_InCanoe_Flag:     ; Set when Player is in Canoe (modifies movement, allows movement in water, etc.)
	.res 1
World_8_Dark:         ; Darkness on World 8 Map, level 2 -- counts 0-7 while setting up the effect
	.res 1
World_Map_AnimF:      ; World map animation frame (for bushes, etc.)
	.res 1
World_Map_AnimT:      ; World map animation tick
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "BONUSGAMEBSS2"
; unused ($500-$536)
	.res 231

BonusText_VH:
	.res 1
BonusText_VL:
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GAMEPLAYBSS2"

; unused ($500-$50F)
	.res 16

; Event_Countdown is context dependent; without context, does nothing
; * When you come out of a pipe, this counter decrements until the pipe should be finished
; * When you die, counts down until dropping back to map

; NOTE: Event_Countdown and the following 7 are all decremented together!
Event_Countdown:
	.res 1

Player_TailCount:     ; Determines display frame of tail wag
	.res 1
Player_InAir_OLD:     ; Stores backup of Player_InAir
	.res 1
Player_FireCount:     ; Player shoots fireball/hammer, sets sprite frame (shared with Player_FrogHopCnt)
Player_FrogHopCnt:    ; Counter used for frog hopping along the ground (shared with Player_FireCount)
	.res 1

; unused ($514)
	.res 1

Player_PMeterCnt:     ; Tick counter used to count when to increase/decrease Power Meter
	.res 1
B10Coin_Timer:        ; Decrements until zero, which is how much time you have to get the max coins from a 10 coin block
	.res 1
Player_TailAttack:    ; Initiailized to $12; counts down to zero, performs tail attack!
	.res 1

CineKing_Timer:       ; Timer; decrements to zero (shares Objects_Timer first byte)
Objects_Timer:        ; $0518-$051F "Timer" values; automatically decrements to zero
	.res 8

; NOTE: Until Timer2 expires, object will not hit other objects.
; Probably used as a dampener to keep an object from slaughtering
; another bunch of objects TOO quickly!
Objects_Timer2:       ; $0520-$0527 "Timer" values; automatically decrements to zero 
	.res 8

; All the Level_BlockChgX/Y values are aligned to nearest 16 (i.e. tile coordinate)
Level_BlockChgXHi:    ; Player X High value when block change was queued
	.res 1
Level_BlockChgXLo:    ; Player X Low value when block change was queued
	.res 1
Level_BlockChgYHi:    ; Player Y High value when block change was queued
	.res 1
Level_BlockChgYLo:    ; Player Y Low value when block change was queued
	.res 1

; the block "bounce" that occurs after hitting ? block, music note block, etc.
Level_BlkBump_Pos:    ; $052C-$052D Block bump effect slot "position" (from 10 down, "position" of bounce)
	.res 2
Level_BlkBump:        ; $052E-$0530 Block bump effect slot (use Level_ChgTileEvent value, or 0 for inactive)
	.res 3
Level_BlkBump_XHi:    ; $0531-$0533 Block bump slot X Hi
	.res 3
Level_BlkBump_XLo:    ; $0534-$0536 Block bump slot X Lo
	.res 3
Level_BlkBump_YHi:    ; $0537-$0539 Block bump slot Y Hi
	.res 3
Level_BlkBump_YLo:    ; $053A-$053C Block bump slot Y Lo
	.res 3

; unused ($53D-$541)
	.res 5

; The alternate vertical scrolls are used so that raster effects can be properly implemented!
Level_VertScrollH:    ; Alternate VertScroll_Hi used by engine, adjusted before being sent to Vert_Scroll_Hi
	.res 1
Level_VertScroll:     ; Alternate VertScroll used by engine, adjusted before being sent to Vert_Scroll
	.res 1

Player_AboveTop:      ; If Player is above top of level, this is $FF (-1), otherwise it is zero
	.res 1

Level_InitAction:     ; AT LEVEL INITIALIZATION ONLY: Performs a specific initialization routine (NOTE: Shared with Player_Slide)
Player_Slide:         ; Positive values sliding forward, negative values sliding backward; directly sets Player_XVel
	.res 1

Player_UphillFlag:    ; When set, Player is walking uphill, and uses speed index value at Player_UphillSpeedIdx
	.res 1

; unused ($547-$54E)
	.res 8

Player_Flip:          ; Invincibility Somersault is used when set; only works in air, reset on ground
	.res 1

Level_AirshipH:       ; Height of the airship during the Airship Intro (shared with Player_KuriboDir)
Player_KuriboDir:     ; While Kuribo's shoe is moving: 0 - Not requesting move, 1 - move right, 2 - move left
	.res 1

Player_Grow:          ; Tick counter used to animate growth into Super Mario (20 is starting value, or 2f to shrink)
	.res 1
Player_FlashInv:      ; Player "flashing invincibility" after being hit, counts down to zero
	.res 1
Player_StarInv:       ; Starman Invincibility counter; full/fatal invincibility, counts down to zero
	.res 1
Player_SuitLost:      ; Suit lost to hit discard "poof" counter
	.res 1
Player_StarOff:       ; Starman Invincibility wear-off (the last second or so when it slows and vanishes), counts down to zero
	.res 1
Player_HaltTick:      ; When non-zero, all action halts until this countdown hits zero
	.res 1
Player_Kick:          ; Kick frame in use, counts down to zero
	.res 1
Player_PipeFace:      ; Player forward frame, used for vertical pipe entrance, counts down to zero
	.res 1
Player_EndLevel:      ; Player's end of level run-off until count down to zero (player will actually wrap around horizontally if too large)
	.res 1
Level_AirshipCtl:     ; Airship control -- 1 = run and jump to catch air ship, 2 = climb to enter, 3 = enter
	.res 1

; unused ($55B)
	.res 1

Counter_Wiggly:       ; "Wiggly" counter, provides rippled movement (like the airship rising during its intro)
	.res 1
Counter_7to0:         ; Counter that runs from 7 to 0 continuously while level is in progress
	.res 1

; unused ($55E)
	.res 1

LevelPartialInit:     ; When set, performs a partial reinitialization of level data (notably does not perform the Level InitAction unless it is airship related)
	.res 1
Level_TilesetIdx:     ; Holds Level_Tileset as an "index" value instead, relative to levels (i.e. Level_Tileset - 1)
	.res 1
Level_ChangeReset:    ; When set to zero, a mass reset is performed (used when changing "scenes" in a single level)
	.res 1
Level_UnusedFlag:     ; Unused; only set in a couple places, but never read back!
	.res 1
Level_SlopeEn:        ; If set, enables slope tiles (otherwise they're considered flat top-only solids)
	.res 1

Level_ChgTileEvent:   ; When non-zero, queues a "change tile" event
	.res 1

Level_NoStopCnt:      ; A counter which continuously increments unless something is "stopping" the action
	.res 1
Level_Event:          ; Check "LevelEvent_Do" for values; 0 means nothing
	.res 1
Level_PSwitchCnt:     ; When non-zero, P-Switch is active (init @ $80); counts down to zero and restarts music
	.res 1

; unused ($568)
	.res 1

Player_SlideRate:     ; While Player is sliding, this is added to X Velocity (does not persist, however)
	.res 1

; unused ($56A)
	.res 1

Player_IsClimbing:    ; Set when Player is climing vine
	.res 1
Player_FlipBits_OLD:  ; Holds backup of Player_FlipBits
	.res 1
Player_HitCeiling:    ; Flag set when Player has just hit head off ceiling
	.res 1

Player_FlyTime:       ; When > 0, Player can fly (for power ups that do so); decrements (unless $FF) to 0
	.res 1
Player_IsDucking:     ; Set when Player is ducking down
	.res 1
Player_WhiteBlkCnt:   ; White block counter; counts up while Player is standing on white block and holding down
	.res 1

; Level_PipeMove is set to various values that dictate 
; how Player is moving within a pipe
;
; The lower 2 bits form a direction as follows:
;	00 - right
;	01 - left
;	10 - down
;	11 - up
;
; If bit 7 ($80) is NOT set, then we're just entering
; the pipe, and next 3 bits say what it will do:
; 000xx - Does nothing (not used, invalid)
; 001xx - Exits level (i.e. World Map pipe junctions)
; 010xx - Junction to appropriate "Big Question Block" bonus area (Level_JctCtl = 2)
; 011xx - Junction general (Level_JctCtl = 3)
; 100xx - Junction to generic exit area (Level_JctCtl = 4)
; 101xx - In-level transit (a la World 7 pipe mazes and other places; does not set Level_JctCtl)
;
; If bit 7 IS set, we're moving through the pipe (either exiting out one end or in-transit)
Level_PipeMove:
	.res 1

Level_CoinHeav:       ; Enter coin heaven when set $80; Increments; at $D0, "soft jump" arrival; terminates at wrap to $00
	.res 1

Player_MoveLR:        ; 0 - Not moving left/right, 1 - Moving left, 2 - Moving right (reversed from the pad input)
	.res 1

Player_WalkAnimTicks: ; Ticks between animation frames of walking; max value varies by Player's X velocity
	.res 1

Player_InWater:       ; Set for when in water (1 = Regular water specifically, other non-zero values indicate waterfall)
	.res 1
Player_SwimCnt:       ; Swim counter FIXME Describe better 0-3
	.res 1
Player_Kuribo:        ; Set for Kuribo's Shoe active
	.res 1
Player_QueueSuit:     ; Queues a suit change (values like Player_Suit, but add 1, EXCEPT: $0F = Statue enable, $40 = Splash, $80 = Kuribo's Shoe)
	.res 1
Player_mGoomba:       ; Player is caught by a micro Goomba (jump short)
	.res 1
Player_Statue:        ; Player is in Tanooki Statue mode; counts down to zero
	.res 1
Player_RunFlag:       ; Set while Player is actually considered "running" (holding down B and at enough speed; doesn't persist)
	.res 1
Player_Bounce:        ; Set to cause block bounce (upper 4 bits specifies what kind of block will be bounced)
	.res 1
Player_BounceDir:     ; Direction of Player bounce -- 0 = Down, 1 = Up, 2 = Left, 3 = Right
	.res 1
Player_BounceObj:     ; Set if it was a kicked shelled object that hit the bounce block (i.e. don't bounce the Player if the object is the one that hit) 
	.res 1
Counter_ByPlayerSpd:  ; A counter which increments faster as the Player goes faster
	.res 1

Level_HAutoScroll:    ; When set to 1, "auto horizontal scroll" is active (this can be toggled mid-level)
	.res 1
B10Coin_Count:        ; Decrements until -1, you continue to get a coin until it does so
	.res 1
B10Coin_ID:           ; Forms a sort of unique ID so game knows if you've switched blocks
	.res 1

Player_OffScreen:     ; Set when Player is completely off screen
	.res 1

; FloatLevel_PlayerWaterStat: For levels that "float" and have a fixed set of water at the bottom
; Bit 6: Set if Player is beneath bottom of water
; Bit 7: Set if beneath top of water
FloatLevel_PlayerWaterStat:
	.res 1


Player_LowClearance:  ; Set when Player is in a "low clearance" situation (big Mario in a single block high tunnel)
	.res 1

PUp_StarManFlash:     ; Set when a Starman is bouncing about so it cycles colors! (also used to get super suit if set in advance)
	.res 1

; Player_Behind_En:
; Specifies whether the "Behind the scenes" effect is actually active
; If the Player has stepped out from behind the background, it can be
; still active, but he won't get the effect of it!
Player_Behind_En:
	.res 1
Player_Behind:        ; When non-zero, Player is "behind the scenes" (as by white block)
	.res 1

Player_Slippery:      ; 0 = Ground is not slippery, 1 = Ground is a little slippery, 2 = Ground is REALLY slippery
	.res 1
Player_SandSink:      ; Sinking in quicksand! (holds Y when quicksand hit in upper 4 bits, bit 0 sets '0' jumping, '1' sinking)
	.res 1

; Player_PartDetEn: "32 Pixel Partition Detection" enabler
; When set, if Player Y >= 160, Player detects bottom two rows of tiles implicitly
; Used with Update_Request = UPDATERASTER_32PIXPART if there's a floor 
; (i.e. NOT used in levels with fixed water; for that, see FloatLevel_PlayerWaterStat)
Player_PartDetEn:
	.res 1
Player_InPipe:        ; Player is going through pipe
	.res 1
Player_MushFall:      ; Set to 0 when mushroom is to fall to the left, 1 to the right
	.res 1
Player_SprOff:        ; Player sprite offset (NOTE: Should be multiples of 4, otherwise bad unaligned stuff happens!)
	.res 1

; Strange gapping here; there's pretty much enough room for a couple more special objects
Object_SprRAM:        ; $058F-$0596 Sprite_RAM offset by object
	.res 8

SpecialObj_Var2:      ; $0597-$059E General purpose variable 2
	.res 8

; unused ($59F-$5A0)
	.res 2

SpecialObj_YVelFrac:  ; $05A1-$05A8 Y velocity fractional accumulator
	.res 8

; unused ($5A9-$5AA)
	.res 2

SpecialObj_XVelFrac:  ; $05AB-$05B2 X velocity fractional accumulator
	.res 8

; unused ($5B3-$5B4)
	.res 2

SpecialObj_Var3:      ; $05B5-$05BC General purpose variable 3
	.res 8

; unused ($5BD-$5BE)
	.res 2

SpecialObj_YLo:       ; $05BF-$05C6 Y low coordinate of special object
	.res 8

; unused ($5C7-$5C8)
	.res 2

SpecialObj_XLo:       ; $05C9-$05D0 X low coordinate of special object
	.res 8

; unused ($5D1-$5D2)
	.res 2

SpecialObj_YVel:      ; $05D3-$05DA Y Velocity of special object
	.res 8

; unused ($5DB-$5DC)
	.res 2

SpecialObj_XVel:      ; $05DD-$05E4 X Velocity of special object
	.res 8

; unused ($5E5-$5EC)
	.res 8

Misc_Counter:         ; Miscellaneous loop counter ?
	.res 1
Level_TimerMSD:       ; Leftmost / most significant digit on timer
	.res 1
Level_TimerMid:       ; Middle digit on timer
	.res 1
Level_TimerLSD:       ; Rightmost / least significant digit on timer
	.res 1
Level_TimerTick:      ; Timer decrementing tick
	.res 1
Inventory_Open:       ; Set when inventory panel is open, also used to dictate whether it is "opening" (1) or "closing" (0)
	.res 1
Level_TimerEn:        ; Set to disable clock (bit 7 will also disable level animations, e.g. '?s')
	.res 1
Kill_Tally:           ; Counter that increases with each successful hit of an object without touching the ground
	.res 1

Objects_KillTally:    ; $05F5-$05F9 OBJECT SLOTS 0 - 4 ONLY: Kill_Tally for a kicked shell as it hits other enemies 
	.res 5

PlayerProj_YHi:       ; $05FA-$05FB Player projectile Y Hi
	.res 2

Level_AScrlConfig:
	.res 1

Cine_ToadKing:        ; Set to 1, initializes Toad and transformed king; set to 2 while running that cinematic
	.res 1
; The diagonal auto scroller wraps vertically several times to give the illusion
; of a long vertical strip.  AScrlURDiag_WrapState is set to 1 and 2 during this
; process which makes it possible.  Objects that need to offset themselves to
; cope with this behavior utilize AScrlURDiag_WrapState_Copy to stay in sync.
AScrlURDiag_WrapState_Copy: ; Copy of AScrlURDiag_WrapState
	.res 1
AScrlURDiag_WrapState:
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $06xx RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.segment "GENBSS1"
; DURING ENDING ONLY (reuses 192 bytes of this segment)
Ending_CmdBuffer:     ; $0600-$06C0 Buffer used during ending sequence

; Normal purpose $06xx RAM...
; unused ($600-$601)
	.res 2

Level_Tile_Head:      ; Tile at Player's head 
	.res 1
Level_Tile_GndL:      ; Tile at Player's feet left
	.res 1
Level_Tile_GndR:      ; Tile at Player's feet right
	.res 1
Level_Tile_InFL:      ; Tile "in front" of Player ("lower", at feet)
	.res 1
Level_Tile_InFU:      ; Tile "in front" of Player ("upper", at face)
	.res 1
Level_Tile_Whack:     ; Tile last hit by tail attack or shell
	.res 1
Level_Tile_Quad:      ; $0608-$060B Quadrant of tile for each of the positions above
	.res 4

; unused ($60C)
	.res 1

; Level_Tile_Slope: Slope of tile for each of the positions above (first byte also used by objects)
; 0: Slope shape at feet
; 1: Slope shape at head
; 2: "in front" of Player ("lower", at feet)
; 3: "in front" of Player ("upper", at face)
Level_Tile_Slope:     ; $060D-$0610
	.res 6

; unused ($611)
	.res 1

Scroll_Cols2Upd:      ; Number of 8x8 columns to update (typically set to 32 for a full dirty update)
	.res 1

; unused ($613-$618)
	.res 6

Bonus_CoinsYVel:      ; $0619-$061E UNUSED Bonus game coins Y velocity
	.res 6
Bonus_CoinsY:         ; $061F-$0624 UNUSED Bonus game coins Y
	.res 6
Bonus_CoinsXVel:      ; $0625-$062A UNUSED Bonus game coins X velocity
	.res 6
Bonus_CoinsX:         ; $062B-$0630 UNUSED Bonus game coins X
	.res 6
Bonus_CoinsYVelFrac:  ; $0631-$0636 UNUSED Bonus game coins Y velocity fractional accumulator
	.res 6

; unused ($637-$63C)
	.res 6


Bonus_CoinsXVelFrac:  ; $063D-$0642 UNUSED Bonus game coins X velocity fractional accumulator
	.res 6

; unused ($643-$64A)
	.res 8

Object_TileFeet:      ; Object tile detected at "feet" of object
	.res 1
Object_TileWall:      ; Object tile detected in front of object, i.e. a wall
	.res 1

; unused ($64D)
	.res 1


Object_AttrFeet:      ; Object tile quadrant of Object_TileFeet
	.res 1
Object_AttrWall:      ; Object tile quadrant of Object_TileWall
	.res 1

; unused ($650)
	.res 1


Objects_SprHVis:      ; $0651-$0658 Flags; Bits 7-2 set when each 8x16 sprite is horizontally off-screen (left-to-right from MSb)
	.res 8
Objects_SpawnIdx:     ; $0659-$0660 Holds the index into level data that this object was spawned from
	.res 8

Objects_State:
	.res 8

Objects_Frame:        ; $0669-$0670 "Frame" of object (see ObjectGroup_PatternSets)
	.res 8

Level_ObjectID:       ; $0671-$0678 All active actor IDs
	.res 8

Objects_FlipBits:     ; $0679-$0680 Applied sprite attributes for this object (usually just horizontal/vertical flip)
	.res 8

Objects_SprVVis:      ; $0681-$0688 Flags; Bits 3-0 set when each 8x16 sprite is vertically off-screen (top-to-bottom from MSb)
	.res 8
Objects_Var1:         ; $0689-$0690 Generic variable 1 for objects
	.res 8
Objects_Var2:         ; $0691-$0698 Generic variable 2 for objects
	.res 8

Unused699:            ; Absolutely no idea, it is set once in one place and never used again... MAY be lost bonus game related?
	.res 1

; UNUSED Bonus Game Die counter
; While the die is rotating, just used as a counter 0 to 3 to time the rolling animation.
; After Player would press 'A', this value is immediately set to 0.
; In the case of the odd/even game, if the Player "won", it is set to 5 or 6.
Bonus_DieCnt:
	.res 1

; unused ($69B)
	.res 1

Score_Earned:         ; $069C-$069D (16-bit value) A "buffer" of score earned to be added to your total, total score stored in Player_Score
	.res 2
Score_Temp:           ; Temp used when figuring out to display a 3-byte integer worth of score
	.res 1

; unused ($69F-$6A3)
	.res 5

Player_IsHolding:     ; Set when Player is holding something (animation effect only)
	.res 1
Player_ISHolding_OLD: ; Holds onto whether Player WAS holding onto something (so we can be sure to clear Player_IsHolding)
	.res 1

; NOTE!! These object vars are OBJECT SLOT 0 - 4 ONLY!

; Objects_Timer3: Used as the "wake up" out of shell timer
; If timer is less than $60, it decrements normally, otherwise...
;	If object is in state 2, timer decrements normally
;	If object is in state 4 (being held), timer only decrements every 4 ticks
;	In all other states, timer decrements every 2 ticks
Objects_Timer3:       ; $06A6-$06AA Used as the "wake up" out of shell timer
	.res 5
Objects_Timer4:       ; $06AB-$06AF "Timer" values; automatically decrements to zero (used in "shakin' awake" effect)
	.res 5

; unused ($6B0-$6B2)
	.res 3

Object_SlopeHeight:   ; Object calculated slope height
	.res 1
Buffer_Occupied:      ; $06B4-$06B5 Set if respective Object_BufferX/Y buffer is already taken by an object
	.res 2

Player_UphillSpeedIdx: ; Override when Player_UphillFlag is set (shared with Player_Microgoomba)
Player_Microgoomba:   ; Microgoomba stuck to Player
	.res 1
Objects_InWater:      ; $06B7-$06BB Set when object is in water
	.res 5

; unused ($6BC)
	.res 1

SpecialObj_Var1:      ; $06BD-$06C4 General purpose variable 1
	.res 8

; unused ($6C5-$6C6)
	.res 2

SpecialObj_Data:      ; $06C7-$06CE Special object "data" field, defined by object
	.res 8

; unused ($6CF-$6D0)
	.res 2

SpecialObj_Timer:     ; $06D1-$06D8 "Timer" values; automatically decrements to zero
	.res 8

; unused ($6D9-$6DA)
	.res 2

CannonFire_Var:       ; $06DB-$06E2
	.res 8
CannonFire_Timer:     ; $06E3-$06EA Cannon Fire timer, decrements to zero
	.res 8
Objects_QSandCtr:     ; $06EB-$06F2 When enemy has fallen into quicksand, increments until $90 which deletes it
	.res 8
