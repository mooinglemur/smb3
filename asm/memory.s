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
