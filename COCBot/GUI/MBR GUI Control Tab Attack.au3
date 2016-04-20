; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015), LunaEclipse (April, 2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func chkDBSmartAttackRedArea()
    Switch _GUICtrlComboBox_GetCurSel($cmbDBDeploy)
		Case $eMultiFinger, $eSmartSave
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_HIDE)			
			GUICtrlSetState($lblDBMultiFinger, $GUI_SHOW)
			GUICtrlSetState($cmbDBMultiFinger, $GUI_SHOW)
		Case Else
			GUICtrlSetState($lblDBMultiFinger, $GUI_HIDE)
			GUICtrlSetState($cmbDBMultiFinger, $GUI_HIDE)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_SHOW)
	EndSwitch

	If _GUICtrlComboBox_GetCurSel($cmbDBDeploy) <> $eMultiFinger Then
		$iChkRedArea[$DB] = 1
		
		If _GUICtrlComboBox_GetCurSel($cmbDBDeploy) <> $eSmartSave Then
			GUICtrlSetState($lblDBSmartDeploy, $GUI_SHOW)
			GUICtrlSetState($cmbDBSmartDeploy, $GUI_SHOW)
		Else
			GUICtrlSetState($lblDBSmartDeploy, $GUI_HIDE)
			GUICtrlSetState($cmbDBSmartDeploy, $GUI_HIDE)
		EndIf
				
		For $i = $chkDBAttackNearGoldMine To $picDBAttackNearDarkElixirDrill
			GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$iChkRedArea[$DB] = 0		
		For $i = $lblDBSmartDeploy To $picDBAttackNearDarkElixirDrill
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkDBSmartAttackRedArea

Func cmbDBMultiFinger()
	$iMultiFingerStyle[$DB] = _GUICtrlComboBox_GetCurSel($cmbDBMultiFinger)
EndFunc   ;==>cmbDBMultiFinger

Func chkABSmartAttackRedArea()
	chkDESideEB()
 	Switch _GUICtrlComboBox_GetCurSel($cmbABDeploy)
		Case $eMultiFinger
			GUICtrlSetState($btnMilkingOptions, $GUI_HIDE)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_HIDE)
			GUICtrlSetState($lblABMultiFinger, $GUI_SHOW)
			GUICtrlSetState($cmbABMultiFinger, $GUI_SHOW)
		Case $eCustomDeploy
			GUICtrlSetState($btnMilkingOptions, $GUI_HIDE)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_HIDE)
			GUICtrlSetState($lblABMultiFinger, $GUI_HIDE)
			GUICtrlSetState($cmbABMultiFinger, $GUI_HIDE)

			For $i = 0 to $DEPLOY_MAX_WAVES - 1
				GUICtrlSetState($ctrlDeploy[$i][1], $GUI_ENABLE)
				GUICtrlSetState($ctrlDeploy[$i][2], $GUI_ENABLE)
			Next
		Case $eMilking
			GUICtrlSetState($btnMilkingOptions, $GUI_SHOW)
			GUICtrlSetState($lblABMultiFinger, $GUI_HIDE)
			GUICtrlSetState($cmbABMultiFinger, $GUI_HIDE)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_SHOW)			
		Case Else
			GUICtrlSetState($btnMilkingOptions, $GUI_HIDE)
			GUICtrlSetState($lblABMultiFinger, $GUI_HIDE)
			GUICtrlSetState($cmbABMultiFinger, $GUI_HIDE)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_SHOW)			
	EndSwitch

	If GUICtrlRead($chkABSmartAttackRedArea) = $GUI_CHECKED Then
		$iChkRedArea[$LB] = 1
		For $i = $lblABSmartDeploy To $picABAttackNearDarkElixirDrill
			GUICtrlSetState($i, $GUI_SHOW)
		 Next
     Else
		$iChkRedArea[$LB] = 0
		For $i = $lblABSmartDeploy To $picABAttackNearDarkElixirDrill
			GUICtrlSetState($i, $GUI_HIDE)
		 Next
	EndIf
EndFunc  ;==>chkABSmartAttackRedArea

Func cmbABMultiFinger()
	$iMultiFingerStyle[$LB] = _GUICtrlComboBox_GetCurSel($cmbABMultiFinger)
EndFunc   ;==>cmbDBMultiFinger

Func chkBalanceDR()
	If GUICtrlRead($chkUseCCBalanced) = $GUI_CHECKED Then
		GUICtrlSetState($cmbCCDonated, $GUI_ENABLE)
		GUICtrlSetState($cmbCCReceived, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbCCDonated, $GUI_DISABLE)
		GUICtrlSetState($cmbCCReceived, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBalanceDR

Func cmbBalanceDR()
	If _GUICtrlComboBox_GetCurSel($cmbCCDonated) = _GUICtrlComboBox_GetCurSel($cmbCCReceived) Then
		_GUICtrlComboBox_SetCurSel($cmbCCDonated, 0)
		_GUICtrlComboBox_SetCurSel($cmbCCReceived, 0)
	EndIf
EndFunc   ;==>cmbBalanceDR

Func chkDBRandomSpeedAtk()
	If GUICtrlRead($chkDBRandomSpeedAtk) = $GUI_CHECKED Then
		;$iChkDBRandomSpeedAtk = 1
		GUICtrlSetState($cmbDBUnitDelay, $GUI_DISABLE)
		GUICtrlSetState($cmbDBWaveDelay, $GUI_DISABLE)
	Else
		;$iChkDBRandomSpeedAtk = 0
		GUICtrlSetState($cmbDBUnitDelay, $GUI_ENABLE)
		GUICtrlSetState($cmbDBWaveDelay, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkDBRandomSpeedAtk

Func chkABRandomSpeedAtk()
	If GUICtrlRead($chkABRandomSpeedAtk) = $GUI_CHECKED Then
		;$iChkABRandomSpeedAtk = 1
		GUICtrlSetState($cmbABUnitDelay, $GUI_DISABLE)
		GUICtrlSetState($cmbABWaveDelay, $GUI_DISABLE)
	Else
		;$iChkABRandomSpeedAtk = 0
		GUICtrlSetState($cmbABUnitDelay, $GUI_ENABLE)
		GUICtrlSetState($cmbABWaveDelay, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkABRandomSpeedAtk

Func btnMilkingOptions()
	OpenGUIMilk2()
EndFunc   ;==>btnMilkingOptions

Func cmbABDeploy()
	chkDESideEB()
	If _GUICtrlComboBox_GetCurSel($cmbABDeploy) = $eMilking Then
		GUICtrlSetState($btnMilkingOptions, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnMilkingOptions, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABRandomSpeedAtk

Func chkDBHeroWait()
	If GUICtrlRead($chkDBKingWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeKing) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkDBKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeKing) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBKingWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkDBKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf

	If GUICtrlRead($chkDBQueenWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeQueen) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkDBQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeQueen) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBQueenWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkDBQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf

	If GUICtrlRead($chkDBWardenWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeWarden) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBWardenAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkDBWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeWarden) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkDBWardenWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkDBWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf
EndFunc   ;==>cmbABDeploy

Func chkABHeroWait()
	If GUICtrlRead($chkABKingWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeKing) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkABKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeKing) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABKingWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkABKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf

	If GUICtrlRead($chkABQueenWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeQueen) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkABQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeQueen) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABQueenWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkABQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf

	If GUICtrlRead($chkABWardenWait) = $GUI_CHECKED Then
		If GUICtrlRead($chkUpgradeWarden) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABWardenAttack, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkABWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	Else
		If GUICtrlRead($chkUpgradeWarden) = $GUI_UNCHECKED Then
			GUICtrlSetState($chkABWardenWait, $GUI_ENABLE)
		Else
			GUICtrlSetState($chkABWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		EndIf
	EndIf
EndFunc   ;==>chkABHeroWait