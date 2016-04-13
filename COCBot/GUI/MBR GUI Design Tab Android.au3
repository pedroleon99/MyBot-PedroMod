; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab Android
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

$tabAndroid = GUICtrlCreateTabItem("Android")
	; Android Settings
	Local $x = 35, $y = 440
	$grpHideAndroid = GUICtrlCreateGroup("Android Options", $x - 20, $y - 20, 440, 85)
		$cmbAndroid = GUICtrlCreateCombo("", $x - 10, $y - 5, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Use this to select the Android Emulator to use with this profile."
			GUICtrlSetTip(-1, $txtTip)
			setupAndroidComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbAndroid")
		$lblAndroidInstance = GUICtrlCreateLabel("Instance:", $x + 130, $y - 2 , 60, 21, $SS_RIGHT)
		$txtAndroidInstance = GUICtrlCreateInput("", $x + 200, $y - 5, 210, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "Enter the Instance to use with this profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "txtAndroidInstance")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkHideTaskBar = GUICtrlCreateCheckbox("Hide Taskbar Icon", $x - 10, $y + 20, 100, -1)
			$txtTip = "This will hide the android client from the taskbar when you press the Hide button"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "HideTaskbar")
		$lblHideTaskBar = GUICtrlCreateLabel("Warning: May cause erratic behaviour, uncheck if you have problems.", $x + 120, $y + 23, 290, 30, $SS_LEFT)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")