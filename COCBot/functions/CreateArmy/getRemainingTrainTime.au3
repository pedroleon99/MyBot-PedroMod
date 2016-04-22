; #FUNCTION# ====================================================================================================================
; Name ..........: getRemainingTrainTime
; Description ...: Read the remaining time to complete the train troops & Spells on ArmyOverView Window
; Syntax ........: RemainTrainTime
; Parameters ....: $Troops and $Spells 
; Return values .: Most high value from Spells or Troops in minutes
; Author ........: ProMac (04-2016)
; Modified ......: 
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: openArmyOverview
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func getRemainingTrainTime($Troops = True, $Spells = True)	
	Local $aRemainTrainTroopTimer = 0 
	Local $aRemainTrainSpellsTimer = 0 
	Local $ResultTroopsHour, $ResultTroopsMinutes
	Local $ResultSpellsHour, $ResultTroopsMinutes
	
	Local $ResultTroops = getOcrTroopsTime(688, 176)
	Local $ResultSpells = getOcrLaboratoryTime(363, 423)
	
	If $Troops = True Then 
		If StringInStr($ResultTroops, "h") > 1 Then ; check if time has hour unit
			$ResultTroopsHour = StringSplit($ResultTroops, "h", $STR_NOCOUNT)
			; $ResultTroopsHour[0] will be the Hour and the $ResultTroopsHour[1] will be the Minutes with the "m" at end
			$ResultTroopsMinutes = StringTrimRight($ResultTroopsHour[1], 1) ; removing the "m"
			$aRemainTrainTroopTimer = (Number($ResultTroopsHour[0]) * 60) + Number($ResultTroopsMinutes)
		Else 
			If StringInStr($ResultTroops, "m") > 1 Then ; check if time has minute unit
			$aRemainTrainTroopTimer = Number(StringTrimRight($ResultTroops, 1))
			EndIf
		EndIf 
	EndIf 
	
	If $Spells = True Then 
		If StringInStr($ResultSpells, "h") > 1 Then ; check if time has hour unit
			$ResultSpellsHour = StringSplit($ResultSpells, "h", $STR_NOCOUNT)
			; $ResultSpellsHour[0] will be the Hour and the $ResultSpellsHour[1] will be the Minutes with the "m" at end
			$ResultTroopsMinutes = StringTrimRight($ResultSpellsHour[1], 1) ; removing the "m"
			$aRemainTrainSpellsTimer = (Number($ResultSpellsHour[0]) * 60) + Number($ResultTroopsMinutes)
		Else 
			If StringInStr($ResultTroops, "m") > 1 Then ; check if time has minute unit
			$aRemainTrainSpellsTimer = Number(StringTrimRight($ResultSpells, 1))
		EndIf
		EndIf
	EndIf 
	
	; Verify the higest value to return in minutes
	If $aRemainTrainTroopTimer > $aRemainTrainSpellsTimer Then 
		Return $aRemainTrainTroopTimer
	Else
		Return $aRemainTrainSpellsTimer
	EndIf 
	Return 0
EndFunc ;==>getRemainingTrainTime