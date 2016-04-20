
; #FUNCTION# ====================================================================================================================
; Name ..........: DonateStats
; Description ...: GUICreateDStat(), GetTroopColumn(), InitDonateStats, CompareBitmaps(), part of DonateStats, for collecting total counts of Troops donated
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Cutidudz (2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func GetTroopColumn($iTroopName)
	Local $startIndex = 1
	$ColCount = _GUICtrlListView_GetColumnCount($lvDonatedTroops)
	If StringRight($iTroopName, 6) = "Spells" Then
		$startIndex = $ColCount - 3
		If $debugSetlog = 1 Then SetLog("DonateStats: Donating Spells $startIndex=" & $startIndex, $COLOR_PURPLE)
	Else
		$ColCount -= 3
	EndIf

	For $ColIndex = $startIndex To $ColCount
		$ColInfo = _GUICtrlListView_GetColumn($lvDonatedTroops, $ColIndex)
		If Not @error And IsArray($ColInfo) Then
			If $debugSetlog = 1 Then SetLog("Donatestats: Column match for TroopName: " & $iTroopName & " = " & $ColInfo[5] & " at column: " & $ColIndex, $COLOR_PURPLE)
			If $iTroopName = $ColInfo[5] Then
				Return $ColIndex
			EndIf

		EndIf
	Next
EndFunc

Func InitDonateStats()
	_GUICtrlListView_DeleteAllItems ($lvDonatedTroops)
	If Not FileExists($dirTemp & "DonateStats\") Then DirCreate($dirTemp & "DonateStats\")
	FileDelete($dirTemp & "DonateStats\*.bmp")

	_GUIImageList_Destroy($hImage)
	$hImage = _GUIImageList_Create(139, 25)

	_GUIImageList_AddBitmap($hImage, @ScriptDir & "\images\Totals.bmp")
	_GUICtrlListView_AddItem($lvDonatedTroops, "Totals", 0)

	_GUICtrlListView_SetImageList($lvDonatedTroops, $hImage, 1)
EndFunc

Func CompareDBitmaps($bm1, $bm2)
	If $debugSetlog = 1 Then SetLog("DonateStats: ImageCompare: " & $bm1 & "=" & $bm2, $COLOR_PURPLE)
    Local $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    Local $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    Local $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    Local $Stride = DllStructGetData($BitmapData1, "Stride")
    Local $Scan0 = DllStructGetData($BitmapData1, "Scan0")

    Local $ptr1 = $Scan0
    Local $size1 = ($Bm1H - 1) * $Stride + ($Bm1W - 1) * 4


    Local $Bm2W = _GDIPlus_ImageGetWidth($bm2)
    Local $Bm2H = _GDIPlus_ImageGetHeight($bm2)
    Local $BitmapData2 = _GDIPlus_BitmapLockBits($bm2, 0, 0, $Bm2W, $Bm2H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    Local $Stride = DllStructGetData($BitmapData2, "Stride")
    Local $Scan0 = DllStructGetData($BitmapData2, "Scan0")

    Local $ptr2 = $Scan0
    Local $size2 = ($Bm2H - 1) * $Stride + ($Bm2W - 1) * 4

    ;$smallest = $size1
    ;If $size2 < $smallest Then $smallest = $size2
	Local $smallest = ($size1 < $size2 ? $size1 : $size2)

    Local $aReturn = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $ptr1, "ptr", $ptr2, "int", $smallest)
    Local $iErrorRet = @error
    Local $iExtendedRet = @extended

    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    _GDIPlus_BitmapUnlockBits($bm2, $BitmapData2)

    $BitmapData1 = 0
    $BitmapData2 = 0

	Return ($iErrorRet ? SetError($iErrorRet, $iExtendedRet, 0) : $aReturn[0] = 0)
    ;Return ($call[0]=0)

EndFunc  ;==>CompareBitmaps