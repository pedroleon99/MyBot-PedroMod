#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $ProfileName[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $InstanceName[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $Launch[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $ManagerConfig = @ScriptDir & "\ManagerConfig.ini"

; ================================================== GUI PART ================================================== ;

$Form1 = GUICreate("MEmu Multiple Instances Manager", 528, 487, 233, 134)

GUICtrlCreateGroup("Instance 1", 5, 5, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 30, 70, 17)
$ProfileName[1] = GUICtrlCreateInput("MyVillage", 85, 25, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 30, 115, 17)
$InstanceName[1] = GUICtrlCreateInput("MEmu", 330, 25, 121, 21)
$Launch[1] = GUICtrlCreateButton("Launch !", 460, 20, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 2", 5, 60, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 85, 70, 17)
$ProfileName[2] = GUICtrlCreateInput("MyVillage1", 85, 80, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 85, 115, 17)
$InstanceName[2] = GUICtrlCreateInput("MEmu_1", 330, 80, 121, 21)
$Launch[2] = GUICtrlCreateButton("Launch !", 460, 75, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 3", 5, 115, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 140, 70, 17)
$ProfileName[3] = GUICtrlCreateInput("MyVillage2", 85, 135, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 140, 115, 17)
$InstanceName[3] = GUICtrlCreateInput("MEmu_2", 330, 135, 121, 21)
$Launch[3] = GUICtrlCreateButton("Launch !", 460, 130, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 4", 5, 170, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 195, 70, 17)
$ProfileName[4] = GUICtrlCreateInput("MyVillage3", 85, 190, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 195, 115, 17)
$InstanceName[4] = GUICtrlCreateInput("MEmu_3", 330, 190, 121, 21)
$Launch[4] = GUICtrlCreateButton("Launch !", 460, 185, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 5", 5, 225, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 250, 70, 17)
$ProfileName[5] = GUICtrlCreateInput("MyVillage4", 85, 245, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 250, 115, 17)
$InstanceName[5] = GUICtrlCreateInput("MEmu_4", 330, 245, 121, 21)
$Launch[5] = GUICtrlCreateButton("Launch !", 460, 240, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 6", 5, 280, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 305, 70, 17)
$ProfileName[6] = GUICtrlCreateInput("MyVillage5", 85, 300, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 305, 115, 17)
$InstanceName[6] = GUICtrlCreateInput("MEmu_5", 330, 300, 121, 21)
$Launch[6] = GUICtrlCreateButton("Launch !", 460, 295, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 7", 5, 335, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 360, 70, 17)
$ProfileName[7] = GUICtrlCreateInput("MyVillage6", 85, 355, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 360, 115, 17)
$InstanceName[7] = GUICtrlCreateInput("MEmu_6", 330, 355, 121, 21)
$Launch[7] = GUICtrlCreateButton("Launch !", 460, 350, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 8", 5, 390, 516, 51)
GUICtrlCreateLabel("Profile Name :", 15, 415, 70, 17)
$ProfileName[8] = GUICtrlCreateInput("MyVillage7", 85, 410, 121, 21)
GUICtrlCreateLabel("MEmu Instance Name :", 215, 415, 115, 17)
$InstanceName[8] = GUICtrlCreateInput("MEmu_7", 330, 410, 121, 21)
$Launch[8] = GUICtrlCreateButton("Launch !", 460, 405, 56, 26)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$OpenMultiMEmu = GUICtrlCreateButton("Open Multi MEmu", 5, 450, 106, 31)
GUICtrlCreateLabel("MEmu Instances Manager v0.1 by @RoroTiti", 140, 455, 359, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")

ReadnApplyConfig()
GUISetState(@SW_SHOW)

; ================================================== FUNCTIONS PART ================================================== ;

Func SaveConfig()

	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[1]", GUICtrlRead($ProfileName[1]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[2]", GUICtrlRead($ProfileName[2]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[3]", GUICtrlRead($ProfileName[3]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[4]", GUICtrlRead($ProfileName[4]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[5]", GUICtrlRead($ProfileName[5]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[6]", GUICtrlRead($ProfileName[6]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[7]", GUICtrlRead($ProfileName[7]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[8]", GUICtrlRead($ProfileName[8]))

	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[1]", GUICtrlRead($InstanceName[1]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[2]", GUICtrlRead($InstanceName[2]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[3]", GUICtrlRead($InstanceName[3]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[4]", GUICtrlRead($InstanceName[4]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[5]", GUICtrlRead($InstanceName[5]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[6]", GUICtrlRead($InstanceName[6]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[7]", GUICtrlRead($InstanceName[7]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[8]", GUICtrlRead($InstanceName[8]))

EndFunc   ;==>SaveConfig

Func ReadnApplyConfig()

	GUICtrlSetData($ProfileName[1], IniRead($ManagerConfig, "ProfileNames", "ProfileName[1]", "MyVillage"))
	GUICtrlSetData($ProfileName[2], IniRead($ManagerConfig, "ProfileNames", "ProfileName[2]", "MyVillage1"))
	GUICtrlSetData($ProfileName[3], IniRead($ManagerConfig, "ProfileNames", "ProfileName[3]", "MyVillage2"))
	GUICtrlSetData($ProfileName[4], IniRead($ManagerConfig, "ProfileNames", "ProfileName[4]", "MyVillage3"))
	GUICtrlSetData($ProfileName[5], IniRead($ManagerConfig, "ProfileNames", "ProfileName[5]", "MyVillage4"))
	GUICtrlSetData($ProfileName[6], IniRead($ManagerConfig, "ProfileNames", "ProfileName[6]", "MyVillage5"))
	GUICtrlSetData($ProfileName[7], IniRead($ManagerConfig, "ProfileNames", "ProfileName[7]", "MyVillage6"))
	GUICtrlSetData($ProfileName[8], IniRead($ManagerConfig, "ProfileNames", "ProfileName[8]", "MyVillage7"))

	GUICtrlSetData($InstanceName[1], IniRead($ManagerConfig, "InstanceNames", "InstanceName[1]", "MEmu"))
	GUICtrlSetData($InstanceName[2], IniRead($ManagerConfig, "InstanceNames", "InstanceName[2]", "MEmu_1"))
	GUICtrlSetData($InstanceName[3], IniRead($ManagerConfig, "InstanceNames", "InstanceName[3]", "MEmu_2"))
	GUICtrlSetData($InstanceName[4], IniRead($ManagerConfig, "InstanceNames", "InstanceName[4]", "MEmu_3"))
	GUICtrlSetData($InstanceName[5], IniRead($ManagerConfig, "InstanceNames", "InstanceName[5]", "MEmu_4"))
	GUICtrlSetData($InstanceName[6], IniRead($ManagerConfig, "InstanceNames", "InstanceName[6]", "MEmu_5"))
	GUICtrlSetData($InstanceName[7], IniRead($ManagerConfig, "InstanceNames", "InstanceName[7]", "MEmu_6"))
	GUICtrlSetData($InstanceName[8], IniRead($ManagerConfig, "InstanceNames", "InstanceName[8]", "MEmu_7"))

EndFunc   ;==>ReadnApplyConfig

; ================================================== USER ACTIONS PART ================================================== ;

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			SaveConfig()
			Exit
		Case $OpenMultiMEmu
			ShellExecute("C:\Program Files\Microvirt\MEmu\MEmuConsole.exe")
		Case $Launch[1]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[1]) & """" & " Memu " & """" & GUICtrlRead($InstanceName[1]) & """")
		Case $Launch[2]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[2]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[2]) & """")
		Case $Launch[3]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[3]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[3]) & """")
		Case $Launch[4]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[4]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[4]) & """")
		Case $Launch[5]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[5]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[5]) & """")
		Case $Launch[6]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[6]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[6]) & """")
		Case $Launch[7]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[7]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[7]) & """")
		Case $Launch[8]
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[8]) & """" & " MEmu " & """" & GUICtrlRead($InstanceName[8]) & """")
	EndSwitch
WEnd
