
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

FAR022_UpdSel_Roulette:
	PJFAR UpdSel_Roulette, 22

FAR029_Player_Draw:
	PJFAR Player_Draw, 29

FAR029_Player_DrawAndDoActions:
	PJFAR Player_DrawAndDoActions, 29

FAR029_ToadHouse_ChestPressB:
	PJFAR ToadHouse_ChestPressB, 29

.endif

