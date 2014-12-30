#NoEnv
SendMode Input
#NoTrayIcon
#persistent
#SingleInstance Force
#Include Res\Var
#Include Res\ScrollBox.ahk
#Include Res\Cardellos
Menu, Tray, Icon,res\icon\logo.ico
Menu, Tray, Add,Go,WallChanger
Menu, Debug, Add,Reload
Menu, Debug, Add,Edit
Menu, Debug, Add,WinSpy
Menu, Debug, Add,
Menu, Debug, Add,
Menu, Debug, Add,Lines,ListLines
Menu, Debug, Add,Vars,ListVars
Menu, Tray, Add,Debug, :Debug
Menu, Tray, Add, 
Menu, Tray, Add, 
Menu, Tray, Add,About
Menu, Tray, Add,Exit,GuiClose
Menu, Tray, Default,Go
OnMessage(0x201, "DragWin")
OnMessage(ListVars, "ListVars")
Global NextWall:=DllCall("RegisterWindowMessage","UInt", &Var:="NextWall")
OnMessage(NextWall, "Update")
ToggInfo:=DllCall("RegisterWindowMessage","UInt", &Var:="ToggInfo")
OnMessage(ToggInfo, "WallInfo")
IniRead, WallPos_x , res\settings.ini, WinPos, WallPos_x , Center
IniRead, WallPos_y , res\settings.ini, WinPos, WallPos_y , Center
If InStr( WallPos_X, "" )	{
	WallPos_X = 0
	WallPos_Y = 0
}
WinTitle = Trakt WallChanger
ShowCounter1<=10?Day1:=ShowCounter1:Day1:=10 ;ternary operator
ShowCounter2<=10?Day2:=ShowCounter2:Day2:=10 ;condition ? value_if_true : value_if_false
Gosub,Days
return

Days:
	Location=FanArt ;FanArt/Poster/Screen
	If Day1 > 1
	{
		WallTimer:=10
	} Else {
		WallTimer:=1440
	}
	WallTime:=(WallTimer*60000)
	Gosub,WallChanger
	SetTimer,WallChanger, %WallTime%
	SetTimer,WallGui, %WallTime%
return

WallChanger:
	Random, WallRand, 1, %Day1%
	Gosub,GetRandomInfo
	Wallpaper:=A_ScriptDir "\Ima\" WeekDate1 "\" Location "\" WallTitle ".jpg"
	DllCall( "SystemParametersInfo", UInt, 0x14,Uint,, Str, Wallpaper)
;	T := "`n# " ErrorLevel " #`n" Wallpaper "`n" WallTitle "`n" WallSE "`n" WallRand
;	ScrollBox(T)
return

;M::GoSub,WallInfo
;v::ListVars

WallInfo:
	If WallInfo = 1
	{
		WallInfo++
		VarFile("Res\Cardellos","WallInfo",WallInfo)
		Gosub,WallGui
	}Else If WallInfo = 2
	{
		WallInfo++
		VarFile("Res\Cardellos","WallInfo",WallInfo)
		Gosub,WallGui
	}Else If WallInfo = 3
	{
		WallInfo++
		VarFile("Res\Cardellos","WallInfo",WallInfo)
		Gosub,WallGui
	}Else If WallInfo = 4
	{
		Gui Destroy
		WallInfo:=0
		VarFile("Res\Cardellos","WallInfo",WallInfo)
	}Else If WallInfo = 0
	{
		WallInfo++	
		VarFile("Res\Cardellos","WallInfo",WallInfo)
		Gosub,WallGui
	}
return

WallGui:
	WinGet, XWin, ID, A 
	GoSub,GetPos
	Gui Destroy
	SysGet, VirtualWidth, 78
	If WallInfo >= 1
	{
		Gui, Font,%ShadowStyle% s21 wBold
		Gui, Add, Text, Y1 X11 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%TextStyle% s21 wBold
		Gui, Add, Text,Y0 X10 BackgroundTrans,%WallTitle% %WallSE%
	}Else If WallInfo >= 2
	{
		Gui, Font,%ShadowStyle% s21 wBold
		Gui, Add, Text, Y1 X11 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%TextStyle% s21 wBold
		Gui, Add, Text,Y0 X10 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+30 X11 BackgroundTrans,%WallRun%Min - %WallEpT%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallRun%Min - %WallEpT%
	}Else If WallInfo >= 3
	{
		Gui, Font,%ShadowStyle% s21 wBold
		Gui, Add, Text, Y1 X11 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%TextStyle% s21 wBold
		Gui, Add, Text,Y0 X10 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+30 X11 BackgroundTrans,%WallRun%Min - %WallEpT%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallRun%Min - %WallEpT%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+25 X11 BackgroundTrans,%WallAir% %WallGen%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallAir% %WallGen%
	}Else If WallInfo >= 4
	{
		Gui, Font,%ShadowStyle% s21 wBold
		Gui, Add, Text, Y1 X11 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%TextStyle% s21 wBold
		Gui, Add, Text,Y0 X10 BackgroundTrans,%WallTitle% %WallSE%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+30 X11 BackgroundTrans,%WallRun%Min - %WallEpT%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallRun%Min - %WallEpT%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+25 X11 BackgroundTrans,%WallAir% %WallGen%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallAir% %WallGen%
		Gui, Font,%ShadowStyle% s14 wNorm
		Gui, Add, Text, Yp+25 X11 BackgroundTrans,%WallNet% %Wall%
		Gui, Font,%TextStyle% s14 wNorm
		Gui, Add, Text,Yp-1 X10 BackgroundTrans,%WallNet% %Wall%
	}
	Gui +E0x80000 +HwndWallGUI +ToolWindow +LastFound -Caption -Resize -Border
	Gui, color, 123456
	WinSet, TransColor, 123456
	Gui,show,x%WallPos_x% y%WallPos_Y% W%VirtualWidth%, %WinTitle% Na
	WinActivate, ahk_id %XWin%
	WinSet, Bottom
return

GetRandomInfo:
	If WallRand = 1
	{
		global WallTitle:=Title101
		global WallSE:="s" Season101 "e" Ep101
		global WallEpT:=EpTitle101
		global WallRun:=Runtime101
		global WallNet:=Network101
		global WallGen:=Genres101
		global WallAir:=AirTime101
	}Else If WallRand = 2
	{
		global WallTitle:=Title102
		global WallSE:="s" Season102 "e" Ep102
		global WallEpT:=EpTitle102
		global WallRun:=Runtime102
		global WallNet:=Network102
		global WallGen:=Genres102
		global WallAir:=AirTime102
	
	}Else If WallRand = 3
	{
		global WallTitle:=Title103
		global WallSE:="s" Season103 "e" Ep103
		global WallEpT:=EpTitle103
		global WallRun:=Runtime103
		global WallNet:=Network103
		global WallGen:=Genres103
		global WallAir:=AirTime103
	
	}Else If WallRand = 4
	{
		global WallTitle:=Title104
		global WallSE:="s" Season104 "e" Ep104
		global WallEpT:=EpTitle104
		global WallRun:=Runtime104
		global WallNet:=Network104
		global WallGen:=Genres104
		global WallAir:=AirTime104
	
	}Else If WallRand = 5
	{
		global WallTitle:=Title105
		global WallSE:="s" Season105 "e" Ep105
		global WallEpT:=EpTitle105
		global WallRun:=Runtime105
		global WallNet:=Network105
		global WallGen:=Genres105
		global WallAir:=AirTime105
	
	}Else If WallRand = 6
	{
		global WallTitle:=Title106
		global WallSE:="s" Season106 "e" Ep106
		global WallEpT:=EpTitle106
		global WallRun:=Runtime106
		global WallNet:=Network106
		global WallGen:=Genres106
		global WallAir:=AirTime106
	
	}Else If WallRand = 7
	{
		global WallTitle:=Title107
		global WallSE:="s" Season107 "e" Ep107
		global WallEpT:=EpTitle107
		global WallRun:=Runtime107
		global WallNet:=Network107
		global WallGen:=Genres107
		global WallAir:=AirTime107
	
	}Else If WallRand = 8
	{
		global WallTitle:=Title108
		global WallSE:="s" Season108 "e" Ep108
		global WallEpT:=EpTitle108
		global WallRun:=Runtime108
		global WallNet:=Network108
		global WallGen:=Genres108
		global WallAir:=AirTime108
	
	}Else If WallRand = 9
	{
		global WallTitle:=Title109
		global WallSE:="s" Season109 "e" Ep109
		global WallEpT:=EpTitle109
		global WallRun:=Runtime109
		global WallNet:=Network109
		global WallGen:=Genres109
		global WallAir:=AirTime109
	
	}Else If WallRand = 10
	{
		global WallTitle:=Title1010
		global WallSE:="s" Season1010 "e" Ep1010
		global WallEpT:=EpTitle1010
		global WallRun:=Runtime1010
		global WallNet:=Network1010
		global WallGen:=Genres1010
		global WallAir:=AirTime1010
	}
return

VarFile(File,Where,Put,Find="",After="=",Before="`n"){
	FileRead what, %File%
	start := InStr(what, Where)
	If (start > 0)	{
		start := InStr(what, After,, start)
		If (start > 0)	{
			end := InStr(what, Before,, start)
			If (end > 0)	{
				If Not Find	{
					StringMid endPart, what, end
					StringLeft what, what, start
					what = %what%%put%%endPart%
					FileDelete, %File%
					FileAppend %what%, %File%
				}	Else	{
					StringMid endPart, what, end
					StringLeft what, what, end - 1
					what := RegExReplace(what, Find, Put,,, start)
					what = %what%%endPart%
					FileDelete, %File%
					FileAppend %what%, %File%
				}
			}	Else	{
				MsgBox 20,, Bad format of '%File%'! `n No %Before%`nAppend to the end of the file?
				IfMsgBox, Yes
					FileAppend %before%, %File%	
			}
		}	Else	{
			MsgBox 16,, Bad format of '%File%'! `n No %After%
		}
	}	Else	{
		MsgBox 20,, '%Where%' not found in '%File%'! `nDo you want to create it?
		IfMsgBox, Yes
			FileAppend %Where%%After%%Put%%before%, %File%	
	}
}

;==[Drag Window]
DragWin(){
	PostMessage, 0xA1, 2
	GoSub, GetPos
}

#IfWinActive, WinTitle
F5::
	GoSub, GetPos
	Reload
return


;==[Update]
;Update:
;	GoSub, GetPos
;	Reload
;return

Update(WP, Lp, Msg){
	If (Msg = NextWall)
		GoSub, GetPos
		Reload
}

OnExit,GetPos
ExitApp

;==[Close]
GuiClose:
	GoSub, GetPos
ExitApp

GetPos:
	VarFile("res\Cardellos","CalPos_x", CalPos_x)
	VarFile("res\Cardellos","CalPos_Y", CalPos_Y)
	WinGetPos, CalPos_x, CalPos_y,,, %WinTitle%
	VarFile("res\Cardellos","CalPos_x", CalPos_x)
	VarFile("res\Cardellos","CalPos_Y", CalPos_Y)
Return

ListLines:
ListLines
return
ListVars:
ListVars
return
Reload:
Reload
return
Edit:
Edit
return
WinSpy:
  RegRead ahkInstallDir, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
  Run %ahkInstallDir%\AU3_Spy.exe
  WinWait Active Window Info,,3
  if not ErrorLevel
    WinMove A,, A_FullNameWidth-400, 200 ; Move the window to the side a little for convenience.
return
About:
	Gui,99: color, 191919
	Gui,99: +caption +toolwindow -alwaysontop -border -Resize +LastFound
	Gui,99: Add, Picture, x545 Y1 gX99,res\X.png
	Gui,99: show, w565 h462, About
	Gui,99: font, cFF0000, Lucida console
	Gui,99: Add, Text, x-40 y10,|          /$$$$$$                                  /$$                     /$$
	Gui,99: Add, Text, xp yp+16,|         /$$__  $$                                | $$                    | $$
	Gui,99: Add, Text, xp yp+16,|        | $$  \__/  /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$$
	Gui,99: Add, Text, xp yp+16,|        | $$       /$$__  $$ /$$__  $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
	Gui,99: Add, Text, xp yp+16,|        | $$      | $$  \__/| $$$$$$$$  /$$$$$$$  | $$    | $$$$$$$$| $$  | $$
	Gui,99: Add, Text, xp yp+16,|        | $$    $$| $$      | $$_____/ /$$__  $$  | $$ /$$| $$_____/| $$  | $$
	Gui,99: Add, Text, xp yp+16,|        |  $$$$$$/| $$      |  $$$$$$$|  $$$$$$$  |  $$$$/|  $$$$$$$|  $$$$$$$
	Gui,99: Add, Text, xp yp+16,|         \______/ |__/       \_______/ \_______/   \___/   \_______/ \_______/
	Gui,99: Add, Text, xp yp+16,|
	Gui,99: Add, Text, xp yp+16,|                                    /$$
	Gui,99: Add, Text, xp yp+16,|                                   | $$
	Gui,99: Add, Text, xp yp+16,|                                   | $$$$$$$  /$$   /$$
	Gui,99: Add, Text, xp yp+16,|                                   | $$__  $$| $$  | $$
	Gui,99: Add, Text, xp yp+16,|                                   | $$  \ $$| $$  | $$
	Gui,99: Add, Text, xp yp+16,|                                   | $$  | $$| $$  | $$
	Gui,99: Add, Text, xp yp+16,|                                   | $$$$$$$/|  $$$$$$$
	Gui,99: Add, Text, xp yp+16,|                                   |_______/  \____  $$
	Gui,99: Add, Text, xp yp+16,|                                              /$$  | $$
	Gui,99: Add, Text, xp yp+16,|                                             |  $$$$$$/
	Gui,99: Add, Text, xp yp+16,|                                              \______/
	Gui,99: Add, Text, xp yp+16,|        /$$$$$$                            /$$           /$$ /$$
	Gui,99: Add, Text, xp yp+16,|       /$$__  $$                          | $$          | $$| $$
	Gui,99: Add, Text, xp yp+16,|      | $$  \__/  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$ | $$| $$  /$$$$$$   /$$$$$$$
	Gui,99: Add, Text, xp yp+16,|      | $$       |____  $$ /$$__  $$ /$$__  $$ /$$__  $$| $$| $$ /$$__  $$ /$$_____/
	Gui,99: Add, Text, xp yp+16,|      | $$        /$$$$$$$| $$  \__/| $$  | $$| $$$$$$$$| $$| $$| $$  \ $$|  $$$$$$
	Gui,99: Add, Text, xp yp+16,|      | $$    $$ /$$__  $$| $$      | $$  | $$| $$_____/| $$| $$| $$  | $$ \____  $$
	Gui,99: Add, Text, xp yp+16,|      |  $$$$$$/|  $$$$$$$| $$      |  $$$$$$$|  $$$$$$$| $$| $$|  $$$$$$/ /$$$$$$$/
	Gui,99: Add, Text, xp yp+16,|       \______/  \_______/|__/       \_______/ \_______/|__/|__/ \______/ |_______/
return
X99:
	Gui,99:destroy
return
