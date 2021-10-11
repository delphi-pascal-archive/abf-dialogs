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
unit abfControlsReg;

{$I abf.inc}
{$WARNINGS OFF}
{$HINTS OFF}

interface

uses
  abfComponentsReg, // don't remove this line !!!
{$IfDef D6}
  DesignIntf, DesignEditors, DesignMenus,
{$Else D6}
  DsgnIntf,
{$EndIf D6}
  Classes, SysUtils;

type

//==============================================================================
// TabfControlEditor
//==============================================================================
// Default control editor for TabfXXX components. Implements "About..." item
// in the popup menu.

  TabfControlEditor = class(TDefaultEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
{$IfDef D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
{$EndIf D5}
  end;

//==============================================================================
// TabfImageEditor
//==============================================================================
// Editor for TabfImage control. Shows load picture dialog by default

  TabfImageEditor = class(TabfControlEditor)
  protected
    FPropName: string;
{$IfDef D6}
    procedure FindProperty(const PropertyEditor: IProperty); virtual;
{$Else D6}
    procedure FindProperty(PropertyEditor: TPropertyEditor); virtual;
{$EndIf D6}
  public
    procedure Edit; override;
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
  Forms, TypInfo,
  abfConsts, abfVclConsts, abfComponents, abfAboutComponent, abfControls;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfComponentsReg.Register;

  RegisterComponents(SabfComponentPaletteVisual, [TabfImage, TabfComboBox,
    TabfImageListBox, TabfGroupBox, TabfScrollBar, TabfDatePanel]);

  RegisterComponents(SabfComponentPaletteEdits, [TabfEdit]);

// Assign component editors
  RegisterComponentEditor(TabfCustomControl, TabfControlEditor);
  RegisterComponentEditor(TabfGraphicControl, TabfControlEditor);
  RegisterComponentEditor(TabfCustomEdit, TabfControlEditor);
  RegisterComponentEditor(TabfCustomComboBox, TabfControlEditor);
  RegisterComponentEditor(TabfCustomImageListBox, TabfControlEditor);
  RegisterComponentEditor(TabfCustomImage, TabfImageEditor);
  RegisterComponentEditor(TabfCustomGroupBox, TabfControlEditor);
  RegisterComponentEditor(TabfCustomDatePanel, TabfControlEditor);

// Assign property editors
  RegisterPropertyEditor(TypeInfo(string), TabfCustomControl,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfGraphicControl,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomEdit, SabfAboutProperty,
    TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomComboBox,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomImageListBox,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomImage, SabfAboutProperty,
    TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomGroupBox,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomDatePanel,
    SabfAboutProperty, TabfAboutProperty);
end;


//==============================================================================
// TabfControlEditor
//==============================================================================
// Default control editor for TabfXXX components. Implements "About..." item
// in the popup menu.
{ TabfControlEditor }

procedure TabfControlEditor.ExecuteVerb(Index: Integer);
begin
  if (Index = GetVerbCount - 1) then abfComponentAbout(Component)
  else inherited ExecuteVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfControlEditor.GetVerb(Index: Integer): string;
begin
  if (Index = GetVerbCount - 1) then Result := SabfAbout + '...'
  else Result := inherited GetVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfControlEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

//------------------------------------------------------------------------------
{$IfDef D5}

procedure TabfControlEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  {$IfNDef D6}
  if (Index = GetVerbCount - 1) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'GLYPH_ABOUT')
  else
  {$EndIf D6}
    inherited PrepareItem(Index, AItem)
end;

{$EndIf D5}


//==============================================================================
// TabfImageEditor
//==============================================================================
// Editor for TabfImage control. Shows load picture dialog by default
{ TabfImageEditor }

type
{$IfDef D6}
  TComponents = TDesignerSelections;
  IComponents = IDesignerSelections;
{$Else D6}
  {$IfDef D5}
  TComponents = TDesignerSelectionList;
  IComponents = TDesignerSelectionList;
  {$Else D5}
  TComponents = TComponentList;
  IComponents = TComponentList;
  {$EndIf D5}
{$EndIf D6}


procedure TabfImageEditor.Edit;

  //-------------------------------------

  procedure _ExecutePropEditor(const APropName: string);
  var
    Components: IComponents;
  begin
    FPropName := APropName;
    Components := TComponents.Create;
    try
      Components.Add(Component);
      GetComponentProperties(Components, [tkClass], Designer,
        FindProperty{$IfDef D6}, nil{$EndIf});
    finally
{$IfNDef D6}
      Components.Free;
{$EndIf D6}
    end;
  end;{Internal procedure _ExecutePropEditor}

  //-------------------------------------

begin
  _ExecutePropEditor('Picture');
end;

//------------------------------------------------------------------------------

{$IfDef D6}
procedure TabfImageEditor.FindProperty(const PropertyEditor: IProperty);
{$Else D6}
procedure TabfImageEditor.FindProperty(PropertyEditor: TPropertyEditor);
{$EndIf D6}
begin
  if PropertyEditor.GetName = FPropName then PropertyEditor.Edit;
{$IfNDef D6}
  PropertyEditor.Free;
{$EndIf D6}
end;

//------------------------------------------------------------------------------

end{unit abfControlsReg}.

