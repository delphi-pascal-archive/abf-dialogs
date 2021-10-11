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
unit abfComboBoxesReg;

{$I abf.inc}
{$WARNINGS OFF}
{$HINTS OFF}

interface

uses
{$IfDef D6}
  DesignIntf,
{$Else D6}
  DsgnIntf,
{$EndIf D6}
  abfComponentsReg, // don't remove this line !!!
  Classes;

type

//==============================================================================
// TabfComboBoxEditor
//==============================================================================
// Component editor for TabfXXXC ComboBoxes, implements OneTouch™ Designer and
// About dialog.

  TabfComboBoxEditor = class(TabfComponentEditor)
  protected
    procedure DesignComponent; virtual;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function  GetVerb(Index: Integer): string; override;
    function  GetVerbCount: Integer; override;
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
  abfConsts, abfVclConsts,
  abfAboutComponent, abfControls, abfComboBoxes, abfDesignerComboBox,
  abfDesignerColorComboBox, abfDesignerFontNameComboBox,
  abfDesignerFontSizeComboBox;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;

  RegisterComponents(SabfComponentPaletteVisual,
    [TabfColorComboBox, TabfFontNameComboBox,
    TabfFontSizeComboBox]);

// Assign component editors
  RegisterComponentEditor(TabfCustomComboBox, TabfComboBoxEditor);
  RegisterComponentEditor(TabfDrawComboBox, TabfComboBoxEditor);
  
// Assign property editors
  RegisterPropertyEditor(TypeInfo(string), TabfCustomComboBox,
    SabfAboutProperty, TabfAboutProperty);
end;


//==============================================================================
// TabfComboBoxEditor
//==============================================================================
// Component editor for TabfXXXC ComboBoxes, implements OneTouch™ Designer and
// About dialog.
// Date: 04/01/2000
{ TabfComboBoxEditor }

procedure TabfComboBoxEditor.DesignComponent;
begin
  if Component is TabfColorComboBox then abfColorComboBoxDesign(Component)
  else
  if Component is TabfFontNameComboBox then abfFontNameComboBoxDesign(Component)
  else
  if Component is TabfFontsizeComboBox then abfFontsizeComboBoxDesign(Component)
  else abfComboBoxDesign(Component);
  Designer.Modified;
end;

//------------------------------------------------------------------------------

procedure TabfComboBoxEditor.ExecuteVerb(Index: Integer);
begin
  if (Index = GetVerbCount - 2) then DesignComponent
  else inherited ExecuteVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfComboBoxEditor.GetVerb(Index: Integer): string;
begin
  if (Index = GetVerbCount - 2) then Result := SabfOneTouchDesigner + '...'
  else Result := inherited GetVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfComboBoxEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

//------------------------------------------------------------------------------

end{unit abfComboBoxesReg}.
