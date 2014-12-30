/*
idle time = monitor off
*/


#NoEnv
SendMode Input
#NoTrayIcon
#persistent
#SingleInstance Force
Menu, Tray, Icon,res\icon\logo.ico
#Include Res\Var
;#Include Res\gdip.ahk
#Include Res\Cardellos
#Include Res\Win.ahk
(CalPos_x = "")?CalPos_X:=LCalPos_X:LCalPos_X:=CalPos_X
(CalPos_y = "")?CalPos_Y:=LCalPos_Y:LCalPos_Y:=CalPos_Y
(CalPos_x = "")?CalPos_X:=0
(CalPos_y = "")?CalPos_Y:=0
; Main GUI
GoSub,Variables
ShowCounter1<=10?Day1:=ShowCounter1:Day1:=10 ;ternary operator
ShowCounter2<=10?Day2:=ShowCounter2:Day2:=10 ;condition ? value_if_true : value_if_false
Gosub,Days
OnMessage(0x201, "DragWin")
If ShowTask = 1
{
	Gui +E0x40000
}
Gui +E0x80000 +HwndCalGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
Gui, color, 123456
WinSet, TransColor, 123456
Gui,show,x%CalPos_x% y%CalPos_Y% H%GuiH%, %WinTitle%
RETURN

Go:
	GuiControl, -Redraw, CalGUI
	If Day1 > 0
	{
		Day1=0
	}Else{
		Day1=%ShowCounter1%
	}
	GuiControl, +Redraw, CalGUI
return

Days:
	GoSub,Top
	GoSub,Day1
	GoSub,Day2
	if (Day1 > 0) AND (Min1 = 0)
	{
		If (Day2 > 0) AND (Min2 = 0)
		{
			GuiH:=75+(Day1*55)+25+(Day2*55)+30
			BY:=GuiH-30
		} 
		Else If (Day2 = 0) AND (Min2 = 1)
		{
			GuiH:=75+(Day1*55)+55
			BY:=GuiH-30
		}
		Else If (Day2 = 0) AND (Min2 = 0)
		{
			GuiH:=75+(Day1*55)+30
			BY:=GuiH-30
		}
	} 
	Else If (Day1 = 0) AND (Min1 = 0)
	{
		GuiH:=75
		BY:=GuiH-25
	}
	Else If (Day1 = 0) AND (Min1 = 1)
	{
		If (Day2 > 0) AND (Min2 = 0)
		{
			GuiH:=75+25+(Day2*55)+30
			BY:=GuiH-30
		} 
		Else If (Day2 = 0) AND (Min2 = 1)
		{
			GuiH:=75+25+(Day2*55)+30
			BY:=GuiH-30
		} 
		Else If (Day2 = 0) AND (Min2 = 0)
		{
			GuiH:=75+30
			BY:=GuiH-30
		}
	}
	GoSub,Bottom
	GoSub,MouseOver
return

Top:
	Gui, Margin, x0 y0
	Gui, Add, Picture,Y0 X0 0x4000000,Res\BG\Top_400x25.png
	Gui, Add, Picture,Y1 x360 H24 W24 BackgroundTrans v g,Ima\%User%.png
	Gui, Font,%TextStyle% 
	Gui, Add, Text, Y0 X260 W100       BackgroundTrans v g Right,%User%
	Gui, Add, Picture,Y1 X2 H24 W24    BackgroundTrans v g,Res\Icon\gear.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 BackgroundTrans vRefresh gUpdate,Res\Icon\Refresh.png
	SetCursor_("HAND","Static5")
;	Ext_Cursor(Refresh, Hand)
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Wall_Next.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Wall_Info.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Notifier.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\OL_a45.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Progress.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Discover.png
	Gui, Add, Picture,Y1 Xp+26 H24 W24 Hidden BackgroundTrans v g,Res\Icon\Watch.png
	Gui, Add, Picture,Y25 X0 W400 H25 0x4000000,Res\BG\Blue_B_400x25.png
Return

Day1:
	If (Day1 > 0) AND (Min1 = 0)
	{
		Gui, Add, Picture,Y50 X0 w400 h25 0x4000000,Res\BG\Day_400x25.png
		Gui, Add, Text, Y50 X4 BackgroundTrans,%WeekDate1% %Date100%
		Gui, Add, Picture,Y50 X370 w25 h25 BackgroundTrans gDay1Togg ,Res\Icon\Button_External_Down.png
		SetCursor_("HAND","Static16")
		Loop %Day1%
		{
			If A_Index = 1
			{
				XD1=25
			}
			Else if A_Index > 1
			{
				XD1=50
			}
			AirTime:=AirTime10%A_Index%
			Title:=Title10%A_Index%
			Season:=Season10%A_Index%
			Ep:=Ep10%A_Index%
			SE= s%Season%e%Ep%
			Gui, Add, Picture, Yp+%XD1% X0 W400 H55 0x4000000 BackgroundTrans Hwnd10%A_Index%1 v10%A_Index%1, Res\BG\Middle_400x55.png
			Gui, Font, s18 cD1E751 ,serif
			Gui, Add, Text, Yp+13 X40  BackgroundTrans Center Hwnd10%A_Index%2 v10%A_Index%2,% AirTime
			Gui, Add, Picture, Yp-8 X140 W255 H45 Hwnd10%A_Index%3 v10%A_Index%3, Ima\%WeekDate1%\Banner\%Title%.jpg
			StringLen, ProgBG, SE
			ProgBG:=(ProgBG*7)+8
			Gui, Add, Progress, yp+33 Xp w%ProgBG% H12 Background008FBB Hwnd10%A_Index%4 v10%A_Index%4
			Gui, Font, s10 cFFFFFF, Droid Sans
			Gui, Add, Text, Yp-2 Xp-1 Wp BackgroundTrans Right Hwnd10%A_Index%5 v10%A_Index%5, % SE
			Gui, Add, Picture, Yp-36 X0  W400 H55 Hidden BackgroundTrans Hwnd10%A_Index%8 v10%A_Index%8, Res\BG\Over_T_400x55.png
			Gui, Add, Picture, Yp+31 X3 w20 h20 BackgroundTrans g10%A_Index%6 Hwnd10%A_Index%6, Res\Icon\Plus.png
			Gui, Add, Picture, Yp-26 X140 W255 H45 BackgroundTrans Hwnd10%A_Index%7 v10%A_Index%7, Res\Overlay\Linen_L_Rounded_200x50.png
			Gui, Add, Picture, Yp X4    w25 h25 Hidden BackgroundTrans g10%A_Index%8a v10%A_Index%8a, Res\Icon\Circle_Check-in.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans g10%A_Index%8b v10%A_Index%8b, Res\Icon\Circle_Torrent_White.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans g10%A_Index%8c v10%A_Index%8c, Res\Icon\Circle_More_White.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans g10%A_Index%8d v10%A_Index%8d, Res\Icon\Circle_Full_White.png
			Gui, Add, Text, Yp X140 W255 H45 Hidden BackgroundTrans v10%A_Index%9 , % EpTitle10%A_Index% "`n" RunTime10%A_Index% " Mins @ " NetWork10%A_Index% " From " Country10%A_Index%
			St=%A_Index%
			Static6=Static
			Static6.=(St*12)+10
			SetCursor_("HAND",Static6)
			Static8a=Static
			Static8a.=(St*12)+12
			SetCursor_("HAND",Static8a)
			Static8b=Static
			Static8b.=(St*12)+13
			SetCursor_("HAND",Static8b)
		}
	}
	Else If (Day1 = 0) AND (Min1 = 1)
	{
		Gui, Add, Picture,Y50 X0 w400 h25 0x4000000,Res\BG\Day_400x25.png
		Gui, Add, Text, Y50 X4 BackgroundTrans,%WeekDate1% %Date100%
		Gui, Add, Picture,Y50 X370 w25 h25 BackgroundTrans gDay1Togg ,Res\Icon\Button_External_Down.png
		SetCursor_("HAND","Static16")
	}
Return

1018a:
	Run %EpURL101%
return

1018b:
	Run %TorSearch%%WebTitle101%
return

1018c:
return

1018d:
return

1028a:
	Run %EpURL102%
return

1028b:
	Run %TorSearch%%WebTitle102%
return

1028c:
return

1028d:
return

1038a:
	Run %EpURL103%
return

1038b:
	Run %TorSearch%%WebTitle103%
return

1038c:
return

1038d:
return

1048a:
	Run %EpURL104%
return

1048b:
	Run %TorSearch%%WebTitle104%
return

1048c:
return

1048d:
return

1058a:
	Run %EpURL105%
return

1058b:
	Run %TorSearch%%WebTitle105%
return

1058c:
return

1058d:
return

1068a:
	Run %EpURL106%
return

1068b:
	Run %TorSearch%%WebTitle106%
return

1068c:
return

1068d:
return

1078a:
	Run %EpURL107%
return

1078b:
	Run %TorSearch%%WebTitle107%
return

1078c:
return

1078d:
return

1088a:
	Run %EpURL108%
return

1088b:
	Run %TorSearch%%WebTitle108%
return

1088c:
return

1088d:
return

1098a:
	Run %EpURL109%
return

1098b:
	Run %TorSearch%%WebTitle109%
return

1098c:
return

1098d:
return

10108a:
	Run %EpURL1010%
return

10108b:
	Run %TorSearch%%WebTitle1010%
return

10108c:
return

10108d:
return

Day1Togg:
	iF Day1 > 0
	{
		Day1:=0
		Min1:=1
		Gui, destroy
		GoSub, Days
		OnMessage(0x201, "DragWin")
		If ShowTask = 1
		{
			Gui +E0x40000
		}
		Gui +E0x80000 +HwndCalGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
		Gui, color, 123456
		WinSet, TransColor, 123456
		Gui,show,x%CalPos_x% y%CalPos_Y% H%GuiH%, %WinTitle%
	} Else {
		Day1:=ShowCounter1
		Min1:=0
		Gui, destroy
		GoSub, Days
		OnMessage(0x201, "DragWin")
		If ShowTask = 1
		{
			Gui +E0x40000
		}
		Gui +E0x80000 +HwndCalGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
		Gui, color, 123456
		WinSet, TransColor, 123456
		Gui,show,x%CalPos_x% y%CalPos_Y% H%GuiH%, %WinTitle%
	}
return

1016:
	1018t:=!1018t
	guiControl, % ( 1018t ) ? "hide":"show", 1018
	guiControl, % ( 1018t ) ? "hide":"show", 1018a
	guiControl, % ( 1018t ) ? "hide":"show", 1018b
	guiControl, % ( 1018t ) ? "hide":"show", 1018c
	guiControl, % ( 1018t ) ? "hide":"show", 1018d
	guiControl, % ( 1018t ) ? "hide":"show", 1019
return
1026:
	1028t:=!1028t
	guiControl, % ( 1028t ) ? "hide":"show", 1028
	guiControl, % ( 1028t ) ? "hide":"show", 1028a
	guiControl, % ( 1028t ) ? "hide":"show", 1028b
	guiControl, % ( 1028t ) ? "hide":"show", 1028c
	guiControl, % ( 1028t ) ? "hide":"show", 1028d
	guiControl, % ( 1028t ) ? "hide":"show", 1029
return
1036:
	1038t:=!1038t
	guiControl, % ( 1038t ) ? "hide":"show", 1038
	guiControl, % ( 1038t ) ? "hide":"show", 1038a
	guiControl, % ( 1038t ) ? "hide":"show", 1038b
	guiControl, % ( 1038t ) ? "hide":"show", 1038c
	guiControl, % ( 1038t ) ? "hide":"show", 1038d
	guiControl, % ( 1038t ) ? "hide":"show", 1039
return
1046:
	1048t:=!1048t
	guiControl, % ( 1048t ) ? "hide":"show", 1048
	guiControl, % ( 1048t ) ? "hide":"show", 1048a
	guiControl, % ( 1048t ) ? "hide":"show", 1048b
	guiControl, % ( 1048t ) ? "hide":"show", 1048c
	guiControl, % ( 1048t ) ? "hide":"show", 1048d
	guiControl, % ( 1048t ) ? "hide":"show", 1049
return
1056:
	1058t:=!1058t
	guiControl, % ( 1058t ) ? "hide":"show", 1058
	guiControl, % ( 1058t ) ? "hide":"show", 1058a
	guiControl, % ( 1058t ) ? "hide":"show", 1058b
	guiControl, % ( 1058t ) ? "hide":"show", 1058c
	guiControl, % ( 1058t ) ? "hide":"show", 1058d
	guiControl, % ( 1058t ) ? "hide":"show", 1059
return
1066:
	1068t:=!1068t
	guiControl, % ( 1068t ) ? "hide":"show", 1068
	guiControl, % ( 1068t ) ? "hide":"show", 1068a
	guiControl, % ( 1068t ) ? "hide":"show", 1068b
	guiControl, % ( 1068t ) ? "hide":"show", 1068c
	guiControl, % ( 1068t ) ? "hide":"show", 1068d
	guiControl, % ( 1068t ) ? "hide":"show", 1069
return
1076:
	1078t:=!1078t
	guiControl, % ( 1078t ) ? "hide":"show", 1078
	guiControl, % ( 1078t ) ? "hide":"show", 1078a
	guiControl, % ( 1078t ) ? "hide":"show", 1078b
	guiControl, % ( 1078t ) ? "hide":"show", 1078c
	guiControl, % ( 1078t ) ? "hide":"show", 1078d
	guiControl, % ( 1078t ) ? "hide":"show", 1079
return
1086:
	1088t:=!1088t
	guiControl, % ( 1088t ) ? "hide":"show", 1088
	guiControl, % ( 1088t ) ? "hide":"show", 1088a
	guiControl, % ( 1088t ) ? "hide":"show", 1088b
	guiControl, % ( 1088t ) ? "hide":"show", 1088c
	guiControl, % ( 1088t ) ? "hide":"show", 1088d
	guiControl, % ( 1088t ) ? "hide":"show", 1089
return
1096:
	1098t:=!1098t
	guiControl, % ( 1098t ) ? "hide":"show", 1098
	guiControl, % ( 1098t ) ? "hide":"show", 1098a
	guiControl, % ( 1098t ) ? "hide":"show", 1098b
	guiControl, % ( 1098t ) ? "hide":"show", 1098c
	guiControl, % ( 1098t ) ? "hide":"show", 1098d
	guiControl, % ( 1098t ) ? "hide":"show", 1099
return
10106:
	10108t:=!10108t
	guiControl, % ( 10108t ) ? "hide":"show", 10108
	guiControl, % ( 10108t ) ? "hide":"show", 10108a
	guiControl, % ( 10108t ) ? "hide":"show", 10108b
	guiControl, % ( 10108t ) ? "hide":"show", 10108c
	guiControl, % ( 10108t ) ? "hide":"show", 10108d
	guiControl, % ( 10108t ) ? "hide":"show", 10109
return

Day2:
	If (Day2 > 0) AND (Min2 = 0)
	{
		YD2:=(Day1*55)+75
		Gui, Font,%TextStyle%
		Gui, Add, Picture,Y%YD2% X0 w400 h25 0x4000000,Res\BG\Day_400x25.png
		Gui, Add, Text, Yp X4 BackgroundTrans,%WeekDate2% %Date200%
		Gui, Add, Picture,Yp X370 w25 h25 BackgroundTrans gDay2Togg ,Res\Icon\Button_External_Down.png
		SetCursor_("HAND","Static103")
		Loop %Day2%
		{
			If A_Index = 1
			{
				XD2=25
			}
			Else if A_Index > 1
			{
				XD2=50
			}
			AirTime:=AirTime20%A_Index%
			Title:=Title20%A_Index%
			Season:=Season20%A_Index%
			Ep:=Ep20%A_Index%
			SE:= "s" Season "e" EP
			Gui, Add, Picture, Yp+%XD2% X0 W400 H55 0x4000000 v20%A_Index%1, Res\BG\Middle_400x55.png
			Gui, Font, s18 cD1E751 ,serif
			Gui, Add, Text, Yp+13 X40  BackgroundTrans Center v20%A_Index%2,% AirTime
			Gui, Add, Picture, Yp-8 X140 W255 H45 v20%A_Index%3, Ima\%Weekdate2%\Banner\%Title%.jpg
			StringLen, ProgBG, SE
			ProgBG:=(ProgBG*7)+8
			Gui, Add, Progress, yp+33 Xp w%ProgBG% H12 Background008FBB v20%A_Index%4
			Gui, Font, s10 cFFFFFF, Droid Sans
			Gui, Add, Text, Yp-2 Xp-1 Wp BackgroundTrans Right v20%A_Index%5, % SE
			Gui, Add, Picture, Yp-36 X0  W400 H55 Hidden BackgroundTrans Hwnd20%A_Index%8 v20%A_Index%8, Res\BG\Over_T_400x55.png
			Gui, Add, Picture, Yp+31 X3 w20 h20 BackgroundTrans g20%A_Index%6 v20%A_Index%6, Res\Icon\Plus.png
			Gui, Add, Picture, Yp-26 X140 W255 H45 BackgroundTrans Hwnd20%A_Index%7 v20%A_Index%7, Res\Overlay\Linen_L_Rounded_200x50.png
			Gui, Add, Picture, Yp X4 w25 h25 Hidden BackgroundTrans Hwnd20%A_Index%8a v20%A_Index%8a, Res\Icon\Circle_Check-in.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans Hwnd20%A_Index%8b v20%A_Index%8b, Res\Icon\Circle_Torrent_White.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans Hwnd20%A_Index%8c v20%A_Index%8c, Res\Icon\Circle_More_White.png
			Gui, Add, Picture, Yp Xp+27 w25 h25 Hidden BackgroundTrans Hwnd20%A_Index%8d v20%A_Index%8d, Res\Icon\Circle_Full_White.png
			Gui, Add, Text, Yp X140 W255 H45 Hidden BackgroundTrans v20%A_Index%9 , % EpTitle20%A_Index% "`n" RunTime20%A_Index% " Mins @ " NetWork20%A_Index% " From " Country20%A_Index%
			St=%A_Index%
			Static6=Static
			Static6.=(St*12)+109-12
			SetCursor_("HAND",Static6)
			Static8a=Static
			Static8a.=(St*12)+111-12
			SetCursor_("HAND",Static8a)
			Static8b=Static
			Static8b.=(St*12)+112-12
			SetCursor_("HAND",Static8b)
		}
	}
	Else If (Day2 = 0) AND (Min2 = 1)
	{
		YD2:=(Day1*55)+75
		Gui, Font,%TextStyle%
		Gui, Add, Picture,Y%YD2% X0 w400 h25 0x4000000,Res\BG\Day_400x25.png
		Gui, Add, Text, Yp X4 BackgroundTrans,%WeekDate2% %Date200%
		Gui, Add, Picture,Yp X370 w25 h25 BackgroundTrans gDay2Togg ,Res\Icon\Button_External_Down.png
		SetCursor_("HAND","Static96")
	}
Return

2018a:
	Run %EpURL201%
return

2018b:
	Run %TorSearch%%WebTitle201%
return

2018c:
return

2018d:
return

2028a:
	Run %EpURL202%
return

2028b:
	Run %TorSearch%%WebTitle202%
return

2028c:
return

2028d:
return

2038a:
	Run %EpURL203%
return

2038b:
	Run %TorSearch%%WebTitle203%
return

2038c:
return

2038d:
return

2048a:
	Run %EpURL204%
return

2048b:
	Run %TorSearch%%WebTitle204%
return

2048c:
return

2048d:
return

2058a:
	Run %EpURL205%
return

2058b:
	Run %TorSearch%%WebTitle205%
return

2058c:
return

2058d:
return

2068a:
	Run %EpURL206%
return

2068b:
	Run %TorSearch%%WebTitle206%
return

2068c:
return

2068d:
return

2078a:
	Run %EpURL207%
return

2078b:
	Run %TorSearch%%WebTitle207%
return

2078c:
return

2078d:
return

2088a:
	Run %EpURL208%
return

2088b:
	Run %TorSearch%%WebTitle208%
return

2088c:
return

2088d:
return

2098a:
	Run %EpURL209%
return

2098b:
	Run %TorSearch%%WebTitle209%
return

2098c:
return

2098d:
return

20108a:
	Run %EpURL2010%
return

20108b:
	Run %TorSearch%%WebTitle2010%
return

20108c:
return

20108d:
return

Day2Togg:
	iF Day2 > 0
	{
		Day2:=0
		Min2:=1
		Gui, destroy
		GoSub, Days
		OnMessage(0x201, "DragWin")
		If ShowTask = 1
		{
			Gui +E0x40000
		}
		Gui +E0x80000 +HwndCalGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
		Gui, color, 123456
		WinSet, TransColor, 123456
		Gui,show,x%CalPos_x% y%CalPos_Y% H%GuiH%, %WinTitle%
	} Else {
		Day2:=ShowCounter2
		Min2:=0
		Gui, destroy
		GoSub, Days
		OnMessage(0x201, "DragWin")
		If ShowTask = 1
		{
			Gui +E0x40000
		}
		Gui +E0x80000 +HwndCalGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
		Gui, color, 123456
		WinSet, TransColor, 123456
		Gui,show,x%CalPos_x% y%CalPos_Y% H%GuiH%, %WinTitle%
	}
return

2016:
	2018t:=!2018t
	guiControl, % ( 2018t ) ? "hide":"show", 2018
	guiControl, % ( 2018t ) ? "hide":"show", 2018a
	guiControl, % ( 2018t ) ? "hide":"show", 2018b
	guiControl, % ( 2018t ) ? "hide":"show", 2018c
	guiControl, % ( 2018t ) ? "hide":"show", 2018d
	guiControl, % ( 2018t ) ? "hide":"show", 2019
return
2026:
	2028t:=!2028t
	guiControl, % ( 2028t ) ? "hide":"show", 2028
	guiControl, % ( 2028t ) ? "hide":"show", 2028a
	guiControl, % ( 2028t ) ? "hide":"show", 2028b
	guiControl, % ( 2028t ) ? "hide":"show", 2028c
	guiControl, % ( 2028t ) ? "hide":"show", 2028d
	guiControl, % ( 2028t ) ? "hide":"show", 2029
return
2036:
	2038t:=!2038t
	guiControl, % ( 2038t ) ? "hide":"show", 2038
	guiControl, % ( 2038t ) ? "hide":"show", 2038a
	guiControl, % ( 2038t ) ? "hide":"show", 2038b
	guiControl, % ( 2038t ) ? "hide":"show", 2038c
	guiControl, % ( 2038t ) ? "hide":"show", 2038d
	guiControl, % ( 2038t ) ? "hide":"show", 2039
return
2046:
	2048t:=!2048t
	guiControl, % ( 2048t ) ? "hide":"show", 2048
	guiControl, % ( 2048t ) ? "hide":"show", 2048a
	guiControl, % ( 2048t ) ? "hide":"show", 2048b
	guiControl, % ( 2048t ) ? "hide":"show", 2048c
	guiControl, % ( 2048t ) ? "hide":"show", 2048d
	guiControl, % ( 2048t ) ? "hide":"show", 2049
return
2056:
	2058t:=!2058t
	guiControl, % ( 2058t ) ? "hide":"show", 2058
	guiControl, % ( 2058t ) ? "hide":"show", 2058a
	guiControl, % ( 2058t ) ? "hide":"show", 2058b
	guiControl, % ( 2058t ) ? "hide":"show", 2058c
	guiControl, % ( 2058t ) ? "hide":"show", 2058d
	guiControl, % ( 2058t ) ? "hide":"show", 2059
return
2066:
	2068t:=!2068t
	guiControl, % ( 2068t ) ? "hide":"show", 2068
	guiControl, % ( 2068t ) ? "hide":"show", 2068a
	guiControl, % ( 2068t ) ? "hide":"show", 2068b
	guiControl, % ( 2068t ) ? "hide":"show", 2068c
	guiControl, % ( 2068t ) ? "hide":"show", 2068d
	guiControl, % ( 2068t ) ? "hide":"show", 2069
return
2076:
	2078t:=!2078t
	guiControl, % ( 2078t ) ? "hide":"show", 2078
	guiControl, % ( 2078t ) ? "hide":"show", 2078a
	guiControl, % ( 2078t ) ? "hide":"show", 2078b
	guiControl, % ( 2078t ) ? "hide":"show", 2078c
	guiControl, % ( 2078t ) ? "hide":"show", 2078d
	guiControl, % ( 2078t ) ? "hide":"show", 2079
return
2086:
	2088t:=!2088t
	guiControl, % ( 2088t ) ? "hide":"show", 2088
	guiControl, % ( 2088t ) ? "hide":"show", 2088a
	guiControl, % ( 2088t ) ? "hide":"show", 2088b
	guiControl, % ( 2088t ) ? "hide":"show", 2088c
	guiControl, % ( 2088t ) ? "hide":"show", 2088d
	guiControl, % ( 2088t ) ? "hide":"show", 2089
return
2096:
	2098t:=!2098t
	guiControl, % ( 2098t ) ? "hide":"show", 2098
	guiControl, % ( 2098t ) ? "hide":"show", 2098a
	guiControl, % ( 2098t ) ? "hide":"show", 2098b
	guiControl, % ( 2098t ) ? "hide":"show", 2098c
	guiControl, % ( 2098t ) ? "hide":"show", 2098d
	guiControl, % ( 2098t ) ? "hide":"show", 2099
return
20106:
	20108t:=!20108t
	guiControl, % ( 20108t ) ? "hide":"show", 20108a
	guiControl, % ( 20108t ) ? "hide":"show", 20108
	guiControl, % ( 20108t ) ? "hide":"show", 20108b
	guiControl, % ( 20108t ) ? "hide":"show", 20108c
	guiControl, % ( 20108t ) ? "hide":"show", 20108d
	guiControl, % ( 20108t ) ? "hide":"show", 20109
return

Bottom:
	Gui, Add, Picture,Y%BY% X0 w400 h25 0x4000000,Res\BG\Bottom_400x25.png
	Gui, Add, Picture,Yp X167 w63 h25 BackgroundTrans ,Res\Icon\Logo_Top.png
	Gui, Add, Picture,Yp X368 H24 W24 BackgroundTrans v g,Res\Icon\List.png
	Gui, Add, Picture,Yp Xp-27 H24 W24 BackgroundTrans v g,Res\Icon\Trending.png
	Gui, Font,%TimeStyle% 
	Gui, Add, Text , Yp+2 X38 BackgroundTrans vClock g, %A_Hour%:%A_Min%:%A_Sec%
	SetTimer, UpdateOSD, 1000
return

Variables:
	WinTitle = Trakt Calendar
	Min1:=0
	Min2:=0
	1018t=1
	1028t=1
	1038t=1
	1048t=1
	1058t=1
	1068t=1
	1078t=1
	1088t=1
	1098t=1
	10108t=1
	2018t=1
	2028t=1
	2038t=1
	2048t=1
	2058t=1
	2068t=1
	2078t=1
	2088t=1
	2098t=1
	20108t=1
return

SetCursor_(wparam, lparam="", msg=0, hwnd=0) { 
   static WM_SETCURSOR := 0x20, WM_MOUSEMOVE := 0x200 
   static APPSTARTING := 32650,HAND := 32649 ,ARROW := 32512,CROSS := 32515 ,IBEAM := 32513 ,NO := 32648 ,SIZE := 32640 ,SIZEALL := 32646 ,SIZENESW := 32643 ,SIZENS := 32645 ,SIZENWSE := 32642 ,SIZEWE := 32644 ,UPARROW := 32516 ,WAIT := 32514 
   static SIZEWE_BIG := 32653, SIZEALL_BIG := 32654, SIZEN_BIG := 32655, SIZES_BIG := 32656, SIZEW_BIG := 32657, SIZEE_BIG := 32658, SIZENW_BIG := 32659, SIZENE_BIG := 32660, SIZESW_BIG := 32661, SIZESE_BIG := 32662
   static hover, curOld=32512, cursor, ctrls="`n", init 

   if !init
      init := 1, OnMessage(WM_SETCURSOR, "SetCursor_"),  OnMessage(WM_MOUSEMOVE, "SetCursor_") 

   if A_Gui = 
   { 
      if wparam is not Integer 
            If InStr( wparam, ".cur" ) || InStr( wparam, ".ani" ) {   ;LoadCursorFromFile 
                 IfNotExist, % WPARAM  ; verify existance 
                    return 
                 cursor := DllCall("LoadCursorFromFile", "Str", WPARAM) 
            } 
            Else cursor := DllCall("LoadCursor", "Uint", 0, "Int", %WPARAM%, "Uint") 

      if lparam = 
            curOld := cursor 
      else  ctrls .= lparam "=" cursor "`n" 
   } 

   If (msg = WM_SETCURSOR) 
      ifEqual, hover, 1,   return 1 

   if (msg = WM_MOUSEMOVE) 
   { 
      MouseGetPos, ,,,c 
      If j := InStr(ctrls, "`n" c "=") 
      { 
         hover := true, 
         j += 2+StrLen(c) 
         j := SubStr(ctrls, j, InStr(ctrls, "`n", 0, j)-j+1) 
         DllCall("SetCursor", "uint",j) 
      } 
      else DllCall("SetCursor", "uint", curOld), hover := "" 
   } 
    
} 

MouseOver:
	/* Send Message
	WM_MOUSEHOVER = 0x2A1
	WM_NCMOUSELEAVE = 0x2A2
	WM_MOUSELEAVE = 0x2A3
	*/
	Gui, Add, Picture,Y20 Hidden X0 w400 h25 0x4000000,Res\BG\Linen_D_Border_H_400x25.png		
	Day2y2:=Day2y-10
	Gui, Add, Picture,Y+%Day2y2% Hidden X0 w400 h45 0x4000000,Res\BG\Linen_D_Border_H_400x25.png
return

Go2:
	UrlDownloadToFile, http://api.trakt.tv/user/calendar/shows.json/2277992484be345a27434d632f0d4230/%User%/today/2 ,%Info%.json
return

UpdateOSD:
FormatTime, TimeString,, ddd HH:mm:ss
GuiControl,, Clock, %A_Hour%:%A_Min%:%A_Sec%
return

;==[Drag Window]
DragWin(){
	PostMessage, 0xA1, 2
	GoSub, GetPos
}

;==[Update]
Update:
	GoSub, GetPos
	Reload
return

OnExit,GetPos
ExitApp

;==[Close]
GuiClose:
exit_:
	GoSub, GetPos
;	SelectObject(hdc, obm)
;	DeleteObject(hbm)
;	DeleteDC(hdc)
;	Gdip_DeleteGraphics(pGraphics)
;	Gdip_Shutdown(pToken)
ExitApp

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

GetPos:
	VarFile("res\Cardellos","CalPos_x", CalPos_x)
	VarFile("res\Cardellos","CalPos_Y", CalPos_Y)
	WinGetPos, CalPos_x, CalPos_y,,, %WinTitle%
	VarFile("res\Cardellos","CalPos_x", CalPos_x)
	VarFile("res\Cardellos","CalPos_Y", CalPos_Y)
Return

;SETTINGS by gahks
snap_prox = 15 ;in px
reaction_speed = 100 ;in ms
;Window snapper code
SysGet, screen, MonitorWorkArea
Loop
{
WinGetActiveStats, title_act, w_act, h_act, x_act, y_act ;active window title and dimensions
If (w_act < screenright-snap_prox)
{
If (x_act > screenleft-snap_prox AND x_act < screenleft OR x_act < screenleft+snap_prox AND x_act > screenleft)
	WinMove, %title_act%,, screenLeft
If (x_act + w_act > screenright-snap_prox AND x_act + w_act < screenright OR x_act + w_act < screenright+snap_prox AND x_act + w_act > screenright)
	WinMove, %title_act%,, (screenright-w_act)
}
If (h_act < screenbottom-snap_prox)
{
If (y_act > screentop-snap_prox AND y_act < screentop OR y_act < screentop+snap_prox AND y_act > screentop)
	WinMove, %title_act%,,, screentop
If (y_act + h_act > screenbottom-snap_prox AND y_act + h_act  < screenbottom OR y_act + h_act < screenbottom+snap_prox AND y_act + h_act > screenbottom)
	WinMove, %title_act%,,, (screenbottom-h_act)
}
Sleep, %reaction_speed%
}

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
