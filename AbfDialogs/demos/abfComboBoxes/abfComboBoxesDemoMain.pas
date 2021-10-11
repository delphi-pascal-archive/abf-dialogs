{*******************************************************************************

  abfComboBoxes Demo. Main form unit.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
unit abfComboBoxesDemoMain;

{$I abf.inc}

interface

uses
{$IfDef D4}
  ImgList,
{$EndIf D4}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons,
  abfControls, abfComboBoxes;

const
  cFlatButtons = True; // Determines are speed buttons flat or not
  cWidth  = 580;
  cHeight = 370;

type

//==============================================================================
// TfrmMain
//==============================================================================

  TfrmComboBoxesDemoMain = class(TForm)
    pnBar: TPanel;
        bvTool: TBevel;
      btnNew: TSpeedButton;
      btnOpenFile: TSpeedButton;
      btnSaveFile: TSpeedButton;
        bvSep1: TBevel;
      btnPrint: TSpeedButton;
        bvSep2: TBevel;
      btnAbout: TSpeedButton;
    pnBar2: TPanel;
        bvTool2: TBevel;
      cmbFontName: TabfFontNameComboBox;
        bvSep4: TBevel;
      cmbFontSize: TabfFontSizeComboBox;
      cmbColor: TabfColorComboBox;
        bvSep5: TBevel;
      btnBold: TSpeedButton;
      btnItalic: TSpeedButton;
      btnUnderline: TSpeedButton;
        bvSep6: TBevel;
      cmbCursor: TabfComboBox;
    pnTop: TPanel;
    pnEditor: TPanel;
      edMain: TRichEdit;
    dlgOpenRtf: TOpenDialog;
    dlgSaveRtf: TSaveDialog;
    imglstCursors: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cmbColorChange(Sender: TObject);
    procedure cmbFontNameChange(Sender: TObject);
    procedure cmbFontSizeChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnBoldClick(Sender: TObject);
    procedure btnItalicClick(Sender: TObject);
    procedure btnUnderlineClick(Sender: TObject);
    procedure edMainSelectionChange(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure cmbCursorClick(Sender: TObject);
  private
    FRichEditChanging: Boolean;
  end;

var
  frmComboBoxesDemoMain: TfrmComboBoxesDemoMain;

//==============================================================================
// Entry point
//==============================================================================
procedure ShowDemo;

{******************************************************************************}
implementation
{******************************************************************************}
{$R *.DFM}
uses
  abfConsts, abfSysUtils, abfAboutApplication;

//==============================================================================
// Entry point
//==============================================================================

procedure ShowDemo;
begin
  if not Assigned(frmComboBoxesDemoMain) then
    Application.CreateForm(TfrmComboBoxesDemoMain, frmComboBoxesDemoMain);
  frmComboBoxesDemoMain.Show;
  frmComboBoxesDemoMain.BringToFront;
end;


//==============================================================================
// TfrmMain
//==============================================================================
{ TfrmMain }

procedure TfrmComboBoxesDemoMain.FormCreate(Sender: TObject);

{$IfDef D3}
  procedure _EnumComponents;
  var
    i: Integer;
  begin
    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TSpeedButton) then TSpeedButton(Components[i]).Flat := cFlatButtons;
  end;
{$EndIf D3}

begin
{$IfDef D3}
  _EnumComponents;
{$EndIf D3}
  try
    edMain.Lines.LoadFromFile(abfAddSlash(SAppPath) + 'some.rtf');
  except
  end;
  cmbCursor.ItemIndex := cmbCursor.Items.Count - 1;
// Fix form width and height
  Width  := cWidth;
  Height := cHeight;
{$IfDef D4}
  OnCanResize := FormCanResize;
{$EndIf D4}
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.FormResize(Sender: TObject);
begin
{$IfNDef D4}
  if Width  < cWidth  then Width  := cWidth;
  if Height < cHeight then Height := cHeight;
{$EndIf D4}
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth  < cWidth  then NewWidth  := cWidth;
  if NewHeight < cHeight then NewHeight := cHeight;
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnNewClick(Sender: TObject);
begin
  edMain.Clear;
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnOpenFileClick(Sender: TObject);
begin
  if dlgOpenRtf.Execute then
    edMain.Lines.LoadFromFile(dlgOpenRtf.FileName);
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnSaveFileClick(Sender: TObject);
begin
  if dlgSaveRtf.Execute then
    edMain.Lines.SaveToFile(dlgSaveRtf.FileName);
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnPrintClick(Sender: TObject);
begin
  Application.MessageBox(
    'Printing is disabled to prevent errors or paper utilization :)', 'Printing...',
    MB_OK or MB_ICONINFORMATION);
//  edMain.Print(Application.Title);
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnAboutClick(Sender: TObject);
begin
  abfApplicationAboutEx(Application.Title, ''{SabfVCLVersion}, '', '',
    True, nil);
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.cmbColorChange(Sender: TObject);
begin
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Color := cmbColor.SelectedColor;
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.cmbFontNameChange(Sender: TObject);
begin
  cmbFontSize.FontName := cmbFontName.FontName;
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Name := cmbFontName.FontName;
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.cmbFontSizeChange(Sender: TObject);
begin
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Size := cmbFontSize.FontSize;
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnBoldClick(Sender: TObject);
begin
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Style := edMain.SelAttributes.Style + [fsBold];
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnItalicClick(Sender: TObject);
begin
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Style := edMain.SelAttributes.Style + [fsItalic];
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.btnUnderlineClick(Sender: TObject);
begin
  if FRichEditChanging then Exit;
  edMain.SelAttributes.Style := edMain.SelAttributes.Style + [fsUnderline];
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.edMainSelectionChange(Sender: TObject);
var
  OldValue: Boolean;
begin
  OldValue := FRichEditChanging;
  FRichEditChanging := True;
  with edMain.SelAttributes do
  try
    cmbFontName.FontName   := Name;
    cmbFontSize.FontSize   := Size;
    cmbColor.SelectedColor := edMain.SelAttributes.Color;
    btnBold     .Down := fsBold in Style;
    btnItalic   .Down := fsItalic in Style;
    btnUnderLine.Down := fsUnderLine in Style;
  finally
    FRichEditChanging := OldValue;
  end
end;

//------------------------------------------------------------------------------

procedure TfrmComboBoxesDemoMain.cmbCursorClick(Sender: TObject);
const
  cCursors: array[0..4] of TCursor = (crArrow, crIBeam, crCross, crHourGlass,
    crDefault);
begin
  edMain.Cursor := cCursors[cmbCursor.ItemIndex];
end;

//------------------------------------------------------------------------------

end{unit abfComboBoxesDemoUnit}.
