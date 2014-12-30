#NoEnv
#NoTrayIcon
Menu, Tray, Icon,res\icon\logo.ico
SendMode Input
#persistent
#SingleInstance Force
WinTitle = Discover
OnMessage(0x201, "DragWin")
GoSub,Vars
GoSub,GetFile
return

Vars:
	DiscURL=http://api.trakt.tv/calendar/shows.json/2277992484be345a27434d632f0d4230/today
	GetDay=siU)(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*(?(?=.*\{\"date\").*\{\"date\"\:(.*)\}\]\}).*
	GetCounter={"show":{
	GetDated=(?(?=.*\{\"date\").*\{\"date\"\:\"(.*)-(.*)-(.*)\",).*
	GetTitled=(?(?=.*\{\"Title\").*\{\"title\"\:\"(.*)\",).*
	GetShowURLd=(?(?=.*\"url\").*\"year\"\:.*,\"url\"\:\"(.*)\",).*
	GetCountryd=(?(?=.*\"country\").*\"country\"\:(.*),).*
	GetOverviewd=(?(?=.*\"overview\").*\"Country\"\:.*,\"overview\"\:\"(.*)\",).*
	GetRuntimed=(?(?=.*\"runtime\").*\"runtime\"\:(.*),).*
	GetNetworkd=(?(?=.*\"network\").*\"network\"\:\"(.*)\",).*
	GetGenresd=(?(?=.*\"genres\").*\"genres\"\:\[(.*)\]).*
	GetSeasond=(?(?=.*\"season\").*\"season\"\:(.*),).*
	GetEpd=(?(?=.*\"number\").*\"number\"\:(.*),).*
	GetFanartd=(?(?=.*\"fanart\").*\"fanart\"\:\"(.*)\",).*
	Page:=0
return

GetFile:
	Disc = %A_ScriptDir%\Info\%A_DDDD%\Discover.Json
	ToolTip, Downloading
	UrlDownloadToFile, %DiscURL%?%A_Hour%%A_Min% ,%Disc%
	FileRead, FullDisc, %Disc%
	RegExMatch(FullDisc,GetDay,Day)
	StringSplit,Day,A_LoopField,`}`]`}
	ToolTip, Counting
	StringReplace,Day,Day,%GetCounter%,%GetCounter%,UseErrorLevel
	ShowCounterd = %ErrorLevel%
	LastPage:=Ceil(ShowCounterd/5)
	ToolTip, Dating
	RegExMatch(FullDisc,"siU)"GetDated,Dated)
	StringSplit,Dated,A_LoopField,`,
	FormatTime,Dated,%Dated1%%Dated2%%Dated3%,dddd MMMM dd, yyyy
	FormatTime,WeekDated,%Dated1%%Dated2%%Dated3%,dddd
	ToolTip, Titling
	GetTitles:=Repeat(GetTitled,ShowCounterd)
	RegExMatch(Day,"siU)"GetTitles,Titled)
	StringSplit,Titled,A_LoopField,
	ToolTip, Show URLing
	GetShowURLs:=Repeat(GetShowURLD,ShowCounterd)
	RegExMatch(Day,"siU)"GetShowURLs,ShowURLd)
	StringSplit,ShowURLd,A_LoopField,
	ToolTip, Countrying
	GetCountrys:=Repeat(GetCountryD,ShowCounterd)
	RegExMatch(Day,"siU)"GetCountrys,Countryd)
	StringSplit,Countryd,A_LoopField,
	ToolTip, Overviewing
	GetOverviews:=Repeat(GetOverviewD,ShowCounterd)
	RegExMatch(Day,"siU)"GetOverviews,Overviewd)
	StringSplit,Overviewd,A_LoopField,
	ToolTip, Runtiming
	GetRuntimes:=Repeat(GetRuntimeD,ShowCounterd)
	RegExMatch(Day,"siU)"GetRuntimes,Runtimed)
	StringSplit,Runtimed,A_LoopField,
	ToolTip, NetWorking
	GetNetworks:=Repeat(GetNetworkD,ShowCounterd)
	RegExMatch(Day,"siU)"GetNetworks,Networkd)
	StringSplit,Networkd,A_LoopField,
	ToolTip, Genring
	GetGenress:=Repeat(GetGenresD,ShowCounterd)
	RegExMatch(Day,"siU)"GetGenress,Genresd)
	StringSplit,Genresd,A_LoopField,
	ToolTip,  Seasoning
	GetSeasons:=Repeat(GetSeasonD,ShowCounterd)
	RegExMatch(Day,"siU)"GetSeasons,Seasond)
	StringSplit,Seasond,A_LoopField,
	ToolTip, Episoding
	GetEps:=Repeat(GetEpD,ShowCounterd)
	RegExMatch(Day,"siU)"GetEps,Epd)
	StringSplit,Epd,A_LoopField,
	ToolTip, Fan Arting
	GetFanArts:=Repeat(GetFanArtD,ShowCounterd)
	RegExMatch(Day,"siU)"GetFanArts,FanArtd)
	StringSplit,FanArtd,A_LoopField,
;	ToolTip, Downloading images (This is gonna take a while)
;	Loop, %ShowCounterd%
;	{
;		FanArts:=FanArtd%A_Index%
;		Titles:=Titled%A_Index%
;		UrlDownloadToFile, %FanArts% , % A_ScriptDir "\Ima\Discover\" WeekDated "\FanArt\" Titles ".jpg"
;		ToolTip, %Titles%
;	}
	ToolTip, 
	GoSub,MainGui
return

MainGui:
	Gui,1: Margin, x0 y0
	Gui,1: Font, cFFFFFF H25 s14 Q4
	Gui,1: Add, Picture,Y15 X0 w800 0x4000000,Res\BG\Top_400x25.png
	Gui,1: Add, Picture,Y0 X785 H30 W30 BackgroundTrans gGuiClose,Res\Overlay\OL_Close.png
	Gui,1: Add, Picture,Y0 X755 H30 W30 BackgroundTrans gGuiMini,Res\Overlay\OL_Mini.png
	Gui,1: Add, Picture,Y16 X5 H24 W24 BackgroundTrans gListVars,Res\Icon\gear.png
	Gui,1: Add, Picture,Y16 Xp+26 H24 W24 BackgroundTrans gReload ,Res\Icon\Refresh.png
	Gui,1: Add, Text, Yp X367  BackgroundTrans, % WinTitle
	Gui,1: Add, Picture,Y40 X0 W800 H25 0x4000000,Res\BG\Blue_B_400x25.png
	Gui,1: Add, Picture,Yp X5 W25 H25 BackgroundTrans gLeft,Res\Icon\Button_External_Left.png
	Gui,1: Add, Picture,Yp X770 W25 H25 BackgroundTrans gRight,Res\Icon\Button_External_Right.png
	Gui,1: Add, Picture,Y65 X0 H805,Res\BG\Trakt_800x800.jpg
	Pages:=(Page*5)
	Gui,1: Font, cFFFFFF H25 s11 Q4
	Loop, 5
	{
		(A_Index=1)?(SY:=70):(A_Index=2)?(SY:=230):(A_Index=3)?(SY:=390):(A_Index=4)?(SY:=550):(A_Index=5)?(SY:=710):(SY:="ERROR")
		(A_Index=1)?(ST:=Pages+1):(A_Index=2)?(ST:=Pages+2):(A_Index=3)?(ST:=Pages+3):(A_Index=4)?(ST:=Pages+4):(A_Index=5)?(ST:=Pages+5):(ST:="ERROR")
		Titles:=Titled%ST%
		Seasons:=Seasond%ST%
		Eps:=Epd%ST%
		RunTimes:=RunTimed%ST%
		NetWorks:=NetWorkd%ST%
		Countrys:=Countryd%ST%
		Genress:=Genresd%ST%
		Overviews:=Overviewd%ST%
		If FileExist("Ima\Discover\" WeekDated "\FanArt\" Titles ".jpg")
		{
			Gui,1: Add, Picture,Y%SY% X5 H155 W276 vDI%A_Index% gDURL%A_Index%, % "Ima\Discover\" WeekDated "\FanArt\" Titles ".jpg"
		} Else {
			Gui,1: Add, Picture,Y%SY% X5 H155 W276 BackgroundTrans vDI%A_Index% gDURL%A_Index%, Res\ImageNotFound.png
		}
		Gui,1: Add, Picture,Y%SY% X5 H155 W276 BackgroundTrans gDURL%A_Index%, Res\Overlay\Linen_D_Rounded_Click2_276x155.png
		Gui,1: Add, Picture,Y%SY% X286 H155 W509 BackgroundTrans, Res\Overlay\Display_Transparent_400x400.png
		Gui,1: Add, Text, Y%SY% X288 W507 H155 r9 BackgroundTrans vDT%A_Index%, % Titles "`ns" Seasond%A_Index% "e" Epd%A_Index% " " RunTimed%A_Index% " Mins @ " NetWorkd%A_Index% " From " Countryd%A_Index% "`n" Genresd%A_Index% "`n" Overviewd%A_Index%
	}
	Gui,1: Font, cFFFFFF H25 s14 Q4
	Gui,1: Add, Text, Y40 X397 W100 vDPage BackgroundTrans, % Page
	Gui,1: Add, Picture,Y870 X0 w800 0x4000000,Res\BG\Bottom_400x25.png
	Gui,1: Add, Picture,Yp X367 w63 h25 BackgroundTrans ,Res\Icon\Logo_Top.png
	Gui,1: +E0x40000
	Gui,1: +E0x80000 +HwndDiscoGUI +ToolWindow +LastFound -Caption -Resize -Border +MinSize +MaxSize
	Gui,1: color, 123456
	WinSet, TransColor, 123456
	Gui,1: show, H920, %WinTitle%
return

Left:
	Page--
	(Page<0)?(Page:=LastPage):(Page:=Page)
	GoSub, ShowShows
return

Right:
	Page++
	(Page>LastPage)?(Page:=0):(Page:=Page)
	GoSub, ShowShows
return


ShowShows:
	Pages:=(Page*5)
	Gui,1: Font, cFFFFFF H25 s14 Q4
	GuiControl,, DPage, %Page%
	Gui,1: Font, cFFFFFF H25 s11 Q4
	Loop, 5
	{
		(A_Index=1)?(SY:=70):(A_Index=2)?(SY:=230):(A_Index=3)?(SY:=390):(A_Index=4)?(SY:=550):(A_Index=5)?(SY:=710):(SY:="ERROR")
		(A_Index=1)?(ST:=Pages+1):(A_Index=2)?(ST:=Pages+2):(A_Index=3)?(ST:=Pages+3):(A_Index=4)?(ST:=Pages+4):(A_Index=5)?(ST:=Pages+5):(ST:="ERROR")
		Titles:=Titled%ST% . %A_Index%
		Seasons:=Seasond%ST% . %A_Index%
		Eps:=Epd%ST% . %A_Index%
		RunTimes:=RunTimed%ST% . %A_Index%
		NetWorks:=NetWorkd%ST% . %A_Index%
		Countrys:=Countryd%ST% . %A_Index%
		Genress:=Genresd%ST% . %A_Index%
		Overviews:=Overviewd%ST% . %A_Index%
		TXT:=Titles "`ns" Seasons "e" Eps " " RunTimes " Mins @ " NetWorks " From " Countrys "`n" Genress "`n" Overviews
		If FileExist("Ima\Discover\" WeekDated "\FanArt\" Titles ".jpg")
		{
			GuiControl,1:, DI%A_Index%, % "Ima\Discover\" WeekDated "\FanArt\" Titles ".jpg"
		} Else {
			GuiControl,1:, DI%A_Index%, Res\ImageNotFound.png
		}
		GuiControl,1:, DT%A_Index%, %TXT%
	}
return

DURL1:
	1URL:=((Page*5)+1)
	1ShowURLs:=ShowURLd%1URL%
	Run %1ShowURLs%
return
DURL2:
	2URL:=((Page*5)+2)
	2ShowURLs:=ShowURLd%2URL%
	Run %2ShowURLs%
return
DURL3:
	3URL:=((Page*5)+3)
	3ShowURLs:=ShowURLd%3URL%
	Run %3ShowURLs%
return
DURL4:
	4URL:=((Page*5)+4)
	4ShowURLs:=ShowURLd%4URL%
	Run %4ShowURLs%
return
DURL5:
	5URL:=((Page*5)+5)
	5ShowURLs:=ShowURLd%5URL%
	Run %5ShowURLs%
return

SetSE(Byref SE){
SE:= RegExReplace(SE, "^(\d){1}$", "0$1")
}

Repeat(String,Times){ ;by rosettacode.org
  Loop, %Times%
    Output .= String
  Return Output
}

GetPos:
	WinGetPos, gui_x, gui_y,,, %WinTitle%
	IniWrite, %gui_x%, res\settings.ini, WinPos, Pos_x
	IniWrite, %gui_y%, res\settings.ini, WinPos, Pos_y
Return

;==[UpDate]
#IfWinActive, WinTitle ahk_class AutoHotkeyGUI
F5::
	GoSub, GetPos
	Reload
return

;==[Drag Window]
DragWin(){
	PostMessage, 0xA1, 2
	GoSub, GetPos
}

;==[Close]
GuiClose:
	GoSub, GetPos
ExitApp
GuiMini:
	GoSub, GetPos
	WinMinimize
return

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
	Gui,99: Add, Picture, x545 y0 gX99,res\X.png
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
