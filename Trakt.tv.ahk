#NoEnv
SendMode Input
#persistent
#SingleInstance Force
#Include Res\Var
#Include Res\ScrollBox.ahk
Menu, Tray, Icon,res\icon\logo.ico
Menu, Tray, NoStandard
Menu, Tray, Add,Go,GetFile
;Menu, Tray, Add,Test,Test
Menu, Calendar, Add, Open, RunCal
Menu, Tray, Add,Calendar, :Calendar
Menu, WallChanger, Add, Open, RunWall
Menu, WallChanger, Add, Next Wallpaper, NextWall
Menu, WallChanger, Add, Toggle Info Text, ToggInfo
Menu, Tray, Add,WallChanger, :WallChanger
Menu, Settings, Add, ListVars
Menu, Tray, Add,Settings, :Settings
Menu, Notifier, Add, ListVars
Menu, Tray, Add,Notifier, :Notifier
Menu, Progress, Add, ListVars
Menu, Tray, Add,Progress, :Progress
Menu, Discover, Add, ListVars
Menu, Tray, Add,Discover, :Discover
Menu, Watching, Add, ListVars
Menu, Tray, Add,Watching, :Watching
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
WinTitle = Info
VarFile = Res\Var
CheckTime := "0805" 
SetTimer, Update, 60000 
GoSub,Test
NextWall:=DllCall("RegisterWindowMessage","UInt", &Var:="NextWall")
ToggInfo:=DllCall("RegisterWindowMessage","UInt", &Var:="ToggInfo")
GetError=siU)(?(?=.*\{\"status\"\:\"failure\").*\"error\"\:\"(.*)\"\}).*
return

Test:
return

GetFile:
	Info = %A_ScriptDir%\Info\%A_DDDD%\%User%.Json
	UrlDownloadToFile, %URL%?%A_Hour%%A_Min% ,%Info%
	FileRead, FullPage, %Info%
	RegExMatch(FullPage,GetError,Error)
	If (Error1 = "server is over capacity")
	{
		ToolTip, server is over capacity
		Sleep 1000
		ToolTip,
		Sleep 3000
		ToolTip, trying again...
		Sleep 1000
		ToolTip,
		GoSub,GetFile
	} 
	Else if not Error1="server is over capacity"
	{
		MsgBox %Error1%
	} 
	Else If (Error = "") 
	{
		ToolTip, Downloading
		RegExMatch(FullPage,GetDay,Day)
		StringSplit,Day,A_LoopField,`}`]`}
		ToolTip, Dating
;		T := "`n`n# " ErrorLevel " #`n" Day1 "`n`n" Day2
		RegExMatch(FullPage,GetDate,Date10)
		StringSplit,Date10,A_LoopField,`,
		RegExMatch(FullPage,GetDate,Date20)
		StringSplit,Date20,A_LoopField,`,
		VarFile(VarFile,"Date101",Date101)
		VarFile(VarFile,"Date102",Date102)
		VarFile(VarFile,"Date103",Date103)
		VarFile(VarFile,"Date201",Date201)
		VarFile(VarFile,"Date202",Date202)
		VarFile(VarFile,"Date203",Date203)
		FormatTime,Date100,%Date101%%Date102%%Date103%,MMMM dd, yyyy
		FormatTime,Date200,%Date104%%Date105%%Date106%,MMMM dd, yyyy
		FormatTime,WeekDate1,%Date101%%Date102%%Date103%,dddd
		FormatTime,WeekDate2,%Date104%%Date105%%Date106%,dddd
		VarFile(VarFile,"Date100",Date100)
		VarFile(VarFile,"Date200",Date200)
		VarFile(VarFile,"WeekDate1",WeekDate1)
		VarFile(VarFile,"WeekDate2",WeekDate2)
		ToolTip, Counting
;		T := "`n`n# " ErrorLevel " #`n" Date101 "." Date102 "." Date103 "=" WeekDate1 "`n" Date104 "." Date105 "." Date106 "=" WeekDate2 "`n" Date1 "`n" Date2
		StringReplace,Day1,Day1,%GetCounter%,%GetCounter%,UseErrorLevel
		ShowCounter1 = %ErrorLevel%
		VarFile(VarFile,"ShowCounter1",ShowCounter1)
		StringReplace,Day2,Day2,%GetCounter%,%GetCounter%,UseErrorLevel
		ShowCounter2 = %ErrorLevel%
		VarFile(VarFile,"ShowCounter2",ShowCounter2)
		ToolTip, Titling
;		T := "`n`n# " ErrorLevel " #`n" ShowCounter1 "`n" ShowCounter2
		RegExMatch(Day1,GetTitle,Title10)
		StringSplit,Title10,A_LoopField,
		RegExMatch(Day2,GetTitle,Title20)
		StringSplit,Title20,A_LoopField,
		VarFile(VarFile,"Title101",Title101)
		VarFile(VarFile,"Title102",Title102)
		VarFile(VarFile,"Title103",Title103)
		VarFile(VarFile,"Title104",Title104)
		VarFile(VarFile,"Title105",Title105)
		VarFile(VarFile,"Title106",Title106)
		VarFile(VarFile,"Title107",Title107)
		VarFile(VarFile,"Title108",Title108)
		VarFile(VarFile,"Title109",Title109)
		VarFile(VarFile,"Title1010",Title1010)
		VarFile(VarFile,"Title201",Title201)
		VarFile(VarFile,"Title202",Title202)
		VarFile(VarFile,"Title203",Title203)
		VarFile(VarFile,"Title204",Title204)
		VarFile(VarFile,"Title205",Title205)
		VarFile(VarFile,"Title206",Title206)
		VarFile(VarFile,"Title207",Title207)
		VarFile(VarFile,"Title208",Title208)
		VarFile(VarFile,"Title209",Title209)
		VarFile(VarFile,"Title2010",Title2010)
		ToolTip, Show URLing
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" Title101 "`n" Title102 "`n" Title103 "`n" Title104 "`n" Title105 "`n" Title106 "`n" Title107 "`n" Title108 "`n" Title109 "`n" Title1010 "`n" "Day2`n`n" Title201 "`n" Title202 "`n" Title203 "`n" Title204 "`n" Title205 "`n" Title206 "`n" Title207 "`n" Title208 "`n" Title209 "`n" Title2010
		RegExMatch(Day1,GetShowURL,ShowURL10)
		StringSplit,ShowURL10,A_LoopField,
		RegExMatch(Day2,GetShowURL,ShowURL20)
		StringSplit,ShowURL20,A_LoopField,
		VarFile(VarFile,"ShowURL101",ShowURL101)
		VarFile(VarFile,"ShowURL102",ShowURL103)
		VarFile(VarFile,"ShowURL103",ShowURL105)
		VarFile(VarFile,"ShowURL104",ShowURL107)
		VarFile(VarFile,"ShowURL105",ShowURL109)
		VarFile(VarFile,"ShowURL106",ShowURL1011)
		VarFile(VarFile,"ShowURL107",ShowURL1013)
		VarFile(VarFile,"ShowURL108",ShowURL1015)
		VarFile(VarFile,"ShowURL109",ShowURL1017)
		VarFile(VarFile,"ShowURL1010",ShowURL1019)
		VarFile(VarFile,"ShowURL201",ShowURL201)
		VarFile(VarFile,"ShowURL202",ShowURL203)
		VarFile(VarFile,"ShowURL203",ShowURL205)
		VarFile(VarFile,"ShowURL204",ShowURL207)
		VarFile(VarFile,"ShowURL205",ShowURL209)
		VarFile(VarFile,"ShowURL206",ShowURL2011)
		VarFile(VarFile,"ShowURL207",ShowURL2013)
		VarFile(VarFile,"ShowURL208",ShowURL2015)
		VarFile(VarFile,"ShowURL209",ShowURL2017)
		VarFile(VarFile,"ShowURL2010",ShowURL2019)
		ToolTip, Episode URLing
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" ShowURL101 "`n" ShowURL103 "`n" ShowURL105 "`n" ShowURL107 "`n" ShowURL109 "`n" ShowURL1011 "`n" ShowURL1013 "`n" ShowURL1015 "`n" ShowURL1017 "`n" ShowURL1019 "`n" "Day2`n`n" ShowURL201 "`n" ShowURL203 "`n" ShowURL205 "`n" ShowURL207 "`n" ShowURL209 "`n" ShowURL2011 "`n" ShowURL2013 "`n" ShowURL2015 "`n" ShowURL2017 "`n" ShowURL2019
		RegExMatch(Day1,GetEpURL,EpURL10)
		StringSplit,EpURL10,A_LoopField,
		RegExMatch(Day2,GetEpURL,EpURL20)
		StringSplit,EpURL20,A_LoopField,
		VarFile(VarFile,"EpURL101",EpURL101)
		VarFile(VarFile,"EpURL102",EpURL102)
		VarFile(VarFile,"EpURL103",EpURL103)
		VarFile(VarFile,"EpURL104",EpURL104)
		VarFile(VarFile,"EpURL105",EpURL105)
		VarFile(VarFile,"EpURL106",EpURL106)
		VarFile(VarFile,"EpURL107",EpURL107)
		VarFile(VarFile,"EpURL108",EpURL108)
		VarFile(VarFile,"EpURL109",EpURL109)
		VarFile(VarFile,"EpURL1010",EpURL1010)
		VarFile(VarFile,"EpURL201",EpURL201)
		VarFile(VarFile,"EpURL202",EpURL202)
		VarFile(VarFile,"EpURL203",EpURL203)
		VarFile(VarFile,"EpURL204",EpURL204)
		VarFile(VarFile,"EpURL205",EpURL205)
		VarFile(VarFile,"EpURL206",EpURL206)
		VarFile(VarFile,"EpURL207",EpURL207)
		VarFile(VarFile,"EpURL208",EpURL208)
		VarFile(VarFile,"EpURL209",EpURL209)
		VarFile(VarFile,"EpURL2010",EpURL2010)
		ToolTip, Countrying
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" EpURL101 "`n" EpURL102 "`n" EpURL103 "`n" EpURL104 "`n" EpURL105 "`n" EpURL106 "`n" EpURL107 "`n" EpURL108 "`n" EpURL109 "`n" EpURL1010 "`n" "Day2`n`n" EpURL201 "`n" EpURL202 "`n" EpURL203 "`n" EpURL204 "`n" EpURL205 "`n" EpURL206 "`n" EpURL207 "`n" EpURL208 "`n" EpURL209 "`n" EpURL2010
		RegExMatch(Day1,GetCountry,Country10)
		StringSplit,Country10,A_LoopField,
		RegExMatch(Day2,GetCountry,Country20)
		StringSplit,Country20,A_LoopField,
		VarFile(VarFile,"Country101",Country101)
		VarFile(VarFile,"Country102",Country102)
		VarFile(VarFile,"Country103",Country103)
		VarFile(VarFile,"Country104",Country104)
		VarFile(VarFile,"Country105",Country105)
		VarFile(VarFile,"Country106",Country106)
		VarFile(VarFile,"Country107",Country107)
		VarFile(VarFile,"Country108",Country108)
		VarFile(VarFile,"Country109",Country109)
		VarFile(VarFile,"Country1010",Country1010)
		VarFile(VarFile,"Country201",Country201)
		VarFile(VarFile,"Country202",Country202)
		VarFile(VarFile,"Country203",Country203)
		VarFile(VarFile,"Country204",Country204)
		VarFile(VarFile,"Country205",Country205)
		VarFile(VarFile,"Country206",Country206)
		VarFile(VarFile,"Country207",Country207)
		VarFile(VarFile,"Country208",Country208)
		VarFile(VarFile,"Country209",Country209)
		VarFile(VarFile,"Country2010",Country2010)
		ToolTip, Overviewing
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" Country101 "`n" Country102 "`n" Country103 "`n" Country104 "`n" Country105 "`n" Country106 "`n" Country107 "`n" Country108 "`n" Country109 "`n" Country1010 "`n" "Day2`n`n" Country201 "`n" Country202 "`n" Country203 "`n" Country204 "`n" Country205 "`n" Country206 "`n" Country207 "`n" Country208 "`n" Country209 "`n" Country2010
		RegExMatch(Day1,GetOverview,Overview10)
		StringSplit,Overview10,A_LoopField,
		RegExMatch(Day2,GetOverview,Overview20)
		StringSplit,Overview20,A_LoopField,
		VarFile(VarFile,"Overview101",Overview101)
		VarFile(VarFile,"Overview102",Overview103)
		VarFile(VarFile,"Overview103",Overview105)
		VarFile(VarFile,"Overview104",Overview107)
		VarFile(VarFile,"Overview105",Overview109)
		VarFile(VarFile,"Overview106",Overview1011)
		VarFile(VarFile,"Overview107",Overview1013)
		VarFile(VarFile,"Overview108",Overview1015)
		VarFile(VarFile,"Overview109",Overview1017)
		VarFile(VarFile,"Overview1010",Overview1019)
		VarFile(VarFile,"Overview201",Overview201)
		VarFile(VarFile,"Overview202",Overview203)
		VarFile(VarFile,"Overview203",Overview205)
		VarFile(VarFile,"Overview204",Overview207)
		VarFile(VarFile,"Overview205",Overview209)
		VarFile(VarFile,"Overview206",Overview2011)
		VarFile(VarFile,"Overview207",Overview2013)
		VarFile(VarFile,"Overview208",Overview2015)
		VarFile(VarFile,"Overview209",Overview2017)
		VarFile(VarFile,"Overview2010",Overview2019)
		ToolTip, Runtiming
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" Overview102 "`n" Overview104 "`n" Overview106 "`n" Overview108 "`n" Overview1010 "`n" Overview1012 "`n" Overview1014 "`n" Overview1016 "`n" Overview1018 "`n" Overview1020 "`n" "Day2`n`n" Overview201 "`n" Overview202 "`n" Overview203 "`n" Overview204 "`n" Overview205 "`n" Overview206 "`n" Overview207 "`n" Overview208 "`n" Overview209 "`n" Overview2010
		RegExMatch(Day1,GetRuntime,Runtime10)
		StringSplit,Runtime10,A_LoopField,
		RegExMatch(Day2,GetRuntime,Runtime20)
		StringSplit,Runtime20,A_LoopField,
		VarFile(VarFile,"Runtime101",Runtime101)
		VarFile(VarFile,"Runtime102",Runtime102)
		VarFile(VarFile,"Runtime103",Runtime103)
		VarFile(VarFile,"Runtime104",Runtime104)
		VarFile(VarFile,"Runtime105",Runtime105)
		VarFile(VarFile,"Runtime106",Runtime106)
		VarFile(VarFile,"Runtime107",Runtime107)
		VarFile(VarFile,"Runtime108",Runtime108)
		VarFile(VarFile,"Runtime109",Runtime109)
		VarFile(VarFile,"Runtime1010",Runtime1010)
		VarFile(VarFile,"Runtime201",Runtime201)
		VarFile(VarFile,"Runtime202",Runtime202)
		VarFile(VarFile,"Runtime203",Runtime203)
		VarFile(VarFile,"Runtime204",Runtime204)
		VarFile(VarFile,"Runtime205",Runtime205)
		VarFile(VarFile,"Runtime206",Runtime206)
		VarFile(VarFile,"Runtime207",Runtime207)
		VarFile(VarFile,"Runtime208",Runtime208)
		VarFile(VarFile,"Runtime209",Runtime209)
		VarFile(VarFile,"Runtime2010",Runtime2010)
		ToolTip, NetWorking
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" Runtime101 "`n" Runtime102 "`n" Runtime103 "`n" Runtime104 "`n" Runtime105 "`n" Runtime106 "`n" Runtime107 "`n" Runtime108 "`n" Runtime109 "`n" Runtime1010 "`n" "Day2`n`n" Runtime201 "`n" Runtime202 "`n" Runtime203 "`n" Runtime204 "`n" Runtime205 "`n" Runtime206 "`n" Runtime207 "`n" Runtime208 "`n" Runtime209 "`n" Runtime2010
		RegExMatch(Day1,GetNetwork,Network10)
		StringSplit,Network10,A_LoopField,
		RegExMatch(Day2,GetNetwork,Network20)
		StringSplit,Network20,A_LoopField,
		VarFile(VarFile,"Network101",Network101)
		VarFile(VarFile,"Network102",Network102)
		VarFile(VarFile,"Network103",Network103)
		VarFile(VarFile,"Network104",Network104)
		VarFile(VarFile,"Network105",Network105)
		VarFile(VarFile,"Network106",Network106)
		VarFile(VarFile,"Network107",Network107)
		VarFile(VarFile,"Network108",Network108)
		VarFile(VarFile,"Network109",Network109)
		VarFile(VarFile,"Network1010",Network1010)
		VarFile(VarFile,"Network201",Network201)
		VarFile(VarFile,"Network202",Network202)
		VarFile(VarFile,"Network203",Network203)
		VarFile(VarFile,"Network204",Network204)
		VarFile(VarFile,"Network205",Network205)
		VarFile(VarFile,"Network206",Network206)
		VarFile(VarFile,"Network207",Network207)
		VarFile(VarFile,"Network208",Network208)
		VarFile(VarFile,"Network209",Network209)
		VarFile(VarFile,"Network2010",Network2010)
		ToolTip, Air Timing
;		T := "`n`n# " ErrorLevel " #`n" "Day1`n`n" Network101 "`n" Network102 "`n" Network103 "`n" Network104 "`n" Network105 "`n" Network106 "`n" Network107 "`n" Network108 "`n" Network109 "`n" Network1010 "`n" "Day2`n`n" Network201 "`n" Network202 "`n" Network203 "`n" Network204 "`n" Network205 "`n" Network206 "`n" Network207 "`n" Network208 "`n" Network209 "`n" Network2010
		RegExMatch(Day1,GetAirTime,AirTime10)
		StringSplit,AirTime10,A_LoopField,
		SetAirTime(AirTime101)
		SetAirTime(AirTime102)
		SetAirTime(AirTime103)
		SetAirTime(AirTime104)
		SetAirTime(AirTime105)
		SetAirTime(AirTime106)
		SetAirTime(AirTime107)
		SetAirTime(AirTime108)
		SetAirTime(AirTime109)
		SetAirTime(AirTime1010)
		RegExMatch(Day2,GetAirTime,AirTime20)
		StringSplit,AirTime20,A_LoopField,
		SetAirTime(AirTime201)
		SetAirTime(AirTime202)
		SetAirTime(AirTime203)
		SetAirTime(AirTime204)
		SetAirTime(AirTime205)
		SetAirTime(AirTime206)
		SetAirTime(AirTime207)
		SetAirTime(AirTime208)
		SetAirTime(AirTime209)
		SetAirTime(AirTime2010)
		VarFile(VarFile,"AirTime101",AirTime101)
		VarFile(VarFile,"AirTime102",AirTime102)
		VarFile(VarFile,"AirTime103",AirTime103)
		VarFile(VarFile,"AirTime104",AirTime104)
		VarFile(VarFile,"AirTime105",AirTime105)
		VarFile(VarFile,"AirTime106",AirTime106)
		VarFile(VarFile,"AirTime107",AirTime107)
		VarFile(VarFile,"AirTime108",AirTime108)
		VarFile(VarFile,"AirTime109",AirTime109)
		VarFile(VarFile,"AirTime1010",AirTime1010)
		VarFile(VarFile,"AirTime201",AirTime201)
		VarFile(VarFile,"AirTime202",AirTime202)
		VarFile(VarFile,"AirTime203",AirTime203)
		VarFile(VarFile,"AirTime204",AirTime204)
		VarFile(VarFile,"AirTime205",AirTime205)
		VarFile(VarFile,"AirTime206",AirTime206)
		VarFile(VarFile,"AirTime207",AirTime207)
		VarFile(VarFile,"AirTime208",AirTime208)
		VarFile(VarFile,"AirTime209",AirTime209)
		VarFile(VarFile,"AirTime2010",AirTime2010)
		ToolTip, Genring
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" AirTime101 "`n" AirTime102 "`n" AirTime103 "`n" AirTime104 "`n" AirTime105 "`n" AirTime106 "`n" AirTime107 "`n" AirTime108 "`n" AirTime109 "`n" AirTime1010 "`n" "Day2`n`n" AirTime201 "`n" AirTime202 "`n" AirTime203 "`n" AirTime204 "`n" AirTime205 "`n" AirTime206 "`n" AirTime207 "`n" AirTime208 "`n" AirTime209 "`n" AirTime2010
		RegExMatch(Day1,GetGenres,Genres10)
		StringSplit,Genres10,A_LoopField,
		RegExMatch(Day2,GetGenres,Genres20)
		StringSplit,Genres20,A_LoopField,
		VarFile(VarFile,"Genres101",Genres101)
		VarFile(VarFile,"Genres102",Genres102)
		VarFile(VarFile,"Genres103",Genres103)
		VarFile(VarFile,"Genres104",Genres104)
		VarFile(VarFile,"Genres105",Genres105)
		VarFile(VarFile,"Genres106",Genres106)
		VarFile(VarFile,"Genres107",Genres107)
		VarFile(VarFile,"Genres108",Genres108)
		VarFile(VarFile,"Genres109",Genres109)
		VarFile(VarFile,"Genres1010",Genres1010)
		VarFile(VarFile,"GEnres201",Genres201)
		VarFile(VarFile,"GEnres202",Genres202)
		VarFile(VarFile,"GEnres203",Genres203)
		VarFile(VarFile,"GEnres204",Genres204)
		VarFile(VarFile,"GEnres205",Genres205)
		VarFile(VarFile,"GEnres206",Genres206)
		VarFile(VarFile,"GEnres207",Genres207)
		VarFile(VarFile,"GEnres208",Genres208)
		VarFile(VarFile,"GEnres209",Genres209)
		VarFile(VarFile,"GEnres2010",Genres2010)
		ToolTip,  Seasoning
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Genres101 "`n" Genres102 "`n" Genres103 "`n" Genres104 "`n" Genres105 "`n" Genres106 "`n" Genres107 "`n" Genres108 "`n" Genres109 "`n" Genres1010 "`n" "Day2`n`n" Genres201 "`n" Genres202 "`n" Genres203 "`n" Genres204 "`n" Genres205 "`n" Genres206 "`n" Genres207 "`n" Genres208 "`n" Genres209 "`n" Genres2010
		RegExMatch(Day1,GetSeason,Season10)
		StringSplit,Season10,A_LoopField,
		RegExMatch(Day2,GetSeason,Season20)
		StringSplit,Season20,A_LoopField,
		SetSE(Season101)
		SetSE(Season102)
		SetSE(Season103)
		SetSE(Season104)
		SetSE(Season105)
		SetSE(Season106)
		SetSE(Season107)
		SetSE(Season108)
		SetSE(Season109)
		SetSE(Season1010)
		SetSE(Season201)
		SetSE(Season202)
		SetSE(Season203)
		SetSE(Season204)
		SetSE(Season205)
		SetSE(Season206)
		SetSE(Season207)
		SetSE(Season208)
		SetSE(Season209)
		SetSE(Season2010)
		VarFile(VarFile,"Season101",Season101)
		VarFile(VarFile,"Season102",Season102)
		VarFile(VarFile,"Season103",Season103)
		VarFile(VarFile,"Season104",Season104)
		VarFile(VarFile,"Season105",Season105)
		VarFile(VarFile,"Season106",Season106)
		VarFile(VarFile,"Season107",Season107)
		VarFile(VarFile,"Season108",Season108)
		VarFile(VarFile,"Season109",Season109)
		VarFile(VarFile,"Season1010",Season1010)
		VarFile(VarFile,"Season201",Season201)
		VarFile(VarFile,"Season202",Season202)
		VarFile(VarFile,"Season203",Season203)
		VarFile(VarFile,"Season204",Season204)
		VarFile(VarFile,"Season205",Season205)
		VarFile(VarFile,"Season206",Season206)
		VarFile(VarFile,"Season207",Season207)
		VarFile(VarFile,"Season208",Season208)
		VarFile(VarFile,"Season209",Season209)
		VarFile(VarFile,"Season2010",Season2010)
		ToolTip, Episoding
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Season101 "`n" Season102 "`n" Season103 "`n" Season104 "`n" Season105 "`n" Season106 "`n" Season107 "`n" Season108 "`n" Season109 "`n" Season1010 "`n" "Day2`n`n" Season201 "`n" Season202 "`n" Season203 "`n" Season204 "`n" Season205 "`n" Season206 "`n" Season207 "`n" Season208 "`n" Season209 "`n" Season2010
		RegExMatch(Day1,GetEp,Ep10)
		StringSplit,Ep10,A_LoopField,
		RegExMatch(Day2,GetEp,Ep20)
		StringSplit,Ep20,A_LoopField,
		SetSE(Ep101)
		SetSE(Ep102)
		SetSE(Ep103)
		SetSE(Ep104)
		SetSE(Ep105)
		SetSE(Ep106)
		SetSE(Ep107)
		SetSE(Ep108)
		SetSE(Ep109)
		SetSE(Ep1010)
		SetSE(Ep201)
		SetSE(Ep202)
		SetSE(Ep203)
		SetSE(Ep204)
		SetSE(Ep205)
		SetSE(Ep206)
		SetSE(Ep207)
		SetSE(Ep208)
		SetSE(Ep209)
		SetSE(Ep2010)
		VarFile(VarFile,"Ep101",Ep101)
		VarFile(VarFile,"Ep102",Ep102)
		VarFile(VarFile,"Ep103",Ep103)
		VarFile(VarFile,"Ep104",Ep104)
		VarFile(VarFile,"Ep105",Ep105)
		VarFile(VarFile,"Ep106",Ep106)
		VarFile(VarFile,"Ep107",Ep107)
		VarFile(VarFile,"Ep108",Ep108)
		VarFile(VarFile,"Ep109",Ep109)
		VarFile(VarFile,"Ep1010",Ep1010)
		VarFile(VarFile,"Ep201",Ep201)
		VarFile(VarFile,"Ep202",Ep202)
		VarFile(VarFile,"Ep203",Ep203)
		VarFile(VarFile,"Ep204",Ep204)
		VarFile(VarFile,"Ep205",Ep205)
		VarFile(VarFile,"Ep206",Ep206)
		VarFile(VarFile,"Ep207",Ep207)
		VarFile(VarFile,"Ep208",Ep208)
		VarFile(VarFile,"Ep209",Ep209)
		VarFile(VarFile,"Ep2010",Ep2010)
		ToolTip, Episode Titling
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Ep101 "`n" Ep102 "`n" Ep103 "`n" Ep104 "`n" Ep105 "`n" Ep106 "`n" Ep107 "`n" Ep108 "`n" Ep109 "`n" Ep1010 "`n" "Day2`n`n" Ep201 "`n" Ep202 "`n" Ep203 "`n" Ep204 "`n" Ep205 "`n" Ep206 "`n" Ep207 "`n" Ep208 "`n" Ep209 "`n" Ep2010
		RegExMatch(Day1,GetEpTitle,EpTitle10)
		StringSplit,EpTitle10,A_LoopField,
		RegExMatch(Day2,GetEpTitle,EpTitle20)
		StringSplit,EpTitle20,A_LoopField,
		VarFile(VarFile,"EpTitle101",EpTitle101)
		VarFile(VarFile,"EpTitle102",EpTitle102)
		VarFile(VarFile,"EpTitle103",EpTitle103)
		VarFile(VarFile,"EpTitle104",EpTitle104)
		VarFile(VarFile,"EpTitle105",EpTitle105)
		VarFile(VarFile,"EpTitle106",EpTitle106)
		VarFile(VarFile,"EpTitle107",EpTitle107)
		VarFile(VarFile,"EpTitle108",EpTitle108)
		VarFile(VarFile,"EpTitle109",EpTitle109)
		VarFile(VarFile,"EpTitle1010",EpTitle1010)
		VarFile(VarFile,"EpTitle201",EpTitle201)
		VarFile(VarFile,"EpTitle202",EpTitle202)
		VarFile(VarFile,"EpTitle203",EpTitle203)
		VarFile(VarFile,"EpTitle204",EpTitle204)
		VarFile(VarFile,"EpTitle205",EpTitle205)
		VarFile(VarFile,"EpTitle206",EpTitle206)
		VarFile(VarFile,"EpTitle207",EpTitle207)
		VarFile(VarFile,"EpTitle208",EpTitle208)
		VarFile(VarFile,"EpTitle209",EpTitle209)
		VarFile(VarFile,"EpTitle2010",EpTitle2010)
		ToolTip, WebTitling
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" EpTitle101 "`n" EpTitle102 "`n" EpTitle103 "`n" EpTitle104 "`n" EpTitle105 "`n" EpTitle106 "`n" EpTitle107 "`n" EpTitle108 "`n" EpTitle109 "`n" EpTitle1010 "`n" "Day2`n`n" EpTitle201 "`n" EpTitle202 "`n" EpTitle203 "`n" EpTitle204 "`n" EpTitle205 "`n" EpTitle206 "`n" EpTitle207 "`n" EpTitle208 "`n" EpTitle209 "`n" EpTitle2010
		SetWebTitle(Title101 , WebTitle101)
		SetWebTitle(Title102 , WebTitle102)
		SetWebTitle(Title103 , WebTitle103)
		SetWebTitle(Title104 , WebTitle104)
		SetWebTitle(Title105 , WebTitle105)
		SetWebTitle(Title106 , WebTitle106)
		SetWebTitle(Title107 , WebTitle107)
		SetWebTitle(Title108 , WebTitle108)
		SetWebTitle(Title109 , WebTitle109)
		SetWebTitle(Title1010 , WebTitle1010)
		SetWebTitle(Title201 , WebTitle201)
		SetWebTitle(Title202 , WebTitle202)
		SetWebTitle(Title203 , WebTitle203)
		SetWebTitle(Title204 , WebTitle204)
		SetWebTitle(Title205 , WebTitle205)
		SetWebTitle(Title206 , WebTitle206)
		SetWebTitle(Title207 , WebTitle207)
		SetWebTitle(Title208 , WebTitle208)
		SetWebTitle(Title209 , WebTitle209)
		SetWebTitle(Title2010 , WebTitle2010)
		VarFile(VarFile,"WebTitle101",WebTitle101)
		VarFile(VarFile,"WebTitle102",WebTitle102)
		VarFile(VarFile,"WebTitle103",WebTitle103)
		VarFile(VarFile,"WebTitle104",WebTitle104)
		VarFile(VarFile,"WebTitle105",WebTitle105)
		VarFile(VarFile,"WebTitle106",WebTitle106)
		VarFile(VarFile,"WebTitle107",WebTitle107)
		VarFile(VarFile,"WebTitle108",WebTitle108)
		VarFile(VarFile,"WebTitle109",WebTitle109)
		VarFile(VarFile,"WebTitle1010",WebTitle1010)
		VarFile(VarFile,"WebTitle201",WebTitle201)
		VarFile(VarFile,"WebTitle202",WebTitle202)
		VarFile(VarFile,"WebTitle203",WebTitle203)
		VarFile(VarFile,"WebTitle204",WebTitle204)
		VarFile(VarFile,"WebTitle205",WebTitle205)
		VarFile(VarFile,"WebTitle206",WebTitle206)
		VarFile(VarFile,"WebTitle207",WebTitle207)
		VarFile(VarFile,"WebTitle208",WebTitle208)
		VarFile(VarFile,"WebTitle209",WebTitle209)
		VarFile(VarFile,"WebTitle2010",WebTitle2010)
		ToolTip, Bannering
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" WebTitle101 "`n" WebTitle102 "`n" WebTitle103 "`n" WebTitle104 "`n" WebTitle105 "`n" WebTitle106 "`n" WebTitle107 "`n" WebTitle108 "`n" WebTitle109 "`n" WebTitle1010 "`n" "Day2`n`n" WebTitle201 "`n" WebTitle202 "`n" WebTitle203 "`n" WebTitle204 "`n" WebTitle205 "`n" WebTitle206 "`n" WebTitle207 "`n" WebTitle208 "`n" WebTitle209 "`n" WebTitle2010
		RegExMatch(Day1,GetBanner,Banner10)
		StringSplit,Banner10,A_LoopField,
		UrlDownloadToFile, %Banner101% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title101%.jpg
		UrlDownloadToFile, %Banner102% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title102%.jpg
		UrlDownloadToFile, %Banner103% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title103%.jpg
		UrlDownloadToFile, %Banner104% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title104%.jpg
		UrlDownloadToFile, %Banner105% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title105%.jpg
		UrlDownloadToFile, %Banner106% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title106%.jpg
		UrlDownloadToFile, %Banner107% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title107%.jpg
		UrlDownloadToFile, %Banner108% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title108%.jpg
		UrlDownloadToFile, %Banner109% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title109%.jpg
		UrlDownloadToFile, %Banner1010% , %A_ScriptDir%\Ima\%WeekDate1%\Banner\%Title1010%.jpg
		RegExMatch(Day2,GetBanner,Banner20)
		StringSplit,Banner20,A_LoopField,
		UrlDownloadToFile, %Banner201% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title201%.jpg
		UrlDownloadToFile, %Banner202% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title202%.jpg
		UrlDownloadToFile, %Banner203% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title203%.jpg
		UrlDownloadToFile, %Banner204% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title204%.jpg
		UrlDownloadToFile, %Banner205% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title205%.jpg
		UrlDownloadToFile, %Banner206% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title206%.jpg
		UrlDownloadToFile, %Banner207% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title207%.jpg
		UrlDownloadToFile, %Banner208% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title208%.jpg
		UrlDownloadToFile, %Banner209% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title209%.jpg
		UrlDownloadToFile, %Banner2010% , %A_ScriptDir%\Ima\%WeekDate2%\Banner\%Title2010%.jpg
		ToolTip, Fan Arting
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Banner101 "`n" Banner102 "`n" Banner103 "`n" Banner104 "`n" Banner105 "`n" Banner106 "`n" Banner107 "`n" Banner108 "`n" Banner109 "`n" Banner1010 "`n" "Day2`n`n" Banner201 "`n" Banner202 "`n" Banner203 "`n" Banner204 "`n" Banner205 "`n" Banner206 "`n" Banner207 "`n" Banner208 "`n" Banner209 "`n" Banner2010
		RegExMatch(Day1,GetFanArt,FanArt10)
		StringSplit,FanArt10,A_LoopField,
		UrlDownloadToFile, %FanArt101% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title101%.jpg
		UrlDownloadToFile, %FanArt102% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title102%.jpg
		UrlDownloadToFile, %FanArt103% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title103%.jpg
		UrlDownloadToFile, %FanArt104% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title104%.jpg
		UrlDownloadToFile, %FanArt105% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title105%.jpg
		UrlDownloadToFile, %FanArt106% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title106%.jpg
		UrlDownloadToFile, %FanArt107% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title107%.jpg
		UrlDownloadToFile, %FanArt108% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title108%.jpg
		UrlDownloadToFile, %FanArt109% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title109%.jpg
		UrlDownloadToFile, %FanArt1010% , %A_ScriptDir%\Ima\%WeekDate1%\FanArt\%Title1010%.jpg
		RegExMatch(Day2,GetFanArt,FanArt20)
		StringSplit,FanArt20,A_LoopField,
		UrlDownloadToFile, %FanArt201% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title201%.jpg
		UrlDownloadToFile, %FanArt202% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title202%.jpg
		UrlDownloadToFile, %FanArt203% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title203%.jpg
		UrlDownloadToFile, %FanArt204% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title204%.jpg
		UrlDownloadToFile, %FanArt205% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title205%.jpg
		UrlDownloadToFile, %FanArt206% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title206%.jpg
		UrlDownloadToFile, %FanArt207% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title207%.jpg
		UrlDownloadToFile, %FanArt208% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title208%.jpg
		UrlDownloadToFile, %FanArt209% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title209%.jpg
		UrlDownloadToFile, %FanArt2010% , %A_ScriptDir%\Ima\%WeekDate2%\FanArt\%Title2010%.jpg
		ToolTip, Postering
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" FanArt101 "`n" FanArt102 "`n" FanArt103 "`n" FanArt104 "`n" FanArt105 "`n" FanArt106 "`n" FanArt107 "`n" FanArt108 "`n" FanArt109 "`n" FanArt1010 "`n" "Day2`n`n" FanArt201 "`n" FanArt202 "`n" FanArt203 "`n" FanArt204 "`n" FanArt205 "`n" FanArt206 "`n" FanArt207 "`n" FanArt208 "`n" FanArt209 "`n" FanArt2010
		RegExMatch(Day1,GetPoster,Poster10)
		StringSplit,Poster10,A_LoopField,
		UrlDownloadToFile, %Poster101% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title101%.jpg
		UrlDownloadToFile, %Poster102% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title102%.jpg
		UrlDownloadToFile, %Poster103% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title103%.jpg
		UrlDownloadToFile, %Poster104% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title104%.jpg
		UrlDownloadToFile, %Poster105% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title105%.jpg
		UrlDownloadToFile, %Poster106% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title106%.jpg
		UrlDownloadToFile, %Poster107% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title107%.jpg
		UrlDownloadToFile, %Poster108% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title108%.jpg
		UrlDownloadToFile, %Poster109% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title109%.jpg
		UrlDownloadToFile, %Poster1010% , %A_ScriptDir%\Ima\%WeekDate1%\Poster\%Title1010%.jpg
		RegExMatch(Day2,GetPoster,Poster20)
		StringSplit,Poster20,A_LoopField,
		UrlDownloadToFile, %Poster201% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title201%.jpg
		UrlDownloadToFile, %Poster202% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title202%.jpg
		UrlDownloadToFile, %Poster203% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title203%.jpg
		UrlDownloadToFile, %Poster204% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title204%.jpg
		UrlDownloadToFile, %Poster205% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title205%.jpg
		UrlDownloadToFile, %Poster206% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title206%.jpg
		UrlDownloadToFile, %Poster207% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title207%.jpg
		UrlDownloadToFile, %Poster208% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title208%.jpg
		UrlDownloadToFile, %Poster209% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title209%.jpg
		UrlDownloadToFile, %Poster2010% , %A_ScriptDir%\Ima\%WeekDate2%\Poster\%Title2010%.jpg
		ToolTip, Screening
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Poster101 "`n" Poster102 "`n" Poster103 "`n" Poster104 "`n" Poster105 "`n" Poster106 "`n" Poster107 "`n" Poster108 "`n" Poster109 "`n" Poster1010 "`n" "Day2`n`n" Poster201 "`n" Poster202 "`n" Poster203 "`n" Poster204 "`n" Poster205 "`n" Poster206 "`n" Poster207 "`n" Poster208 "`n" Poster209 "`n" Poster2010
		RegExMatch(Day1,GetScreen,Screen10)
		StringSplit,Screen10,A_LoopField,
		UrlDownloadToFile, %Screen101% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title101%.jpg
		UrlDownloadToFile, %Screen102% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title102%.jpg
		UrlDownloadToFile, %Screen103% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title103%.jpg
		UrlDownloadToFile, %Screen104% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title104%.jpg
		UrlDownloadToFile, %Screen105% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title105%.jpg
		UrlDownloadToFile, %Screen106% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title106%.jpg
		UrlDownloadToFile, %Screen107% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title107%.jpg
		UrlDownloadToFile, %Screen108% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title108%.jpg
		UrlDownloadToFile, %Screen109% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title109%.jpg
		UrlDownloadToFile, %Screen1010% , %A_ScriptDir%\Ima\%WeekDate1%\Screen\%Title1010%.jpg
		RegExMatch(Day2,GetScreen,Screen20)
		StringSplit,Screen20,A_LoopField,
		UrlDownloadToFile, %Screen201% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title201%.jpg
		UrlDownloadToFile, %Screen202% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title202%.jpg
		UrlDownloadToFile, %Screen203% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title203%.jpg
		UrlDownloadToFile, %Screen204% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title204%.jpg
		UrlDownloadToFile, %Screen205% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title205%.jpg
		UrlDownloadToFile, %Screen206% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title206%.jpg
		UrlDownloadToFile, %Screen207% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title207%.jpg
		UrlDownloadToFile, %Screen208% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title208%.jpg
		UrlDownloadToFile, %Screen209% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title209%.jpg
		UrlDownloadToFile, %Screen2010% , %A_ScriptDir%\Ima\%WeekDate2%\Screen\%Title2010%.jpg
		ToolTip, 
;		T := "`n# " ErrorLevel " #`n`nDay1`n`n" Screen101 "`n" Screen102 "`n" Screen103 "`n" Screen104 "`n" Screen105 "`n" Screen106 "`n" Screen107 "`n" Screen108 "`n" Screen109 "`n" Screen1010 "`n" "Day2`n`n" Screen201 "`n" Screen202 "`n" Screen203 "`n" Screen204 "`n" Screen205 "`n" Screen206 "`n" Screen207 "`n" Screen208 "`n" Screen209 "`n" Screen2010
;		ScrollBox(T)
		Gosub, Guis
	}
return

Guis:
	If CalTog
	{
		Run Calendar.ahk
	}
	If WallTog
	{
		Run WallChanger.ahk
	}
return

RunCal:
	Run Calendar.ahk
return

RunWall:
	Run WallChanger.ahk
return
NextWall:
	PostMessage, NextWall,0,0,,Trakt WallChanger
return
ToggInfo:
	PostMessage, ToggInfo,0,0,,Trakt WallChanger
return

GetProfile:
	ProInfo = %A_ScriptDir%\Info\%User%_Profile.Json
	UrlDownloadToFile, %ProURL% ,%ProInfo%
	FileRead, ProPage, %ProInfo%
	RegExMatch(ProPage,GetFullName,FullName)
	VarFile(VarFile,"FullName",FullName1)
;	T := "`n# " ErrorLevel " #`n" FullName1
	RegExMatch(ProPage,GetGender,Gender)
	VarFile(VarFile,"Gender",Gender1)
;	T := "`n# " ErrorLevel " #`n" Gender1
	RegExMatch(ProPage,GetAge,Age)
	VarFile(VarFile,"Age",Age1)
;	T := "`n# " ErrorLevel " #`n" Age1
	RegExMatch(ProPage,GetLocation,Location)
	VarFile(VarFile,"Location",Location1)
;	T := "`n# " ErrorLevel " #`n" Location1
	RegExMatch(ProPage,GetUserURL,UserURL)
	VarFile(VarFile,"UserURL",UserURL1)
;	T := "`n# " ErrorLevel " #`n" UserURL1
	RegExMatch(ProPage,GetVIP,VIP)
	VarFile(VarFile,"VIP",VIP1)
;	T := "`n# " ErrorLevel " #`n" VIP1
	RegExMatch(ProPage,GetAvatar,Avatar)
	UrlDownloadToFile, %Avatar1% , %A_ScriptDir%\Ima\%User%.png
;	T := "`n# " ErrorLevel " #`n" Avatar1
;	ScrollBox(T)
return

GetWatching:
;	UrlDownloadToFile, %WatchURL% ,WatchPage
	ChangeCheck(WatchURL, 30000)
	FileRead, Watching, WatchPage
;	RegExMatch(WatchPage,GetWatching,Watching)
;	T := "`n# " ErrorLevel " #`n" Watching
;	ScrollBox(T)
return

GetProgres:
	UrlDownloadToFile, %ProgURL% ,%ProgPage%
	RegExMatch(ProgPage,GetProgress,Progres)
;	T := "`n# " ErrorLevel " #`n" Progres1
;	ScrollBox(T)
return

GetDiscover:
	UrlDownloadToFile, %DiscURL% ,%DiscPage%
	RegExMatch(DiscPage,GetDisc,Disc)
;	T := "`n# " ErrorLevel " #`n" Disc1
;	ScrollBox(T)
return

Update: 
	FormatTime, UpTime, %A_NowUTC%,HHmm
;	FormatTime, Todate, %A_Now%,dd
	if (LastTimeChecked = UpTime) 
		return 
	if (CheckTime = UpTime)
;	AND (Date101 != Todate)
	{ 
		GoSub,GetFile
		LastTimeCheck := UpTime    
	} 
return

SetWebTitle(From, ByRef To){
	To:=RegExReplace(From,"\W"," ")
}

SetAirTime(Byref H){
	IfInString, H, pm
	{
		StringSplit, hour, H, `:
		If hour1 < 12
			hour1 += 12
			H = %hour1%:%hour2%
			H := RegExReplace(H, "pm")
	}Else IfInString, H, am	
	{
		StringSplit, hour, H, `:
		If hour1 < 10
			H := RegExReplace(H, "(\d){1}:(\d\d)am", "0$1:$2")
		Else if hour1 = 12
			H := RegExReplace(H, "12:(\d\d)am", "00:$1")
	}
}

SetSE(Byref SE){
SE:= RegExReplace(SE, "^(\d){1}$", "0$1")
}

VarFile(File,Var,Put,Find="",After="=",Before="`n"){
	FileRead what, %File%
	start := InStr(what, Var)
	If (start > 0){
		start := InStr(what, After,, start)
		If (start > 0){
			end := InStr(what, Before,, start)
			If (end > 0){
				If Not Find{
					StringMid endPart, what, end
					StringLeft what, what, start
					what = %what%%put%%endPart%
					FileDelete, %File%
					FileAppend %what%, %File%
				}Else{
					StringMid endPart, what, end
					StringLeft what, what, end - 1
					what := RegExReplace(what, Find, Put,,, start)
					what = %what%%endPart%
					FileDelete, %File%
					FileAppend %what%, %File%
				}
			}Else{
				MsgBox 16,, Bad format of '%File%'! `n No %Before%
			}
		}Else{
			MsgBox 16,, Bad format of '%File%'! `n No %After%
		}
	}Else{
		MsgBox 20,, '%Var%' not found in '%File%'! `nDo you want to create it?
		IfMsgBox, Yes
			FileAppend `n%Var%%After%%Put%%before%, %File%	
	}
}

FileVar(File,Byref OUtput,Find,After="=",Before="`n"){
	IfNotExist %File%
	{
		MsgBox 16 ,, No File Such as %File%
	}Else{
		FileRead what, %File%
		start := InStr(what, Find,,"1")
		If (start > 0){
			start := InStr(what, After,, start)
			If (start > 0){
				end := InStr(what, Before,, start)
				If (end > 0){
					StringMid Output, what, end,,L
					StringMid Output, Output, start - 1
				}Else{
					MsgBox 16,, Bad format of '%File%'! `n No %Before%
				}
			}Else{
				MsgBox 16,, Bad format of '%File%'! `n No %After%
			}
		}Else{
			MsgBox 16,, I Couldn't Find %Find%! 
		}
	}
}

BetweenVar(Var,Byref OUtput,After="=",Before="`n"){
	start := InStr(Var, After,, start)
	If (start > 0){
		end := InStr(Var, Before,, start)
		If (end > 0){
			Start++
			End--
			StringMid Output, Var, end,,L
			StringMid Output, Output, start
		}Else{
			MsgBox 16,, Bad format of '%Var%'! `n No %Before%
		}
	}Else{
		MsgBox 16,, Bad format of '%Var%'! `n No %After%
	}
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

;==[Close]
GuiClose:
	GoSub, GetPos
ExitApp

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

;URLDownloadToVar(url){
;	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
;	hObject.Open("GET",url)
;	hObject.Send()
;	return hObject.ResponseText
;}


ChangeCheck(CheckUrl, CheckTimer=10000, Byref Do=""){
	SetTimer, Change, %CheckTimer%
	Global OldCheckData, nTime, yTime
	Change:
		UrlDownLoadToFile, %CheckURL%?%nTime%, CheckData
		FileRead, NewCheckData, CheckData
		if (NewCheckData != OldCheckData)
		{
			GoSub, Do
			OldCheckData := NewCheckData
		} Else {
		nTime++
		yTime=0
		MsgBox Nope %nTime%
		}
	return
	Do:
	yTime++
	nTime=0
	MsgBox Yeah %yTime%
	FileRead, Watching, WatchPage
	return
}
