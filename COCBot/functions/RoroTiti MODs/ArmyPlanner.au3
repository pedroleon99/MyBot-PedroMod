; #FUNCTION# ====================================================================================================================
; Name ..........: ArmyPlanner (v1)
; Description ...: This file contains all functions of ArmyPlanner feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: This function is my contribution to the new Train System by @ProMac (2016)
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

; ================================================== GUI PART ================================================== ;

Func ApplyGUILevels()

	For $x = 0 To 11
		GUICtrlSetData($eGUILevelTroops[$x], $eLevelTroops[$x])
	Next
	For $x = 0 To 6
		GUICtrlSetData($dGUILevelTroops[$x], $dLevelTroops[$x])
	Next
	For $x = 0 To 5
		GUICtrlSetData($eGUILevelSpells[$x], $eLevelSpells[$x])
	Next
	For $x = 0 To 3
		GUICtrlSetData($dGUILevelSpells[$x], $dLevelSpells[$x])
	Next

EndFunc   ;==>ApplyGUILevels

Func SaveGUILevels()

	For $x = 0 To 11
		$eLevelTroops[$x] = GUICtrlRead($eGUILevelTroops[$x])
	Next
	For $x = 0 To 6
		$dLevelTroops[$x] = GUICtrlRead($dGUILevelTroops[$x])
	Next
	For $x = 0 To 5
		$eLevelSpells[$x] = GUICtrlRead($eGUILevelSpells[$x])
	Next
	For $x = 0 To 3
		$dLevelSpells[$x] = GUICtrlRead($dGUILevelSpells[$x])
	Next

EndFunc   ;==>SaveGUILevels

; ================================================== BTNs PART ================================================== ;

Func chkBarrackBoost()

	If GUICtrlRead($chkeBarrack1Boost) = $GUI_CHECKED Then
		$ichkeBarrack1Boost = 1
	Else
		$ichkeBarrack1Boost = 0
	EndIf

	If GUICtrlRead($chkeBarrack2Boost) = $GUI_CHECKED Then
		$ichkeBarrack2Boost = 1
	Else
		$ichkeBarrack2Boost = 0
	EndIf

	If GUICtrlRead($chkeBarrack3Boost) = $GUI_CHECKED Then
		$ichkeBarrack3Boost = 1
	Else
		$ichkeBarrack3Boost = 0
	EndIf

	If GUICtrlRead($chkeBarrack4Boost) = $GUI_CHECKED Then
		$ichkeBarrack4Boost = 1
	Else
		$ichkeBarrack4Boost = 0
	EndIf

	If GUICtrlRead($chkdBarrack1Boost) = $GUI_CHECKED Then
		$ichkdBarrack1Boost = 1
	Else
		$ichkdBarrack1Boost = 0
	EndIf

	If GUICtrlRead($chkdBarrack2Boost) = $GUI_CHECKED Then
		$ichkdBarrack2Boost = 1
	Else
		$ichkdBarrack2Boost = 0
	EndIf

	If GUICtrlRead($chkeFactoryBoost) = $GUI_CHECKED Then
		$ichkeFactoryBoost = 1
	Else
		$ichkeFactoryBoost = 0
	EndIf

	If GUICtrlRead($chkdFactoryBoost) = $GUI_CHECKED Then
		$ichkdFactoryBoost = 1
	Else
		$ichkdFactoryBoost = 0
	EndIf

EndFunc   ;==>chkBarrackBoost

Func chkBarrackUse()

	If GUICtrlRead($chkeBarrack1Use) = $GUI_CHECKED Then
		$eBarrack1Duration = 0
	Else
		$eBarrack1Duration = 999999999999
	EndIf

	If GUICtrlRead($chkeBarrack2Use) = $GUI_CHECKED Then
		$eBarrack2Duration = 0
	Else
		$eBarrack2Duration = 999999999999
	EndIf

	If GUICtrlRead($chkeBarrack3Use) = $GUI_CHECKED Then
		$eBarrack3Duration = 0
	Else
		$eBarrack3Duration = 999999999999
	EndIf

	If GUICtrlRead($chkeBarrack4Use) = $GUI_CHECKED Then
		$eBarrack4Duration = 0
	Else
		$eBarrack4Duration = 999999999999
	EndIf

	If GUICtrlRead($chkdBarrack1Use) = $GUI_CHECKED Then
		$dBarrack1Duration = 0
	Else
		$dBarrack1Duration = 999999999999
	EndIf

	If GUICtrlRead($chkdBarrack2Use) = $GUI_CHECKED Then
		$dBarrack2Duration = 0
	Else
		$dBarrack2Duration = 999999999999
	EndIf

EndFunc   ;==>chkBarrackUse

Func ebtnAdd($Duration, $Size, $TroopCoord)

	Local $eMiniDuration[4] = [$eBarrack1Duration, $eBarrack2Duration, $eBarrack3Duration, $eBarrack4Duration]

	$eMinDuration = _ArrayMinIndex($eMiniDuration)

	If $eMinDuration = 0 Then
		If $ichkeBarrack1Boost = 1 Then
			$eBarrack1Duration += $Duration / 4
		Else
			$eBarrack1Duration += $Duration
		EndIf
		$eBarracksContent[0][$TroopCoord] = $eBarracksContent[0][$TroopCoord] + 1
		GUICtrlSetData($eGUIBarracks[0][$TroopCoord], $eBarracksContent[0][$TroopCoord])
	ElseIf $eMinDuration = 1 Then
		If $ichkeBarrack2Boost = 1 Then
			$eBarrack2Duration += $Duration / 4
		Else
			$eBarrack2Duration += $Duration
		EndIf
		$eBarracksContent[1][$TroopCoord] = $eBarracksContent[1][$TroopCoord] + 1
		GUICtrlSetData($eGUIBarracks[1][$TroopCoord], $eBarracksContent[1][$TroopCoord])
	ElseIf $eMinDuration = 2 Then
		If $ichkeBarrack3Boost = 1 Then
			$eBarrack3Duration += $Duration / 4
		Else
			$eBarrack3Duration += $Duration
		EndIf
		$eBarracksContent[2][$TroopCoord] = $eBarracksContent[2][$TroopCoord] + 1
		GUICtrlSetData($eGUIBarracks[2][$TroopCoord], $eBarracksContent[2][$TroopCoord])
	ElseIf $eMinDuration = 3 Then
		If $ichkeBarrack4Boost = 1 Then
			$eBarrack4Duration += $Duration / 4
		Else
			$eBarrack4Duration += $Duration
		EndIf
		$eBarracksContent[3][$TroopCoord] += 1
		GUICtrlSetData($eGUIBarracks[3][$TroopCoord], $eBarracksContent[3][$TroopCoord])
	EndIf

	$TotalArmy += $Size
	GUICtrlSetData($lblTotalArmy, " " & $TotalArmy)

EndFunc   ;==>ebtnAdd

Func dbtnAdd($Duration, $Size, $TroopCoord)

	Local $dMiniDuration[2] = [$dBarrack1Duration, $dBarrack2Duration]

	$dMinDuration = _ArrayMinIndex($dMiniDuration)

	If $dMinDuration = 0 Then
		If $ichkdBarrack1Boost = 1 Then
			$dBarrack1Duration += $Duration / 4
		Else
			$dBarrack1Duration += $Duration
		EndIf
		$dBarracksContent[0][$TroopCoord] = $dBarracksContent[0][$TroopCoord] + 1
		GUICtrlSetData($dGUIBarracks[0][$TroopCoord], $dBarracksContent[0][$TroopCoord])
	ElseIf $dMinDuration = 1 Then
		If $ichkdBarrack2Boost = 1 Then
			$dBarrack2Duration += $Duration / 4
		Else
			$dBarrack2Duration += $Duration
		EndIf
		$dBarracksContent[1][$TroopCoord] += 1
		GUICtrlSetData($dGUIBarracks[1][$TroopCoord], $dBarracksContent[1][$TroopCoord])
	EndIf

	$TotalArmy += $Size
	GUICtrlSetData($lblTotalArmy, " " & $TotalArmy)

EndFunc   ;==>dbtnAdd

Func ebtnAddS($TroopCoord)

	If $ichkeFactoryBoost = 1 Then
		$eFactoryDuration += 600 / 4
	Else
		$eFactoryDuration += 600
	EndIf
	$eFactoryContent[$TroopCoord] += 1

	$TotalSpell += 2
	GUICtrlSetData($lblTotalSpell, " " & $TotalSpell)

EndFunc   ;==>ebtnAddS

Func dbtnAddS($TroopCoord)

	If $ichkdFactoryBoost = 1 Then
		$dFactoryDuration += 300 / 4
	Else
		$dFactoryDuration += 300
	EndIf
	$dFactoryContent[$TroopCoord] += 1

	$TotalSpell += 1
	GUICtrlSetData($lblTotalSpell, " " & $TotalSpell)

EndFunc   ;==>dbtnAddS

Func btnReset()

	For $x = 0 To 3
		For $y = 0 To 11
			$eBarracksContent[$x][$y] = 0
			$eTotalTroops[$y] = 0
			GUICtrlSetData($eGUITotalTroops[$y], 0)
			GUICtrlSetData($eGUIBarracks[$x][$y], 0)
		Next
	Next
	For $x = 0 To 1
		For $y = 0 To 6
			$dBarracksContent[$x][$y] = 0
			$dTotalTroops[$y] = 0
			GUICtrlSetData($dGUITotalTroops[$y], 0)
			GUICtrlSetData($dGUIBarracks[$x][$y], 0)
		Next
	Next

	For $x = 0 To 5
		$eFactoryContent[$x] = 0
		$eTotalSpells[$x] = 0
		GUICtrlSetData($eGUITotalSpells[$x], 0)
	Next
	For $x = 0 To 3
		$dFactoryContent[$x] = 0
		$dTotalSpells[$x] = 0
		GUICtrlSetData($dGUITotalSpells[$x], 0)
	Next

	$eBarrack1DurationC = 0
	$eBarrack2DurationC = 0
	$eBarrack3DurationC = 0
	$eBarrack4DurationC = 0
	$dBarrack1DurationC = 0
	$dBarrack2DurationC = 0
	$eFactoryDuration = 0
	$dFactoryDuration = 0

	$HourDuration = 0
	$MinDuration = 0
	$SecDuration = 0

	$totalDuration = 0

	$TotalArmy = 0
	$TotalSpell = 0

	chkBarrackUse()
	btnCalcTotals()

	GUICtrlSetData($lblTotalArmy, " 0")
	GUICtrlSetData($lblTotalSpell, " 0")
	GUICtrlSetData($lbleCost, " 0")
	GUICtrlSetData($lbldCost, " 0")
	GUICtrlSetData($lblTotalDuration, " 0s")

	$CanCalc = 1

	GUICtrlSetData($btnCalcTotals, "Calc !")
	GUICtrlSetState($btnCalcTotals, $GUI_ENABLE)

	GUICtrlSetData($btnCopyTroops, "Copy to Planner Tab")
	GUICtrlSetState($btnCopyTroops, $GUI_ENABLE)
	GUICtrlSetOnEvent($btnCopyTroops, "copyTroops")
	GUICtrlSetData($btnCopySpells, "Copy to Planner Tab")
	GUICtrlSetState($btnCopySpells, $GUI_ENABLE)
	GUICtrlSetOnEvent($btnCopySpells, "copySpells")

EndFunc   ;==>btnReset

Func copyTroops()

	GUICtrlSetData($eGUITotalTroops[2], GUICtrlRead($txtNumGiant))
	GUICtrlSetData($eGUITotalTroops[4], GUICtrlRead($txtNumWall))
	GUICtrlSetData($eGUITotalTroops[5], GUICtrlRead($txtNumBall))
	GUICtrlSetData($eGUITotalTroops[6], GUICtrlRead($txtNumWiza))
	GUICtrlSetData($eGUITotalTroops[7], GUICtrlRead($txtNumHeal))
	GUICtrlSetData($eGUITotalTroops[8], GUICtrlRead($txtNumDrag))
	GUICtrlSetData($eGUITotalTroops[9], GUICtrlRead($txtNumPekk))
	GUICtrlSetData($eGUITotalTroops[10], GUICtrlRead($txtNumBabyD))
	GUICtrlSetData($eGUITotalTroops[11], GUICtrlRead($txtNumMine))

	GUICtrlSetData($dGUITotalTroops[0], GUICtrlRead($txtNumMini))
	GUICtrlSetData($dGUITotalTroops[1], GUICtrlRead($txtNumHogs))
	GUICtrlSetData($dGUITotalTroops[2], GUICtrlRead($txtNumValk))
	GUICtrlSetData($dGUITotalTroops[3], GUICtrlRead($txtNumGole))
	GUICtrlSetData($dGUITotalTroops[4], GUICtrlRead($txtNumWitc))
	GUICtrlSetData($dGUITotalTroops[5], GUICtrlRead($txtNumLava))
	GUICtrlSetData($dGUITotalTroops[6], GUICtrlRead($txtNumBowl))

	$copySubTotal = GUICtrlRead($txtNumGiant) * 5 + GUICtrlRead($txtNumWall) * 2 + GUICtrlRead($txtNumBall) * 5 + GUICtrlRead($txtNumWiza) * 4 + GUICtrlRead($txtNumHeal) * 14 + GUICtrlRead($txtNumDrag) * 20 + GUICtrlRead($txtNumBabyD) * 10 + GUICtrlRead($txtNumMine) * 5 + GUICtrlRead($txtNumMini) * 2 + GUICtrlRead($txtNumHogs) * 5 + GUICtrlRead($txtNumValk) * 8 + GUICtrlRead($txtNumGole) * 30 + GUICtrlRead($txtNumWitc) * 12 + GUICtrlRead($txtNumLava) * 30 + GUICtrlRead($txtNumBowl) * 6

	$txtNumBarbD = Round(GUICtrlRead($txtNumBarb) * (GUICtrlRead($txtTotalCamp) - $copySubTotal) / 100)
	$txtNumArchD = Round(GUICtrlRead($txtNumArch) * (GUICtrlRead($txtTotalCamp) - $copySubTotal) / 100)
	$txtNumGoblD = Round(GUICtrlRead($txtNumGobl) * (GUICtrlRead($txtTotalCamp) - $copySubTotal) / 100)

	GUICtrlSetData($eGUITotalTroops[0], $txtNumBarbD)
	GUICtrlSetData($eGUITotalTroops[1], $txtNumArchD)
	GUICtrlSetData($eGUITotalTroops[3], $txtNumGoblD)

	GUICtrlSetData($btnCopyTroops, "Copied !")
	GUICtrlSetBkColor($btnCopyTroops, $COLOR_MONEYGREEN)
	Sleep(1000)
	GUICtrlSetData($btnCopyTroops, "Copy to Planner Tab")
	GUICtrlSetStyle($btnCopyTroops, $GUI_SS_DEFAULT_BUTTON)

EndFunc   ;==>copyTroops

Func copySpells()

	GUICtrlSetData($eGUITotalSpells[0], GUICtrlRead($txtNumLightningSpell))
	GUICtrlSetData($eGUITotalSpells[1], GUICtrlRead($txtNumHealSpell))
	GUICtrlSetData($eGUITotalSpells[2], GUICtrlRead($txtNumRageSpell))
	GUICtrlSetData($eGUITotalSpells[3], GUICtrlRead($txtNumJumpSpell))
	GUICtrlSetData($eGUITotalSpells[4], GUICtrlRead($txtNumFreezeSpell))
	GUICtrlSetData($eGUITotalSpells[5], GUICtrlRead($txtNumCloneSpell))

	GUICtrlSetData($dGUITotalSpells[0], GUICtrlRead($txtNumPoisonSpell))
	GUICtrlSetData($dGUITotalSpells[1], GUICtrlRead($txtNumEarthSpell))
	GUICtrlSetData($dGUITotalSpells[2], GUICtrlRead($txtNumHasteSpell))
	GUICtrlSetData($dGUITotalSpells[3], GUICtrlRead($txtNumSkeletonSpell))

	GUICtrlSetData($btnCopySpells, "Copied !")
	GUICtrlSetBkColor($btnCopySpells, $COLOR_MONEYGREEN)
	Sleep(1000)
	GUICtrlSetData($btnCopySpells, "Copy to Planner Tab")
	GUICtrlSetStyle($btnCopySpells, $GUI_SS_DEFAULT_BUTTON)

EndFunc   ;==>copySpells


; ================================================== CONFIG PART ================================================== ;

Func applyConfigPlanner()

	If $ichkeBarrack1Boost = 1 Then
		GUICtrlSetState($chkeBarrack1Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack1Boost, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack2Boost = 1 Then
		GUICtrlSetState($chkeBarrack2Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack2Boost, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack3Boost = 1 Then
		GUICtrlSetState($chkeBarrack3Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack3Boost, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack4Boost = 1 Then
		GUICtrlSetState($chkeBarrack4Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack4Boost, $GUI_UNCHECKED)
	EndIf
	If $ichkdBarrack1Boost = 1 Then
		GUICtrlSetState($chkdBarrack1Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdBarrack2Boost, $GUI_UNCHECKED)
	EndIf
	If $ichkdBarrack2Boost = 1 Then
		GUICtrlSetState($chkdBarrack2Boost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdBarrack2Boost, $GUI_UNCHECKED)
	EndIf

	If $ichkeBarrack1Use = 1 Then
		GUICtrlSetState($chkeBarrack1Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack1Use, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack2Use = 1 Then
		GUICtrlSetState($chkeBarrack2Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack2Use, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack3Use = 1 Then
		GUICtrlSetState($chkeBarrack3Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack3Use, $GUI_UNCHECKED)
	EndIf
	If $ichkeBarrack4Use = 1 Then
		GUICtrlSetState($chkeBarrack4Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeBarrack4Use, $GUI_UNCHECKED)
	EndIf
	If $ichkdBarrack1Use = 1 Then
		GUICtrlSetState($chkdBarrack1Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdBarrack1Use, $GUI_UNCHECKED)
	EndIf
	If $ichkdBarrack2Use = 1 Then
		GUICtrlSetState($chkdBarrack2Use, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdBarrack2Use, $GUI_UNCHECKED)
	EndIf

	If $ichkeFactoryBoost = 1 Then
		GUICtrlSetState($chkeFactoryBoost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkeFactoryBoost, $GUI_UNCHECKED)
	EndIf
	If $ichkdFactoryBoost = 1 Then
		GUICtrlSetState($chkdFactoryBoost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdFactoryBoost, $GUI_UNCHECKED)
	EndIf

	For $x = 0 To 11
		GUICtrlSetData($eGUITotalTroops[$x], $eTotalTroops[$x])
	Next
	For $x = 0 To 6
		GUICtrlSetData($dGUITotalTroops[$x], $dTotalTroops[$x])
	Next

	For $x = 0 To 3
		GUICtrlSetData($dGUITotalSpells[$x], $dTotalSpells[$x])
	Next

	For $x = 0 To 5
		GUICtrlSetData($eGUITotalSpells[$x], $eTotalSpells[$x])
	Next

	GUICtrlSetData($txtTotalCamp, IniRead($config, "planner", "TotalCamp", "200"))

	chkBarrackBoost()
	btnCalcTotals()

EndFunc   ;==>applyConfigPlanner

Func CloseLevels()

	GUICtrlSetData($btnValidateLevels, "Wait...")
	GUICtrlSetState($btnValidateLevels, $GUI_ENABLE)
	SaveGUILevels()
	GUIDelete($Form1)
	GUICtrlSetData($btnSetLevels, "Levels")
	GUICtrlSetState($btnSetLevels, $GUI_ENABLE)

EndFunc   ;==>CloseLevels

; ================================================== CALC PART ================================================== ;

Func btnCalcTotals()

	If $CanCalc = 1 Then

		GUICtrlSetState($btnCalcTotals, $GUI_DISABLE)
		GUICtrlSetData($btnCalcTotals, "Reset 1st")

		GUICtrlSetData($btnCopyTroops, "Reset Planner 1st")
		GUICtrlSetOnEvent($btnCopyTroops, "btnReset")
		GUICtrlSetData($btnCopySpells, "Reset Planner 1st")
		GUICtrlSetOnEvent($btnCopySpells, "btnReset")

		$CanCalc = 0

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[0]) - 1)
			ebtnAdd(20, 1, 0)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[1]) - 1)
			ebtnAdd(25, 1, 1)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[2]) - 1)
			ebtnAdd(120, 5, 2)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[3]) - 1)
			ebtnAdd(30, 1, 3)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[4]) - 1)
			ebtnAdd(60, 2, 4)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[5]) - 1)
			ebtnAdd(300, 5, 5)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[6]) - 1)
			ebtnAdd(300, 4, 6)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[7]) - 1)
			ebtnAdd(600, 14, 7)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[8]) - 1)
			ebtnAdd(900, 20, 8)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[9]) - 1)
			ebtnAdd(900, 25, 9)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[10]) - 1)
			ebtnAdd(600, 10, 10)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalTroops[11]) - 1)
			ebtnAdd(300, 5, 11)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[0]) - 1)
			dbtnAdd(45, 2, 0)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[1]) - 1)
			dbtnAdd(120, 5, 1)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[2]) - 1)
			dbtnAdd(300, 8, 2)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[3]) - 1)
			dbtnAdd(900, 30, 3)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[4]) - 1)
			dbtnAdd(600, 12, 4)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[5]) - 1)
			dbtnAdd(900, 30, 5)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalTroops[6]) - 1)
			dbtnAdd(300, 6, 6)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[0]) - 1)
			ebtnAddS(0)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[1]) - 1)
			ebtnAddS(1)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[2]) - 1)
			ebtnAddS(2)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[3]) - 1)
			ebtnAddS(3)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[4]) - 1)
			ebtnAddS(4)
		Next

		For $i = 0 To (GUICtrlRead($eGUITotalSpells[5]) - 1)
			ebtnAddS(5)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalSpells[0]) - 1)
			dbtnAddS(0)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalSpells[1]) - 1)
			dbtnAddS(1)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalSpells[2]) - 1)
			dbtnAddS(2)
		Next

		For $i = 0 To (GUICtrlRead($dGUITotalSpells[3]) - 1)
			dbtnAddS(3)
		Next

		$BarbTotCost = ($eBarracksContent[0][0] + $eBarracksContent[1][0] + $eBarracksContent[2][0] + $eBarracksContent[3][0]) * $BarbCost[$eLevelTroops[0]]
		$ArchTotCost = ($eBarracksContent[0][1] + $eBarracksContent[1][1] + $eBarracksContent[2][1] + $eBarracksContent[3][1]) * $ArchCost[$eLevelTroops[1]]
		$GiantTotCost = ($eBarracksContent[0][2] + $eBarracksContent[1][2] + $eBarracksContent[2][2] + $eBarracksContent[3][2]) * $GiantCost[$eLevelTroops[2]]
		$GoblinTotCost = ($eBarracksContent[0][3] + $eBarracksContent[1][3] + $eBarracksContent[2][3] + $eBarracksContent[3][3]) * $GoblCost[$eLevelTroops[3]]
		$WBTotCost = ($eBarracksContent[0][4] + $eBarracksContent[1][4] + $eBarracksContent[2][4] + $eBarracksContent[3][4]) * $WBCost[$eLevelTroops[4]]
		$BaloonTotCost = ($eBarracksContent[0][5] + $eBarracksContent[1][5] + $eBarracksContent[2][5] + $eBarracksContent[3][5]) * $BallCost[$eLevelTroops[5]]
		$WizardTotCost = ($eBarracksContent[0][6] + $eBarracksContent[1][6] + $eBarracksContent[2][6] + $eBarracksContent[3][6]) * $WizCost[$eLevelTroops[6]]
		$HealerTotCost = ($eBarracksContent[0][7] + $eBarracksContent[1][7] + $eBarracksContent[2][7] + $eBarracksContent[3][7]) * $HealCost[$eLevelTroops[7]]
		$DragonTotCost = ($eBarracksContent[0][8] + $eBarracksContent[1][8] + $eBarracksContent[2][8] + $eBarracksContent[3][8]) * $DragCost[$eLevelTroops[8]]
		$PekkaTotCost = ($eBarracksContent[0][9] + $eBarracksContent[1][9] + $eBarracksContent[2][9] + $eBarracksContent[3][9]) * $PekkaCost[$eLevelTroops[9]]
		$BabyTotCost = ($eBarracksContent[0][10] + $eBarracksContent[1][10] + $eBarracksContent[2][10] + $eBarracksContent[3][10]) * $BabyCost[$eLevelTroops[10]]
		$MinerTotCost = ($eBarracksContent[0][11] + $eBarracksContent[1][11] + $eBarracksContent[2][11] + $eBarracksContent[3][11]) * $MinerCost[$eLevelTroops[11]]
		$MinionTotCost = ($dBarracksContent[0][0] + $dBarracksContent[1][0]) * $MinionCost[$dLevelTroops[0]]
		$HogTotCost = ($dBarracksContent[0][1] + $dBarracksContent[1][1]) * $HogCost[$dLevelTroops[1]]
		$ValkyrieTotCost = ($dBarracksContent[0][2] + $dBarracksContent[1][2]) * $ValkyrieCost[$dLevelTroops[2]]
		$GolemTotCost = ($dBarracksContent[0][3] + $dBarracksContent[1][3]) * $GolemCost[$dLevelTroops[3]]
		$WitchTotCost = ($dBarracksContent[0][4] + $dBarracksContent[1][4]) * $WitchCost[$dLevelTroops[4]]
		$LavaTotCost = ($dBarracksContent[0][5] + $dBarracksContent[1][5]) * $LavaCost[$dLevelTroops[5]]
		$BowlerTotCost = ($dBarracksContent[0][6] + $dBarracksContent[1][6]) * $BowlerCost[$dLevelTroops[6]]

		$LightSpellTotCost = $eFactoryContent[0] * $LightCost[$eLevelSpells[0]]
		$HealSpellTotCost = $eFactoryContent[1] * $HealCost[$eLevelSpells[1]]
		$RageSpellTotCost = $eFactoryContent[2] * $RageCost[$eLevelSpells[2]]
		$JumpSpellTotCost = $eFactoryContent[3] * $JumpCost[$eLevelSpells[3]]
		$FreezeSpellTotCost = $eFactoryContent[4] * $FreezeCost[$eLevelSpells[4]]
		$CloneSpellTotCost = $eFactoryContent[5] * $CloneCost[$eLevelSpells[5]]
		$PoisonSpellTotCost = $dFactoryContent[0] * $PoisonCost[$dLevelSpells[0]]
		$EarthSpellTotCost = $dFactoryContent[1] * $EarthCost[$dLevelSpells[1]]
		$HasteSpellTotCost = $dFactoryContent[2] * $HasteCost[$dLevelSpells[2]]
		$SkelSpellTotCost = $dFactoryContent[3] * $SkelCost[$dLevelSpells[3]]

		GUICtrlSetData($lbleCost, " " & _NumberFormat($BarbTotCost + $ArchTotCost + $GiantTotCost + $GoblinTotCost + $WBTotCost + $BaloonTotCost + $WizardTotCost + $HealerTotCost + $DragonTotCost + $PekkaTotCost + $BabyTotCost + $MinerTotCost + $LightSpellTotCost + $HealSpellTotCost + $RageSpellTotCost + $JumpSpellTotCost + $FreezeSpellTotCost + $CloneSpellTotCost))
		GUICtrlSetData($lbldCost, " " & _NumberFormat($MinionTotCost + $HogTotCost + $ValkyrieTotCost + $GolemTotCost + $WitchTotCost + $LavaTotCost + $BowlerTotCost + $PoisonSpellTotCost + $EarthSpellTotCost + $HasteSpellTotCost + $SkelSpellTotCost))

		calcDuration()

	EndIf

EndFunc   ;==>btnCalcTotals

Func calcDuration()

	If $eBarrack1Duration = 999999999999 Then
		$eBarrack1DurationC = 0
	Else
		$eBarrack1DurationC = $eBarrack1Duration
	EndIf

	If $eBarrack2Duration = 999999999999 Then
		$eBarrack2DurationC = 0
	Else
		$eBarrack2DurationC = $eBarrack2Duration
	EndIf

	If $eBarrack3Duration = 999999999999 Then
		$eBarrack3DurationC = 0
	Else
		$eBarrack3DurationC = $eBarrack3Duration
	EndIf

	If $eBarrack4Duration = 999999999999 Then
		$eBarrack4DurationC = 0
	Else
		$eBarrack4DurationC = $eBarrack4Duration
	EndIf

	If $dBarrack1Duration = 999999999999 Then
		$dBarrack1DurationC = 0
	Else
		$dBarrack1DurationC = $dBarrack1Duration
	EndIf

	If $dBarrack2Duration = 999999999999 Then
		$dBarrack2DurationC = 0
	Else
		$dBarrack2DurationC = $dBarrack2Duration
	EndIf

	Local $arrayDuration[8] = [$eBarrack1DurationC, $eBarrack2DurationC, $eBarrack3DurationC, $eBarrack4DurationC, $dBarrack1DurationC, $dBarrack2DurationC, $eFactoryDuration, $dFactoryDuration]

	$totalDuration = _ArrayMax($arrayDuration)

	If $totalDuration >= 3600 Then
		$HourDuration = Int($totalDuration / 3600)
		$MinDuration = Int(($totalDuration - $HourDuration * 3600) / 60)
		$SecDuration = $totalDuration - $HourDuration * 3600 - $MinDuration * 60
		GUICtrlSetData($lblTotalDuration, " " & $HourDuration & "h " & $MinDuration & "m " & $SecDuration & "s")
	ElseIf $totalDuration < 3600 And $totalDuration >= 60 Then
		$MinDuration = Int(($totalDuration - $HourDuration * 3600) / 60)
		$SecDuration = $totalDuration - $HourDuration * 3600 - $MinDuration * 60
		GUICtrlSetData($lblTotalDuration, " " & $MinDuration & "m " & $SecDuration & "s")
	Else
		$SecDuration = $totalDuration
		GUICtrlSetData($lblTotalDuration, " " & $SecDuration & "s")
	EndIf

EndFunc   ;==>calcDuration
