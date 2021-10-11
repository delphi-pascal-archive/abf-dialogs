{*******************************************************************************

  abfAPM Demo. Main form unit.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
unit abfAPMDemoMain;

{$I abf.inc}

interface

uses
{$IfDef D4}
  ImgList,
{$EndIf D4}
  Windows, SysUtils, Classes, Forms, StdCtrls, Menus, Graphics, Controls,
  ExtCtrls,ComCtrls,
// ABF VCL
  abfComponents, abfControls, abfAPM;

const
  cFlatButtons = False; // Determines are speed buttons flat or not
  cWidth  = 640;
  cHeight = 400;

type

//==============================================================================
// TfrmMain
//==============================================================================

  TfrmAPMDemoMain = class(TForm)
    grpManager: TGroupBox;
      imgManager: TImage;
      lbManagerInfo: TLabel;
      pnManager: TPanel;
    grpScheduler: TGroupBox;
      lbSchedulerInfo: TLabel;
      imgScheduler: TImage;
      chbScheduler: TCheckBox;
      pnScheduler: TPanel;
    grpSuspend: TabfGroupBox;
          lbSuspendDate: TLabel;
            edSuspendDate: TEdit;
          lbSuspendTime: TLabel;
            edSuspendTime: TEdit;
          cmbSuspendMode: TComboBox;
          chbForced: TCheckBox;
    grpWakeUp: TabfGroupBox;
          lbWakeUpDate: TLabel;
            edWakeUpDate: TEdit;
          lbWakeUpTime: TLabel;
            edWakeUpTime: TEdit;
          cmbWakeUpMode: TComboBox;
  { Non-visual }
    abfAPMManager: TabfAPMManager;
    abfAPMScheduler: TabfAPMScheduler;
    TrayIcon: TabfTrayIcon;
    pmMain: TPopupMenu;
      miRestore: TMenuItem;
        mi1: TMenuItem;
      miAbout: TMenuItem;
        mi2: TMenuItem;
      miEnabledManager: TMenuItem;
      miEnabledScheduler: TMenuItem;
        mi3: TMenuItem;
      miClose: TMenuItem;
    pcPowerInfo: TPageControl;
    tsPowerStatus: TTabSheet;
    tsPowerCapabilities: TTabSheet;
    grpPowerCapabilities: TGroupBox;
    lbLid: TLabel;
    lbLidResult: TLabel;
    lbPowerButton: TLabel;
    lbPowerButtonResult: TLabel;
    lbSleepButton: TLabel;
    lbSleepButtonResult: TLabel;
    lbSystemBatteries: TLabel;
    lbSystemBatteriesResult: TLabel;
    lbUPS: TLabel;
    lbUPSResult: TLabel;
    grpPowerStatus: TGroupBox;
    lbACLineStatus: TLabel;
    lbBatteryStatus: TLabel;
    lbChargeLevel: TLabel;
    lbBatteryLifePercent: TLabel;
    lbBatteryLifeTime: TLabel;
    lbBatteryLifeTimeResult: TLabel;
    lbBatteryLifePercentResult: TLabel;
    lbChargeLevelResult: TLabel;
    lbBatteryStatusResult: TLabel;
    lbACLineStatusResult: TLabel;
    grpBlockingModes: TGroupBox;
    chbDisplayActivity: TCheckBox;
    chbSystemActivity: TCheckBox;
    lbSystemActivity: TLabel;
    Label1: TLabel;
    chbManager: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ComponentIconClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure miRestoreClick(Sender: TObject);
  { TabfAPMManager }
    procedure EnabledManagerClick(Sender: TObject);
    procedure chbBlockingModeClick(Sender: TObject);
    procedure abfAPMManagerPowerStatusChange(Sender: TObject);
  { TabfAPMScheduler }
    procedure EnabledSchedulerClick(Sender: TObject);
    procedure chbGroupEnabledClick(Sender: TObject);
    procedure cmbModeChange(Sender: TObject);
    procedure edDateTimeChange(Sender: TObject);
  private
    procedure UpdatePowerStatus;
    procedure RefreshManagerStatus;
    procedure RefreshSchedulerStatus;
  end;

var
  frmAPMDemoMain: TfrmAPMDemoMain;

//==============================================================================
// Entry point
//==============================================================================

procedure ShowDemo;

{******************************************************************************}
implementation
{******************************************************************************}
{$R *.DFM}
uses
  abfAboutApplication, abfAboutComponent;

//==============================================================================
// Private consts
//==============================================================================

const
  cPresentFeatureCaptions: array[Boolean] of string = (
    'Absent', 'Present');

//==============================================================================
// Entry point
//==============================================================================

procedure ShowDemo;
begin
  if not Assigned(frmAPMDemoMain) then
    Application.CreateForm(TfrmAPMDemoMain, frmAPMDemoMain);
  frmAPMDemoMain.Show;
  frmAPMDemoMain.BringToFront;
end;


//==============================================================================
// TfrmMain
//==============================================================================
{ TfrmMain }

procedure TfrmAPMDemoMain.UpdatePowerStatus;
var
  Hour, Min, Sec: Integer;
begin
  with abfAPMManager do
  begin
    with SystemBatteryState do
    begin
      if ACOnLine then
      begin
        lbACLineStatusResult.Caption := 'Online';
        lbACLineStatusResult.Font.Color := clGreen;
      end else
      begin
        lbACLineStatusResult.Caption := 'Offline';
        lbACLineStatusResult.Font.Color := clRed;
      end;

      if not BatteryPresent then
      begin
        lbBatteryStatusResult.Caption := 'Unknown';
        lbBatteryStatusResult.Font.Color := clBlack;
      end else
      begin
        if Charging then
        begin
          lbBatteryStatusResult.Caption := 'Charging';
          lbBatteryStatusResult.Font.Color := clBlue;
        end else
        if Discharging then
        begin
          lbBatteryStatusResult.Caption := 'Discharging';
          lbBatteryStatusResult.Font.Color := clFuchsia;
        end else
        begin
          lbBatteryStatusResult.Caption := 'Nothing';
          lbBatteryStatusResult.Font.Color := clBlack;
        end;
      end;

      case BatteryFlag of
      bfHigh:
        begin
          lbChargeLevelResult.Caption := 'High';
          lbChargeLevelResult.Font.Color := clGreen;
        end;
      bfLow:
        begin
          lbChargeLevelResult.Caption := 'Low';
          lbChargeLevelResult.Font.Color := clYellow;
        end;
      bfCritical:
        begin
          lbChargeLevelResult.Caption := 'Critical';
          lbChargeLevelResult.Font.Color := clRed;
        end;
      else
        begin
          lbChargeLevelResult.Caption := 'Unknown';
          lbChargeLevelResult.Font.Color := clBlack;
        end;
      end;

      if abfAPMManager.BatteryLifePercent in [0..100] then
      begin
        lbBatteryLifePercentResult.Caption := Format('%d%', [abfAPMManager.BatteryLifePercent]);
        lbBatteryLifePercentResult.Font.Color := lbChargeLevelResult.Font.Color;
      end else
      begin
        lbBatteryLifePercentResult.Caption := 'Unknown';
        lbBatteryLifePercentResult.Font.Color := clBlack;
      end;
      if abfAPMManager.BatteryLifeTime > -1 then
      begin
        Hour := abfAPMManager.BatteryLifeTime div 3600;
        Min := (abfAPMManager.BatteryLifeTime - Hour * 3600) div 60;
        Sec := abfAPMManager.BatteryLifeTime - Hour * 3600 - Min * 60;
        lbBatteryLifeTimeResult.Caption := Format('%2.2dh:%2.2dm:%2.2ds',
                                                      [Hour, Min, Sec]);
        lbBatteryLifeTimeResult.Font.Color := lbChargeLevelResult.Font.Color;
      end else
      begin
        lbBatteryLifeTimeResult.Caption := 'Unknown';
        lbBatteryLifeTimeResult.Font.Color := clBlack;
      end;
    end;

    with PowerCapabilities do
    begin
      lbLidResult.Caption :=
        cPresentFeatureCaptions[LidPresent];
      lbPowerButtonResult.Caption :=
        cPresentFeatureCaptions[PowerButtonPresent];
      lbSleepButtonResult.Caption :=
        cPresentFeatureCaptions[SleepButtonPresent];
      lbSystemBatteriesResult.Caption :=
        cPresentFeatureCaptions[SystemBatteriesPresent];
      lbUPSResult.Caption :=
        cPresentFeatureCaptions[UpsPresent];
    end;
  end;
end{procedure TfrmAPMDemoMain.UpdatePowerStatus};

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.RefreshManagerStatus;
var
  i: Integer;
begin
  chbManager.OnClick := nil;
  try
    chbManager.Checked := abfAPMManager.Enabled;
  finally
    chbManager.OnClick := EnabledManagerClick;
  end;

  for i:= 0 to pnManager.ControlCount - 1 do
    pnManager.Controls[i].Enabled := chbManager.Checked;

  for i:= 0 to grpBlockingModes.ControlCount - 1 do
    grpBlockingModes.Controls[i].Enabled := chbManager.Checked;

  for i:= 0 to grpPowerStatus.ControlCount - 1 do
  begin
    grpPowerStatus.Controls[i].Enabled := chbManager.Checked;
  end;

  for i:= 0 to grpPowerCapabilities.ControlCount - 1 do
  begin
    grpPowerCapabilities.Controls[i].Enabled := chbManager.Checked;
  end;

  UpdatePowerStatus;

  chbSystemActivity.OnClick := nil;
  try
    chbSystemActivity .Checked := amSystemActivity  in abfAPMManager.BlockingModes;
  finally
    chbSystemActivity.OnClick := chbBlockingModeClick;
  end;

  chbDisplayActivity.OnClick := nil;
  try
    chbDisplayActivity.Checked := amDisplayActivity in abfAPMManager.BlockingModes;
  finally
    chbDisplayActivity.OnClick := chbBlockingModeClick;
  end;
end;{procedure TfrmMain.RefreshabfAPMManagerStatus}

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.RefreshSchedulerStatus;
var
  i: Integer;
begin
  chbScheduler.OnClick := nil;
  try
    chbScheduler.Checked := abfAPMScheduler.Enabled;
  finally
    chbScheduler.OnClick := EnabledSchedulerClick;
  end;

  grpSuspend.OnCheckBoxClick := nil;
  try
    grpSuspend.CheckBox.Checked := abfAPMScheduler.SuspendOptions.Enabled;
  finally
    grpSuspend.OnCheckBoxClick := chbGroupEnabledClick;
  end;

  grpWakeUp.OnCheckBoxClick := nil;
  try
    grpWakeUp.CheckBox.Checked := abfAPMScheduler.WakeUpOptions.Enabled;
  finally
    grpWakeUp.OnCheckBoxClick := chbGroupEnabledClick;
  end;

  for i:= 0 to pnScheduler.ControlCount - 1 do
    pnScheduler.Controls[i].Enabled := chbScheduler.Checked;
  if abfAPMScheduler.SuspendOptions.Enabled then
    for i:= 0 to grpSuspend.ControlCount - 1 do
      grpSuspend.Controls[i].Enabled := chbScheduler.Checked;

  edSuspendDate.OnChange := nil;
  try
    edSuspendDate.Text := DateToStr(abfAPMScheduler.SuspendOptions.Date);
  finally
    edSuspendDate.OnChange := edDateTimeChange;
  end;

  edSuspendTime.OnChange := nil;
  try
    edSuspendTime.Text := TimeToStr(abfAPMScheduler.SuspendOptions.Time);
  finally
    edSuspendTime.OnChange := edDateTimeChange;
  end;

  cmbSuspendMode.OnChange := nil;
  try
    cmbSuspendMode.ItemIndex := Integer(abfAPMScheduler.SuspendOptions.Mode);
  finally
    cmbSuspendMode.OnChange := cmbModeChange;
  end;

  chbForced.Checked := abfAPMScheduler.SuspendOptions.Forced;

  if abfAPMScheduler.WakeUpOptions.Enabled then
    for i:= 0 to grpWakeUp.ControlCount - 1 do
      grpWakeUp.Controls[i].Enabled := chbScheduler.Checked;

  edWakeUpDate.OnChange := nil;
  try
    edWakeUpDate.Text := DateToStr(abfAPMScheduler.WakeUpOptions.Date);
  finally
    edWakeUpDate.OnChange := edDateTimeChange;
  end;

  edWakeUpTime.OnChange := nil;
  try
    edWakeUpTime.Text := TimeToStr(abfAPMScheduler.WakeUpOptions.Time);
  finally
    edWakeUpTime.OnChange := edDateTimeChange;
  end;

  cmbWakeUpMode.OnChange := nil;
  try
    cmbWakeUpMode.ItemIndex := Integer(abfAPMScheduler.SuspendOptions.Mode);
  finally
    cmbWakeUpMode.OnChange := cmbModeChange;
  end;
end;{procedure TfrmMain.RefreshAPMSchedulerStatus}

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.FormCreate(Sender: TObject);
begin
  abfAPMScheduler.SuspendOptions.Date := Date;
  abfAPMScheduler.WakeUpOptions.Date := Date;
  abfAPMScheduler.SuspendOptions.Time := Time;
  abfAPMScheduler.WakeUpOptions.Time := Time;
  Width  := cWidth;
  Height := cHeight;
  TrayIcon.Icon := Application.Icon;
{$IfDef D4}
  OnCanResize := FormCanResize;
{$EndIf D4}
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.FormResize(Sender: TObject);
begin
{$IfNDef D4}
  if Width  < cWidth  then Width  := cWidth;
  if Height < cHeight then Height := cHeight;
{$EndIf D4}
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth  < cWidth  then NewWidth  := cWidth;
  if NewHeight < cHeight then NewHeight := cHeight;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.FormShow(Sender: TObject);
begin
  TrayIcon.Visible := False;
  RefreshManagerStatus;
  RefreshSchedulerStatus;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.ComponentIconClick(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    1: abfComponentAboutEx(abfAPMManager, '', '', True);
    2: abfComponentAboutEx(abfAPMScheduler, '', '', True);
  end;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.AboutClick(Sender: TObject);
begin
  abfApplicationAboutEx(Application.Title, ''{SabfVCLVersion}, '', '',
    True, nil);
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.CloseClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.pmMainPopup(Sender: TObject);
var
  ExtendedMenu: Boolean;
begin
  ExtendedMenu := (pmMain.PopupComponent = TrayIcon);
  miRestore.Visible := ExtendedMenu;
  mi1.Visible := ExtendedMenu;

  miEnabledManager.Checked := abfAPMManager.Enabled;
  miEnabledScheduler.Checked := abfAPMScheduler.Enabled;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.miRestoreClick(Sender: TObject);
begin
  TrayIcon.Visible := False;
end;

//==============================================================================
// TabfAPMManager

procedure TfrmAPMDemoMain.EnabledManagerClick(Sender: TObject);
begin
  abfAPMManager.Enabled := not abfAPMManager.Enabled;
  RefreshManagerStatus;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.chbBlockingModeClick(Sender: TObject);
var
  Temp: TabfAPMManagerBlockingModes;
begin
  TCheckBox(Sender).OnClick := nil;
  try
    Temp := [];
    if chbSystemActivity .Checked then Include(Temp, amSystemActivity);
    if chbDisplayActivity.Checked then Include(Temp, amDisplayActivity);

    abfAPMManager.BlockingModes := Temp;

    chbSystemActivity .Checked := amSystemActivity in abfAPMManager.BlockingModes;
    chbDisplayActivity.Checked := amDisplayActivity in abfAPMManager.BlockingModes;
  finally
    TCheckBox(Sender).OnClick := chbBlockingModeClick;
  end;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.abfAPMManagerPowerStatusChange(Sender: TObject);
begin
  UpdatePowerStatus;
end;

//==============================================================================
// TabfAPMScheduler

procedure TfrmAPMDemoMain.EnabledSchedulerClick(Sender: TObject);
begin
  abfAPMScheduler.Enabled := not abfAPMScheduler.Enabled;
  RefreshSchedulerStatus;
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.chbGroupEnabledClick(Sender: TObject);
var
  i: Integer;
begin
  with TabfGroupBox(Sender) do
    if Tag = 1 then
    begin
      abfAPMScheduler.SuspendOptions.Enabled := CheckBox.Checked;
      for i:= 0 to grpSuspend.ControlCount - 1 do
        if grpSuspend.Controls[i] <> grpSuspend.CheckBox then
          grpSuspend.Controls[i].Enabled := CheckBox.Checked;
    end else
    begin
      abfAPMScheduler.WakeUpOptions.Enabled := CheckBox.Checked;
      for i:= 0 to grpWakeUp.ControlCount - 1 do
        if grpWakeUp.Controls[i] <> grpWakeUp.CheckBox then
          grpWakeUp.Controls[i].Enabled := CheckBox.Checked;
    end;
end;
//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.cmbModeChange(Sender: TObject);
begin
  with TComboBox(Sender) do
    if Tag = 1 then
      abfAPMScheduler.SuspendOptions.Mode := TabfAPMTimerMode(ItemIndex)
    else
      abfAPMScheduler.WakeUpOptions.Mode := TabfAPMTimerMode(ItemIndex);
end;

//------------------------------------------------------------------------------

procedure TfrmAPMDemoMain.edDateTimeChange(Sender: TObject);
begin
  try
    with TEdit(Sender) do
      case Tag of
        1: abfAPMScheduler.SuspendOptions.Date := StrToDate(Text);
        2: abfAPMScheduler.SuspendOptions.Time := StrToTime(Text);
        3: abfAPMScheduler.WakeUpOptions .Date := StrToDate(Text);
        4: abfAPMScheduler.WakeUpOptions .Time := StrToTime(Text);
      end;
  except
  end;
end;

//------------------------------------------------------------------------------

end{unit abfAPMDemoMain}.

