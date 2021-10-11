{*******************************************************************************

  abfStatusBar component DEMO. Main form unit.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.

*******************************************************************************}
unit abfStatusBarDemoUnit;

{$I abf.inc}

interface

uses
{$IFDEF D4}
  ImgList,
{$ENDIF D4}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  abfStatusBars, StdCtrls, Buttons, Menus;

type

{******************************************************************************}
{ TfrmMain }

  TfrmMain = class(TForm)
    pnTop: TPanel;
    pnInfo: TPanel;
    memInfo: TMemo;
    pnButton: TPanel;
    btnAbout: TBitBtn;
    stbMain: TabfStatusBar;
    tmrMain: TTimer;
    pmMain: TPopupMenu;
    miItem1: TMenuItem;
    miItem2: TMenuItem;
    miItem3: TMenuItem;
    mi1: TMenuItem;
    miAbout: TMenuItem;
    imgsMain: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure stbMainPanelDblClick(Panel: TabfStatusPanel;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AbountClick(Sender: TObject);
    procedure pnButtonResize(Sender: TObject);
  private
    i: Integer;
  end;

var
  frmMain: TfrmMain;

{******************************************************************************}
implementation
{******************************************************************************}
{$R *.DFM}
uses
  abfAboutComponent;

{******************************************************************************}
{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  i := stbMain.Panels[1].ProgressBarStyle.Progress;
end;

{--------------------------------------}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  stbMain.Panels[2].TextStyle.ScrollEffect := seChangeableDirection;
  tmrMain.Enabled := True;
end;

{--------------------------------------}

procedure TfrmMain.tmrMainTimer(Sender: TObject);
begin
  Inc(i);
  stbMain.Panels[1].ProgressBarStyle.Progress := i;
  if i >= 100 then i := 0;
end;

{--------------------------------------}

procedure TfrmMain.stbMainPanelDblClick(Panel: TabfStatusPanel;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SScrollText = 'This panel has the scrolling text, ScrollEffect = ';
  SNames: array [TabfScrollEffect] of string = ('seNone', 'seFromLeftToRight',
    'seFromRightToLeft', 'seChangeableDirection');
begin
  if not (Panel.Name = 'ScrollText') and (Button = mbLeft) then Exit;
  with Panel.TextStyle do
    if ScrollEffect >= High(ScrollEffect) then ScrollEffect := Low(ScrollEffect)
    else ScrollEffect := Succ(ScrollEffect);
  Panel.Hint := SScrollText + SNames[Panel.TextStyle.ScrollEffect];
end;

{--------------------------------------}

procedure TfrmMain.AbountClick(Sender: TObject);
begin
  abfComponentAbout(stbMain);
end;

{--------------------------------------}

procedure TfrmMain.pnButtonResize(Sender: TObject);
begin
  btnAbout.Left := (pnButton.Width - btnAbout.Width) div 2;
end;

{--------------------------------------}

end{unit abfStatusBarDemoUnit}.
