{*******************************************************************************

  ABF Visual Components Library, Design-time part

  Copyright (c) 2000-2005 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@abf-dev.com
  web:    http://www.abf-dev.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

  RESTRICTIONS

  THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED FILES OR ANY
PORTION OF ITS CONTENTS SHALL AT NO TIME BE COPIED, TRANSFERRED, SOLD,
DISTRIBUTED, OR OTHERWISE MADE AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS
WRITTEN CONSENT AND PERMISSION FROM THE ABF SOFTWARE, INC.

  CONSULT THE END USER LICENSE AGREEMENT (EULA) FOR INFORMATION ON ADDITIONAL
RESTRICTIONS.

*******************************************************************************}
unit abfEffectsReg;

{$I abf.inc}
{$WARNINGS OFF}
{$HINTS OFF}

interface

uses
{$IfDef D6}
  DesignIntf, DesignEditors,
{$Else D6}
  DsgnIntf,
{$EndIf D6}
  abfComponentsReg, // don't remove this line !!!
  Classes, SysUtils;

type

//==============================================================================
// TabfFillTypeEditor
//==============================================================================
// FillType property editor for TabfBackGround control.

  TabfFillTypeProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

//==============================================================================
// Registration
//==============================================================================

procedure Register;

{******************************************************************************}
implementation
{******************************************************************************}
{$R *.res}

uses
  abfControlsReg, // don't remove this line !!!
  abfConsts, abfEffects;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;

  RegisterComponents(SabfComponentPaletteNonVisual,
    [TabfFormEffect]);
  RegisterComponents(SabfComponentPaletteVisual,
    [TabfBackGround, TabfCredits, TabfMovablePanel, TabfMagnifier]);

// Assign component editors
  RegisterComponentEditor(TabfCustomBackGround, TabfControlEditor);
  RegisterComponentEditor(TabfMovablePanel, TabfControlEditor);

// Assign property editors
  RegisterPropertyEditor(TypeInfo(string), TabfCustomBackGround,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfMovablePanel,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(TabfBackGroundFillType), TabfCustomBackGround,
    'FillType', TabfFillTypeProperty);
end;


//==============================================================================
// TabfFillTypeProperty
//==============================================================================
// FillType property editor for TabfBackGround control.
{ TabfFillTypeProperty } 

function TabfFillTypeProperty.GetAttributes:TPropertyAttributes;
begin
  Result := [paValueList];
end;

//------------------------------------------------------------------------------

procedure TabfFillTypeProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  for i := 0 to abfGraphicFillList.Count - 1 do
    Proc(abfGraphicFillList[i]);
end;

//------------------------------------------------------------------------------

end{unit abfEffectsReg}.
