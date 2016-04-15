; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Tab MOD
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func chkSmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		$ichkSmartZap = 1
	Else
		GUICtrlSetState($chkSmartZapDB, $GUI_DISABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_DISABLE)
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		$ichkSmartZap = 0
	EndIf
 EndFunc   ;==>chkSmartLightSpell

Func chkSmartZapDB()
	If GUICtrlRead($chkSmartZapDB) = $GUI_CHECKED Then
		$ichkSmartZapDB = 1
	Else
		$ichkSmartZapDB = 0
	EndIf
 EndFunc   ;==>chkSmartZapDB

Func chkSmartZapSaveHeroes()
	If GUICtrlRead($chkSmartZapSaveHeroes) = $GUI_CHECKED Then
		$ichkSmartZapSaveHeroes = 1
	Else
		$ichkSmartZapSaveHeroes = 0
	EndIf
 EndFunc   ;==>chkSmartZapSaveHeroes

Func txtMinDark()
	$itxtMinDE = GUICtrlRead($txtMinDark)
EndFunc   ;==>txtMinDark

Func chkChangeFF()
	If GUICtrlRead($chkChangeFF) = $GUI_CHECKED Then
		$useFFBarchST = 1
	Else
		$useFFBarchST = 0
	EndIf
 EndFunc   ;==>chkChangeFF

Func txtPercentCollectors()
	$percentCollectors = GUICtrlRead($txtPercentCollectors)
EndFunc   ;==>txtPercentCollectors

Func txtDistance()
	$redlineDistance = GUICtrlRead($txtDistance)
EndFunc   ;==>txtDistance

Func chkFastADBClicks()
	If GUICtrlRead($chkFastADBClicks) = $GUI_CHECKED Then
		$AndroidAdbClicksEnabled = True
	Else
		$AndroidAdbClicksEnabled = False
	EndIf
EndFunc   ;==>chkFastADBClicks

;MBR GUI_MOD CONTROLS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func SwitchAndDonate()
	If GUICtrlRead($chkSwitchDonate) = $GUI_CHECKED Then
		$ichkSwitchDonate = 1
	Else
		$ichkSwitchDonate = 0
	EndIf
EndFunc   ;==>SwitchAndDonate


Func MultiFarming()
	If GUICtrlRead($chkMultyFarming) = $GUI_CHECKED Then
		$ichkMultyFarming = 1
		GUICtrlSetState($Account, $GUI_ENABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_ENABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
			GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
		EndIf
	Else
		$ichkMultyFarming = 0
		GUICtrlSetState($Account, $GUI_DISABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_DISABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
	EndIf
EndFunc   ;==>MultiFarming

Func Account()
	$iAccount = GUICtrlRead($Account)
	IniWrite($config, "MOD", "Account", $iAccount)
EndFunc


	; Android Settings
Func setupAndroidComboBox()
	Local $androidString = ""
	Local $aAndroid = getInstalledEmulators()

	; Convert the array into a string
	$androidString = _ArrayToString($aAndroid, "|")

	; Set the new data of valid Emulators
	GUICtrlSetData($cmbAndroid, $androidString, $aAndroid[0])
EndFunc   ;==>setupAndroidComboBox

Func cmbAndroid()
	$sAndroid = GUICtrlRead($cmbAndroid)
	modifyAndroid()
EndFunc   ;==>cmbAndroid

Func txtAndroidInstance()
	$sAndroidInstance = GUICtrlRead($txtAndroidInstance)
	modifyAndroid()
EndFunc   ;==>$txtAndroidInstance

Func HideTaskbar()
	If GUICtrlRead($chkHideTaskBar) = $GUI_CHECKED Then
		$ichkHideTaskBar = 1
	Else
		$ichkHideTaskBar = 0
	EndIf
EndFunc   ;==>HideTaskbar