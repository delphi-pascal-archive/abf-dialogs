{*******************************************************************************

  abfStatusBar component DEMO. Main form unit.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.

*******************************************************************************}
unit abfStatusBarInserterDemoUnit;

{$I abf.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  abfStatusBars, StdCtrls, Buttons, ComCtrls, abfComponents;

type

{******************************************************************************}
{ TfrmMain }

  TfrmMain = class(TForm)
    pnTop: TPanel;
    pnInfo: TPanel;
      memInfo: TMemo;
      btnAbout: TBitBtn;
    stbMain: TStatusBar;
    abiPanel0: TabfStatusBarInserter;
    sbiPanel1: TabfStatusBarInserter;
    trbTest: TTrackBar;
    sbiPanel2: TabfStatusBarInserter;
    sbiPanel3: TabfStatusBarInserter;
    edTest: TEdit;
    prbTest: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure trbTestChange(Sender: TObject);
    procedure AbountClick(Sender: TObject);
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
{$IfDef D4}
  trbTest.ThumbLength := 10;
{$EndIf D4}
  trbTestChange(nil);
end;

{--------------------------------------}

procedure TfrmMain.trbTestChange(Sender: TObject);
const
  SHint = 'Position = ';
begin
  trbTest.Hint := SHint + IntToStr(trbTest.Position);
  prbTest.Position := trbTest.Position;
  prbTest.Hint := trbTest.Hint;
end;

{--------------------------------------}

procedure TfrmMain.AbountClick(Sender: TObject);
begin
  abfComponentAbout(abiPanel0);
end;

{--------------------------------------}

end{unit abfStatusBarInserterDemoUnit}.
