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

$tabProfiles = GUICtrlCreateTabItem("Profiles")

Local $x = 30, $y = 150
	$grpControls = GUICtrlCreateGroup("Profiles", $x - 20, $y - 20, 450, 45)
		$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(7,28, "Use this to switch to a different profile") & @CRLF & GetTranslated(7,29, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput(GetTranslated(7,30, "MyVillage"), $x - 3, $y, 130, 20, BitOR($SS_CENTER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit (-1, 100, 0)
			GUICtrlSetFont(-1, 9, 400, 1)
			GUICtrlSetTip(-1, GetTranslated(7,31, "Your village/profile's name"))
			GUICtrlSetState(-1, $GUI_HIDE)

		$bIconAdd = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
		$bIconConfirm = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
		$bIconDelete = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
		$bIconCancel = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
		$bIconEdit = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
		$btnAdd = GUICtrlCreateButton("", $x + 135, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetTip(-1, GetTranslated(7,103, "Add New Profile"))
		$btnConfirmAdd = GUICtrlCreateButton("", $x + 135, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetTip(-1, GetTranslated(7,104, "Confirm"))
		$btnConfirmRename = GUICtrlCreateButton("", $x + 135, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetTip(-1, GetTranslated(7,104, "Confirm"))
		$btnDelete = GUICtrlCreateButton("", $x + 162, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetTip(-1, GetTranslated(7,105, "Delete Profile"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
		$btnCancel = GUICtrlCreateButton("", $x + 162, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetTip(-1, GetTranslated(7,106, "Cancel"))
		$btnRename = GUICtrlCreateButton("", $x + 190, $y, 22, 22)
			_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			GUICtrlSetTip(-1, GetTranslated(7,107, "Rename Profile"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
	GUICtrlCreateGroup("", -99, -99, 1, 1)
Local $x = 30, $y = 200
	$grpGoldSwitch = GUICtrlCreateGroup("Gold Switch Profile Conditions", $x - 20, $y - 20, 450, 75)
	$y += 5
		$chkGoldSwitchMax = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when gold is above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblGoldMax = GUICtrlCreateLabel("When Gold is Above", $x + 140, $y, -1, -1)
		$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Gold to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
	$y += 25
		$chkGoldSwitchMin = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when gold is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblGoldMin = GUICtrlCreateLabel("When Gold is Below", $x + 140, $y, -1, -1)
		$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Gold to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 360, $y - 40, 64, 64)
		$picProfileGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 350, $y - 30, 16, 16)
		$picProfileGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 330, $y - 15, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpElixirSwitch = GUICtrlCreateGroup("Elixir Switch Profile Conditions", $x - 20, $y - 20, 450, 75)
	$y += 5
		$chkElixirSwitchMax = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Elixir is above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblElixirMax = GUICtrlCreateLabel("When Elixir is Above", $x + 140, $y, -1, -1)
		$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
	$y += 25
		$chkElixirSwitchMin = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Elixir is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblElixirMin = GUICtrlCreateLabel("When Elixir is Below", $x + 140, $y, -1, -1)
		$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 360, $y - 40, 64, 64)
		$picProfileElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 350, $y - 30, 16, 16)
		$picProfileElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 330, $y - 15, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpDESwitch = GUICtrlCreateGroup("Dark Elixir Switch Profile Conditions", $x - 20, $y - 20, 450, 75)
	$y += 5
		$chkDESwitchMax = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Dark Elixir is above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblDEMax = GUICtrlCreateLabel("When Dark Elixir is Above", $x + 140, $y, -1, -1)
		$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Dark Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
	$y += 25
		$chkDESwitchMin = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Dark Elixir is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblDEMin = GUICtrlCreateLabel("When  Dark Elixir is Below", $x + 140, $y, -1, -1)
		$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Dark Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picProfileDE = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 360, $y - 40, 64, 64)
		$picProfileDE = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 350, $y - 30, 16, 16)
		$picProfileDE = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 330, $y - 15, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpTrophySwitch = GUICtrlCreateGroup("Trophy Switch Profile Conditions", $x - 20, $y - 20, 450, 85)
	$y += 5
		$chkTrophySwitchMax = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Trophies are above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblTrophyMax = GUICtrlCreateLabel("When Trophies are Above", $x + 140, $y, -1, -1)
		$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Trophies to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
	$y += 25
		$chkTrophySwitchMin = GUICtrlCreateCheckbox("Switch To", $x - 5, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Trophies are below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 65, $y - 5, 70, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
		$lblTrophyMin = GUICtrlCreateLabel("When Trophies are Below", $x + 140, $y, -1, -1)
		$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 270, $y - 3, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Trophies to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
		$picProfileTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 360, $y - 40, 64, 64)
		$picProfileTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 345, $y - 35, 16, 16)
		$picProfileTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 330, $y - 15, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
setupProfileComboBox()