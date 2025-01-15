; COMMONZP
.exportzp Temp_Var1, Temp_Var2, Temp_Var3, Temp_Var4, Temp_Var5, Temp_Var6, Temp_Var7, Temp_Var8
.exportzp Temp_Var9, Temp_Var10, Temp_Var11, Temp_Var12, Temp_Var13, Temp_Var14, Temp_Var15, Temp_Var16
.exportzp VBlank_Tick, Horz_Scroll_Hi, PPU_CTL1_Mod, Vert_Scroll_Hi, Level_ExitToMap, Counter_1, PPU_CTL2_Copy, Pad_Holding
.exportzp Pad_Input, Roulette_RowIdx, Pal_Force_Set12, PlantInfest_ACnt, VBlank_TickEn, Map_Enter2PFlag, Map_EnterViaID, Map_EnterLevelFX
.exportzp Map_IntBoxErase, Map_ClearLevelFXCnt, Map_ScrollOddEven, Level_Width, Scroll_ColumnR, Scroll_ColumnL, Scroll_VOffsetT, Scroll_VOffsetB
.exportzp Scroll_ColorStrip, Scroll_LastDir, Scroll_RightUpd, Scroll_VertUpd, Scroll_LeftUpd, Graphics_Queue, Level_LayPtr_AddrL, Level_LayPtr_AddrH
.exportzp Map_Tile_AddrL, Map_Tile_AddrH, BonusText_BaseL, BonusText_BaseH, Level_ObjPtr_AddrL, Level_ObjPtr_AddrH, Video_Upd_AddrL, Video_Upd_AddrH
.exportzp Music_Base_L, Music_Base_H, Sound_Sqr_FreqL, Sound_Sqr_FreqH, Sound_Map_EntrV, Sound_Map_EntV2, Music_PatchAdrL, Music_PatchAdrH
.exportzp Sound_Map_Off
; COMMONHIZP
.exportzp Scroll_OddEven, Controller1Press, Controller2Press, Controller1, Controller2, Vert_Scroll, Horz_Scroll, PPU_CTL1_Copy
; TITLEZP
.exportzp Title_XPosHi, Title_YPosHi, Title_ObjX, Title_ObjY, Title_ObjXVel, Title_ObjYVel, Title_XPosFrac, Title_YPosFrac
.exportzp Title_ObjYVelChng, Title_ObjMLFlags, Title_ObjMLMoveDir, Title_ObjMLAnimFrame, Title_ObjMLDirTicks, Title_ObjMLSprite, Title_ObjMLPower
.exportzp Title_ObjMLSprRAMOff, Title_ObjMLSprVis, Title_ObjMLTailTick, Title_ObjMLHold, Title_ObjMLBonkTick, Title_ObjMLKickTick, Title_ObjMPowerDown
.exportzp Title_ObjMLStop, Title_CurMLIndex, Ending_Timer, Title_ObjFlags, EndText_Timer , EndText_CPos, Title_ObjStates, EndText_State , Title_State
.exportzp Title_ResetCnt, Title_ResetCnt2, Title_ResetTrig, Title_UnusedFlag, Title_Ticker, Title_MActScriptPos, Title_LActScriptPos, Title_MActScriptDelay
.exportzp Title_LActScriptDelay, Title_MActScriptDirSet, Title_LActScriptDirSet, Title_ObjMLDir, Title_ObjMLQueue, Title_EventIndex, Title_EventGrafX
.exportzp Title_ObjInitIdx, Title_ObjInitDly, Title_3GlowFlag, Title_3GlowIndex, Ending2_IntCmd, Ending_State, EndText_VL, EndText_VH
; ENDINGZP
.exportzp Ending2_PicState, Ending2_ClearLen, Ending2_ClearPat, Ending2_PicVRAMH, Ending2_PicVRAML, Ending2_QCmdEnd, Ending2_FadeTimer, Ending2_QueueCmd
.exportzp Ending2_TimerH, Ending2_TimerL, Ending2_CurWorld
; WORLDMAPZP
.exportzp World_Map_Y, World_Map_XHi, World_Map_X, World_Map_Move, World_Map_Dir, Map_UnusedPlayerVal, Map_UnusedPlayerVal2, Map_WWOrHT_Y, Map_HandTrap_XHi
.exportzp Map_WWOrHT_X, Map_WWOrHT_Cnt, Map_WWOrHT_Dir, Map_WarpWind_FX, Map_StarFX_State, World_Map_Twirl, Map_Skid_DeltaY, Map_Skid_DeltaFracY
.exportzp Map_Skid_FracY, Map_Skid_DeltaX, Map_Skid_DeltaFracX, Map_Skid_FracX, Map_Skid_FracCarry, Map_Skid_Count, Map_Skid_Counter, Map_Skid_TravDirs
.exportzp Map_StarsX, Map_StarsY, Map_StarsOutRad, Map_StarsXSteps, Map_StarsRadCnt, Map_StarsCenterX, Map_StarsCenterY, Map_StarsDeltaR, Map_StarsConst9
.exportzp Map_StarsAnimCnt, Map_StarsFrame, Map_StarsPattern, Map_StarsLandRad, Map_StarsYSteps, Map_StarsRadius, Map_StarsState, Map_SkidBack
.exportzp Map_UnusedGOFlag, Map_Intro_CurStripe, Map_Intro_NTOff, Map_Intro_ATOff, Map_Airship_DC, Map_Airship_DY, Map_Airship_YNib, Map_Airship_YAcc
.exportzp Map_Airship_DXHi, Map_Airship_DX, Map_Airship_XNib, Map_Airship_Dir, Map_HideObj, MapPoof_Y, MapPoof_X, Map_UseItem, World_Map_Tile, Scroll_Temp
.exportzp Player_WalkFrame
; BONUSGAMEZP
.exportzp BonusCoins_State, BonusDie_Y, BonusDie_X, BonusDie_YVel, BonusDie_YVelFrac
; VSZP
.exportzp Vs_State, Vs_IsPaused
; GAMEPLAYZP
.exportzp Player_XHi, Objects_XHi, CineKing_DialogState, Objects_Var4, Pipe_PlayerX, Pipe_PlayerY, Level_GndLUT_Addr, Player_YHi, Objects_YHi, Player_X
.exportzp Objects_X, CineKing_Var, Objects_Var5, Player_Y, Objects_Y, Player_SpriteX, Objects_SpriteX, Player_SpriteY, Objects_SpriteY, Player_XVel
.exportzp Objects_XVel, Objects_VarBSS, SlotIndexBackup, Player_HaltGame, Player_YVel, Objects_YVel, Player_InAir, CineKing_Frame2, Objects_DetStat
.exportzp Player_SprWorkL, Player_SprWorkH, Level_TileOff, Level_Tile, Player_Slopes, Player_XStart, Player_Suit, Player_Frame, Player_FlipBits
.exportzp Player_WagCount, Player_IsDying, Obj01_Flag
; ONEPAGE
.export Update_Select, Raster_Effect, Debug_Flag
; OAMSHADOW
.export Sprite_RAM
; GFXBSS
.export Graphics_BufCnt, Graphics_Buffer, TileChng_VRAM_H, TileChng_VRAM_L, TileChng_Pats, Level_SizeOrig, Level_PipeExitDir, Level_7VertCopy
.export Level_PipeNotExit, Level_PauseFlag, Level_SkipStatusBarUpd, Raster_State, Scroll_ToVRAMHi, Scroll_LastCol8, Scroll_LastOff8, Scroll_PatStrip
.export Scroll_ToVRAMHA, Scroll_LastAttr, Scroll_AttrStrip, World_Num_Debug, Map_StarsDeltaX, Map_StarsDeltaY, Map_Stars_PRelX, Map_Stars_PRelY
.export Player_Power, Level_JctCtl, Level_JctFlag, Map_DrawPanState, ObjGroupRel_Idx, InvFlip_VAddrHi, InvFlip_Frame, InvFlip_Counter, InvStart_Item
.export InvHilite_X, InvHilite_Item, THouse_ID, THouse_Treasure, Coins_Earned, Map_Powerup_Poof, Level_FreeVertScroll, Level_7Vertical, Level_SelXStart
.export Update_Request, Map_Starman, Map_Power_Disp, Map_Warp_PrevWorld
; WORLDMAPBSS
.export Map_EntTran_VLHalf, Map_EntTran_TBCnt, Map_EntTran_LRCnt, Map_W8D_VAddrH, Map_EntTran_BVAddrH, Map_W8D_VAddrL, Map_EntTran_BVAddrL
.export Map_EntTran_BorderLoop, Map_EntTran_Cnt, Map_W8D_VAddrH2, Map_EntTran_VAddrH, Map_EntTran_VAddrHAdj, Map_W8D_VAddrL2, Map_EntTran_VAddrL
.export Map_EntTran_TileOff, Map_W8D_TileOff, Map_EntTran_Tile8x8, Map_EntTran_VRAMGap, Map_W8D_YOff, Map_W8D_XOff, Map_W8D_RC, Map_W8D_Dir, Map_W8D_X
.export Map_W8D_Y, Map_W8D_Idx, Map_EntTran_Temp, Map_EntTran_InitValIdx
; BONUSGAMEBSS
.export Roulette_Pos, Roulette_PosHi, Roulette_ShapeLock, Roulette_ConfigRun, Roulette_ConfigState, Roulette_RunState, Roulette_StopState, Roulette_xUpY
.export Roulette_LivesToGive, Roulette_Speed, Roulette_StopCnt, Roulette_PosFrac, Roulette_Turns, Card_SelectX, Bonus_PrizeX, Card_SelectY, Bonus_PrizeY
.export Card_Index, Bonus_CurBufOffset, Card_FirstIndex, Bonus_Round2, Card_SelectXOrig, Card_MoveDelay, Card_SprRAMOff, Card_AnimTick, Card_VRAM_L
.export Card_VRAM_H, Card_FlipCount, Card_MatchCard, Card_UnusedVL, Card_UnusedVH, Bonus_GameHost, Card_GameState, Card_TurnsRemain, Card_FlipFrame
.export Card_UnusedArray, Card_UnusedAttr, Card_UnusedArrIdx, Card_Matches, Card_CoinsToGive, Bonus_GameState, Card_InitState, Bonus_GameType, Bonus_KTPrize
; GAMEPLAYBSS
.export Fade_State, Fade_Tick, Fade_Level, FadeOut_Cancel, Player_AllowAirJump, Player_XVelAdj, CineKing_Frame, Objects_Var7
; MUSICQBSS
.export Level_MusicQueue, Level_MusicQueueRestore
; SOUNDENGINEBSS
.export Music_TriTrkPos, Music_NseTrkPos, Music_PCMTrkPos, Music_Sq2RestH, Music_Sq2Rest, Music_Sq2NoteLen, Music_Sq1Rest, Music_Sq1NoteLen
.export Music_TriRestH, Music_TriRest, Music_NoiseRest, Music_NseRestH, Music_DMCRest, Music_DMCRestH, Music_PCMStart, Music_NextIndex, SFX_Counter1
.export SndCur_Player, SndCur_Level1, SndCur_Level2, SndCur_Music1, SndCur_Music2, SndCur_Map, SndCur_Pause, SFX_Counter2, SFX_Counter3, SFX_Counter4
.export Sound_IsPaused, Sound_QPlayer, Sound_QLevel1, Sound_QLevel2, Sound_QMusic1, Sound_QMusic2, Sound_QMap, Sound_QPause, DMC_Time, Music_Sq1RestH
.export Music_Sq1AltRamp, Music_LOST4FB, Music_LOST4FC, Music_RestH_Base, Music_Sq2TrkOff, Music_Sq1TrkOff
; TITLEBSS
.export Title_MLAccelCnt, Title_MarioPoof, Title_MLHoldTick, Title_ObjVar, Title_ObjVar2, Title_ObjFrame
; WORLDMAPBSS2
.export Map_Object_ActY, Map_Object_ActX, Map_Object_ActXH, Map_Object_Data, Map_March_Count, Map_Objects_Vis, Map_MarchInit, Map_InCanoe_Flag
.export World_8_Dark, World_Map_AnimF, World_Map_AnimT
; BONUSGAMEBSS2
.export BonusText_VH, BonusText_VL
; GAMEPLAYBSS2
.export Event_Countdown, Player_TailCount, Player_InAir_OLD, Player_FireCount, Player_FrogHopCnt, Player_PMeterCnt, B10Coin_Timer, Player_TailAttack
.export CineKing_Timer, Objects_Timer, Objects_Timer2, Level_BlockChgXHi, Level_BlockChgXLo, Level_BlockChgYHi, Level_BlockChgYLo, Level_BlkBump_Pos
.export Level_BlkBump, Level_BlkBump_XHi, Level_BlkBump_XLo, Level_BlkBump_YHi, Level_BlkBump_YLo, Level_VertScrollH, Level_VertScroll, Player_AboveTop
.export Level_InitAction, Player_Slide, Player_UphillFlag, Player_Flip, Level_AirshipH, Player_KuriboDir, Player_Grow, Player_FlashInv, Player_StarInv
.export Player_SuitLost, Player_StarOff, Player_HaltTick, Player_Kick, Player_PipeFace, Player_EndLevel, Level_AirshipCtl, Counter_Wiggly, Counter_7to0
.export LevelPartialInit, Level_TilesetIdx, Level_ChangeReset, Level_UnusedFlag, Level_SlopeEn, Level_ChgTileEvent, Level_NoStopCnt, Level_Event
.export Level_PSwitchCnt, Player_SlideRate, Player_IsClimbing, Player_FlipBits_OLD, Player_HitCeiling, Player_FlyTime, Player_IsDucking, Player_WhiteBlkCnt
.export Level_PipeMove, Level_CoinHeav, Player_MoveLR, Player_WalkAnimTicks, Player_InWater, Player_SwimCnt, Player_Kuribo, Player_QueueSuit, Player_mGoomba
.export Player_Statue, Player_RunFlag, Player_Bounce, Player_BounceDir, Player_BounceObj, Counter_ByPlayerSpd, Level_HAutoScroll, B10Coin_Count, B10Coin_ID
.export Player_OffScreen, FloatLevel_PlayerWaterStat, Player_LowClearance, PUp_StarManFlash, Player_Behind_En, Player_Behind, Player_Slippery
.export Player_SandSink, Player_PartDetEn, Player_InPipe, Player_MushFall, Player_SprOff, Object_SprRAM, SpecialObj_Var2, SpecialObj_YVelFrac
.export SpecialObj_XVelFrac, SpecialObj_Var3, SpecialObj_YLo, SpecialObj_XLo, SpecialObj_YVel, SpecialObj_XVel, Misc_Counter, Level_TimerMSD
.export Level_TimerMid, Level_TimerLSD, Level_TimerTick, Inventory_Open, Level_TimerEn, Kill_Tally, Objects_KillTally, PlayerProj_YHi, Level_AScrlConfig
.export Cine_ToadKing, AScrlURDiag_WrapState_Copy, AScrlURDiag_WrapState
; GENBSS1
.export Ending_CmdBuffer, Level_Tile_Head, Level_Tile_GndL, Level_Tile_GndR, Level_Tile_InFL, Level_Tile_InFU, Level_Tile_Whack, Level_Tile_Quad
.export Level_Tile_Slope, Scroll_Cols2Upd, Bonus_CoinsYVel, Bonus_CoinsY, Bonus_CoinsXVel, Bonus_CoinsX, Bonus_CoinsYVelFrac, Bonus_CoinsXVelFrac
.export Object_TileFeet, Object_TileWall, Object_AttrFeet, Object_AttrWall, Objects_SprHVis, Objects_SpawnIdx, Objects_State, Objects_Frame
.export Level_ObjectID, Objects_FlipBits, Objects_SprVVis, Objects_Var1, Objects_Var2, Unused699, Bonus_DieCnt, Score_Earned, Score_Temp
.export Player_IsHolding, Player_ISHolding_OLD, Objects_Timer3, Objects_Timer4, Object_SlopeHeight, Buffer_Occupied, Player_UphillSpeedIdx
.export Player_Microgoomba, Objects_InWater, SpecialObj_Var1, SpecialObj_Data, SpecialObj_Timer, CannonFire_Var, CannonFire_Timer, Objects_QSandCtr
; GENBSS2
.export TileAddr_Off, LevLoad_Unused1, LevLoad_Unused2, LevLoad_Unused3, LevLoad_Unused4, LL_ShapeDef, Scroll_UpdAttrFlag, Level_Tileset, Bonus_UnusedVH
.export ToadTalk_VH, Bonus_UnusedVL, ToadTalk_VL, BonusText_CPos, ToadTalk_CPos, BonusText_CharPause, Bonus_UnusedFlag, Map_Pan_Count, CineKing_Timer2
.export Bonus_Timer, Map_Intro_Tick, Map_ReturnStatus, MaxPower_Tick, Player_Score, PatTable_BankSel, PAGE_C000, PAGE_A000, PAGE_CMD, Map_Prev_XOff
.export Map_Prev_XHi, Player_Current, World_Num, World_EnterState, CineKing_State, GameOver_State, Map_Operation, Total_Players, Map_Unused72C, Bonus_DDDD
.export Map_HandState, Map_WW_Backup_Y, Map_WW_Backup_XH, Map_WW_Backup_X, Map_WW_Backup_UPV2, Player_Lives, Map_Unused738, ClearPattern
.export PalSel_Tile_Colors, PalSel_Obj_Colors, Player_FallToKing, Map_Player_SkidBack, Map_NSpadeMatches, Map_NSpadeInProg, Map_Airship_Trav
.export Map_DoFortressFX, World_Map_Power, Map_Unused749, Object_VelCarry, Player_XVelFrac, Objects_XVelFrac, THouse_UnusedFlag, Player_YVelFrac
.export Objects_YVelFrac, Objects_ColorCycle, Objects_Var6, Objects_TargetingXVal, King_Y, Objects_TargetingYVal, Pipe_TransYDelta, Level_ScrollDiffV
.export Level_ScrollDiffH, Random_Pool, RandomN, Map_PlayerLost2PVs, Player_RescuePrincess, Objects_PlayerHitStat, Scores_Value, Scores_Counter, Scores_Y
.export Scores_X, LRBounce_Y, LRBounce_X, LRBounce_Vel, Objects_Slope, World3_Bridge, ArrowPlat_IsActive, Level_GetWandState, Video_DoPalUpd
.export Palette_AddrHi, Palette_AddrLo, Palette_BufCnt, Palette_Buffer, Palette_Term, BigQBlock_GotIt, DMC_Queue, DMC_Current, Sound_Sq1_CurFL
.export Music_NseStart, Music2_Hold, Sound_Sq2_CurFL, Music_Sq2Patch, Music_Sq1Patch, Sound_Map_L2Hld, Sound_Map_Len2, Sound_Map_LHold, Sound_Map_Len
.export Sound_Map_Off2, Sound_Unused7FF
; VS2PSRAM
.export Vs_MemStart, Vs_PlayerFrame, Vs_PlayerState, Vs_ObjectState, Vs_PlayerBlkHitCnt, Vs_PlayerY, Vs_ObjectsY, Vs_PlayerBlkHitY, Vs_PlayerX
.export Vs_ObjectsX, Vs_PlayerBlkHitX, Vs_PlayerYVel, Vs_ObjectYVel, Vs_PlayerBlkHitYVel, Vs_PlayerXVel, Vs_ObjectXVel, Vs_PlayerClimbFrame
.export Vs_ObjectAnimCnt, Vs_PlayerDir, Vs_ObjectDir, Vs_PlayerYVelFrac, Vs_ObjectYVelFrac, Vs_PlayerXVelFrac, Vs_ObjectXVelFrac, Vs_PlayerDetStat
.export Vs_ObjectDetStat, Vs_ObjectVar1, Vs_PlayerKick, Vs_PlayerDizzy, Vs_PlayerStick, Vs_PlayerBumpTimer, Vs_POWBlockCnt, Vs_ObjectId
.export Vs_ObjectSprRAMOff, Vs_ObjectSprRAMSel, Vs_EnemyCount, Vs_PlayerHaltTimer, Vs_ObjHaltTimer, Vs_ObjectTimer3, Vs_PlayerCnt
.export Vs_EnemyGetUpTimer, Vs_PlayerJumped, Vs_PlayerTileL, Vs_ObjectTileL, Vs_PlayerBlkHit, Vs_PlayerFlashInv, Vs_SpawnCnt2, Vs_TooLongCnt
.export Vs_CurIndex, Vs_PlayerTileU, Vs_ObjectPipeTimer, Vs_Random, Vs_PlayerCoins, Vs_TimeToExit, Vs_ObjectIsLast, Vs_POWHits, Vs_PlayerYOff
.export Vs_UNKGAMECnt, Vs_PlayerYHi, Vs_ObjectYHi, Vs_ObjectIsAngry, Vs_AngrySidesteppers, Vs_ObjectVDir, Vs_ObjectRestoreXVel, Vs_ObjTimer2
.export Vs_CardFlash, Vs_HaltTimerBackup, Vs_EnemySet, Vs_ObjectXOff, Vs_PlayerWalkCnt, Vs_PlayerWalkFrame, Vs_NextObjectIsLast, Vs_xUpCnt, Vs_xUpY
.export Vs_xUpX, Vs_xUpLives, Vs_SpawnCnt
; GENSRAM
.export Tile_Mem, Map_MoveRepeat, AScrlURDiag_OffsetX, AScrlURDiag_OffsetY, StatusBar_UpdFl, UpdSel_Disable, Map_Objects_Itm, Level_TreasureItem
.export Reset_Latch, Map_BonusType, Map_BonusCoinsReqd, Coins_ThisLevel, Map_NSpade_NextScore, Map_BonusAppY, Map_BonusAppXHi, Map_BonusAppX
.export Map_NoLoseTurn, Map_Got13Warp, Map_Anchored, Map_WhiteHouse, Map_CoinShip, Map_WasInPipeway, EndCard_Flag, Map_PlyrSprOvrY, Map_Entered_Y
.export Map_Entered_XHi, Map_Entered_X, Map_Previous_UnusedPVal2, Map_Previous_Y, Map_Previous_XHi, Map_Previous_X, Map_Unused7984, Map_Prev_XOff2
.export Map_Prev_XHi2, Map_Unused798A, Level_Jct_HSHi, Level_Jct_HS, Level_Jct_VSHi, Level_Jct_VS, Map_Unused7992, Bonus_DiePos, Map_Previous_Dir
.export Map_Unused7995, Player_NoSlopeStick, AScroll_Anchor, Level_AScrlSelect, Level_AScrlLimitSel, Level_AScrlVar, Level_AScrlLoopSel
.export Level_AScrlMoveRepeat, Level_AScrlLoopCurMove, Level_AScrlSclLastDir, Level_AScrlMoveTicks, Level_AScrlTimer, Level_AScrlPosHHi, Level_AScrlPosH
.export Level_AScrlPosV, Level_AScrlHVel, Level_AScrlVVel, Level_AScrlHVelFrac, Level_AScrlVVelFrac, Level_AScrlHVelCarry, Level_AScrlVVelCarry
.export World8Tank_OnTank, CannonFire_ID, CannonFire_YHi, CannonFire_Y, CannonFire_XHi, CannonFire_X, CannonFire_Parent, Splash_DisTimer
.export ShellKillFlash_Cnt, ShellKillFlash_Y, ShellKillFlash_X, Objects_DisPatChng, ObjSplash_DisTimer, PlayerProj_XVelFrac, CannonFire_Timer2
.export Roulette_Unused7A5F, Roulette_Unused7A5F_Delta, Bowser_Tiles, Bowser_Counter1, Bowser_Counter2, Bowser_Counter3, CoinShip_CoinGlowIdx
.export CoinShip_CoinGlowCnt, SObjBlooperKid_OutOfWater, Object_SplashAlt, Music_Start, Music_End, Music_Loop, Sound_Octave, Music_Sq1Bend
.export Music_Sq2Bend, Music_RestH_Off, PAPU_MODCTL_Copy, Level_ObjIdxStartByScreen, Level_ObjectsSpawned, Level_Objects, Object_BufferX, Object_BufferY
.export ChainChomp_ChainX1, ChainChomp_ChainX2, ChainChomp_ChainX3, ChainChomp_ChainX4, ChainChomp_ChainY1, ChainChomp_ChainY2, ChainChomp_ChainY3
.export ChainChomp_ChainY4, Objects_Var10, Objects_Var11, Objects_Var12, Objects_Var13, Objects_Var14, PlayerProj_ID, PlayerProj_Y, PlayerProj_X
.export PlayerProj_YVel, PlayerProj_XVel, Fireball_HitChkPass, PlayerProj_Cnt, Temp_VarNP0, Lakitu_Active, LevelEvent_Cnt, Vert_Scroll_Off
.export Level_Vibration, Player_VibeDisable, Player_TwisterSpin, Objects_HitCount, RotatingColor_Cnt, Wand_FrameCnt, Wand_Frame, Wand_BounceFlag
.export Player_DebugNoHitFlag, Map_Completions, Inventory_Items, Inventory_Cards, Inventory_Score, Inventory_Coins, Inventory_Items2, Inventory_Cards2
.export Inventory_Score2, Inventory_Coins2, Map_Unused7DC6, Map_GameOver_CursorY, Map_PrevMoveDir, Pal_Data, Level_AltLayout, Level_AltObjects
.export Level_BlockGrabHitMem, Card_ActiveSet, Tile_AttrTable, Level_UnusedSlopesTS5, PlantInfest_ACnt_Max, LevelJctBQ_Flag, Level_JctBackupTileset
.export Level_AltTileset, Level_LayPtrOrig_AddrL, Level_LayPtrOrig_AddrH, Level_ObjPtrOrig_AddrL, Level_ObjPtrOrig_AddrH, Level_BG_Page1_2
.export Map_BorderAttrFromTiles, Map_Unused7EEA, Map_Objects_Y, Map_Objects_XLo, Map_Objects_XHi, Map_Objects_IDs, Map_SprRAMOffDistr, Map_2PVsGame
.export Map_Airship_Dest, THouse_OpenByID, StatusBar_PMT, StatusBar_CoinH, StatusBar_CoinL, StatusBar_LivesH, StatusBar_LivesL, StatusBar_Score
.export StatusBar_Time, Map_MusicBox_Cnt, Level_JctYLHStart, Level_JctXLHStart, Object_TileFeet2, Object_TileWall2, ObjTile_DetYHi, ObjTile_DetYLo
.export ObjTile_DetXHi, ObjTile_DetXLo, Bubble_Cnt, WatrHit_IsSetFlag, Bubble_YHi, Object_WatrHitYHi, Bubble_Y, Object_WatrHitY, Bubble_XHi
.export Object_WatrHitXHi, Bubble_X, Object_WatrHitX, Splash_Counter, Splash_Y, Splash_X, Splash_NoScrollY, BrickBust_En, BrickBust_YUpr, BrickBust_X
.export BrickBust_YVel, BrickBust_XDist, BrickBust_YLwr, BrickBust_HEn, CoinPUp_State, CoinPUp_Y, CoinPUp_X, CoinPUp_YVel, CoinPUp_Counter
.export SpecialObj_ID, Objects_Var3, SpecialObj_YHi, Objects_LastTile, Objects_SprAttr, Objects_UseShortHTest, Roulette_Lives, Objects_IsGiant
; WANDSRAM
.export CineKing_WandState, CineKing_WandFrame, CineKing_ToadFrame, CineKing_DiagHi, CineKing_TimerT, CineKing_Timer3, CineKing_WandX, CineKing_WandY
.export CineKing_WandXVel, CineKing_WandYVel, CineKing_WandXVel_Frac, CineKing_WandYVel_Frac


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
	.res 1

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

Ending2_IntCmd:       ; used during ending to buffer out the ending picture data on the interrupt.  Triggers "Do_Ending2_IntCmd" in PRG024 in interrupt context.  Shared with Scroll_OddEven
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
Ending_Timer:         ; $D2-$D3 Twin ending timers, generally one for Mario and one for Princess
Title_ObjFlags:       ; $D2-$D7 Minor objects' sprite flags
	.res 6

EndText_Timer := Ending_Timer+2        ; Timer used for the ending text display
Ending_State  := Ending_Timer+3        ; Current state value for initial part of ending (the princess, prior to curtain)
EndText_VL    := Ending_Timer+4        ; Princess speech VRAM Address Low
EndText_VH    := Ending_Timer+5        ; Princess speech VRAM Address High

EndText_CPos:         ; Princess speech Character Position
Title_ObjStates:      ; $D8-$DD Title screen array of states for the individual objects (NOT including Mario/Luigi)
	.res 6
EndText_State := EndText_CPos+1       ; Princess speech state variable

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

.segment "ENDINGZP": zeropage
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
	.res 4

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $07xx RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GENBSS2"

TileAddr_Off:         ; During level loading, specifies an offset into the current Mem_Tile_Addr setting
	.res 1

; LevLoad_Unused1-4 are initialized when about to load a level, 
; but never used.  May have been reserved or intended or 
; even debugging, but who knows now...
LevLoad_Unused1:
	.res 1
LevLoad_Unused2:
	.res 1
LevLoad_Unused3:
	.res 1
LevLoad_Unused4:
	.res 1

; unused ($705)
	.res 1

LL_ShapeDef:          ; During level loading, defines a shape of something (context-specific)
	.res 1

Scroll_UpdAttrFlag:   ; Set when it is time to update attributes
	.res 1

; unused ($708-$709)
	.res 2

; Tileset values:
; 00 = On map
; 01 = Plains style; bushes, zigzag ground, blocks (includes blue-block bonus area)
; 02 = Mini fortress style; gray blocks, lava (and king's room)
; 03 = Hills style; green grass, bushes (works in desert like 2-2 also)
; 04 = High-Up style; "cliffside" grass, swirly clouds, wooden block style ground
; 05 = pipe world plant infestation
; 06 = Water world
; 07 = Toad House
; 08 = Vertical pipe maze
; 09 = desert level, sand, pyramids (and desert fortress)
; 10 = Airship
; 11 = Giant World
; 12 = Ice level, frozen "1" style
; 13 = Coin heaven / Sky level
; 14 = Underground
; 15 = Bonus game intro and N-Spade
; 16 = Spade game sliders
; 17 = N-Spade
; 18 = 2P vs
Level_Tileset:        ; Different tilesets which changes the detection and meaning in levels
	.res 1

Bonus_UnusedVH:       ; VRAM High address ?? Seems to only be part of an unused routine
ToadTalk_VH:          ; Cinematic Toad & King / "Toad House" Toad VRAM Address High
	.res 1

Bonus_UnusedVL:       ; VRAM Low address ?? Seems to only be part of an unused routine
ToadTalk_VL:          ; Cinematic Toad & King / "Toad House" Toad VRAM Address Low
	.res 1

BonusText_CPos:
ToadTalk_CPos:        ; Cinematic Toad & King / "Toad House" Toad Character Position
	.res 1

BonusText_CharPause:  ; Counter that decrements to zero between letters
	.res 1
Bonus_UnusedFlag:     ; Doesn't do much besides block an unused subroutine
	.res 1

Map_Pan_Count:        ; Map is panning, counts to zero (Scroll_LastDir sets which direction we're panning)
	.res 1

; NOTE sharing
CineKing_Timer2:      ; Timer; decrements to zero
Bonus_Timer:          ; Decrements to zero
Map_Intro_Tick:       ; Counts down to zero while displaying the "World X" intro
	.res 1

; unused ($712)
	.res 1

Map_ReturnStatus:     ; When 0, level panel is cleared; otherwise, Player is considered to have died (decrements life!)
	.res 1
MaxPower_Tick:        ; When Player has maximum "power" charge, this counts for the flashing [P]
	.res 1
Player_Score:         ; $0715 (H)-$0717 (L) treated as 3-byte integer, with least significant zero on display not part of this value 
	.res 3

; unused ($718)
	.res 1

; Each byte of PatTable_BankSel sets the VROM available at
; 0000 (first half BG), 0800 (second half BG, typ animated), 
; 1000 (1/4 sprites), 1400 (2/4 sprites), 1800 (3/4 sprites),
; and 1C00 (4/4 sprites), respectively
PatTable_BankSel:     ; $0719-$071E  Provides an array of 6 pages to set the entire Pattern Table [BG_Full_CHRROM_Switch]
	.res 6
PAGE_C000:            ; Page to set PRG ROM C000 (PRGROM_Change_Both)
	.res 1
PAGE_A000:            ; Page to set PRG ROM A000 (PRGROM_Change_Both)
	.res 1
PAGE_CMD:             ; When using PRGROM_Change_Both2 or PRGROM_Change_A000, this value stores the MMC3 command
	.res 1
Map_Prev_XOff:        ; $0722-$0723 (Mario/Luigi) Stores previous scroll X offset on map
	.res 2
Map_Prev_XHi:         ; $0724-$0725 (Mario/Luigi) Stores previous "hi byte" of map X
	.res 2
Player_Current:       ; Which Player is currently up (0 = Mario, 1 = Luigi)
	.res 1
World_Num:            ; Current world index (0-8, where 0 = World 1, 7 = World 8, 8 = World 9 / Warp Zone)
	.res 1

; NOTE: sharing
World_EnterState:     ; State variable during "world X" intro entrance, set to 3 when entering a level; overlaps GameOver_State
CineKing_State:       ; State of King-got-his-wand-back sequence
GameOver_State:       ; State variable used during "Gameover!" sequence only; overlaps World_EnterState
	.res 1

Map_Operation:        ; Map_Operation: Current "operation" happening on map (See Map_DoOperation in PRG010)
	.res 1

; unused ($72A)
	.res 1

Total_Players:        ; Total players (0 = 1P, 1 = 2P)
	.res 1
Map_Unused72C:        ; No apparent use; only assigned to, but never read back
	.res 1
Bonus_DDDD:           ; ?? Set to '1' if you exit the unused bonus game BONUS_UNUSED_DDDD
	.res 1
Map_HandState:        ; Hand trap state
	.res 1

; unused ($72F)
	.res 1

Map_WW_Backup_Y:      ; Warp Whistle wind backs up the Player's map Y
	.res 1

Map_WW_Backup_XH:     ; Warp Whistle wind backs up the Player's map X Hi byte
	.res 1
Map_WW_Backup_X:      ; Warp Whistle wind backs up the Player's map X
	.res 1
Map_WW_Backup_UPV2:   ; Warp Whistle wind backs up Map_UnusedPlayerVal2
	.res 1

; unused ($734-$735)
	.res 2

Player_Lives:         ; $0736-$0737 (Mario/Luigi) Player's lives
	.res 2
Map_Unused738:        ; Index used in some dead code in PRG011; sometimes index of unused array Map_Unused7DC6
	.res 1
ClearPattern:         ; Set by ClearPattern_ByTileset for use in Clear_Nametable_Short
	.res 1
PalSel_Tile_Colors:   ; Stores value to index which tile color set to use when palette loading routine is called
	.res 1
PalSel_Obj_Colors:    ; Stores value to index which object color set to use when palette loading routine is called
	.res 1
Player_FallToKing:    ; $073C-$073D (Mario/Luigi) Player will fall to king when Level_ExitToMap is nonzero (instead of map)
	.res 2
Map_Player_SkidBack:  ; $073E-$073F (Mario/Luigi) Set to '1' if Player died last turn or otherwise ejected (that is, they DID skid from their last turn, not necessarily currently skidding)
	.res 2

Map_NSpadeMatches:    ; Keeps count of N-Spade matches of active session (9 means game is done)
	.res 1
Map_NSpadeInProg:     ; If set, there's an N-Spade game "in progress" (so if you lose, you pick it up later)
	.res 1

Map_Airship_Trav:     ; Airship's current travel-table offset (randomly offset by 0-2, spices up life)
	.res 1

; unknown ($743-$744)
	.res 2

Map_DoFortressFX:     ; Bust locks, build bridges, whatever after Mini-Fortress is toppled
	.res 1

World_Map_Power:      ; $0746-$0747 (Mario/Luigi) MAP Power up # (1 - big, 2 - Fire, 3 - Leaf, 4 - Frog, 5 - Tanooki, 6 - Hammer, 7 - Judgems, 8 - Pwing, 9 - Star)
	.res 2

; unused ($748)
	.res 1

Map_Unused749:        ; $0749-$074A (Mario/Luigi) ? Another value just set once and never read back!
	.res 2

; unused ($74B)
	.res 1

Object_VelCarry:      ; '1' when last Object Velocity fraction accumulation rolled over
	.res 1

; WARNING: The distance between Player/Objects_XVelFrac and Player/Objects_YVelFrac must be same as Player/Objects_X/YVel!
Player_XVelFrac:      ; X velocity fractional accumulator
	.res 1
Objects_XVelFrac:     ; $074E-$0755 Other object's X velocity fractional accumulator
	.res 8

; unused ($756)
	.res 1

THouse_UnusedFlag:    ; Cleared when Toad House gives you an item, but never used otherwise
	.res 1

; unused ($758-$75E)
; WARNING: Though unused, this is required for the consistent padding between XVel(Frac) and YVel(Frac)
; So use it if you want, but maintain the distance!!
	.res 7

; WARNING: The distance between Player/Objects_XVelFrac and Player/Objects_YVelFrac must be same as Player/Objects_X/YVel!
Player_YVelFrac:      ; Y velocity fractional accumulator
	.res 1
Objects_YVelFrac:     ; $0760-$0767 Other object's Y velocity fractional accumulator
	.res 8

Objects_ColorCycle:   ; $0768-$076F Cycles colors of object and decrements to zero (e.g. "Melting" ice block, starman, etc.)
	.res 8

; Objects_Var6: Special hardcoded behavior for the following objects ONLY:
; OBJ_FIRECHOMP, OBJ_CHAINCHOMPFREE, OBJ_BLOOPERCHILDSHOOT, 
; OBJ_BLOOPERWITHKIDS, or OBJ_FIRESNAKE
; ... as the X/Y buffer slot they occupy (see Object_Delete)
Objects_Var6:         ; $0770-$0774 General purpose variable 6 (except as noted above)
	.res 5
Objects_TargetingXVal: ; $0775-$0779 X velocity result of Object_CalcHomingVels for this object OR some other X pixel target
	.res 5

King_Y:               ; Y position (NOTE: shared with Objects_TargetingYVal)
Objects_TargetingYVal: ; $077A-$077E Y velocity result of Object_CalcHomingVels for this object OR some other Y pixel target
	.res 5

Pipe_TransYDelta:     ; In-level transit pipe Y delta value (WARNING: Shared with Level_ScrollDiffV)
Level_ScrollDiffV:    ; Difference between desired vertical and the current Vert_Scroll (WARNING: Shared with Pipe_TransYDelta)
	.res 1
Level_ScrollDiffH:    ; Difference between desired horizontal and the current Horz_Scroll
	.res 1

Random_Pool:          ; $0781-$078A (or $0789?) Data pool for pseudo-random number generator algorithm
	.res 10
RandomN := Random_Pool+1 ; Pull a random number from the sequence (NOTE: RandomN+1 is also good; If you need multiple random numbers, call Randomize)


Map_PlayerLost2PVs:   ; When > 0, (1=Mario, 2=Luigi) doesn't lose a life for "death" exiting to map, but does lose their turn
	.res 1

; unused ($78C)
	.res 1

Player_RescuePrincess: ; Player will jump to the princess rescue when Level_ExitToMap is nonzero (instead of map)
	.res 1

; unused ($78E-$795)
	.res 8

; Objects_PlayerHitStat:
;	Bit 0 - Set if Player's bbox bottom is HIGHER than object's bbox bottom
;	Bit 1 - Set if Player's bbox left edge is to the LEFT of object's bbox left edge
;	Bit 4 - Set if Player tail attacked an object
Objects_PlayerHitStat: ; $0796-$079D Player hit status
	.res 8

; Up to five "scores" can be displayed at once
Scores_Value:         ; $079E-$07A2 score "value"; '0' none, (10, 20, 40, 80, 100, 200, 400, 800, 1000, 2000, 4000, 8000, 1-up)
	.res 5
Scores_Counter:       ; $07A3-$07A7 "counter" until score disappears
	.res 5
Scores_Y:             ; $07A8-$07AC Score's Y
	.res 5
Scores_X:             ; $07AD-$07B1 Score's X
	.res 5

LRBounce_Y:           ; Left/right bouncer as sprite Y ($FF is disabled)
	.res 1
LRBounce_X:           ; Left/right bouncer as sprite X
	.res 1
LRBounce_Vel:         ; Left/right bouncer absolute value of X velocity
	.res 1

; NOTE!! These object vars are OBJECT SLOT 0 - 4 ONLY!
Objects_Slope:        ; $07B5-$07B9 Absolute slope calc value
	.res 5

; unused ($7BA)
	.res 1

World3_Bridge:        ; 0 - Bridges are down, 1 - Bridges are up
	.res 1

ArrowPlat_IsActive:   ; Set if arrow platform is active
	.res 1

Level_GetWandState:   ; See Koopaling code in PRG001
	.res 1

; ********************************************************************************
; The Palette_* vars here form a graphics buffer to be committed in the
; style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
Video_DoPalUpd:       ; Name consistent with Video_Upd_Table
Palette_AddrHi:       ; Stores high part of palette address when committing palettes
	.res 1
Palette_AddrLo:       ; Stores low part of palette address when committing palettes
	.res 1
Palette_BufCnt:       ; 32 for updating entire palette
	.res 1
Palette_Buffer:       ; $07C1-$07E0 Buffer of palette bytes to commit, used for fade in/out
	.res 32
Palette_Term:         ; Set to zero as terminator, per requirement of the Video_Upd_Table format
	.res 1
; ********************************************************************************

; BigQBlock_GotIt: 
;	Big ? Blocks can only be retrieved once; this is a bitfield that marks which
;	ones you've gotten by setting a bit per screen space in the Big ? Block area.
;	Basically, if you reenter a Big ? Block area after opening it, it won't reappear!
;	See ObjInit_BigQBlock and ObjNorm_BigQBlock for usage...
;	NOTE: This is cleared completely upon Player death which works since levels
;	are not re-enterable, but still seems a bit extreme...
BigQBlock_GotIt:
	.res 1

; unused ($7E3-$7EF)
	.res 13

DMC_Queue:            ; Stores value to play on DMC
	.res 1
DMC_Current:          ; Currently playing DMC sound
	.res 1

Sound_Sq1_CurFL:      ; Holds current "low" frequency of Square Wave 1 (Warning: Must be +4 to Sound_Sq2_CurFL, see PRG031_E808)
	.res 1

Music_NseStart:       ; Holds the starting offset of the noise track (CHECK: Reuse of $07F3, is this bad??)
	.res 1

; unused ($7F4)
; required for padding
	.res 1

Music2_Hold:          ; A very little used feature, Music Set 1 overrides Music Set 2, but after a M1 song finishes, it restarts the M2 song
	.res 1
Sound_Sq2_CurFL:      ; Holds current "low" frequency of Square Wave 1 (Warning: Must be +4 from Sound_Sq1_CurFL, see PRG031_E808)
	.res 1

Music_Sq2Patch:       ; Current "instrument patch" for Square 2 (only upper 4 bits stored, 0ppp 0000)
	.res 1
Music_Sq1Patch:       ; Current "instrument patch" for Square 1 (only upper 4 bits stored, 0ppp 0000)
	.res 1

; unused ($7F9)
	.res 1

Sound_Map_L2Hld:      ; Same as Sound_Map_LHold, used for the secondary track (Warning: Will be affected by triangle, see PRG031_E808)
	.res 1
Sound_Map_Len2:       ; Same as Sound_Map_Len, used for the secondary track
	.res 1
Sound_Map_LHold:      ; Current length setting, used as delay after each byte of map sound (changed by special bytes in range $80-$FF)
	.res 1
Sound_Map_Len:        ; Countdown tick for current note/rest that map sound effect is on
	.res 1
Sound_Map_Off2:       ; Same as Sound_Map_Off, used for the secondary track
	.res 1
Sound_Unused7FF:      ; Cleared once, never used otherwise
	.res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $68xx SRAM for 2P Vs ONLY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NOTE: $6000-$67FF is still in considered tile grid memory (see next section)
; 2P Vs just utilizes a chunk where no tiles will ever exist in 2P Mode
.segment "VS2PSRAM"

; 2P Vs Only
Vs_MemStart:          ; Should be at "top"; this point and 512 bytes forward are cleared at start of 2P Vs

; Vs_PlayerFrame
; 0/1: Standing (0) / walking (0/1) / falling-not-jumped (1) frames
; 2: Skidding turnaround
; 3: Jumping/Falling-jumped
; 4: Dizzy
; 5: Kicking
; 6: Dying
; 7: Climbing
Vs_PlayerFrame:       ; $6800-$6801 Mario/Luigi Frame
	.res 2
Vs_PlayerState:       ; $6802-$6803 Mario/Luigi State (0=Init, 1=Normal, 2=Dying, 3=Ladder climbing)
	.res 2
Vs_ObjectState:       ; $6804-$680F Objects State (0=Dead/empty, 1=Normal, 2=Flipped over, 3=Dying)
	.res 12

; unused ($6810)
	.res 1

Vs_PlayerBlkHitCnt:   ; $6811-$6812 Mario/Luigi Hit block counter value
	.res 2
Vs_PlayerY:           ; $6813-$6814 Mario/Luigi Y
	.res 2
Vs_ObjectsY:          ; $6815-$6820 Objects Y
	.res 12

; unused ($6821)
	.res 1

Vs_PlayerBlkHitY:     ; $6822-$6823 Mario/Luigi Aligned Y position where block was hit
	.res 2
Vs_PlayerX:           ; $6824-$6825 Mario/Luigi X
	.res 2
Vs_ObjectsX:          ; $6826-$6831 Objects X
	.res 12

; unused ($6832)
	.res 1

Vs_PlayerBlkHitX:     ; $6833-$6834 Mario/Luigi Aligned Y position where block was hit
	.res 2
Vs_PlayerYVel:        ; $6835-$6836 Mario/Luigi Y Velocity
	.res 2
Vs_ObjectYVel:        ; $6837-$6842 Objects Y Velocity
	.res 12

; unused ($6843)
	.res 1

Vs_PlayerBlkHitYVel:  ; $6844-$6845 Mario/Luigi Hit block Y velocity
	.res 2
Vs_PlayerXVel:        ; $6846-$6847 Mario/Luigi X Velocity
	.res 2
Vs_ObjectXVel:        ; $6848-$6853 Objects X Velocity
	.res 12

; unused ($6854-$6856)
	.res 3

Vs_PlayerClimbFrame:  ; $6857-$6858 incremented as Player climbs
	.res 2
Vs_ObjectAnimCnt:     ; $6859-$6864 A continuous counter per object for animating (typically 2 frames)
	.res 12

; unused ($6865)
	.res 1

Vs_PlayerDir:         ; $6866-$6867 Mario/Luigi direction (1=Right, 2=Left)
	.res 2
Vs_ObjectDir:         ; $6868-$6873 Objects direction (1=Right, 2=Left)
	.res 12

; unused ($6874)
	.res 1

Vs_PlayerYVelFrac:    ; $6875-$6876 Mario/Luigi Y velocity fractional accumulator
	.res 2
Vs_ObjectYVelFrac:    ; $6877-$6882
	.res 12

; unused ($6883-$6885)
	.res 3

Vs_PlayerXVelFrac:    ; $6886-$6887 Mario/Luigi X velocity fractional accumulator
	.res 2
Vs_ObjectXVelFrac:    ; $6888-$6893
	.res 12

; unused ($6894-$6896)
	.res 3

Vs_PlayerDetStat:     ; $6897-$6898 Mario/Luigi detection status
	.res 2
Vs_ObjectDetStat:     ; $6899-$68A4 Objects detection status
	.res 12

; unused ($68A5-$68A7)
	.res 3

Vs_ObjectVar1:        ; $68A8-$68B3 General variable 1
	.res 12

; unused ($68B4)
	.res 1

Vs_PlayerKick:        ; $68B5-$68B6 Mario/Luigi Player is kicking until decrements to zero
	.res 2
Vs_PlayerDizzy:       ; $68B7-$68B8 Mario/Luigi Player "dizzy" face until decrements to zero
	.res 2
Vs_PlayerStick:       ; $68B9-$68BA Mario/Luigi Mario/Luigi Player "sticking" to ceiling; decrements to zero
	.res 2
Vs_PlayerBumpTimer:   ; Mario/Luigi Players bumped off eachother (and can't again until zero); decrements to zero
	.res 1
Vs_POWBlockCnt:       ; POW block counter; decrements to zero; until then, POW shaking!
	.res 1

Vs_ObjectId:          ; $68BD-$68C8 Objects ID
	.res 12

; unused ($68C9)
	.res 1

Vs_ObjectSprRAMOff:   ; Current object Sprite RAM offset
	.res 1
Vs_ObjectSprRAMSel:   ; Counter that runs $D to $0 (inclusive) and helps distribute Sprite RAM offsets among the objects
	.res 1
Vs_EnemyCount:        ; Number of spawned enemies (in the typical game)
	.res 1
Vs_PlayerHaltTimer:   ; $68CD-$68CE Mario/Luigi timer which halts gameplay; decrements to zero
	.res 2
Vs_ObjHaltTimer:      ; $68CF-$68DA Object timer which halts object when greater than zero; decrements to zero
	.res 12

; unused ($68DB)
	.res 1

Vs_ObjectTimer3:      ; $68DC-$68E7
	.res 12

; unused ($68E8)
	.res 1

Vs_PlayerCnt:         ; $68E9-$68EA Mario/Luigi "counter" value; decrements to zero
	.res 2
Vs_EnemyGetUpTimer:   ; $68EB-$68F6 Timer for flipped-over enemy; decrements to zero
	.res 12

; unused ($68F7)
	.res 1

Vs_PlayerJumped:      ; $68F8-$68F9 Set to 1 if Player jumped; prevents Player from jumping again until they hit floor
	.res 2
Vs_PlayerTileL:       ; $68FA-$68FB Mario/Luigi Tile detected at Player's feet
	.res 2
Vs_ObjectTileL:       ; $68FC-$6907
	.res 12

; unused ($6908-$6909)
	.res 2

Vs_PlayerBlkHit:      ; $690A-$690B Mario/Luigi Holds Tile_Mem offset to bounce block they hit
	.res 2
Vs_PlayerFlashInv:    ; $690C-$690D Mario/Luigi Flashing invicibility (?)
	.res 2
Vs_SpawnCnt2:         ; FIXME describe better
	.res 1
Vs_TooLongCnt:        ; Increments after each round of spawning; if it overflows, "game ender" fireballs are spawned 
	.res 1
Vs_CurIndex:          ; Current index (Player or object)
	.res 1
Vs_PlayerTileU:       ; $6911-$6912 Mario/Luigi Tile detected above Player's feet
	.res 2

; unused ($6913-$691F)
	.res 13

Vs_ObjectPipeTimer:   ; $6920-$692B Timer used for enemies to exit and emerge from pipes; decrements to zero
	.res 12

; unused ($692C)
	.res 1

Vs_Random:            ; $692D-$692F Random generator for 2P Vs mode
	.res 3
Vs_PlayerCoins:       ; $6930-$6931 Player's coins (in 2P Vs); 5 wins the match
	.res 2
Vs_TimeToExit:        ; Decrements to zero then exits the 2P Vs
	.res 1
Vs_ObjectIsLast:      ; $6933-$693E Set if this is the last object (turns blue, move fast)
	.res 12

; unused ($693F)
	.res 1

Vs_POWHits:           ; Number of times POW block has been hit (disabled on 3)
	.res 1
Vs_PlayerYOff:        ; $6941-$6942 Mario/Luigi Y offset applied
	.res 2
Vs_UNKGAMECnt:        ; Unknown "game" counter; after overflow, we exit
	.res 1
Vs_PlayerYHi:         ; $6944-$6945 Mario/Luigi Y Hi
	.res 2
Vs_ObjectYHi:         ; $6946-$6951 Object Y Hi
	.res 12

; unused ($6952-$6954)
	.res 3
Vs_ObjectIsAngry:     ; $6955-$6960 Set when Sidestepper is angry (not used for anything else)
	.res 12

; unused ($6961)
	.res 1

Vs_AngrySidesteppers: ; When greater than zero, and spawning a Sidestepper, next one is an "angry" Sidestepper (then decrement)
	.res 1

; unused ($6963)
	.res 1

Vs_ObjectVDir:        ; $6964-$696F Objects vertical direction (4=Down, 8=Up)
	.res 12

; unused ($6970)
	.res 1

Vs_ObjectRestoreXVel: ; $6971-$697C Flipped over object restore X velocity
	.res 12

; unused ($697D)
	.res 1

Vs_ObjTimer2:         ; $697E-$6989 Object timer; decrements to zero
	.res 12

; unused ($698A)
	.res 1

Vs_CardFlash:         ; $698B-$698C Mario/Luigi Cycles color for card (when picked up from another Player)
	.res 2
Vs_HaltTimerBackup:   ; $698D-$699B Backs up all halt timers
	.res 15
Vs_EnemySet:          ; Specifies an index of active enemy set, selecting one of the quintuples from Vs_5EnemySets
	.res 1
Vs_ObjectXOff:        ; A one-shot X offset for display of object FIXME: When?
	.res 1
Vs_PlayerWalkCnt:     ; $699E-$699F Mario/Luigi counts up and overflows to toggle walk frames
	.res 2
Vs_PlayerWalkFrame:   ; $69A0-$69A1 Mario/Luigi incremented when Vs_PlayerWalkCnt overflows
	.res 2
Vs_NextObjectIsLast:  ; If there are 5 enemies and this is set, next enemy out is the "last" (turns blue, moves fast)
	.res 1

; Display of "x Up" after getting 3 cards
Vs_xUpCnt:            ; $69A3-$69A4 Mario/Luigi "x Up" counter
	.res 2
Vs_xUpY:              ; $69A5-$69A6 Mario/Luigi "x Up" Y pos
	.res 2
Vs_xUpX:              ; $69A7-$69A8 Mario/Luigi "x Up" X pos
	.res 2
Vs_xUpLives:          ; $69A9-$69AA Mario/Luigi "x Up" Lives amount (1, 2, 3, 5)
	.res 2
Vs_SpawnCnt:          ; Spawn counter; increments and triggers spawning
	.res 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $6000-$7FFF MMC3 SRAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "GENSRAM"
; NOTE: $6800+ is used by 2P Vs RAM, see previous section

; Tile_Mem stores for the greatest case:
;	Vertical level max size is 	15 rows * 16 columns * 16 screens = 3840 ($0F00) bytes
;	Non-vertical level max size is 	27 rows * 16 columns * 15 screens = 6480 ($1950) bytes
Tile_Mem:             ; $6000-$794F Space used to store the 16x16 "tiles" that make up the World Map or Level
	.res 6480

Map_MoveRepeat:       ; $7950-$7951 (Mario/Luigi) counts up to $18 and then you keep moving without pause
	.res 2
AScrlURDiag_OffsetX:  ; When diagonal autoscroller is wrapping, this holds an X offset for Player/Objects to temporarily correct
	.res 1
AScrlURDiag_OffsetY:  ; When diagonal autoscroller is wrapping, this holds an Y offset for Player/Objects to temporarily correct
	.res 1
StatusBar_UpdFl:      ; Status bar Update Flag; toggles so to update status bar only every other frame
	.res 1
UpdSel_Disable:       ; When set, disables the Update_Select routine during the NMI, which halts most activity due to no reported V-Blanking
	.res 1
Map_Objects_Itm:      ; $7956-$795D, "Item given by" map objects
	.res 13

; Item that will be given by treasure box; set by the object OBJ_TREASURESET by its row
; Level_TreasureItem:
; 0 = INVALID
; 1 = Mushroom
; 2 = Flower
; 3 = Leaf
; 4 = Frog
; 5 = Tanooki
; 6 = Hammer
; 7 = Judgem's cloud
; 8 = P-Wing
; 9 = Star
; A = Anchor
; B = Hammer
; C = Warp Whistle
; D = Music Box
Level_TreasureItem:
	.res 1
Reset_Latch:          ; If this value is anything besides $5A, the reset is run (I assume this is considered a safe value in case of data corruption, e.g. from runaway generator)
	.res 1
Map_BonusType:        ; 0 = No bonus, 1 = White Toad House, 2 = UNKNOWN WHITE THING (MAPOBJ_UNK0C)
	.res 1
Map_BonusCoinsReqd:   ; Number of coins you need for White Toad House (or the MAPOBJ_UNK0C thing!); value ranges 0-127
	.res 1
Coins_ThisLevel:      ; Internal counter of coins earned -this level- (so always starts at 0 and increments)
	.res 1

Map_NSpade_NextScore: ; $7968 (H)-$796A (L) treated as 3-byte integer
	.res 3

Map_BonusAppY:        ; Map "white" bonus appearance Y (set to Player's last "succeeded" map position)
	.res 1
Map_BonusAppXHi:      ; Map "white" bonus appearance XHi (set to Player's last "succeeded" map position)
	.res 1
Map_BonusAppX:        ; Map "white" bonus appearance X (set to Player's last "succeeded" map position)
	.res 1

Map_NoLoseTurn:       ; If set, Player does not lose turn after having completed a level (used for Toad House, pipeways, etc.)
	.res 1
Map_Got13Warp:        ; Set non-zero if Player already got the 1-3 Warp Whistle
	.res 1
Map_Anchored:         ; Set if anchor is set on this map
	.res 1
Map_WhiteHouse:       ; Set if you have already earned the White Toad House for this world
	.res 1
Map_CoinShip:         ; Set if you have already earned the Coin Ship for this world
	.res 1
Map_WasInPipeway:     ; Set if you just came out of a pipeway
	.res 1
EndCard_Flag:         ; Set when End Level card is hit (can determine when level has ended)
	.res 1
Map_PlyrSprOvrY:      ; "Player Sprite Override Y"; If set to $F8 during warp, erases Player's map sprite; otherwise provides a Y to put it at
	.res 1
Map_Entered_Y:        ; $7976-$7977 (Mario/Luigi) Stores the Y value when you enter a level; this is the Y used if you complete the level
	.res 2
Map_Entered_XHi:      ; $7978-$7979 (Mario/Luigi) Hi byte for Map_Entered_X
	.res 2
Map_Entered_X:        ; $797A-$797B (Mario/Luigi) Same as Map_Entered_Y, only for X
	.res 2
Map_Previous_UnusedPVal2: ; $797C-$797D (Mario/Luigi) Backup of Map_UnusedPlayerVal2
	.res 2
Map_Previous_Y:       ; $797E-$797F (Mario/Luigi) Stores the previous Y you were "safe" at; this is the Y you go back to if you die
	.res 2
Map_Previous_XHi:     ; $7980-$7981 (Mario/Luigi) Same as Map_Previous_Y, only for XHi
	.res 2
Map_Previous_X:       ; $7982-$7983 (Mario/Luigi) Same as Map_Previous_Y, only for X
	.res 2
Map_Unused7984:       ; $7984-$7985 (Mario/Luigi) Unused; cleared and never touched again
	.res 2
Map_Prev_XOff2:       ; $7986-$7987 (Mario/Luigi) Holds a copy of Map_Prev_XOff, but I'm not sure why?
	.res 2
Map_Prev_XHi2:        ; $7988-$7989 (Mario/Luigi) Holds a copy of Map_Prev_XHi, but I'm not sure why?
	.res 2
Map_Unused798A:       ; $798A-$798B (Mario/Luigi) Unused; cleared and never touched again
	.res 2

; These define values to use when you junction back
; to the level you were before...
Level_Jct_HSHi:       ; Level junction horizontal scroll high value
	.res 1
Level_Jct_HS:         ; Level junction horizontal scroll value
	.res 1
Level_Jct_VSHi:       ; Level junction vertical scroll high value
	.res 1
Level_Jct_VS:         ; Level junction vertical scroll value
	.res 1

; unused ($7990-$7991)
	.res 2

Map_Unused7992:       ; Value used in some dead code in PRG011; cleared elsewhere (NOT SURE if maybe it sometimes meant Bonus_DiePos?)
Bonus_DiePos:         ; UNUSED Die in the lost bonus games, counts 0-5
	.res 1

Map_Previous_Dir:     ; $7993-$7994 (Mario/Luigi) Backup movement dir (remember which way Player moved last) (8=Up, 4=Down, 2=Left, 1=Right)
	.res 2

Map_Unused7995:       ; Unused; cleared but never used otherwise
	.res 1

Player_NoSlopeStick:  ; If set, Player does not stick to slopes (noticeable running downhill)
	.res 1

; unused ($7997-$79FF)
	.res 105

; Auto scroll effect variables -- everything to do with screens that aren't scrolling in the normal way
; NOTE: Post-airship cinematic scene with Toad and King ONLY uses $7A01-$7A11 MMC3 SRAM (from Level_AScrlSelect to Level_AScrlHVelCarry)

AScroll_Anchor:       ; Used as starting point for $7A00-$7A14 clear, but never actually used in Auto-Scroll
	.res 1

Level_AScrlSelect:    ; Selects auto scroll routine to use (see PRG009_B922)
	.res 1

; Values used in horizontal scrolling (Level_AScrlSelect = 0/1) only:
; $00: World 3-6 / 1-4
; $01: World 3 Airship
; $02: World 6-2
; $03: World 5 Airship
; $04: World 2 Airship
; $05: World 4 Airship
; $06: World 6 Airship
; $07: World 5-6
; $0A: World 6-7
; $0B: World 1 Airship
; $0C: World 7 Airship
; $0D: World 8 Airship
; $0E: World 8 Battleship
; $0F: World 7-4
; $10: World 1 Coin Heaven
; $11: Coin Ship
; $13: World 8 Tank 1
; $14: World 8 Tank 2
Level_AScrlLimitSel:  ; "Limit Selector" for the auto scroll (typically selects an end or a start/end pair, depending on style)
	.res 1

; Level_AScrlVar
; Variable used for different things depending on the auto scroll style
; In horizontal scroll style (Level_AScrlSelect = 0), it's the current "movement" (see table AScroll_Movement)
Level_AScrlVar:
	.res 1

Level_AScrlLoopSel:   ; Currently selected "movement loop" (horizontal only, see AScroll_MovementLoopStart; Just a var in others?)
	.res 1
Level_AScrlMoveRepeat: ; Repeat current move until zero (decrements each full expiration of Level_AScrlMoveTicks); $FF when on last move, passes control to movement loop
	.res 1
Level_AScrlLoopCurMove: ; Current "movement loop" index (into AScroll_MovementLoop)
	.res 1
Level_AScrlSclLastDir: ; Auto scroll "Scroll_LastDir" 
	.res 1
Level_AScrlMoveTicks: ; Counts down to zero, decrements Level_AScrlMoveRepeat (goes to next "movement")
	.res 1
Level_AScrlTimer:     ; Auto scroll counter, decrements to zero
	.res 1
Level_AScrlPosHHi:    ; Raster effect horizontal "high" position
	.res 1

; unlabeled (unused?) ($780B)
	.res 1

Level_AScrlPosH:      ; Raster effect horizontal position
	.res 1
Level_AScrlPosV:      ; Raster effect vertical position
	.res 1
Level_AScrlHVel:      ; Auto scroll horizontal "velocity"
	.res 1
Level_AScrlVVel:      ; Auto scroll vertical "velocity"
	.res 1
Level_AScrlHVelFrac:  ; Auto scroll horizontal velocity fractional accumulator 
	.res 1
Level_AScrlVVelFrac:  ; Auto scroll vertical velocity fractional accumulator 
	.res 1
Level_AScrlHVelCarry: ; '1' when last auto scroll H Velocity fraction accumulation rolled over
	.res 1
Level_AScrlVVelCarry: ; '1' when last auto scroll V Velocity fraction accumulation rolled over
	.res 1
World8Tank_OnTank:    ; Set when Player is standing on tank surface in Tank level (as opposed to ground); for the illusion the tank is moving through...
	.res 1
;;;;;;;;;;;;

CannonFire_ID:        ; $7A15-$7A1C ID of the cannon fire
	.res 8
CannonFire_YHi:       ; $7A1D-$7A24 Cannon fire Y Hi
	.res 8
CannonFire_Y:         ; $7A25-$7A2C Cannon fire Y
	.res 8
CannonFire_XHi:       ; $7A2D-$7A34 Cannon fire X Hi
	.res 8
CannonFire_X:         ; $7A35-$7A3C Cannon fire X
	.res 8
CannonFire_Parent:    ; $7A3D-$7A44 Tie back to level object index of "parent" object
	.res 8

Splash_DisTimer:      ; Player water splashes are disabled until decrements to zero; set when Player hits any bounce block
	.res 1

; For that little "flash" that comes from the shell kill impact!
ShellKillFlash_Cnt:   ; "Shell Kill Flash" counter
	.res 1
ShellKillFlash_Y:     ; "Shell Kill Flash" Y
	.res 1
ShellKillFlash_X:     ; "Shell Kill Flash" X
	.res 1

; NOTE!! Objects_DisPatChng for OBJECT SLOT 0 - 5 ONLY!
Objects_DisPatChng:   ; $7A49-$7A4E If set, this object no longer enforces a pattern bank change
	.res 6

; NOTE!! These object vars are OBJECT SLOT 0 - 5 ONLY!
ObjSplash_DisTimer:   ; $7A4F-$7A54 Object water/lava splashes are disabled until decrements to zero
	.res 6

PlayerProj_XVelFrac:  ; $7A55-$7A56 Player Projectile X velocity fractional accumulator
	.res 2

CannonFire_Timer2:    ; $7A57-$7A5E Cannon Fire timer (decrements to zero)
	.res 8

Roulette_Unused7A5F:  ; Unused value in Roulette game
	.res 1
Roulette_Unused7A5F_Delta: ; Delta value added to Roulette_Unused7A5F
	.res 1

Bowser_Tiles:         ; $7A61-$7A62 Bowser's detected tiles (to determine what to break)
	.res 2
Bowser_Counter1:      ; A counter used by Bowser, decrements to zero
	.res 1
Bowser_Counter2:      ; A counter used by Bowser, decrements to zero 
	.res 1
Bowser_Counter3:      ; A counter used by Bowser, random setting, decrements to zero
	.res 1

CoinShip_CoinGlowIdx: ; Coin Ship only: Glowing coins palette color index
	.res 1
CoinShip_CoinGlowCnt: ; Coin Ship only: Glowing coins palette color counter
	.res 1

SObjBlooperKid_OutOfWater: ; $7A68-$7A6F Blooper kid only; if set, Blooper Kid is trying to go out of water
	.res 8

; unused ($7A70-$7A71)
	.res 2

Object_SplashAlt:     ; Used to alternate the "splash slots" 1 and 2 as objects hit the water
	.res 1

; unused ($7A73-$7ADF)
	.res 109

Music_Start:          ; Music start index (beginning of this song)
	.res 1
Music_End:            ; Music end index (inclusive last index to play before loop)
	.res 1
Music_Loop:           ; Music loop index (index to start from when song reaches end)
	.res 1

Sound_Octave:         ; Used for calculating octave
	.res 1

; unused ($7AE4-$7AEF)
	.res 12

Music_Sq1Bend:        ; Alters PAPU_FT1 for bend effects
	.res 1

; unused ($7AF1-$7AF3)
	.res 3

Music_Sq2Bend:        ; Alters PAPU_FT2 for bend effects
	.res 1

; unused ($7AF5-$7AF6)
	.res 2

Music_RestH_Off:      ; Offset added to Music_RestH_Base; typically $00 or $10 (for low time warning on compatible songs)
	.res 1

; unused ($7AF8-$7AFE)
	.res 7

PAPU_MODCTL_Copy:     ; Current PAPU_MODCTL register
	.res 1

Level_ObjIdxStartByScreen: ; $7B00-$7B0F Defines the starting index into Level_Objects for each "screen"
	.res 16

Level_ObjectsSpawned: ; $7B10-$7B3F When $80 set, object is already spawned, $00 means not
	.res 48

; Level_ObjPtr_AddrL is an array that defines the level objects to appear
; The first byte copied in has no apparent purpose
; The rest is a repeating series of 3 bytes -- ID, Column, Row (C/R of tile grid, multiply by 16 for pixel location), $FF for terminator
Level_Objects:        ; $7B40-$7BCF
	.res 48*3

; unused ($7BD0-$7C1F)
	.res 80

; For certain objects that require a buffer of X or Y values; only a couple are available.
; Each contains 32 bytes, intended for enemies that have "tails"; Buffer_Occupied determines
; which of the two buffers is free, if any at all.  The object will hold onto it then.
; Because of this, objects which employ it must also be hardcoded to release it; see
; "Object_Delete" for the hardcoded list of objects which must release this resource...
Object_BufferX:       ; $7C20-$7C3F / $7C40-$7C5F
	.res 32*2
Object_BufferY:       ; $7C60-$7C7F / $7C80-$7C9F
	.res 32*2

; Variables used by Chain Chomps ONLY -- manages the chain links 
ChainChomp_ChainX1:   ; $7CA0-$7CA4 Chain Link 1 X
	.res 5
ChainChomp_ChainX2:   ; $7CA5-$7CA9 Chain Link 2 X
	.res 5
ChainChomp_ChainX3:   ; $7CAA-$7CAE Chain Link 3 X
	.res 5
ChainChomp_ChainX4:   ; $7CAF-$7CB4 Chain Link 4 X
	.res 5

ChainChomp_ChainY1:   ; $7CB4-$7CB8 Chain Link 1 Y
	.res 5
ChainChomp_ChainY2:   ; $7CB9-$7CBD Chain Link 2 Y
	.res 5
ChainChomp_ChainY3:   ; $7CBE-$7CC2 Chain Link 3 Y
	.res 5
ChainChomp_ChainY4:   ; $7CC3-$7CC8 Chain Link 4 Y
	.res 5

; NOTE!! These object vars are OBJECT SLOT 0 - 4 ONLY!
Objects_Var10:        ; $7CC8-$7CCC Generic object variable 10
	.res 5
Objects_Var11:        ; $7CCD-$7CD1 Generic object variable 11
	.res 5
Objects_Var12:        ; $7CD2-$7CD6 Generic object variable 12
	.res 5
Objects_Var13:        ; $7CD7-$7CDB Generic object variable 13
	.res 5
Objects_Var14:        ; $7CDC-$7CE0 Generic object variable 14
	.res 5

; Player's hammer/fireball
PlayerProj_ID:        ; $7CE1-$7CE2 Player projectile ID (0 = not in use, 1 = fireball, 2 = hammer, 3+ = Fireball impact "Poof")
	.res 2
PlayerProj_Y:         ; $7CE3-$7CE4 Player projectile Y
	.res 2
PlayerProj_X:         ; $7CE5-$7CE6 Player projectile X
	.res 2
PlayerProj_YVel:      ; $7CE7-$7CE8 Player projectile Y Velocity (NOTE: Integer, not 4.4FP)
	.res 2
PlayerProj_XVel:      ; $7CE9-$7CEA Player projectile X Velocity (NOTE: Fireball is integer, 4.4FP for hammer ONLY)
	.res 2
Fireball_HitChkPass:  ; $7CEB-$7CEC Count of times Player's fireball has gone through hit check; when it hits 2, fireball poofs
	.res 2
PlayerProj_Cnt:       ; $7CED-$7CEE Player projectile counter
	.res 2

Temp_VarNP0:          ; A temporary not on page 0
	.res 1

Lakitu_Active:        ; Set while a Lakitu is active; keeps Lakitu "alive" even if off-screen etc.
	.res 1

LevelEvent_Cnt:       ; General purpose counter used by a couple LevelEvents
	.res 1
Vert_Scroll_Off:      ; Vertical scroll offset, used for "vibration" effects
	.res 1
Level_Vibration:      ; While greater than zero, screen vibrates (from impact of heavy fellow)
	.res 1
Player_VibeDisable:   ; While greater than zero, Player is unable to move (from impact of heavy fellow)
	.res 1
Player_TwisterSpin:   ; While greater than zero, Player is twirling from sand twister
	.res 1

; NOTE!! This object var is OBJECT SLOT 0 - 4 ONLY!
Objects_HitCount:     ; $7CF6-$7CFA Somewhat uncommon "HP" used generally for bosses only (e.g. they take so many fireballs)
	.res 5


RotatingColor_Cnt:    ; When non-zero, causes rainbow palettes in the background; $80 bit is used by Koopaling wand grab
	.res 1

; Some variables used by the recovered magic wand
Wand_FrameCnt:        ; A counter that overflows to increment Wand_Frame (added to by the wand's SpecialObj_Var1)
	.res 1
Wand_Frame:           ; Wand frame
	.res 1
Wand_BounceFlag:      ; Tracks the recovered wand bounce; odd on first bounce
	.res 1

Player_DebugNoHitFlag: ; UNUSED: (Old debug routine) When set, disables getting hurt (would be toggled by pressing SELECT; see PRG000 $C91B)
	.res 1

; Map_Completions:
; Stores "rows" of completed levels or other map alterations (e.g. rock break,
; mini-fortress lock removal, etc.) for a given column, from the leftmost.
; Rows 1-7 use decending bits from $80, and row 9 uses bit $01.  This makes row 8
; invalid for hosting a level panel ever!
; --------- TOP OF MAP
; $80
; $40
; $20
; $10
; $08
; $04
; $02
; INVALID
; $01
; --------- BOT OF MAP
Map_Completions:      ; $7D00-$7D3F (Mario), $7D40-$7D7F (Luigi) Allows a MAX of 4 map screens (64 columns total each player, 16 columns per map screen)
	.res 16*4*2

; Inventory_Items:
; 0 = Empty
; 1 = Mushroom
; 2 = Flower
; 3 = Leaf
; 4 = Frog
; 5 = Tanooki
; 6 = Hammer
; 7 = Judgem's cloud
; 8 = P-Wing
; 9 = Star
; A = Anchor
; B = Hammer
; C = Warp Whistle
; D = Music Box
Inventory_Items:      ; $7D80-$7D9B Mario, 4 rows of 7 items 
	.res 4*7
Inventory_Cards:      ; $7D9C-$7D9E Mario, 3 cards
	.res 3
Inventory_Score:      ; $7D9F-$7DA1 Mario, 3 byte score
	.res 3
Inventory_Coins:      ; Mario's coins
	.res 1

Inventory_Items2:     ; $7DA3-$7DBE Luigi, 4 rows of 7 items 
	.res 4*7
Inventory_Cards2:     ; $7DBF-$7DC1 Luigi, 3 cards
	.res 3
Inventory_Score2:     ; $7DC2-$7DC4 Luigi, 3 byte score
	.res 3
Inventory_Coins2:     ; Luigi's coins
	.res 1
Map_Unused7DC6:       ; $7DC6-$7DCA? Indexed by Map_Unused738, value used in dead routine in PRG011 @ $A2AF
	.res 5

Map_GameOver_CursorY: ; Game Over popup cursor Y ($60/$68)
	.res 1

; unused ($7DCC-$7DD4)
	.res 9

Map_PrevMoveDir:      ; Last SUCCESSFUL (allowed) movement direction on map R01 L02 D04 U08
	.res 1

; unused ($7DD6-$7DDD)
	.res 8

Pal_Data:             ; $7DDE-$7DFD Holds an entire bg/sprite palette (this is the MASTER palette, what fades target, and others may source for "original" colors!)
	.res 32

Level_AltLayout:      ; $7DFE-$7DFF Pointer to level's "alternate" layout (when you go into bonus pipe, etc.)
	.res 2
Level_AltObjects:     ; $7E00-$7E01 Pointer to level's "alternate" object set (when you go into bonus pipe, etc.)
	.res 2

Level_BlockGrabHitMem: ; $7E02-$7E81 Records coins and 1-ups grabbed, so they don't come back if you switch areas
	.res 128

Card_ActiveSet:       ; $7E82-$7E93 Active set of N-Spade game cards
	.res 18

; Tile_AttrTable:
; On the world map, it's always the following:
; [03 67 BF E9] [03 67 BF E9]
; There's a usage of checking which "quadrant" of tile the Player is standing on ($00, $40, $80, or $C0)
; and using that as an index (shifted right 6) into the second half of this table
; TILE_PANEL1		= $03	; Level Panel 1

; TILE_FORT		= $67	; Mini-Fortress
; TILE_POOL		= $BF	; Pool / Oasis
; TILE_WORLD5STAR	= $E9	; Star used on World 5 Sky map
; The check follows with a "less than", as a quick failure check (if you're in this "range"
; of tiles, but less than that value, you can't possibly be on an enterable tile)
; The second half is not used on the world map
;
; In levels, both "halves" define the first tile of a quadrant to be solid
; The first half is solid at the ground (i.e. Player can stand on it)
; The second half is solid at the head and walls (i.e. Player bumps head on it, typically "full solidity" when combined above)
; Interestingly, the Sonic the Hedgehog games implemented this same solidity pattern...
Tile_AttrTable:       ; $7E94-$7E9B
	.res 8

Level_UnusedSlopesTS5: ; UNUSED; If set to 2, forces slopes to be enabled for Level_Tileset = 5 (plant infestation)
	.res 1
PlantInfest_ACnt_Max: ; Always set to $1A in plant infestation levels, sets max value for animation counter
	.res 1

; unused ($7E9E-$7EB5)
	.res 24

LevelJctBQ_Flag:      ; Set to '1' while in a Big Question block area, locks horizontal scrolling
	.res 1
Level_JctBackupTileset: ; Level Junction tileset backup
	.res 1
Level_AltTileset:     ; Level's "alternate" tileset (when you go into bonus pipe, etc.)
	.res 1

; The "ORIGINAL" series are so you can switch back after going to a level's "alternate"
Level_LayPtrOrig_AddrL: ; ORIGINAL Low byte of address to tile layout
	.res 1
Level_LayPtrOrig_AddrH: ; ORIGINAL High byte of address to tile layout
	.res 1
Level_ObjPtrOrig_AddrL: ; ORIGINAL Low byte of address to object set
	.res 1
Level_ObjPtrOrig_AddrH: ; ORIGINAL High byte of address to object set
	.res 1

Level_BG_Page1_2:     ; Sets which bank the first and second page (2K / 64 8x8 tiles) of BG is using (see Level_BG_Pages1/2)
	.res 1

Map_BorderAttrFromTiles: ; $7EBE-$7EC8 (?) Attributes collected from map tiles that get overwritten by border FIXME SIZE UNCERTAIN
	.res 44

Map_Unused7EEA:       ; Unused; Value retrieved from LUT at initialization of world, but never used otherwise
	.res 1
Map_Objects_Y:        ; $7EEB-$7EF8, Y coordinate of all map objects
	.res 14
Map_Objects_XLo:      ; $7EF9-$7F06, X coordinate lo byte of all map objects
	.res 14
Map_Objects_XHi:      ; $7F07-$7F14, X coordinate hi byte of all map objects
	.res 14

Map_Objects_IDs:      ; $7F15-$7F22
	.res 14

Map_SprRAMOffDistr:   ; A free running counter on the map only which distributes Sprite_RAM offsets to ensure visibility
	.res 1

; Map_2PVsGame
; Sets which "style" of 2P Vs game will be played
;  0: Spiny Only
;  1: Fighter Fly Only
;  2: Spiny and Fighter Fly
;  3: Static coins
;  4: Spiny and Sidestepper
;  5: Fighter Fly and Sidestepper
;  6: Sidestepper Only
;  7: Coin Fountain
;  8: Spiny Only
;  9: Fighter Fly Only 
; 10: Sidestepper Only
; 11: Ladder and [?] blocks
Map_2PVsGame:
	.res 1

; unused ($7F25-$7F2C)
	.res 8

Map_Airship_Dest:     ; Airship travel destination; 6 X/Y map coordinates defined per world, after that it just sits still
	.res 1
THouse_OpenByID:      ; $7F2E-$7F3D UNUSED would keep track of chests opened for a given Toad House ID (THouse_ID)
	.res 16
StatusBar_PMT:        ; $7F3E-$7F45, tiles that currently make up the power meter >>>>>>[P]
	.res 8
StatusBar_CoinH:      ; Status bar tile for coin MSD
	.res 1
StatusBar_CoinL:      ; Status bar tile for coin LSD
	.res 1
StatusBar_LivesH:     ; Status bar tile for lives MSD
	.res 1
StatusBar_LivesL:     ; Status bar tile for lives LSD
	.res 1
StatusBar_Score:      ; $7F4A-$7F4F Status bar tiles for score
	.res 6
StatusBar_Time:       ; $7F50-$7F52 Status bar tiles for time remaining
	.res 3
Map_MusicBox_Cnt:     ; Number of turns remaining until hammer brothers wake up (>= 1 and they're be asleep on the map)
	.res 1

; Store arrays defined by level data as starts after an "alternate" level junction event
; Level_JctXLHStart:
;	Lower 4 bits: X Hi
;	Upper 4 bits: X Lo
; Level_JctYLHStart:
;	Bits 0 - 3: Go into Level_PipeExitDir
;	Bits 4 - 6: 0 to 7, selects start position from LevelJct_YLHStarts and sets proper vertical with LevelJct_VertStarts
;	Bit      7: If set, entering in vertical mode (for "dirty" refresh purposes)
Level_JctYLHStart:    ; $7F54-$7F63 Array of Y / YHi starts
	.res 16
Level_JctXLHStart:    ; $7F64-$7F73 Array of X / XHi starts
	.res 16

Object_TileFeet2:     ; ? Difference against Object_TileFeet?
	.res 1
Object_TileWall2:     ; ? Difference against Object_TileWall?
	.res 1

ObjTile_DetYHi:       ; Object tile detect Y Hi
	.res 1
ObjTile_DetYLo:       ; Object tile detect Y Lo
	.res 1
ObjTile_DetXHi:       ; Object tile detect X Hi
	.res 1
ObjTile_DetXLo:       ; Object tile detect X Lo
	.res 1

Bubble_Cnt:           ; $7F7A-$7F7C Bubble counter value (0 = no bubble)
	.res 3

; NOTE: Object_WatrHit* values are set only once, then WatrHit_IsSetFlag latches
; and they will never update again; seems it is leftover debug code or maybe
; an unused feature (that an object could respond to a splashdown)
WatrHit_IsSetFlag:    ; Set when Object_WatrHit* values are stored (but never cleared, so only once!)
	.res 1
Bubble_YHi:           ; $7F7E-$7F80 Water Bubble Y Hi
	.res 3
Object_WatrHitYHi:    ; Y Hi of object that just hit water
	.res 1
Bubble_Y:             ; $7F82-$7F84 Water Bubble Y
	.res 3
Object_WatrHitY:      ; Y of object that just hit water
	.res 1
Bubble_XHi:           ; $7F86-$7F88 Water Bubble X Hi
	.res 3
Object_WatrHitXHi:    ; X Hi of object that just hit water
	.res 1
Bubble_X:             ; $7F8A-$7F8C Water Bubble X
	.res 3
Object_WatrHitX:      ; X of object that just hit water
	.res 1

Splash_Counter:       ; $7F8E-$7F90 Water splash counter
	.res 3
Splash_Y:             ; $7F91-$7F93 Water splash X
	.res 3
Splash_X:             ; $7F94-$7F96 Water splash Y
	.res 3
Splash_NoScrollY:     ; $7F97-$7F99 If set, flags this water splash to not display sprite Y as relative to screen scroll
	.res 3

BrickBust_En:         ; $7F9A-$7F9C Brick bust "Enable" (0 = disable, 2 = brick debris, anything else = "poof" away)
	.res 3
BrickBust_YUpr:       ; $7F9D-$7F9F Brick bust upper chunks Y
	.res 3
BrickBust_X:          ; $7FA0-$7FA2 Brick bust base X
	.res 3
BrickBust_YVel:       ; $7FA3-$7FA5 Brick bust Y velocity
	.res 3
BrickBust_XDist:      ; $7FA6-$7FA8 Brick bust X split
	.res 3
BrickBust_YLwr:       ; $7FA9-$7FAB Brick bust lower chunks Y
	.res 3
BrickBust_HEn:        ; $7FAC-$7FAE Bits to hide chunks (Bit 0 = Right, 1 = Left, 2 = Lower, 3 = Upper) OR poof counter
	.res 3

; unused ($7FAF-$7FB1)
	.res 3

CoinPUp_State:        ; $7FB2-$7FB5 State of up to 4 "Power Up" coins (i.e. coins that come out of ? blocks and bricks)
	.res 4
CoinPUp_Y:            ; $7FB6-$7FB9 Y of "Power Up" coins
	.res 4
CoinPUp_X:            ; $7FBA-$7FBD X of "Power Up" coins
	.res 4
CoinPUp_YVel:         ; $7FBE-$7FC1 Y velocity of "Power Up" coins
	.res 4
CoinPUp_Counter:      ; $7FC2-$7FC5 Counter used by "Power Up" coins
	.res 4

SpecialObj_ID:        ; $7FC6-$7FCD Special object spawn event IDs
	.res 8

; unknown ($7FCE-$7FCF)
	.res 2

Objects_Var3:         ; $7FD0-$7FD4 Generic variable 3 for objects SLOT 0 - 4 ONLY
	.res 5

SpecialObj_YHi:       ; $7FD5-$7FDC Special object Y high coordinate
	.res 8

; unknown ($7FDD-$7FDE)
	.res 2

Objects_LastTile:     ; $7FDF-$7FE6 Last tile this object detected
	.res 8

Objects_SprAttr:      ; $7FE7-$7FEE Object sprite attributes (only uses bit 6 for H-Flip and bits 0-1 for palette)
	.res 8
Objects_UseShortHTest: ; $7FEF-$7FF6 If set, object will use a short horizontal test to determine if it is off-screen
	.res 8

Roulette_Lives:       ; Number of lives you are rewarded from winning the Roulette (NOTE: Shared with first byte of Objects_IsGiant)
Objects_IsGiant:      ; $7FF7-$7FFE Set mainly for World 4 "Giant" enemies (but some others, like Bowser, also use it)
	.res 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $7A01-$7A11 MMC3 SRAM as Cinematic for Wand Return (Post-Airship)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "WANDSRAM"
; This uses the same space as most of the Auto Scroll data

; After the wand is returned ONLY
CineKing_WandState:   ; Wand state; 0 = falling, 1 = spinning, 2 = held
	.res 1
CineKing_WandFrame:   ; Wand frame; 0 to 7
	.res 1
CineKing_ToadFrame:   ; Toad's frame
	.res 1
CineKing_DiagHi:      ; Text high address value
	.res 1

; unused in this context ($7A05-$7A07)
	.res 3

CineKing_TimerT:      ; Cheering Toad animation Timer
	.res 1
CineKing_Timer3:      ; Timer decremented every 4 ticks (does not appear to be used!)
	.res 1

; unused in this context ($7A0A-$7A0B)
	.res 2

CineKing_WandX:       ; Wand X position
	.res 1
CineKing_WandY:       ; Wand Y position
	.res 1
CineKing_WandXVel:    ; Wand X velocity (4.4FP)
	.res 1
CineKing_WandYVel:    ; Wand Y velocity (4.4FP)
	.res 1
CineKing_WandXVel_Frac: ; Wand X velocity fractional accumulator
	.res 1
CineKing_WandYVel_Frac: ; Wand Y velocity fractional accumulator
	.res 1
