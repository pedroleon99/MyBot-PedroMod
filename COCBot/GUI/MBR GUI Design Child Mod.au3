; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
$hGUI_MOD = GUICreate("", $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $frmBotEx)
;GUISetBkColor($COLOR_WHITE, $hGUI_BOT)

GUISwitch($hGUI_MOD)

$hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem("Attacks")

Local $xStart = 0, $yStart = 0

; SmartZap Settings

Local $x = $xStart + 30, $y = $yStart + 50

$grpStatsMisc = GUICtrlCreateGroup("SmartZap", $x - 20, $y - 20, 420, 150)
GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 30, 24, 24)
GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x - 10, $y + 3, 24, 24)
$chkSmartLightSpell = GUICtrlCreateCheckbox("Use Lightning Spells to Zap Drills", $x + 20, $y + 5, -1, -1)
$txtTip = "Check this to drop Lightning Spells on top of Dark Elixir Drills." & @CRLF & @CRLF & _
		"Remember to go to the tab 'troops' and put the maximum capacity " & @CRLF & _
		"of your spell factory and the number of spells so that the bot " & @CRLF & _
		"can function perfectly."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkSmartLightSpell")
GUICtrlSetState(-1, $GUI_UNCHECKED)
$chkSmartZapDB = GUICtrlCreateCheckbox("Only Zap Drills in Dead Bases", $x + 20, $y + 31, -1, -1)
$txtTip = "It is recommended you only zap drills in dead bases as most of the " & @CRLF & _
		"Dark Elixir in a live base will be in the storage."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkSmartZapDB")
GUICtrlSetState(-1, $GUI_CHECKED)
$lblSmartZap = GUICtrlCreateLabel("Min. amount of Dark Elixir:", $x - 10, $y + 58, 160, -1, $SS_RIGHT)
$txtMinDark = GUICtrlCreateInput("478", $x + 155, $y + 55, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "The value here depends a lot on what level your Town Hall is, " & @CRLF & _
		"and what level drills you most often see."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
GUICtrlSetOnEvent(-1, "txtMinDark")
$chkSmartZapSaveHeroes = GUICtrlCreateCheckbox("TH snipe NoZap if Heroes Deployed", $x + 20, $y + 79, -1, -1)
$txtTip = "This will stop SmartZap from zapping a base on a Town Hall Snipe " & @CRLF & _
		"if your heroes were deployed. " & @CRLF & @CRLF & _
		"This protects their health so they will be ready for battle sooner!"
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkSmartZapSaveHeroes")
GUICtrlSetState(-1, $GUI_CHECKED)
Local $x = 220, $y = 70
$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 160, $y + 3, 24, 24)
$lblSmartZap = GUICtrlCreateLabel("0", $x + 60, $y + 5, 80, 30, $SS_RIGHT)
GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x279B61)
$txtTip = "Number of dark elixir zapped during the attack with lightning."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 160, $y + 40, 24, 24)
$lblLightningUsed = GUICtrlCreateLabel("0", $x + 60, $y + 40, 80, 30, $SS_RIGHT)
GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x279B61)
$txtTip = "Amount of used spells."
_GUICtrlSetTip(-1, $txtTip)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem("Miscellaneous")

Local $xStart = 0, $yStart = 0

; Collect Treasury

Local $x = $xStart + 230, $y = $yStart - 80

$grpTreasury = GUICtrlCreateGroup("Collect Treasury", $x - 226, $y + 110, 440, 100) ;70
$chkCollectTresory = GUICtrlCreateCheckbox("Enable", $x - 210, $y + 135, -1, -1)
$txtTip = "Enable auto collect of treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresory")
GUICtrlSetState(-1, $GUI_UNCHECKED)
$leurequisertarienTresor = GUICtrlCreateLabel("", $x - 180, $y + 135, -1, -1, $SS_RIGHT)
GUICtrlCreateIcon($pIconLib, $eIcnGold, $x - 120, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$chkTRFull = GUICtrlCreateCheckbox("When Full", $x - 210, $y + 165, -1, -1)
$txtTip = "Check to the bot collect the treasury when full"
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_HIDE)
$txtTreasuryGold = GUICtrlCreateInput("0", $x - 100, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Gold amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_HIDE)

$chkCollectTresoryGold = GUICtrlCreateCheckbox("Gold", $x - 90, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Gold amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryGold")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x - 15, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetOR = GUICtrlCreateButton("Reset", $x - 92, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetOr")
GUICtrlSetState(-1, $GUI_HIDE)

$txtTreasuryElixir = GUICtrlCreateInput("0", $x + 5, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Elixir amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_HIDE)
$chkCollectTresoryElixir = GUICtrlCreateCheckbox("Elixir", $x + 10, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Elixir amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryElixir")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 90, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetEL = GUICtrlCreateButton("Reset", $x + 13, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetEL")
GUICtrlSetState(-1, $GUI_HIDE)

$txtTreasuryDark = GUICtrlCreateInput("0", $x + 110, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Dark Elixir amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
GUICtrlSetState(-1, $GUI_HIDE)
$chkCollectTresoryDark = GUICtrlCreateCheckbox("Dark Elixir", $x + 115, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Dark Elixir amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryDark")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetDE = GUICtrlCreateButton("Reset", $x + 118, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetDE")
GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateGroup("", -99, -99, 1, 1)

;GUI modification by rulesss
  Local $x = 24, $y = 135
	  $grpCoCStats = GUICtrlCreateGroup("", $x - 20, $y, 440, 35)
   $y += 10
   $x+= -10
	   $chkCoCStats = GUICtrlCreateCheckbox(GetTranslated(110, 1,"CoCStats Activate"), $x , $y , -1, -1)
		   $txtTip = GetTranslated(110,2,"Activate sending raid results to CoCStats.com")
		   GUICtrlSetTip(-1, $txtTip)
		   GUICtrlSetOnEvent(-1, "chkCoCStats")
   $x += 135
	   $lblAPIKey = GUICtrlCreateLabel(GetTranslated(110, 3,"API Key:"), $x - 18, $y + 4 , -1, 21, $SS_LEFT)
		   $txtAPIKey = GUICtrlCreateInput("", $x + 30, $y , 250, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		   $txtTip = GetTranslated(110,4,"Join in CoCStats.com and input API Key here")
		   GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	 GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem("Forecast")

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 30

$chkEnableForecastReading = GUICtrlCreateCheckbox("Read Weather Index from ClashOfClansForecaster.com", $x, $y, -1, -1)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetOnEvent(-1, "chkEnableForecastReading")

$y += 30
$grpActualValue = GUICtrlCreateGroup("Weather index", $x, $y, 420, 60)
$TxtActualIndexValue = GUICtrlCreateLabel("Actual weather index", $x + 80, $y + 27, 160, 15, $SS_RIGHT)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$TxtActualIndexValueEgal = GUICtrlCreateLabel("  = ", $x + 110, $y + 29, 160, 15, $SS_RIGHT)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$lblActualIndexValue = GUICtrlCreateLabel("", $x + 275, $y + 27, 30, 15, $SS_RIGHT)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$surdix = GUICtrlCreateLabel("/10", $x + 305, $y + 27, 30, 15, $SS_RIGHT)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateGroup("", -99, -99, 1, 1)


$y += 70
$grpPauses = GUICtrlCreateGroup("Weather breaks", $x, $y, 420, 80)
$chkForecastPause = GUICtrlCreateCheckbox("Take breaks when the weather index <", $x + 10, $y + 25, -1, -1)
$txtTip = "The bot will pause when the index drops below the set value."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastPause")
GUICtrlSetState(-1, $GUI_ENABLE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
$txtForecastPause = GUICtrlCreateInput("2.5", $x + 225, $y + 27, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = "Minimum loot index."
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
_GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
$chkDontRemoveredzone = GUICtrlCreateCheckbox("Don't empty barracks at each reconnection if the index is below the set value", $x + 10, $y + 50, -1, -1)
$txtTip = "The bot doesn't empty barracks at each reconnection if the index is below the set value."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += 85
$grpBoost = GUICtrlCreateGroup("Boosts", $x, $y, 420, 70)
$chkForecastBoost = GUICtrlCreateCheckbox("Boost only when the weather index >", $x + 10, $y + 25, -1, -1)
$txtTip = "Boost Barracks, Spells, and/or Heroes (Specified on the Troops tab) only when the loot index is above the specified value."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastBoost")
GUICtrlSetState(-1, $GUI_UNCHECKED)
$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 210, $y + 27, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = "Minimum loot index for boosting."
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 6.0)
_GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += 80
$grpHoping = GUICtrlCreateGroup("Profile Switch", $x, $y, 420, 90)
$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox("Switch to", $x + 10, $y + 25, -1, -1)
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 80, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMax = GUICtrlCreateLabel("When Weather Index <", $x + 180, $y + 30, -1, -1)
$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 300, $y + 28, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
_GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox("Switch to", $x + 10, $y + 55, -1, -1)
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 80, $y + 55, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMin = GUICtrlCreateLabel("When Weather Index >", $x + 180, $y + 60, -1, -1)
$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 300, $y + 58, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = "" ; à renseigner
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
_GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBox()
GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem("ChatBot")

ChatbotCreateGui()

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM5 = GUICtrlCreateTabItem("Switch Profiles")

Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage, $btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage, $btnGUIPresetLoadConf, $lblLoadPresetMessage, $btnGUIPresetDeleteConf, $chkCheckDeleteConf

Local $x = 25, $y = 45

$grpGoldSwitch = GUICtrlCreateGroup(GetTranslated(19, 7, "Gold Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;Gold Switch
$chkGoldSwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 9, "Enable this to switch profiles when gold is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMax = GUICtrlCreateLabel(GetTranslated(19, 11, "When Gold is Above"), $x + 145, $y, -1, -1)
$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 12, "Set the amount of Gold to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)

$y += 30
$chkGoldSwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 13, "Enable this to switch profiles when gold is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMin = GUICtrlCreateLabel(GetTranslated(19, 14, "When Gold is Below"), $x + 145, $y, -1, -1)
$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 12, "Set the amount of Gold to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileGold = GUICtrlCreatePic(@ScriptDir & "\Images\GoldStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpElixirSwitch = GUICtrlCreateGroup(GetTranslated(19, 15, "Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Elixir Switch
$chkElixirSwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 16, "Enable this to switch profiles when Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)

$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMax = GUICtrlCreateLabel(GetTranslated(19, 17, "When Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 18, "Set the amount of Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$y += 30
$chkElixirSwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 19, "Enable this to switch profiles when Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMin = GUICtrlCreateLabel(GetTranslated(19, 20, "When Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 18, "Set the amount of Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileElixir = GUICtrlCreatePic(@ScriptDir & "\Images\ElixirStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpDESwitch = GUICtrlCreateGroup(GetTranslated(19, 21, "Dark Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;DE Switch
$chkDESwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 22, "Enable this to switch profiles when Dark Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblDEMax = GUICtrlCreateLabel(GetTranslated(19, 23, "When Dark Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 24, "Set the amount of Dark Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$y += 30
$chkDESwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 25, "Enable this to switch profiles when Dark Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblDEMin = GUICtrlCreateLabel(GetTranslated(19, 26, "When  Dark Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 24, "Set the amount of Dark Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$picProfileDE = GUICtrlCreatePic(@ScriptDir & "\Images\DEStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpTrophySwitch = GUICtrlCreateGroup(GetTranslated(19, 27, "Trophy Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Trophy Switch
$chkTrophySwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 28, "Enable this to switch profiles when Trophies are above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMax = GUICtrlCreateLabel(GetTranslated(19, 29, "When Trophies are Above"), $x + 145, $y, -1, -1)
$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 30, "Set the amount of Trophies to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$y += 30
$chkTrophySwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 31, "Enable this to switch profiles when Trophies are below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMin = GUICtrlCreateLabel(GetTranslated(19, 32, "When Trophies are Below"), $x + 145, $y, -1, -1)
$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 30, "Set the amount of Trophies to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$picProfileTrophy = GUICtrlCreatePic(@ScriptDir & "\Images\TrophyLeague.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBoxswitch()
;GUICtrlCreateTabItem("")

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------
