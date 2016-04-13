; #FUNCTION# ====================================================================================================================
; Name ..........: CheckVersion
; Description ...: Check if we have last version of program
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CheckVersion()
	If $ichkVersion = 1 Then
		CheckVersionHTML()
		If $lastversion = "" Then
			SetLog("WE CANNOT OBTAIN PRODUCT VERSION AT THIS TIME", $COLOR_ORANGE)
		ElseIf VersionNumFromVersionTXT($sBotVersion) < VersionNumFromVersionTXT($lastversion) Then
			SetLog("WARNING, YOUR BOT VERSION (" & $sBotVersion & ") IS OUT OF DATE.", $COLOR_RED)
			SetLog("PLEASE DOWNLOAD THE LATEST(" & $lastversion & ") FROM https://MyBot.run               ", $COLOR_RED)
			SetLog(" ")
			_PrintLogVersion($oldversmessage)
		ElseIf VersionNumFromVersionTXT($sBotVersion) > VersionNumFromVersionTXT($lastversion) Then
			SetLog("YOU ARE USING A FUTURE VERSION OF MYBOT CHIEF!", $COLOR_GREEN)
			SetLog("YOUR VERSION: " & $sBotVersion, $COLOR_GREEN)
			SetLog("OFFICIAL VERSION: " & $lastversion, $COLOR_GREEN)
			SetLog(" ")
		Else
			SetLog("WELCOME CHIEF, YOU HAVE THE LATEST VERSION OF THE BOT", $COLOR_GREEN)
			SetLog(" ")
			_PrintLogVersion($lastmessage)
		EndIf
		
		CheckMODVersion()
	EndIf
EndFunc   ;==>CheckVersion

Func CheckVersionHTML()
	Local $versionfile = @ScriptDir & "\LastVersion.txt"
	If FileExists(@ScriptDir & "\TestVersion.txt") Then
		FileCopy(@ScriptDir & "\TestVersion.txt", $versionfile, 1)
	Else
		;download page from site contains last bot version
		$hDownload = InetGet("https://raw.githubusercontent.com/MyBotRun/MyBot/master/LastVersion.txt", $versionfile, 0, 1)

		; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
		Local $i = 0
		Do
			Sleep($iDelayCheckVersionHTML1)
			$i += 1
		Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) or $i > 25

		InetClose($hDownload)
	EndIf

	;search version into downloaded page
	Local $f, $f2, $line, $line2, $Casesense = 0, $chkvers = False, $chkmsg = False, $chkmsg2 = False, $i = 0
	$lastversion = ""
	If FileExists($versionfile) Then
		$f = FileOpen($versionfile, 0)
		$lastversion = IniRead($versionfile,"general","version","")
		;look for localized messages for the new and old versions
		Local $versionfilelocalized = @ScriptDir & "\LastVersion_" & $sLanguage & ".txt";
		If FileExists(@ScriptDir & "\TestVersion_" & $sLanguage & ".txt") Then
			FileCopy(@ScriptDir & "\TestVersion_" & $sLanguage & ".txt", $versionfilelocalized, 1)
		Else
			;download page from site contains last bot version localized messages
			$hDownload = InetGet("https://raw.githubusercontent.com/MyBotRun/MyBot/master/LastVersion_" & $sLanguage & ".txt", $versionfilelocalized, 0, 1)

			; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
			Local $i = 0
			Do
				Sleep($iDelayCheckVersionHTML1)
				$i += 1
			Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) or $i > 25

			InetClose($hDownload)
		EndIf
		If FileExists($versionfilelocalized) Then
			$f2 = FileOpen($versionfilelocalized, 0)
			$lastmessage  = IniRead($versionfilelocalized,"general","messagenew","")
			$oldversmessage  = IniRead($versionfilelocalized,"general","messageold","")
			FileClose($f2)
			FileDelete($versionfilelocalized)
		Else
			$lastmessage  = IniRead($versionfile,"general","messagenew","")
			$oldversmessage  = IniRead($versionfile,"general","messageold","")
		EndIf
		FileClose($f)
		FileDelete($versionfile)
	EndIf
EndFunc   ;==>CheckVersionHTML

Func CheckMODVersion()
	Local $botFile = @ScriptDir & "\MyBot.run.exe"
	Local $lastModified, $lastPushed, $lastPushedDatetime
	If FileExists($botFile) Then
		$lastModified = FileGetTime($botFile, $FT_MODIFIED, $FT_STRING)
	EndIf

	Local $tempJson = @ScriptDir & "\Temp.json"
	$hDownload = InetGet("https://api.github.com/repos/pedroleon99/MyBot-PedroMod", $tempJson, 0, 1)
	; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
	Local $i = 0
	Do
		Sleep($iDelayCheckVersionHTML1)
		$i += 1
	Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) or $i > 25
	InetClose($hDownload)

	Local $file = FileOpen($tempJson, 0)
	Local $fileContent = FileRead($file)
	Local $decodedArray = _JSONDecode($fileContent)
	For $i = 0 To Ubound($decodedArray) - 1
		If $decodedArray[$i][0] = "pushed_at" Then 
			$lastPushedDatetime = $decodedArray[$i][1]			
			ExitLoop
		EndIf
	Next
	FileClose($file)
	FileDelete($tempJson)
	
	; convert UTC time to local time
	Local $utcPushedTime = _Date_Time_EncodeSystemTime(StringMid($lastPushedDatetime, 6, 2), StringMid($lastPushedDatetime, 9, 2), StringMid($lastPushedDatetime, 1, 4), StringMid($lastPushedDatetime, 12, 2), StringMid($lastPushedDatetime, 15, 2), StringMid($lastPushedDatetime, 18, 2))
	Local $localPushedTime = _Date_Time_SystemTimeToTzSpecificLocalTime(DllStructGetPtr($utcPushedTime))
	$lastPushed = StringRegExpReplace(_Date_Time_SystemTimeToDateTimeStr($localPushedTime, 1), "[^[:digit:]]", "")
	
	If $lastModified And $lastPushed Then
		If Number($lastModified) + 500 < Number($lastPushed) Then ; check if last modified timestamp of local bot is within 5 mins of latest upload timestamp
			MsgBox(0, "", "A new version of the MOD has been uploaded(" & _Date_Time_SystemTimeToDateTimeStr($localPushedTime, 1) & ") , your version might be outdated." & @CRLF & _
			"Check and download latest version from Update Menu")
			Return False
		EndIf
	EndIf
	Return True
EndFunc

Func VersionNumFromVersionTXT($versionTXT)
	; remove all after a space from $versionTXT, example "v.4.0.1 MOD" ==> "v.4.0.1"
	Local $versionTXT_clean
	If StringInStr($versionTXT, " ") Then
		$versionTXT_clean = StringLeft($versionTXT, StringInStr($versionTXT, " ") - 1)
	Else
		$versionTXT_clean = $versionTXT
	EndIf

	Local $resultnumber = 0
	If StringLeft($versionTXT_clean, 1) = "v" Then
		Local $versionTXT_Vector = StringSplit(StringMid($versionTXT_clean, 2, -1), ".")
		Local $multiplier = 1000000
		If UBound($versionTXT_Vector) > 0 Then
			For $i = 1 To UBound($versionTXT_Vector) - 1
				$resultnumber = $resultnumber + Number($versionTXT_Vector[$i]) * $multiplier
				$multiplier = $multiplier / 1000
			Next
		Else
			$resultnumber = Number($versionTXT_Vector) * $multiplier
		EndIf
	EndIf
	Return $resultnumber
EndFunc   ;==>VersionNumFromVersionTXT

Func _PrintLogVersion($message)
	Local $messagevet = StringSplit($message, "\n", 1)
	If Not (IsArray($messagevet)) Then
		Setlog($message)
	Else
		For $i = 1 To $messagevet[0]
			If StringLen($messagevet[$i]) <= 53 Then
				SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
			Else
				While StringLen($messagevet[$i]) > 53
					Local $sp = StringInStr(StringLeft($messagevet[$i], 53), " ", 0, -1) ; find last occurrence of space
					If $sp = 0 Then ;no found spaces
						Local $sp = StringInStr($messagevet[$i], " ", 0) ; find first occurrence of space
						If $sp = 0 Then
							SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
						Else
							SetLog(StringLeft($messagevet[$i], $sp), $COLOR_BLACK, "Lucida Console", 8.5)
							$messagevet[$i] = StringMid($messagevet[$i], $sp + 1, -1)
						EndIf
					Else
						SetLog(StringLeft($messagevet[$i], $sp), $COLOR_BLACK, "Lucida Console", 8.5)
						$messagevet[$i] = StringMid($messagevet[$i], $sp + 1, -1)
					EndIf
				WEnd
				If StringLen($messagevet[$i]) > 0 Then SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
			EndIf
		Next
	EndIf
EndFunc   ;==>_PrintLogVersion