?
 TFRMAPMDEMOMAIN 0?#  TPF0TfrmAPMDemoMainfrmAPMDemoMainLeftTop? BorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaptionabfAPM DemoClientHeightuClientWidthxFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameMS Sans Serif
Font.Style 	PopupMenupmMainPositionpoScreenCenterShowHint	OnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight 	TGroupBoxgrpSchedulerLeftBTopWidth0HeightlCaptionTabfAPMSchedulerFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder TLabellbSchedulerInfoLeft,TopWidth? Height? AutoSizeCaptionY  TabfAPMScheduler is a non-visual component that allows easily create APM oriented timers and schedulers, has two independent timers to control a suspending and resuming of the system. Also you can specify the APM events that will occur every day, week, month etc. Very useful in diagnostic, auto sleep/wake-up, and "long time working" programs. Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontWordWrap	  TImageimgSchedulerTagLeft
TopWidthHeightHintabfAPMSchedulerAutoSize	Picture.Data
B  TBitmap6  BM6      v   (               ?                ???  ?? ? ?   ? ??   ?  ?        ?   ??   ? ??? ??? ???         ??????????????`p??????????????????????????????????w{w{?????????w?w??{???????w?׻?{???????ݻ?	????????????w	??????????w{?|?????ݰ????w???????зwww{7{??????}s? ?}???????3 p 7???????7  w7???????3  7???????s??}???????w;7{??????{wws33ww|??????qwwwq|??????q??|????????????????????{??w???????????w{??????????????????????????????????????????????????????????????              ?OnClickComponentIconClick  TPanelpnSchedulerLeftTop? Width%Height? 
BevelOuterbvNoneFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTabOrder TabfGroupBox	grpWakeUpTagLeftTopdWidthHeight\CaptionWake up enabledTabOrderOnCheckBoxClickchbGroupEnabledClick TLabellbWakeUpDateLeft
TopWidthHeightCaptionDateFocusControledWakeUpDate  TLabellbWakeUpTimeLeft? TopWidthHeightCaptionTimeFocusControledWakeUpTime  TEditedWakeUpDateTagLeft
Top Width? Height	MaxLength
TabOrder OnChangeedDateTimeChange  TEditedWakeUpTimeTagLeft? Top Width? Height	MaxLengthTabOrderOnChangeedDateTimeChange  	TComboBoxcmbWakeUpModeTagLeft
Top<Width? HeightStylecsDropDownList
ItemHeightItems.StringsOne time	Every day
Every week TabOrderOnChangecmbModeChange   TabfGroupBox
grpSuspendTagLeftTopWidthHeight\CaptionSuspend enabledTabOrder OnCheckBoxClickchbGroupEnabledClick TLabellbSuspendDateLeft
TopWidthHeightCaptionDateFocusControledSuspendDate  TLabellbSuspendTimeLeft? TopWidthHeightCaptionTimeFocusControledSuspendTime  	TCheckBox	chbForcedLeft? Top@Width9HeightCaptionForcedTabOrder  TEditedSuspendDateTagLeft
Top Width? Height	MaxLength
TabOrder OnChangeedDateTimeChange  TEditedSuspendTimeTagLeft? Top Width? Height	MaxLengthTabOrderOnChangeedDateTimeChange  	TComboBoxcmbSuspendModeTagLeft
Top<Width? HeightStylecsDropDownList
ItemHeightItems.StringsOne time	Every day
Every week TabOrderOnChangecmbModeChange    	TCheckBoxchbSchedulerLeftTop? WidthDHeightCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTabOrder    	TGroupBox
grpManagerLeftTopWidth1HeightlCaptionTabfAPMManagerFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  TImage
imgManagerTagLeft
TopWidthHeightHintabfAPMManagerAutoSize	Picture.Data
B  TBitmap6  BM6      v   (               ?                ???  ?? ? ?   ? ??   ?  ?        ?   ??   ? ??? ??? ???         ??????????????pp?????????????????????????????????????????????????w{w{?????????w?w??|???????w?׻?|???????ݻ?	????????????w	??????????w????????ݰ???׻???????зwww{????????{л?{?????????л?{?????????л?{??????????{??????????:?{?????????г{????????{?? {????????????ۻ???????????????????????????????????????????????????????????????????????????????????????????????????????              ?OnClickComponentIconClick  TLabellbManagerInfoLeft,TopWidth? Height\AutoSizeCaption?TabfAPMManager is a non-visual component that controls the system power behaviors. Contains information about power capabilities and power status. Allows suspending and resuming of the system or blocking of these features.Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontWordWrap	  TPanel	pnManagerLeftTopxWidth%Height? 
BevelOuterbvNoneFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTabOrder TPageControlpcPowerInfoLeftTopfWidthHeight? 
ActivePagetsPowerStatusTabOrder  	TTabSheettsPowerStatusCaptionPower status 	TGroupBoxgrpPowerStatusLeftTop Width	HeightbTabOrder  TLabellbACLineStatusLeft
TopWidthOHeightCaptionAC line status:  TLabellbBatteryStatusLeft
TopWidthMHeightCaptionBattery status:  TLabellbChargeLevelLeft
Top-WidthmHeightCaptionBattery charge level:  TLabellbBatteryLifePercentLeft
Top=WidthgHeightCaptionBattery life percent:  TLabellbBatteryLifeTimeLeft
TopMWidthVHeightCaptionBattery life time:  TLabellbBatteryLifeTimeResultLeft? TopMWidth4HeightCaptionUnknown  TLabellbBatteryLifePercentResultLeft? Top=Width4HeightCaptionUnknown  TLabellbChargeLevelResultLeft? Top-Width4HeightCaptionUnknown  TLabellbBatteryStatusResultLeft? TopWidth4HeightCaptionUnknown  TLabellbACLineStatusResultLeft? TopWidth4HeightCaptionUnknown    	TTabSheettsPowerCapabilitiesCaptionPower capabilities 	TGroupBoxgrpPowerCapabilitiesLeftTop Width	HeightbTabOrder  TLabellbLidLeft
TopWidthHeightCaptionLid:  TLabellbLidResultLeft? TopWidth4HeightCaptionUnknown  TLabellbPowerButtonLeft
TopWidthKHeightCaptionPower button:  TLabellbPowerButtonResultLeft? TopWidth4HeightCaptionUnknown  TLabellbSleepButtonLeft
Top-WidthHHeightCaptionSleep button:  TLabellbSleepButtonResultLeft? Top-Width4HeightCaptionUnknown  TLabellbSystemBatteriesLeft
Top=Width_HeightCaptionSystem batteries:  TLabellbSystemBatteriesResultLeft? Top=Width4HeightCaptionUnknown  TLabellbUPSLeft
TopMWidthHeightCaptionUPS:  TLabellbUPSResultLeft? TopMWidth4HeightCaptionUnknown     	TGroupBoxgrpBlockingModesLeftTopWidthHeightRTabOrder TLabellbSystemActivityLeftTopWidth? HeightAutoSizeCaptionDPrevents the system from putting the computer in the sleeping state.FocusControlchbSystemActivityWordWrap	  TLabelLabel1LeftTop/Width? HeightAutoSizeCaption1Prevents the system from turning off the display.WordWrap	  	TCheckBoxchbDisplayActivityLeftTop/WidthHeightCaptionchbDisplayActivityTabOrderOnClickchbBlockingModeClick  	TCheckBoxchbSystemActivityLeftTopWidthHeightCaptionchbSystemActivityTabOrder OnClickchbBlockingModeClick    	TCheckBox
chbManagerLeftTopnWidthDHeightCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTabOrder    
TPopupMenupmMainOnPopuppmMainPopupLeftTop 	TMenuItem	miRestoreCaption&RestoreDefault	OnClickmiRestoreClick  	TMenuItemmi1Caption-  	TMenuItemmiAboutCaption	&About...OnClick
AboutClick  	TMenuItemmi2Caption-  	TMenuItemmiEnabledManagerCaptionEnabled managerChecked	  	TMenuItemmiEnabledSchedulerCaptionEnabled schedulerChecked	OnClickEnabledSchedulerClick  	TMenuItemmi3Caption-  	TMenuItemmiCloseCaption&CloseShortCuts?  OnClick
CloseClick   TabfTrayIconTrayIconHintabfAPM Demo	Icon.Data
>           (     (                ?                         ?  ?   ?? ?   ? ? ??  ??? ???   ?  ?   ?? ?   ? ? ??  ???             ?   w?8? wx? 3?3 x??p 3  x???   x  w      p??p  p ?p  p ?p  p ?0  p 	0  p ?0    p p     w   ?#  ?   ?   ?@  ?  ?G  ??     J  Z  Z  Z  Z  Z  ??  ~?  MinimizeToTray		PopupMenupmMainLeftTop  TabfAPMSchedulerabfAPMSchedulerLeftNTop  TabfAPMManagerabfAPMManagerBlockingModes OnPowerStatusChangeabfAPMManagerPowerStatusChangeLeftTop   