; #FUNCTION# ====================================================================================================================
; Name ..........: GUIControl
; Description ...: This file contains all functions of GUIControl of the @RoroTiti's MOD
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func chkBarrackSpell()
	If GUICtrlRead($chkBarrackSpell) = $GUI_CHECKED Then
		For $i = $grpBrewInAdvance To $lblSkeletonIcon2
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		GUICtrlSetData($txtNumPoisonSpell, $iPoisonSpellComp)
		GUICtrlSetData($txtNumEarthSpell, $iEarthSpellComp)
		GUICtrlSetData($txtNumHasteSpell, $iHasteSpellComp)

	ElseIf GUICtrlRead($chkBarrackSpell) = $GUI_UNCHECKED Then
		For $i = $grpBrewInAdvance To $lblSkeletonIcon2
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $chkBrewInAdvanceLightningSpell To $chkBrewInAdvanceSkeletonSpell
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
		For $i = $lblTotalSpell To $lblTimesSkeletonS
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
	EndIf
EndFunc   ;==>chkBarrackSpell

Func chkBrewInAdvanceLightningSpell()
	If GUICtrlRead($chkBrewInAdvanceLightningSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 10)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceLightningSpell

Func chkBrewInAdvanceHealSpell()
	If GUICtrlRead($chkBrewInAdvanceHealSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 10)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceHealSpell

Func chkBrewInAdvanceRageSpell()
	If GUICtrlRead($chkBrewInAdvanceRageSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 10)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceRageSpell

Func chkBrewInAdvanceJumpSpell()
	If GUICtrlRead($chkBrewInAdvanceJumpSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 10)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceJumpSpell

Func chkBrewInAdvanceFreezeSpell()
	If GUICtrlRead($chkBrewInAdvanceFreezeSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 10)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceFreezeSpell

Func chkBrewInAdvanceCloneSpell()
	If GUICtrlRead($chkBrewInAdvanceCloneSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 10)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceCloneSpell

Func chkBrewInAdvancePoisonSpell()
	If GUICtrlRead($chkBrewInAdvancePoisonSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 10 * 2)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvancePoisonSpell

Func chkBrewInAdvanceEarthSpell()
	If GUICtrlRead($chkBrewInAdvanceEarthSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumEarthSpell, 10 * 2)
		GUICtrlSetState($txtNumEarthSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceEarthSpell

Func chkBrewInAdvanceHasteSpell()
	If GUICtrlRead($chkBrewInAdvanceHasteSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHasteSpell, 10 * 2)
		GUICtrlSetState($txtNumHasteSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 0)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceHasteSpell

Func chkBrewInAdvanceSkeletonSpell()
	If GUICtrlRead($chkBrewInAdvanceSkeletonSpell) = $GUI_CHECKED Then
		GUICtrlSetData($txtNumLightningSpell, 0)
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHealSpell, 0)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumRageSpell, 0)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumJumpSpell, 0)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumFreezeSpell, 0)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumCloneSpell, 0)
		GUICtrlSetState($txtNumCloneSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumPoisonSpell, 0)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumEarthSpell, 0)
		GUICtrlSetState($txtNumEarthSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumHasteSpell, 0)
		GUICtrlSetState($txtNumHasteSpell, $GUI_DISABLE)
		GUICtrlSetData($txtNumSkeletonSpell, 10 * 2)
		GUICtrlSetState($txtNumSkeletonSpell, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBrewInAdvanceSkeletonSpell

Func setupProfileComboBoxswitch()
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBoxswitch

Func chkCoCStats()
	If GUICtrlRead($chkCoCStats) = $GUI_CHECKED Then
		$ichkCoCStats = 1
		GUICtrlSetState($txtAPIKey, $GUI_ENABLE)
	Else
		$ichkCoCStats = 0
		GUICtrlSetState($txtAPIKey, $GUI_DISABLE)
	EndIf
	IniWrite($config, "Stats", "chkCoCStats", $ichkCoCStats)
EndFunc   ;==>chkCoCStats
