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
unit abfComControlsReg;

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
  abfControlsReg, // don't remove this line !!!
  TypInfo, Classes, SysUtils;

type

//==============================================================================
// TabfListViewEditor
//==============================================================================
// Component editor for TabfCustomListView controls and its descendants.

  TabfListViewEditor = class(TabfComponentEditor)
  protected
    FPropName: string;
{$IfNDef D6}
    procedure FindProperty(PropertyEditor: TPropertyEditor); virtual;
{$Else D6}
    procedure FindProperty(const PropertyEditor: IProperty); virtual;
{$EndIf D6}
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
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
  Forms, abfConsts, abfComponents, abfAboutComponent, abfComControls,
  abfComControlsConsts;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;

  RegisterComponents(SabfComponentPaletteVisual,
    [TabfRichEdit, TabfListView, TabfProgressBar, TabfTrackBar]);

// Assign property editors
  RegisterPropertyEditor(TypeInfo(string), TabfCustomRichEdit,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfCustomListView,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfProgressBar,
    SabfAboutProperty, TabfAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TabfTrackBar,
    SabfAboutProperty, TabfAboutProperty);

// Assign component editors
  RegisterComponentEditor(TabfCustomRichEdit, TabfControlEditor);
  RegisterComponentEditor(TabfCustomListView, TabfListViewEditor);
  RegisterComponentEditor(TabfProgressBar, TabfControlEditor);
  RegisterComponentEditor(TabfTrackBar, TabfControlEditor);
end;


//==============================================================================
// TabfListViewEditor
//==============================================================================
// Component editor for TabfCustomListView controls and its descendants.
// Date: 04/08/2001
{ TabfListViewEditor }

type
{$IfNDef D5}
  TComponents = TComponentList;
  IComponents = TComponentList;
{$Else D5}
  {$IfNDef D6}
  TComponents = TDesignerSelectionList;
  IComponents = TDesignerSelectionList;
  {$Else D6}
  TComponents = TDesignerSelections;
  IComponents = IDesignerSelections;
  {$EndIf D6}
{$EndIf D5}


procedure TabfListViewEditor.ExecuteVerb(Index: Integer);

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

var
  vc: Integer;
begin
  vc := GetVerbCount;
  if Index = vc - 3 then _ExecutePropEditor('Items')
  else
  if Index = vc - 4 then _ExecutePropEditor('Columns')
  else inherited ExecuteVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfListViewEditor.GetVerb(Index: Integer): string;
var
  vc: Integer;
begin
  vc := GetVerbCount;
  if Index = vc - 2 then Result := '-'
  else
  if Index = vc - 3 then Result := SabfListView_DesignerMenuItem2
  else
  if Index = vc - 4 then Result := SabfListView_DesignerMenuItem1
  else Result := inherited GetVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfListViewEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 3;
end;

//------------------------------------------------------------------------------

{$IfNDef D6}
procedure TabfListViewEditor.FindProperty(PropertyEditor: TPropertyEditor);
{$Else D6}
procedure TabfListViewEditor.FindProperty(const PropertyEditor: IProperty);
{$EndIf D6}
begin
  if PropertyEditor.GetName = FPropName then PropertyEditor.Edit;
{$IfNDef D6}
  PropertyEditor.Free;
{$EndIf D6}
end;

//------------------------------------------------------------------------------

end{unit abfComControlsReg}.

