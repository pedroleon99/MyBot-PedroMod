; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: AwesomeGamer (2016)
; Modified ......: Moebius14 06/2016
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
; Forecast Tab
;~ -------------------------------------------------------------
Func chkForecastPause()
	If GUICtrlRead($chkForecastPause) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastPause, False)
		GUICtrlSetState($txtForecastPause, $GUI_ENABLE)
		GUICtrlSetState($chkDontRemoveredzone, $GUI_ENABLE)
		GUICtrlSetState($chkDontRemoveredzone, $GUI_CHECKED)
		$iChkForecastPause = 1

	Else
		_GUICtrlEdit_SetReadOnly($txtForecastPause, True)
		GUICtrlSetState($txtForecastPause, $GUI_DISABLE)
		GUICtrlSetState($chkDontRemoveredzone, $GUI_DISABLE)
		GUICtrlSetState($chkDontRemoveredzone, $GUI_UNCHECKED)
		$iChkForecastPause = 0
	EndIf
EndFunc   ;==>chkForecastPause

Func chkForecastBoost()
	If GUICtrlRead($chkForecastBoost) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastBoost, False)
		GUICtrlSetState($txtForecastBoost, $GUI_ENABLE)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastBoost, True)
		GUICtrlSetState($txtForecastBoost, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkForecastBoost

Func chkForecastHopingSwitchMax()
	If GUICtrlRead($chkForecastHopingSwitchMax) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMax, False)
		GUICtrlSetState($txtForecastHopingSwitchMax, $GUI_ENABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMax, $GUI_ENABLE)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMax, True)
		GUICtrlSetState($txtForecastHopingSwitchMax, $GUI_DISABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMax, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkForecastHopingSwitchMax

Func chkForecastHopingSwitchMin()
	If GUICtrlRead($chkForecastHopingSwitchMin) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMin, False)
		GUICtrlSetState($txtForecastHopingSwitchMin, $GUI_ENABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMin, $GUI_ENABLE)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMin, True)
		GUICtrlSetState($txtForecastHopingSwitchMin, $GUI_DISABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMin, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkForecastHopingSwitchMin

Func _RoundDown($nVar, $iCount)
	Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc   ;==>_RoundDown

Func readCurrentForecast()

	If $ichkEnableForecastReading = 1 Then

		Local $return = getCurrentForecast()
		If $return > 0 Then Return $return

		Local $line = ""
		Local $filename = @ScriptDir & "\COCBot\Forecast\forecast.mht"

		;	SetLog("Consultation de la météo...", $COLOR_BLUE)

		_INetGetMHT("http://clashofclansforecaster.com", $filename)

		Local $file = FileOpen($filename, 0)
		If $file = -1 Then
			SetLog("     Error reading forecast !", $COLOR_RED)
			Return False
		EndIf

		ReDim $dtStamps[0]
		ReDim $lootMinutes[0]
		While 1
			$line = FileReadLine($file)
			If @error <> 0 Then ExitLoop
			If StringCompare(StringLeft($line, StringLen("<script language=""javascript"">var militaryTime")), "<script language=""javascript"">var militaryTime") = 0 Then
				Local $pos1
				Local $pos2
				$pos1 = StringInStr($line, "minuteNow")
				If $pos1 > 0 Then
					$pos1 = StringInStr($line, ":", 0, 1, $pos1 + 1)
					If $pos1 > 0 Then
						$pos2 = StringInStr($line, ",", 9, 1, $pos1 + 1)
						Local $minuteNowString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
						$timeOffset = Int($minuteNowString) - nowTicksUTC()
						;					SetLog("     timeOffset: " & $timeOffset, $COLOR_BLUE)
					EndIf
				EndIf

				$pos1 = StringInStr($line, "dtStamps")
				If $pos1 > 0 Then
					$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
					If $pos1 > 0 Then
						$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
						Local $dtStampsString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
						$dtStamps = StringSplit($dtStampsString, ",", 2)
					EndIf
				EndIf

				$pos1 = StringInStr($line, "lootMinutes", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
					If $pos1 > 0 Then
						$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
						Local $minuteString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
						$lootMinutes = StringSplit($minuteString, ",", 2)
					EndIf
				EndIf

				$pos1 = StringInStr($line, "lootIndexScaleMarkers", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
					If $pos1 > 0 Then
						$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
						Local $lootIndexScaleMarkersString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
						$lootIndexScaleMarkers = StringSplit($lootIndexScaleMarkersString, ",", 2)
					EndIf
				EndIf
				ExitLoop
			EndIf
		WEnd
		FileClose($file)

		;	SetLog("     Processed " & UBound($lootMinutes) & " loot minutes.", $COLOR_BLUE)

		$return = getCurrentForecast()
		If $return = 0 Then
			SetLog("Error reading forecast.")
		EndIf
		Return $return

	Else
		Return
	EndIf

EndFunc   ;==>readCurrentForecast

Func _INetGetMHT($url, $file)
	Local $msg = ObjCreate("CDO.Message")
	If @error Then Return False
	Local $ado = ObjCreate("ADODB.Stream")
	If @error Then Return False
	Local $conf = ObjCreate("CDO.Configuration")
	If @error Then Return False

	With $ado
		.Type = 2
		.Charset = "US-ASCII"
		.Open
	EndWith

	Local $flds = $conf.Fields
	$flds.Item("http://schemas.microsoft.com/cdo/configuration/urlgetlatestversion") = True
	$flds.Update()
	$msg.Configuration = $conf
	$msg.CreateMHTMLBody($url, 31)
	$msg.DataSource.SaveToObject($ado, "_Stream")
	FileDelete($file)
	$ado.SaveToFile($file, 1)
	$msg = ""
	$ado = ""
	Return True
EndFunc   ;==>_INetGetMHT

Func getCurrentForecast()
	Local $return = 0
	Local $nowTicks = nowTicksUTC() + $timeOffset
	If UBound($dtStamps) > 0 And UBound($lootMinutes) > 0 And UBound($dtStamps) = UBound($lootMinutes) Then
		If $nowTicks >= Int($dtStamps[0]) And $nowTicks <= Int($dtStamps[UBound($dtStamps) - 1]) Then
			Local $i
			For $i = 0 To UBound($dtStamps) - 1
				If $nowTicks >= Int($dtStamps[$i]) Then
					$return = Int($lootMinutes[$i])
				Else
					ExitLoop
				EndIf
			Next
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf

	Return CalculateIndex($return)
EndFunc   ;==>getCurrentForecast

Func CalculateIndex($minutes)
	Local $index = 0
	Local $iRound1 = 0
	Local $index25 = 2.5
	Local $index4 = 4
	Local $index6 = 6
	Local $index8 = 8

	If $minutes < $lootIndexScaleMarkers[0] Then
		$index = $minutes / $lootIndexScaleMarkers[0]
	ElseIf $minutes < $lootIndexScaleMarkers[1] Then
		$index = (($minutes - $lootIndexScaleMarkers[0]) / ($lootIndexScaleMarkers[1] - $lootIndexScaleMarkers[0])) + 1
	ElseIf $minutes < $lootIndexScaleMarkers[2] Then
		$index = (($minutes - $lootIndexScaleMarkers[1]) / ($lootIndexScaleMarkers[2] - $lootIndexScaleMarkers[1])) + 2
	ElseIf $minutes < $lootIndexScaleMarkers[3] Then
		$index = (($minutes - $lootIndexScaleMarkers[2]) / ($lootIndexScaleMarkers[3] - $lootIndexScaleMarkers[2])) + 3
	ElseIf $minutes < $lootIndexScaleMarkers[4] Then
		$index = (($minutes - $lootIndexScaleMarkers[3]) / ($lootIndexScaleMarkers[4] - $lootIndexScaleMarkers[3])) + 4
	ElseIf $minutes < $lootIndexScaleMarkers[5] Then
		$index = (($minutes - $lootIndexScaleMarkers[4]) / ($lootIndexScaleMarkers[5] - $lootIndexScaleMarkers[4])) + 5
	ElseIf $minutes < $lootIndexScaleMarkers[6] Then
		$index = (($minutes - $lootIndexScaleMarkers[5]) / ($lootIndexScaleMarkers[6] - $lootIndexScaleMarkers[5])) + 6
	ElseIf $minutes < $lootIndexScaleMarkers[7] Then
		$index = (($minutes - $lootIndexScaleMarkers[6]) / ($lootIndexScaleMarkers[7] - $lootIndexScaleMarkers[6])) + 7
	ElseIf $minutes < $lootIndexScaleMarkers[8] Then
		$index = (($minutes - $lootIndexScaleMarkers[7]) / ($lootIndexScaleMarkers[8] - $lootIndexScaleMarkers[7])) + 8
	ElseIf $minutes < $lootIndexScaleMarkers[9] Then
		$index = (($minutes - $lootIndexScaleMarkers[8]) / ($lootIndexScaleMarkers[9] - $lootIndexScaleMarkers[8])) + 9
	Else
		$index = (($minutes - $lootIndexScaleMarkers[9]) / (44739594 - $lootIndexScaleMarkers[9])) + 10
	EndIf

	$iRound1 = Round($index, 1)
	If $Runstate Then
		SetLog("Viewing weather information ...", $COLOR_PURPLE)
		If $iRound1 <= $index25 Then
			SetLog("Loot index : " & $iRound1 & " ---> SHABBY !", $COLOR_RED)
		ElseIf $iRound1 > $index25 And $iRound1 <= $index4 Then
			SetLog("Loot index : " & $iRound1 & " ---> FAIR", $COLOR_DEEPPINK)
		ElseIf $iRound1 > $index4 And $iRound1 <= $index6 Then
			SetLog("Loot index : " & $iRound1 & " ---> MEDIUM", $COLOR_ORANGE)
		ElseIf $iRound1 > $index6 And $iRound1 <= $index8 Then
			SetLog("Loot index : " & $iRound1 & " ---> GOOD !", $COLOR_GREEN)
		ElseIf $iRound1 > $index8 Then
			SetLog("Loot index : " & $iRound1 & " ---> EXCELLENT !!", $COLOR_DARKGREEN)
		EndIf
		GUICtrlSetData($lblActualIndexValue, $iRound1)
	EndIf
	Return _RoundDown($index, 1)
EndFunc   ;==>CalculateIndex


Func nowTicksUTC()
	Local $now = _Date_Time_GetSystemTime()
	Local $nowUTC = _Date_Time_SystemTimeToDateTimeStr($now)

	$nowUTC = StringMid($nowUTC, 7, 4) & "/" & StringMid($nowUTC, 1, 2) & "/" & StringMid($nowUTC, 4, 2) & StringMid($nowUTC, 11)
	Return _DateDiff('s', "1970/01/01 00:00:00", $nowUTC)
EndFunc   ;==>nowTicksUTC

Func ForecastSwitch()
	If $ichkForecastHopingSwitchMax = 1 Or $ichkForecastHopingSwitchMin = 1 And $RunState Then
		$currentForecast = readCurrentForecast()
		Local $SwitchtoProfile = ""
		Local $aArray = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
		_ArrayDelete($aArray, 0)
		While True
			If $ichkForecastHopingSwitchMax = 1 Then
				If $currentForecast < Number($itxtForecastHopingSwitchMax, 3) And $sCurrProfile <> $icmbForecastHopingSwitchMax Then
					$SwitchtoProfile = $icmbForecastHopingSwitchMax
					Local $aNewProfile = $aArray[Number($icmbForecastHopingSwitchMax)]
					SetLog("Weather index < " & $itxtForecastHopingSwitchMax & " !!", $COLOR_ORANGE)
					SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
					ExitLoop
				EndIf
			EndIf
			If $ichkForecastHopingSwitchMin = 1 Then
				If $currentForecast > Number($itxtForecastHopingSwitchMin, 3) And $sCurrProfile <> $icmbForecastHopingSwitchMin Then
					$SwitchtoProfile = $icmbForecastHopingSwitchMin
					Local $aNewProfile = $aArray[Number($icmbForecastHopingSwitchMin)]
					SetLog("Weather index > " & $itxtForecastHopingSwitchMin & " !!", $COLOR_ORANGE)
					SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
					ExitLoop
				EndIf
			EndIf
			ExitLoop
		WEnd
		If $SwitchtoProfile <> "" Then
			If $sCurrProfile <> $SwitchtoProfile Then
				_GUICtrlComboBox_SetCurSel($cmbProfile, $SwitchtoProfile)
				cmbProfile()
			EndIf
		EndIf
	EndIf
EndFunc   ;==>ForecastSwitch

Func PauseMeteo()
	;Filtre Sleep Forecast
	If $RunState Then
		$currentForecast = readCurrentForecast()

		;Fonctionnement UTC pour usage mondial
		Local $HourActual, $tLocal, $tSystem, $UTC
		$tLocal = _Date_Time_GetLocalTime()
		$tSystem = _Date_Time_TzSpecificLocalTimeToSystemTime($tLocal)
		$UTC = _Date_Time_SystemTimeToDateTimeStr($tSystem)
		$HourActual = StringMid($UTC, 12, 2) ;Retourne l'heure UTC (HH)

		;Réglages UTC+2
		Local $14h = 14
		Local $16h = 16
		Local $18h = 18
		Local $sleepforecast1 = Random(240, 420, 1) * 60000 ; 4 à 7 heures
		Local $sleepforecast2 = Random(120, 180, 1) * 60000 ; 2 à 3 heures
		Local $sleepforecast3 = Random(60, 120, 1) * 60000 ; 1 à 2 heures
		Local $sleepforecast4 = Random(15, 40, 1) * 60000 ; 15 à 40 minutes
		Local $RouletteForecast = Random(0, 1, 1)
		Local $iDelayHourPause, $iDelayMinPause, $iDelaySecPause

		If $iChkForecastPause = 1 Then
			If $currentForecast >= Number($iTxtForecastPause, 3) Then
				SetLog("The loot weather is clement !!", $COLOR_GREEN)

			ElseIf $currentForecast < Number($iTxtForecastPause, 3) Then

				SetLog("The loot weather is rotten !!", $COLOR_RED)

				If $RouletteForecast = 1 Then

					Local $i = 0
					While 1
						AndroidBackButton()
						If _Sleep(1000) Then Return ; wait for window to open
						If ClickOkay("ExitCoCokay", True) = True Then ExitLoop ; Confirm okay to exit
						If $i > 10 Then
							Setlog("Can not find Okay button to exit CoC, Forcefully Closing CoC", $COLOR_RED)
							If $debugImageSave = 1 Then DebugImageSave("CheckAttackDisableFailedButtonCheck_")
							CloseCoC()
							ExitLoop
						EndIf
						$i += 1
					WEnd
					$RandomTimer = True ; Reinitialise le timer de la pause

					; short wait for CoC to exit
					If _Sleep(1500) Then Return

					If $HourActual < $14h Then
						SetLog("Clement conditions are very far, big break !", $COLOR_BLUE)
						Setlog("Classical closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast1, True)
					ElseIf $HourActual >= $14h And $HourActual < $16h Then
						SetLog("Clement conditions are far, medium break !", $COLOR_BLUE)
						Setlog("Classical closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast2, True)
					ElseIf $HourActual >= $16h And $HourActual < $18h Then
						SetLog("Clement conditions are close, short break !", $COLOR_BLUE)
						Setlog("Classical closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast3, True)
					ElseIf $HourActual >= $18h Then
						SetLog("Clement conditions are very close, mini break the time the sun comes !", $COLOR_BLUE)
						Setlog("Classical closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast4, True)
					EndIf

				ElseIf $RouletteForecast = 0 Then

					$RandomTimer = True ; Reinitialise le timer de la pause

					If $HourActual < $14h Then
						SetLog("Clement conditions are very far, big break !", $COLOR_BLUE)
						Setlog("Timeout closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast1, False)
					ElseIf $HourActual >= $14h And $HourActual < $16h Then
						SetLog("Clement conditions are far, medium break !", $COLOR_BLUE)
						Setlog("Timeout closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast2, False)
					ElseIf $HourActual >= $16h And $HourActual < $18h Then
						SetLog("Clement conditions are close, short break !", $COLOR_BLUE)
						Setlog("Timeout closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast3, False)
					ElseIf $HourActual >= $18h Then
						SetLog("Clement conditions are very close, mini break the time the sun comes !", $COLOR_BLUE)
						Setlog("Timeout closure of CoC during the storm.", $COLOR_BLUE)
						; Pushbullet Msg
						PushMsg("TakeBreak")
						WaitnOpenCoc($sleepforecast4, False)
					EndIf
				EndIf

			EndIf
		EndIf
	EndIf
	;Filtre Sleep Forecast
EndFunc   ;==>PauseMeteo

Func chkEnableForecastReading()

	If GUICtrlRead($chkEnableForecastReading) = $GUI_CHECKED Then
		$ichkEnableForecastReading = 1
		For $i = $grpActualValue To $txtForecastHopingSwitchMin
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		$currentForecast = readCurrentForecast()
		GUICtrlSetData($lblActualIndexValue, $currentForecast)
	Else
		$ichkEnableForecastReading = 0
		For $i = $grpActualValue To $txtForecastHopingSwitchMin
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf

EndFunc   ;==>chkEnableForecastReading
