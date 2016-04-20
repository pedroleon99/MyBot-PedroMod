; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab MOD
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

$tabMOD = GUICtrlCreateTabItem("Mods")
	; SmartZap Settings
	Local $x = 35, $y = 155
    $grpStatsMisc = GUICtrlCreateGroup("SmartZap", $x - 20, $y - 20, 440, 120)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 20, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x - 10, $y - 7, 24, 24)
		$chkSmartLightSpell = GUICtrlCreateCheckbox("Use Lightning Spells to Zap Drills", $x + 20, $y - 5, -1, -1)
			$txtTip = "Check this to drop Lightning Spells on top of Dark Elixir Drills." & @CRLF & @CRLF & _
					  "Remember to go to the tab 'troops' and put the maximum capacity " & @CRLF & _
					  "of your spell factory and the number of spells so that the bot " & @CRLF & _
					  "can function perfectly."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartLightSpell")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$chkSmartZapDB = GUICtrlCreateCheckbox("Only Zap Drills in Dead Bases", $x + 20, $y + 21, -1, -1)
			$txtTip = "It is recommended you only zap drills in dead bases as most of the " & @CRLF & _
					  "Dark Elixir in a live base will be in the storage."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapDB")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblSmartZap = GUICtrlCreateLabel("Min. amount of Dark Elixir:", $x, $y + 48, 160, -1, $SS_RIGHT)
		$txtMinDark = GUICtrlCreateInput("200", $x + 165, $y + 45, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		    $txtTip = "The value here depends a lot on what level your Town Hall is, " & @CRLF & _
					  "and what level drills you most often see."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkSmartZapSaveHeroes = GUICtrlCreateCheckbox("Don't Zap on Town Hall Snipe when Heroes Deployed", $x + 20, $y + 69, -1, -1)
			$txtTip = "This will stop SmartZap from zapping a base on a Town Hall Snipe " & @CRLF & _
					  "if your heroes were deployed. " & @CRLF & @CRLF & _
					  "This protects their health so they will be ready for battle sooner!"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapSaveHeroes")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
	Local $x = 236, $y = 155
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 160, $y + 3, 24, 24)
		$lblSmartZap = GUICtrlCreateLabel("0", $x + 60, $y + 5, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Number of dark elixir zapped during the attack with lightning."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 160, $y + 40, 24, 24)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x + 60, $y + 40, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Amount of used spells."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; Save for Collector Settings
	Local $x = 35, $y = 275
	$grpSaveTroops = GUICtrlCreateGroup("Save Troops for Collectors", $x - 20, $y - 20, 440, 70)
		$chkChangeFF = GUICtrlCreateCheckbox("Use Multi Finger", $x - 10, $y - 5, -1, -1)
			$txtTip = "Change to Multi Finger if less than " & $percentCollectors & "% of collectors near RED LINE." & @CRLF & _
					  "     This will switch to 0 delay for troops for a fast deployment."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkChangeFF")
		$lblChangeFF = GUICtrlCreateLabel("Minimum near Red Line:", $x + 105, $y - 2, 125, -1, $SS_RIGHT)
		$txtPercentCollectors = GUICtrlCreateInput("80", $x + 235, $y - 5, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Suggestions: " & @CRLF & _ 
					  "     Barch lvl. 6 and above use 70%." & @CRLF & _ 
					  "     Barch lvl. 5 use 80%." & @CRLF & _ 
					  "     Barch lvl. 4 and below use 90%."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 100)
			GUICtrlSetOnEvent(-1, "txtPercentCollectors")
		$lblChangeFFPercent = GUICtrlCreateLabel("% Collectors.", $x + 275, $y - 2, -1, -1)
		$lblDistance = GUICtrlCreateLabel("Maximum Distance to Redline:", $x - 10, $y + 24, 240, -1, $SS_RIGHT)
		$txtDistance = GUICtrlCreateInput("50", $x + 235, $y + 21, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Maximum number of pixels between the collector and the Redline." & @CRLF & _ 
					  "     Recommended: 50 pixels."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 100)
			GUICtrlSetOnEvent(-1, "txtDistance")
		$lblDistancePixels = GUICtrlCreateLabel("pixels.", $x + 275, $y + 24, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	;;;;;;;;;;;;;;;;;
    ;;; Mult-Farming
    ;;;;;;;;;;;;;;;;;
	Local $x = 35, $y = 345
	$grpMultyFarming = GUICtrlCreateGroup(GetTranslated(17,1, "Multy-Farming"), $x - 20, $y - 20, 100, 70)
	$x -= 10
		$chkMultyFarming = GUICtrlCreateCheckbox(GetTranslated(17,1, "Multy-Farming"), $x - 5, $y -7, -1 , -1)
			$txtTip = GetTranslated(17,3, "Will switch account and attack, then switch back")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultiFarming")
		$chkSwitchDonate = GUICtrlCreateCheckbox(GetTranslated(6,1, "Donate"), $x - 5, $y + 10, -1, -1)
			$txtTip = GetTranslated(17,4, "Will switch account For Donate, then switch back")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchAndDonate")
		$Account = GUICtrlCreateInput("2", $x +70, $y + 28, 15, 15, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(17,5, "How many account to use For multy farming")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblmultyAcc = GUICtrlCreateLabel(GetTranslated(17,2, "How Many:"), $x -5, $y + 29, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)

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
		$chkHideTaskBar = GUICtrlCreateCheckbox("Hide Taskbar Icon", $x - 10, $y + 20, 120, -1)
			$txtTip = "This will hide the android client from the taskbar when you press the Hide button"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "HideTaskbar")
		$lblHideTaskBar = GUICtrlCreateLabel("Warning: May cause erratic behaviour, uncheck if you have problems.", $x - 10, $y + 45, 340, 30, $SS_LEFT)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	
	; Misc Battle Settings
	Local $x = 140, $y = 345
	$grpDontEndBattle = GUICtrlCreateGroup("Miscellaneous Battle Settings", $x - 20, $y - 20, 165, 45)
		$chkFastADBClicks = GUICtrlCreateCheckbox("Enable Fast ADB Clicks", $x - 10, $y - 5, -1, -1)
			$txtTip = "Tick this to enable faster ADB deployment for MEmu and Droid4x in Multi-finger mode." & @CRLF & @CRLF & _ 
				      "     WARNING:  This is experimental, if you have issues with deployment, disable it."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkFastADBClicks")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")