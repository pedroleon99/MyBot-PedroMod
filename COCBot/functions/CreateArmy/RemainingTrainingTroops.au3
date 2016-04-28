; #FUNCTION# ====================================================================================================================
; Name ..........: RemainTimetroops
; Description ...: Function to close the CoC when the troops & Spells are Training
; Syntax ........: None
; Parameters ....: None
; Return values .: None
; Author ........: ProMac (04-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func RemainTimetroops()

	;Local $iRemainTimeTroops = Random(Number(GUICtrlRead($txtRemainTrain)) - 3, Number(GUICtrlRead($txtRemainTrain)) + 5, 1)

	If GUICtrlRead($chkRemainTrain) = $GUI_UNCHECKED and GUICtrlRead($chkRemainNight)= $GUI_UNCHECKED Then Return

	Local $Hour = @HOUR
	Local $weekup = Random(8, 9, 1)
	Local $Sleeping = Random(0, 1, 1)

	If $Hour >= $Sleeping And $Hour < $weekup and GUICtrlRead($chkRemainNight)= $GUI_CHECKED Then
		SetLog("The Truth About Beauty Sleep!!!")

		Local $Waiting = ($weekup - $Hour) * 60 * 60 * 1000

		CloseBotRemainTime($Waiting)
		$RandomTimer = true
		$FirstStart = true
		RandomAttack()
	Else
		If GUICtrlRead($chkRemainTrain) = $GUI_UNCHECKED Then Return

		Local $iRemainTimeTroops = getRemainingTraining(True, False) ; return the time in minutes

		; if the Remaining time is less then 2 minutes better continuing the routines on bot
		If $iRemainTimeTroops < 2 then return

		; random additional time from 10 minute to 20 minutes
		$iRemainTimeTroops += Random(10, 20, 1)

		$iRemainTimeTroops = $iRemainTimeTroops * 60 * 1000
		CloseBotRemainTime($iRemainTimeTroops)

	EndIf
EndFunc   ;==>RemainTimetroops

Func CloseBotRemainTime($Remaintime) ; in ms

	; Find and wait for the confirmation of exit "okay" button
	Local $i = 0
	While 1
		checkObstacles()
		BS1BackButton()
		If _Sleep($iDelayAttackDisable1000) Then Return ; wait for window to open
		If ClickOkay("ExitCoCokay", True) = True Then ExitLoop ; Confirm okay to exit
		If $i > 10 Then
			Setlog("Can not find Okay button to exit CoC, Forcefully Closing CoC", $COLOR_RED)
			If $debugImageSave = 1 Then DebugImageSave("CheckAttackDisableFailedButtonCheck_")
			CloseCoC()
			ExitLoop
		EndIf
		$i += 1
	WEnd

	; short wait for CoC to exit
	If _Sleep(1500) Then Return

	; Pushbullet Msg
	PushMsg("TakeBreak")

	; Log off CoC for user set time in troops tab
	WaitnOpenCoC($Remaintime, True)

EndFunc
