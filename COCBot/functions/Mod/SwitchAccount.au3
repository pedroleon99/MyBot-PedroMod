; #FUNCTION# ====================================================================================================================
; Name ..........: Switch Account
; Description ...: Switch To 1st And 2nd Account
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

;;;;;;;##### Main Account #####;;;;;;;
Global $iconfirm
Func SwitchMain()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectMain()
	If $RunState = False Then Return
		waitMainScreen()

	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Main.bmp"))
	EndIf
	$fullArmy = False
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Main account", $COLOR_blue)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>SwitchMain

Func SelectMain()
	If $RunState = False Then Return
	Local $iLoopCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1
	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		SetLog("PLease make sure image create From png", $COLOR_RED)
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
		Return
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	EndIf

	While 1
		Sleep(1000)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		Local $Message1 = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0xF5F5F5, 6), 0)
		If IsArray($Message) Then
			CheckMain() ;Select Main account
			CheckOK()
			ExitLoop
		ElseIf IsArray($Message1) Then
			CheckMain() ;Select Main account
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectMain()
			ExitLoop
		EndIf
	WEnd

	If $AccmainLoc = 1 Then
		LoadMain()
	EndIf

EndFunc   ;==>SelectMain

Func LoadMain() ;Load Main Account
	Local $iLoopCount = 0

	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Main account", $COLOR_blue)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectMain()
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>LoadMain

;;;;;;;##### Second Account#####;;;;;;;
Func SwitchSecond()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectSecond()
	If $RunState = False Then Return
		waitMainScreen()

	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Second.bmp"))
	EndIf
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Second account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchSecond

Func SelectSecond()
	If $RunState = False Then Return
	Local $iLoopCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1

	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		SetLog("PLease make sure image create From png", $COLOR_RED)
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
		Return
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	EndIf

	SetLog("Please wait account select", $COLOR_GREEN)

	While 1
	Sleep(1000)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		Local $Message1 = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0xF5F5F5, 6), 0)
		If IsArray($Message) Then
			CheckSecond()
			Sleep(1000)
			CheckOK()
			ExitLoop
		ElseIf IsArray($Message1) Then
			CheckSecond()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectSecond()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $AccSecondLoc = 1 Then
		LoadSecond()
	EndIf

EndFunc   ;==>SelectSecond

Func LoadSecond() ; Load Second Account
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Second account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectSecond()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadSecond

;;;;;;;##### Third Account#####;;;;;;;
Func SwitchThird()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectThird()
	If $RunState = False Then Return
		waitMainScreen()

	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Third.bmp"))
	EndIf
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Third account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchThird

Func SelectThird()
	If $RunState = False Then Return
	Local $iLoopCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1

	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		SetLog("PLease make sure image create From png", $COLOR_RED)
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
		Return
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return
	EndIf

	SetLog("Please wait account select", $COLOR_GREEN)
	While 1
	Sleep(1000)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		Local $Message1 = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0xF5F5F5, 6), 0)
		If IsArray($Message) Then
			CheckThird()
			Sleep(1000)
			CheckOK()
			ExitLoop
		ElseIf IsArray($Message1) Then
			CheckThird()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectThird()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $AccThirdLoc = 1 Then
	    LoadThird()
	EndIf

EndFunc   ;==>SelectThird


Func LoadThird() ; Load Third Account
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Third account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectThird()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadThird

;;;;;;;##### Fourth Account#####;;;;;;;
Func SwitchFourth()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectFourth()
	If $RunState = False Then Return
		waitMainScreen()

	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Fourth.bmp"))
	EndIf
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Fourth account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchFourth

Func SelectFourth()
	If $RunState = False Then Return
	Local $iLoopCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1

	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		SetLog("PLease make sure image create From png", $COLOR_RED)
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
		Return
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	EndIf

	SetLog("Please wait account select", $COLOR_GREEN)
	While 1
	Sleep(1000)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		Local $Message1 = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0xF5F5F5, 6), 0)
		If IsArray($Message) Then
			CheckFourth()
			Sleep(1000)
			CheckOK()
			ExitLoop
		ElseIf IsArray($Message1) Then
			CheckFourth()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectFourth()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $AccFourthLoc = 1 Then
	    LoadFourth()
	EndIf

EndFunc   ;==>SelectFourth

Func LoadFourth() ; Load Fourth Account
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Fourth account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectFourth()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadFourth

Func CheckOK()

	Local $OkX, $OkY
	$Ok = @ScriptDir & "\images\Multyfarming\Ok.bmp"
	If Not FileExists($Ok) Then Return False
	$OkLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $OkTol = 0 To 20
		If $OkLoc = 0 Then
			$OkX = 0
			$OkY = 0
			$OkLoc = _ImageSearch($Ok, 1, $OkX, $OkY, $OkTol)
			If $OkLoc = 1 Then
				SetLog("Found Ok Button ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Ok Button found (" & $OkX & "," & $OkY & ") tolerance:" & $OkTol, $COLOR_PURPLE)
				Click($OkX, $OkY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find OK Button", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckOK Button

Func CheckMain()

	Local $AccmainX, $AccmainY
	$Accmain = @ScriptDir & "\images\Multyfarming\Accmain.bmp"
	If Not FileExists($Accmain) Then Return False
	$AccmainLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccmainTol = 0 To 20
		If $AccmainLoc = 0 Then
			$AccmainX = 0
			$AccmainY = 0
			$AccmainLoc = _ImageSearch($Accmain, 1, $AccmainX, $AccmainY, $AccmainTol)
			If $AccmainLoc = 1 Then
				SetLog("Found Main Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Main Account found (" & $AccmainX & "," & $AccmainY & ") tolerance:" & $AccmainTol, $COLOR_PURPLE)
				Click($AccmainX, $AccmainY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Main Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckMain

Func CheckSecond()

	Local $AccSecondX, $AccSecondY
	$AccSecond = @ScriptDir & "\images\Multyfarming\AccSecond.bmp"
	If Not FileExists($AccSecond) Then Return False
	$AccSecondLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccSecondTol = 0 To 20
		If $AccSecondLoc = 0 Then
			$AccSecondX = 0
			$AccSecondY = 0
			$AccSecondLoc = _ImageSearch($AccSecond, 1, $AccSecondX, $AccSecondY, $AccSecondTol)
			If $AccSecondLoc = 1 Then
				SetLog("Found Second Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Second Account found (" & $AccSecondX & "," & $AccSecondY & ") tolerance:" & $AccSecondTol, $COLOR_PURPLE)
				Click($AccSecondX, $AccSecondY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Second Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckSecond

Func CheckThird()

	Local $AccThirdX, $AccThirdY
	$AccThird = @ScriptDir & "\images\Multyfarming\AccThird.bmp"
	If Not FileExists($AccThird) Then Return False
	$AccThirdLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccThirdTol = 0 To 20
		If $AccThirdLoc = 0 Then
			$AccThirdX = 0
			$AccThirdY = 0
			$AccThirdLoc = _ImageSearch($AccThird, 1, $AccThirdX, $AccThirdY, $AccThirdTol)
			If $AccThirdLoc = 1 Then
				SetLog("Found Third Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Third Account found (" & $AccThirdX & "," & $AccThirdY & ") tolerance:" & $AccThirdTol, $COLOR_PURPLE)
				Click($AccThirdX, $AccThirdY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Third Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckThird

Func CheckFourth()

	Local $AccFourthX, $AccFourthY
	$AccFourth = @ScriptDir & "\images\Multyfarming\AccFourth.bmp"
	If Not FileExists($AccFourth) Then Return False
	$AccFourthLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccFourthTol = 0 To 20
		If $AccFourthLoc = 0 Then
			$AccFourthX = 0
			$AccFourthY = 0
			$AccFourthLoc = _ImageSearch($AccFourth, 1, $AccFourthX, $AccFourthY, $AccFourthTol)
			If $AccFourthLoc = 1 Then
				SetLog("Found Fourth Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Fourth Account found (" & $AccFourthX & "," & $AccFourthY & ") tolerance:" & $AccFourthTol, $COLOR_PURPLE)
				Click($AccFourthX, $AccFourthY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Fourth Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckFourth