
.include "../inc/macros.inc"
.include "../inc/defines.inc"

; PRG010 imports
.import FX_MonoFlash_By_MapTick
.import Map_GetTile
.import Map_W8DarknessUpdate
.import WorldMap_UpdateAndDraw

; PRG011 imports
.import GameOver_AlignToStartY
.import GameOver_ReturnToStartX
.import GameOver_TwirlFromAfar
.import GameOver_TwirlToStart
.import Map_DoMap_WarpWind_FX
.import Map_DrawClearLevelPoof
.import MapObjects_UpdateDrawEnter
.import MapStarsIntro_DoStarFX
.import MO_CheckForBonus
.import MO_DoLevelClear
.import MO_HandTrap
.import MO_SkidAfarFinish
.import MO_SkidAfarPrep
.import MO_SkidToPrev
.import MO_SkidToPrevAfar

; PRG014 imports
.import LoadLevel_BGBush
.import LoadLevel_BGOrWater
.import LoadLevel_BigSizeBush
.import LoadLevel_BlockRun
.import LoadLevel_CCBridge
.import LoadLevel_Cannon
.import LoadLevel_CloudRun
.import LoadLevel_CloudRun3
.import LoadLevel_Conveyor
.import LoadLevel_Corner
.import LoadLevel_DecoCeiling
.import LoadLevel_DecoGround
.import LoadLevel_DonutLifts
.import LoadLevel_Door1
.import LoadLevel_Door2
.import LoadLevel_EndGoal
.import LoadLevel_FillBackground
.import LoadLevel_FloatingBigBlock
.import LoadLevel_GenerateBigBlock
.import LoadLevel_GroundRun
.import LoadLevel_HLeftWallPipeRun
.import LoadLevel_HRightWallPipeRun
.import LoadLevel_HRightWallPipeRun3
.import LoadLevel_IceBricks
.import LoadLevel_Jelectro
.import LoadLevel_LittleBushRun
.import LoadLevel_LittleCloudRun
.import LoadLevel_LittleCloudSolidRun
.import LoadLevel_MidSizeBush
.import LoadLevel_MiscBG
.import LoadLevel_Nothing
.import LoadLevel_Path45B2T
.import LoadLevel_Path45T2B
.import LoadLevel_Path625B2T
.import LoadLevel_Path625T2B
.import LoadLevel_PathHorizontal
.import LoadLevel_PathVertical
.import LoadLevel_Pitfall
.import LoadLevel_PitfallW
.import LoadLevel_PowerBlock
.import LoadLevel_PrefabBlock
.import LoadLevel_PutLittleBGCloud
.import LoadLevel_RandomPUpClouds
.import LoadLevel_Slope225B2T
.import LoadLevel_Slope225B2TCeiling
.import LoadLevel_Slope225T2B
.import LoadLevel_Slope225T2BCeiling
.import LoadLevel_Slope45B2T
.import LoadLevel_Slope45B2TCeiling
.import LoadLevel_Slope45T2B
.import LoadLevel_Slope45T2BCeiling
.import LoadLevel_SmallSizeBush
.import LoadLevel_TopDecoBlocks
.import LoadLevel_Tunnel
.import LoadLevel_VCeilingPipeRun
.import LoadLevel_VGroundPipe5Run
.import LoadLevel_VGroundPipeRun
.import LoadLevel_VTransitPipeRun
.import LoadLevel_VertGroundL
.import LoadLevel_VertGroundR
.import LoadLevel_VineToGround

; PRG022 imports
.import UpdSel_Roulette

; PRG029 imports
.import Player_Draw
.import Player_DrawAndDoActions
.import ToadHouse_ChestPressB

; exports
.export FAR010_FX_MonoFlash_By_MapTick
.export FAR010_Map_GetTile
.export FAR010_Map_W8DarknessUpdate
.export FAR010_WorldMap_UpdateAndDraw
.export FAR011_GameOver_AlignToStartY
.export FAR011_GameOver_ReturnToStartX
.export FAR011_GameOver_TwirlFromAfar
.export FAR011_GameOver_TwirlToStart
.export FAR011_Map_DoMap_WarpWind_FX
.export FAR011_Map_DrawClearLevelPoof
.export FAR011_MapObjects_UpdateDrawEnter
.export FAR011_MapStarsIntro_DoStarFX
.export FAR011_MO_CheckForBonus
.export FAR011_MO_DoLevelClear
.export FAR011_MO_HandTrap
.export FAR011_MO_SkidAfarFinish
.export FAR011_MO_SkidAfarPrep
.export FAR011_MO_SkidToPrev
.export FAR011_MO_SkidToPrevAfar
.export FAR014_LoadLevel_BGBush
.export FAR014_LoadLevel_BGOrWater
.export FAR014_LoadLevel_BigSizeBush
.export FAR014_LoadLevel_BlockRun
.export FAR014_LoadLevel_CCBridge
.export FAR014_LoadLevel_Cannon
.export FAR014_LoadLevel_CloudRun
.export FAR014_LoadLevel_CloudRun3
.export FAR014_LoadLevel_Conveyor
.export FAR014_LoadLevel_Corner
.export FAR014_LoadLevel_DecoCeiling
.export FAR014_LoadLevel_DecoGround
.export FAR014_LoadLevel_DonutLifts
.export FAR014_LoadLevel_Door1
.export FAR014_LoadLevel_Door2
.export FAR014_LoadLevel_EndGoal
.export FAR014_LoadLevel_FillBackground
.export FAR014_LoadLevel_FloatingBigBlock
.export FAR014_LoadLevel_GenerateBigBlock
.export FAR014_LoadLevel_GroundRun
.export FAR014_LoadLevel_HLeftWallPipeRun
.export FAR014_LoadLevel_HRightWallPipeRun
.export FAR014_LoadLevel_HRightWallPipeRun3
.export FAR014_LoadLevel_IceBricks
.export FAR014_LoadLevel_Jelectro
.export FAR014_LoadLevel_LittleBushRun
.export FAR014_LoadLevel_LittleCloudRun
.export FAR014_LoadLevel_LittleCloudSolidRun
.export FAR014_LoadLevel_MidSizeBush
.export FAR014_LoadLevel_MiscBG
.export FAR014_LoadLevel_Nothing
.export FAR014_LoadLevel_Path45B2T
.export FAR014_LoadLevel_Path45T2B
.export FAR014_LoadLevel_Path625B2T
.export FAR014_LoadLevel_Path625T2B
.export FAR014_LoadLevel_PathHorizontal
.export FAR014_LoadLevel_PathVertical
.export FAR014_LoadLevel_Pitfall
.export FAR014_LoadLevel_PitfallW
.export FAR014_LoadLevel_PowerBlock
.export FAR014_LoadLevel_PrefabBlock
.export FAR014_LoadLevel_PutLittleBGCloud
.export FAR014_LoadLevel_RandomPUpClouds
.export FAR014_LoadLevel_Slope225B2T
.export FAR014_LoadLevel_Slope225B2TCeiling
.export FAR014_LoadLevel_Slope225T2B
.export FAR014_LoadLevel_Slope225T2BCeiling
.export FAR014_LoadLevel_Slope45B2T
.export FAR014_LoadLevel_Slope45B2TCeiling
.export FAR014_LoadLevel_Slope45T2B
.export FAR014_LoadLevel_Slope45T2BCeiling
.export FAR014_LoadLevel_Tunnel
.export FAR014_LoadLevel_SmallSizeBush
.export FAR014_LoadLevel_TopDecoBlocks
.export FAR014_LoadLevel_VCeilingPipeRun
.export FAR014_LoadLevel_VGroundPipe5Run
.export FAR014_LoadLevel_VGroundPipeRun
.export FAR014_LoadLevel_VTransitPipeRun
.export FAR014_LoadLevel_VertGroundL
.export FAR014_LoadLevel_VertGroundR
.export FAR014_LoadLevel_VineToGround
.export FAR022_UpdSel_Roulette
.export FAR029_Player_Draw
.export FAR029_Player_DrawAndDoActions
.export FAR029_ToadHouse_ChestPressB

.ifdef NES
	FAR010_FX_MonoFlash_By_MapTick := FX_MonoFlash_By_MapTick
	FAR010_Map_GetTile := Map_GetTile
	FAR010_Map_W8DarknessUpdate := Map_W8DarknessUpdate
	FAR010_WorldMap_UpdateAndDraw := WorldMap_UpdateAndDraw
	FAR011_GameOver_AlignToStartY := GameOver_AlignToStartY
	FAR011_GameOver_ReturnToStartX := GameOver_ReturnToStartX
	FAR011_GameOver_TwirlFromAfar := GameOver_TwirlFromAfar
	FAR011_GameOver_TwirlToStart := GameOver_TwirlToStart
	FAR011_Map_DoMap_WarpWind_FX := Map_DoMap_WarpWind_FX
	FAR011_Map_DrawClearLevelPoof := Map_DrawClearLevelPoof
	FAR011_MapObjects_UpdateDrawEnter := MapObjects_UpdateDrawEnter
	FAR011_MapStarsIntro_DoStarFX := MapStarsIntro_DoStarFX
	FAR011_MO_CheckForBonus := MO_CheckForBonus
	FAR011_MO_DoLevelClear := MO_DoLevelClear
	FAR011_MO_HandTrap := MO_HandTrap
	FAR011_MO_SkidAfarFinish := MO_SkidAfarFinish
	FAR011_MO_SkidAfarPrep := MO_SkidAfarPrep
	FAR011_MO_SkidToPrev := MO_SkidToPrev
	FAR011_MO_SkidToPrevAfar := MO_SkidToPrevAfar
	FAR014_LoadLevel_BGBush := LoadLevel_BGBush
	FAR014_LoadLevel_BGOrWater = LoadLevel_BGOrWater
	FAR014_LoadLevel_BigSizeBush := LoadLevel_BigSizeBush
	FAR014_LoadLevel_BlockRun := LoadLevel_BlockRun
	FAR014_LoadLevel_CCBridge := LoadLevel_CCBridge
	FAR014_LoadLevel_Cannon := LoadLevel_Cannon
	FAR014_LoadLevel_Conveyor := LoadLevel_Conveyor
	FAR014_LoadLevel_CloudRun := LoadLevel_CloudRun
	FAR014_LoadLevel_CloudRun3 := LoadLevel_CloudRun3
	FAR014_LoadLevel_Corner := LoadLevel_Corner
	FAR014_LoadLevel_DecoCeiling := LoadLevel_DecoCeiling
	FAR014_LoadLevel_DecoGround := LoadLevel_DecoGround
	FAR014_LoadLevel_DonutLifts := LoadLevel_DonutLifts
	FAR014_LoadLevel_Door1 := LoadLevel_Door1
	FAR014_LoadLevel_Door2 := LoadLevel_Door2
	FAR014_LoadLevel_EndGoal := LoadLevel_EndGoal
	FAR014_LoadLevel_FillBackground = LoadLevel_FillBackground
	FAR014_LoadLevel_FloatingBigBlock := LoadLevel_FloatingBigBlock
	FAR014_LoadLevel_GenerateBigBlock := LoadLevel_GenerateBigBlock
	FAR014_LoadLevel_GroundRun := LoadLevel_GroundRun
	FAR014_LoadLevel_HLeftWallPipeRun := LoadLevel_HLeftWallPipeRun
	FAR014_LoadLevel_HRightWallPipeRun := LoadLevel_HRightWallPipeRun
	FAR014_LoadLevel_HRightWallPipeRun3 := LoadLevel_HRightWallPipeRun3
	FAR014_LoadLevel_IceBricks := LoadLevel_IceBricks
	FAR014_LoadLevel_Jelectro := LoadLevel_Jelectro
	FAR014_LoadLevel_LittleBushRun := LoadLevel_LittleBushRun
	FAR014_LoadLevel_LittleCloudRun := LoadLevel_LittleCloudRun
	FAR014_LoadLevel_LittleCloudSolidRun := LoadLevel_LittleCloudSolidRun
	FAR014_LoadLevel_MidSizeBush := LoadLevel_MidSizeBush
	FAR014_LoadLevel_MiscBG := LoadLevel_MiscBG
	FAR014_LoadLevel_Nothing := LoadLevel_Nothing
	FAR014_LoadLevel_Path45B2T := LoadLevel_Path45B2T
	FAR014_LoadLevel_Path45T2B := LoadLevel_Path45T2B
	FAR014_LoadLevel_Path625B2T := LoadLevel_Path625B2T
	FAR014_LoadLevel_Path625T2B := LoadLevel_Path625T2B
	FAR014_LoadLevel_PathHorizontal := LoadLevel_PathHorizontal
	FAR014_LoadLevel_PathVertical := LoadLevel_PathVertical
	FAR014_LoadLevel_Pitfall := LoadLevel_Pitfall
	FAR014_LoadLevel_PitfallW := LoadLevel_PitfallW
	FAR014_LoadLevel_PowerBlock := LoadLevel_PowerBlock
	FAR014_LoadLevel_PrefabBlock := LoadLevel_PrefabBlock
	FAR014_LoadLevel_PutLittleBGCloud := LoadLevel_PutLittleBGCloud
	FAR014_LoadLevel_RandomPUpClouds := LoadLevel_RandomPUpClouds
	FAR014_LoadLevel_Slope225B2T := LoadLevel_Slope225B2T
	FAR014_LoadLevel_Slope225B2TCeiling := LoadLevel_Slope225B2TCeiling
	FAR014_LoadLevel_Slope225T2B := LoadLevel_Slope225T2B
	FAR014_LoadLevel_Slope225T2BCeiling := LoadLevel_Slope225T2BCeiling
	FAR014_LoadLevel_Slope45B2T := LoadLevel_Slope45B2T
	FAR014_LoadLevel_Slope45B2TCeiling := LoadLevel_Slope45B2TCeiling
	FAR014_LoadLevel_Slope45T2B := LoadLevel_Slope45T2B
	FAR014_LoadLevel_Slope45T2BCeiling := LoadLevel_Slope45T2BCeiling
	FAR014_LoadLevel_SmallSizeBush := LoadLevel_SmallSizeBush
	FAR014_LoadLevel_TopDecoBlocks := LoadLevel_TopDecoBlocks
	FAR014_LoadLevel_Tunnel := LoadLevel_Tunnel
	FAR014_LoadLevel_VCeilingPipeRun := LoadLevel_VCeilingPipeRun
	FAR014_LoadLevel_VGroundPipe5Run := LoadLevel_VGroundPipe5Run
	FAR014_LoadLevel_VGroundPipeRun := LoadLevel_VGroundPipeRun
	FAR014_LoadLevel_VTransitPipeRun := LoadLevel_VTransitPipeRun
	FAR014_LoadLevel_VertGroundL := LoadLevel_VertGroundL
	FAR014_LoadLevel_VertGroundR := LoadLevel_VertGroundR
	FAR014_LoadLevel_VineToGround := LoadLevel_VineToGround
	FAR022_UpdSel_Roulette := UpdSel_Roulette
	FAR029_Player_Draw := Player_Draw
	FAR029_Player_DrawAndDoActions := Player_DrawAndDoActions
	FAR029_ToadHouse_ChestPressB := ToadHouse_ChestPressB
.endif

.ifdef X16
.include "../inc/x16.inc"
.segment "X16BRIDGE"

FAR010_FX_MonoFlash_By_MapTick:
	PJFAR FX_MonoFlash_By_MapTick, 10

FAR010_Map_GetTile:
	PJFAR Map_GetTile, 10

FAR010_Map_W8DarknessUpdate:
	PJFAR Map_W8DarknessUpdate, 10

FAR010_WorldMap_UpdateAndDraw:
	PJFAR WorldMap_UpdateAndDraw, 10

FAR011_GameOver_AlignToStartY:
	PJFAR GameOver_AlignToStartY, 11

FAR011_GameOver_ReturnToStartX:
	PJFAR GameOver_ReturnToStartX, 11

FAR011_GameOver_TwirlFromAfar:
	PJFAR GameOver_TwirlFromAfar, 11

FAR011_GameOver_TwirlToStart:
	PJFAR GameOver_TwirlToStart, 11

FAR011_Map_DoMap_WarpWind_FX:
	PJFAR Map_DoMap_WarpWind_FX, 11

FAR011_Map_DrawClearLevelPoof:
	PJFAR Map_DrawClearLevelPoof, 11

FAR011_MapObjects_UpdateDrawEnter:
	PJFAR MapObjects_UpdateDrawEnter, 11

FAR011_MapStarsIntro_DoStarFX:
	PJFAR MapStarsIntro_DoStarFX, 11

FAR011_MO_CheckForBonus:
	PJFAR MO_CheckForBonus, 11

FAR011_MO_DoLevelClear:
	PJFAR MO_DoLevelClear, 11

FAR011_MO_HandTrap:
	PJFAR MO_HandTrap, 11

FAR011_MO_SkidAfarFinish:
	PJFAR MO_SkidAfarFinish, 11

FAR011_MO_SkidAfarPrep:
	PJFAR MO_SkidAfarPrep, 11

FAR011_MO_SkidToPrev:
	PJFAR MO_SkidToPrev, 11

FAR011_MO_SkidToPrevAfar:
	PJFAR MO_SkidToPrevAfar, 11

FAR014_LoadLevel_BGBush:
	PJFAR LoadLevel_BGBush, 14

FAR014_LoadLevel_BGOrWater:
	PJFAR LoadLevel_BGOrWater, 14

FAR014_LoadLevel_BigSizeBush:
	PJFAR LoadLevel_BigSizeBush, 14

FAR014_LoadLevel_BlockRun:
	PJFAR LoadLevel_BlockRun, 14

FAR014_LoadLevel_CCBridge:
	PJFAR LoadLevel_CCBridge, 14

FAR014_LoadLevel_Cannon:
	PJFAR LoadLevel_Cannon, 14

FAR014_LoadLevel_CloudRun:
	PJFAR LoadLevel_CloudRun, 14

FAR014_LoadLevel_CloudRun3:
	PJFAR LoadLevel_CloudRun3, 14

FAR014_LoadLevel_Conveyor:
	PJFAR LoadLevel_Conveyor, 14

FAR014_LoadLevel_Corner:
	PJFAR LoadLevel_Corner, 14

FAR014_LoadLevel_DecoCeiling:
	PJFAR LoadLevel_DecoCeiling, 14

FAR014_LoadLevel_DecoGround:
	PJFAR LoadLevel_DecoGround, 14

FAR014_LoadLevel_DonutLifts:
	PJFAR LoadLevel_DonutLifts, 14

FAR014_LoadLevel_Door1:
	PJFAR LoadLevel_Door1, 14

FAR014_LoadLevel_Door2:
	PJFAR LoadLevel_Door2, 14

FAR014_LoadLevel_EndGoal:
	PJFAR LoadLevel_EndGoal, 14

FAR014_LoadLevel_FillBackground:
	PJFAR LoadLevel_FillBackground, 14

FAR014_LoadLevel_FloatingBigBlock:
	PJFAR LoadLevel_FloatingBigBlock, 14

FAR014_LoadLevel_GenerateBigBlock:
	PJFAR LoadLevel_GenerateBigBlock, 14

FAR014_LoadLevel_GroundRun:
	PJFAR LoadLevel_GroundRun, 14

FAR014_LoadLevel_HLeftWallPipeRun:
	PJFAR LoadLevel_HLeftWallPipeRun, 14

FAR014_LoadLevel_HRightWallPipeRun:
	PJFAR LoadLevel_HRightWallPipeRun, 14

FAR014_LoadLevel_HRightWallPipeRun3:
	PJFAR LoadLevel_HRightWallPipeRun3, 14

FAR014_LoadLevel_IceBricks:
	PJFAR LoadLevel_IceBricks, 14

FAR014_LoadLevel_Jelectro:
	PJFAR LoadLevel_Jelectro, 14

FAR014_LoadLevel_LittleBushRun:
	PJFAR LoadLevel_LittleBushRun, 14

FAR014_LoadLevel_LittleCloudRun:
	PJFAR LoadLevel_LittleCloudRun, 14

FAR014_LoadLevel_LittleCloudSolidRun:
	PJFAR LoadLevel_LittleCloudSolidRun, 14

FAR014_LoadLevel_MidSizeBush:
	PJFAR LoadLevel_MidSizeBush, 14

FAR014_LoadLevel_MiscBG:
	PJFAR LoadLevel_MiscBG, 14

FAR014_LoadLevel_Nothing:
	PJFAR LoadLevel_Nothing, 14

FAR014_LoadLevel_Path45B2T:
	PJFAR LoadLevel_Path45B2T, 14

FAR014_LoadLevel_Path45T2B:
	PJFAR LoadLevel_Path45T2B, 14

FAR014_LoadLevel_Path625B2T:
	PJFAR LoadLevel_Path625B2T, 14

FAR014_LoadLevel_Path625T2B:
	PJFAR LoadLevel_Path625T2B, 14

FAR014_LoadLevel_PathHorizontal:
	PJFAR LoadLevel_PathHorizontal, 14

FAR014_LoadLevel_PathVertical:
	PJFAR LoadLevel_PathVertical, 14

FAR014_LoadLevel_Pitfall:
	PJFAR LoadLevel_Pitfall, 14

FAR014_LoadLevel_PitfallW:
	PJFAR LoadLevel_PitfallW, 14

FAR014_LoadLevel_PowerBlock:
	PJFAR LoadLevel_PowerBlock, 14

FAR014_LoadLevel_PrefabBlock:
	PJFAR LoadLevel_PrefabBlock, 14

FAR014_LoadLevel_PutLittleBGCloud:
	PJFAR LoadLevel_PutLittleBGCloud, 14

FAR014_LoadLevel_RandomPUpClouds:
	PJFAR LoadLevel_RandomPUpClouds, 14

FAR014_LoadLevel_Slope225B2T:
	PJFAR LoadLevel_Slope225B2T, 14

FAR014_LoadLevel_Slope225B2TCeiling:
	PJFAR LoadLevel_Slope225B2TCeiling, 14

FAR014_LoadLevel_Slope225T2B:
	PJFAR LoadLevel_Slope225T2B, 14

FAR014_LoadLevel_Slope225T2BCeiling:
	PJFAR LoadLevel_Slope225T2BCeiling, 14

FAR014_LoadLevel_Slope45B2T:
	PJFAR LoadLevel_Slope45B2T, 14

FAR014_LoadLevel_Slope45B2TCeiling:
	PJFAR LoadLevel_Slope45B2TCeiling, 14

FAR014_LoadLevel_Slope45T2B:
	PJFAR LoadLevel_Slope45T2B, 14

FAR014_LoadLevel_Slope45T2BCeiling:
	PJFAR LoadLevel_Slope45T2BCeiling, 14

FAR014_LoadLevel_SmallSizeBush:
	PJFAR LoadLevel_SmallSizeBush, 14

FAR014_LoadLevel_TopDecoBlocks:
	PJFAR LoadLevel_TopDecoBlocks, 14

FAR014_LoadLevel_Tunnel:
	PJFAR LoadLevel_Tunnel, 14

FAR014_LoadLevel_VCeilingPipeRun:
	PJFAR LoadLevel_VCeilingPipeRun, 14

FAR014_LoadLevel_VGroundPipe5Run:
	PJFAR LoadLevel_VGroundPipe5Run, 14

FAR014_LoadLevel_VGroundPipeRun:
	PJFAR LoadLevel_VGroundPipeRun, 14

FAR014_LoadLevel_VTransitPipeRun:
	PJFAR LoadLevel_VTransitPipeRun, 14

FAR014_LoadLevel_VertGroundL:
	PJFAR LoadLevel_VertGroundL, 14

FAR014_LoadLevel_VertGroundR:
	PJFAR LoadLevel_VertGroundR, 14

FAR014_LoadLevel_VineToGround:
	PJFAR LoadLevel_VineToGround, 14

FAR022_UpdSel_Roulette:
	PJFAR UpdSel_Roulette, 22

FAR029_Player_Draw:
	PJFAR Player_Draw, 29

FAR029_Player_DrawAndDoActions:
	PJFAR Player_DrawAndDoActions, 29

FAR029_ToadHouse_ChestPressB:
	PJFAR ToadHouse_ChestPressB, 29

.endif

