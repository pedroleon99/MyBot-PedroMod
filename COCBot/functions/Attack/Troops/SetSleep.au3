; #FUNCTION# ====================================================================================================================
; Name ..........: SetSleep
; Description ...: Randomizes deployment wait time
; Syntax ........: SetSleep($type)
; Parameters ....: $type                - Flag for type return desired.
; Return values .: None
; Author ........:
; Modified ......: KnowJack (June2015), LunaEclipse(April, 2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func SetSleep($type)
	If IsKeepClicksActive() = True Or ($iMatchMode = $DB And $iChkDeploySettings[$iMatchMode] = $eSmartSave And $usingMultiFinger = True) Then Return 0 ; Fast Bulk Deploy

    Local $factor0 = 10
	Local $factor1 = 100

	If $AndroidAdbClick = True Then
	   ; adjust for slow ADB clicks the delay factor
	   $factor0 = 10
	   $factor1 = 100
    EndIf
	Local $temp[8] = [1, 5, 10, 11, 12, 13, 14, 15]
	Local $temp1[4] = [5, 10 , 20 , 25]
	Switch $type
		Case 0
			If $iChkRandomspeedatk[$iMatchMode] = 1 Then
				Return $temp[Random(0, 7, 1)] * $factor0 ; random deploying click [10ms to 200ms]
			Else
				Return ($iCmbUnitDelay[$iMatchMode]) * $factor0
			EndIf
		Case 1
			If $iChkRandomspeedatk[$iMatchMode] = 1 Then
				Return $temp1[Random(0, 3, 1)] * $factor1 ; random delay between waves [500ms to 2500ms]
			Else
				Return ($iCmbWaveDelay[$iMatchMode]) * $factor1
			EndIf
	EndSwitch
EndFunc   ;==>SetSleep

; #FUNCTION# ====================================================================================================================
; Name ..........: _SleepAttack
; Description ...: Version of _Sleep() used in attack code so active keep clicks mode doesn't slow down bulk deploy
; Syntax ........: see _Sleep
; Parameters ....: see _Sleep
; Return values .: see _Sleep
; Author ........: cosote (2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func _SleepAttack($iDelay, $iSleep = True)
   If $RunState = False Then
	  ResumeAndroid()
	  Return True
   EndIf
   If IsKeepClicksActive() = True Then Return False
   Return _Sleep($iDelay, $iSleep)
EndFunc
