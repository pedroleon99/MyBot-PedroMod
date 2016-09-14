; #FUNCTION# ====================================================================================================================
; Name ..........: TreasuryCollect
; Description ...: This file contains all functions of TreasuryCollect feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: Moebius14
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func chkCollectTresory()
	If GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		For $i = $leurequisertarienTresor To $btnResetDE
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		If GUICtrlRead($chkCollectTresoryGold) = $GUI_UNCHECKED Then
			GUICtrlSetState($btnResetOR, $GUI_DISABLE)
			GUICtrlSetState($btnResetEL, $GUI_DISABLE)
			GUICtrlSetState($btnResetDE, $GUI_DISABLE)
		EndIf
		$ichkCollectTresory = 1
	Else
		For $i = $leurequisertarienTresor To $btnResetDE
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkCollectTresory = 0
	EndIf
EndFunc   ;==>chkCollectTresory

Func chkCollectTresoryGold()
	If GUICtrlRead($chkCollectTresoryGold) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryGold, $GUI_ENABLE)
		GUICtrlSetState($btnResetOR, $GUI_ENABLE)
	ElseIf GUICtrlRead($chkCollectTresoryGold) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_UNCHECKED Then
		GUICtrlSetState($txtTreasuryGold, $GUI_DISABLE)
		GUICtrlSetState($btnResetOR, $GUI_DISABLE)
	ElseIf GUICtrlRead($chkCollectTresoryGold) = $GUI_UNCHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryGold, $GUI_DISABLE)
		GUICtrlSetState($btnResetOR, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkCollectTresoryGold

Func ResetOr()
	Global $ResetOR = 0
	GUICtrlSetData($txtTreasuryGold, $ResetOR)
	$itxtTreasuryGold = GUICtrlRead($txtTreasuryGold)
EndFunc   ;==>ResetOr

Func chkCollectTresoryElixir()
	If GUICtrlRead($chkCollectTresoryElixir) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryElixir, $GUI_ENABLE)
		GUICtrlSetState($btnResetEL, $GUI_ENABLE)
	ElseIf GUICtrlRead($chkCollectTresoryElixir) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_UNCHECKED Then
		GUICtrlSetState($txtTreasuryElixir, $GUI_DISABLE)
		GUICtrlSetState($btnResetEL, $GUI_DISABLE)
	ElseIf GUICtrlRead($chkCollectTresoryElixir) = $GUI_UNCHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryElixir, $GUI_DISABLE)
		GUICtrlSetState($btnResetEL, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkCollectTresoryElixir

Func ResetEL()
	Global $ResetEL = 0
	GUICtrlSetData($txtTreasuryElixir, $ResetEL)
	$itxtTreasuryElixir = GUICtrlRead($txtTreasuryElixir)
EndFunc   ;==>ResetEL

Func chkCollectTresoryDark()
	If GUICtrlRead($chkCollectTresoryDark) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryDark, $GUI_ENABLE)
		GUICtrlSetState($btnResetDE, $GUI_ENABLE)
	ElseIf GUICtrlRead($chkCollectTresoryDark) = $GUI_CHECKED And GUICtrlRead($chkCollectTresory) = $GUI_UNCHECKED Then
		GUICtrlSetState($txtTreasuryDark, $GUI_DISABLE)
		GUICtrlSetState($btnResetDE, $GUI_DISABLE)
	ElseIf GUICtrlRead($chkCollectTresoryDark) = $GUI_UNCHECKED And GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		GUICtrlSetState($txtTreasuryDark, $GUI_DISABLE)
		GUICtrlSetState($btnResetDE, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkCollectTresoryDark

Func ResetDE()
	Global $ResetDE = 0
	GUICtrlSetData($txtTreasuryDark, $ResetDE)
	$itxtTreasuryDark = GUICtrlRead($txtTreasuryDark)
EndFunc   ;==>ResetDE
