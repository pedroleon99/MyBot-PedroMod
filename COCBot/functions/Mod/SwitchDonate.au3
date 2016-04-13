; #FUNCTION# ====================================================================================================================
; Name ..........: Switch Account And Donate
; Description ...:
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........:
; Modified ......: Lakereng (2016) And Extreme DE Side MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SwitchDonate()
		;..............Switch Account & Donate Then Switch Back...................
	If $ichkSwitchDonate = 1 Then
		SetLog("Switching account For Donate", $COLOR_blue)
		DetectAccount()
		If $sCurrProfile = "[01] Main" Then
			SwitchSecond()
			$RunState = True
			While 1
				Collect()
				Train()
				DonateCC()
				RequestCC()
				ExitLoop
			WEnd
			SwitchMain()
		ElseIf $sCurrProfile = "[02] Second" Then
			If $iAccount = "3" Or $iAccount = "4" Then
				SwitchThird()
			Else
				SwitchMain()
			EndIf
			$RunState = True
			While 1
				Train()
				DonateCC()
				RequestCC()
				ExitLoop
			WEnd
			SwitchSecond()
		ElseIf $sCurrProfile = "[03] Third" Then
			If $iAccount = "4" Then
				SwitchFourth()
			ElseIf $iAccount = "3" Then
				SwitchMain()
			EndIf
			$RunState = True
			While 1
				Train()
				DonateCC()
				RequestCC()
				ExitLoop
			WEnd
			SwitchThird()
		ElseIf $sCurrProfile = "[04] Fourth" Then
			$RunState = True
			SwitchMain()
			While 1
				Train()
				DonateCC()
				RequestCC()
				ExitLoop
			WEnd
			SwitchFourth()
		EndIf
		If _Sleep(1000) Then Return
	EndIf

  EndFunc
