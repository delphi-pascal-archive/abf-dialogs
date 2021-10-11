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
unit abfWABReg;

{$I abf.inc}
{$WARNINGS OFF}
{$HINTS OFF}

interface

uses
{$IfDef D6}
  DesignIntf, DesignMenus,
{$Else D6}
  DsgnIntf,
{$EndIf D6}
  abfComponentsReg, abfControlsReg, // don't remove this line !!!
  Classes, Windows;

type
//==============================================================================
// TabfWABEditor
//==============================================================================
// Component editor for TabfWAB

  TabfWABEditor = class(TabfComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

//==============================================================================
// TabfWABEditor
//==============================================================================
// Component editor for TabfWAB

  TabfWABDlgEditor = class(TabfComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
{$IfDef D5}
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
{$EndIf D5}
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
  abfConsts, abfVclConsts, abfWABConsts,
  abfAboutComponent, abfWAB, abfWABDialogs, abfDesignerWAB;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;

  RegisterComponents(SabfComponentPaletteNonVisual, [TabfWAB]);
  RegisterComponents(SabfComponentPaletteDialogs, [TabfWABAddrDlg]);

// Assign component editors
  RegisterComponentEditor(TabfWAB, TabfWABEditor);
  RegisterComponentEditor(TabfWABAddrDlg, TabfWABDlgEditor);

// Assign property editors
  RegisterPropertyEditor(TypeInfo(TabfWABItemsCollection), TabfWAB,
    SabfWAB_ItemsPropertyName, TabfWABItemsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TabfWABContactsCollection), TabfWAB,
    SabfWAB_ContactsPropertyName, TabfWABItemsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TabfWABGroupsCollection), TabfWAB,
    SabfWAB_GroupsPropertyName, TabfWABItemsPropertyEditor);
end;


//==============================================================================
// TabfWABEditor
//==============================================================================
// Component editor for TabfWAB
{ TabfWABEditor }

procedure TabfWABEditor.ExecuteVerb(Index: Integer);
begin
  if (Index = GetVerbCount - 4) then
  begin
    ShowAbfWABItemsEditor(Designer, Component as TabfWAB,
      (Component as TabfWAB).Items, SabfWAB_ItemsPropertyName)
  end
  else if (Index = GetVerbCount - 3) then
  begin
    ShowAbfWABItemsEditor(Designer, Component as TabfWAB,
      (Component as TabfWAB).Contacts, SabfWAB_ContactsPropertyName)
  end
  else if (Index = GetVerbCount - 2) then
  begin
    ShowAbfWABItemsEditor(Designer, Component as TabfWAB,
      (Component as TabfWAB).Groups, SabfWAB_GroupsPropertyName)
  end
  else
    inherited ExecuteVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfWABEditor.GetVerb(Index: Integer): string;
begin
  if (Index = GetVerbCount - 4) then
    Result := SabfWAB_DesignerMenuItem1
  else if (Index = GetVerbCount - 3) then
    Result := SabfWAB_DesignerMenuItem2
  else if (Index = GetVerbCount - 2) then
    Result := SabfWAB_DesignerMenuItem3
  else
    Result := inherited GetVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfWABEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 3;
end;


//==============================================================================
// TabfWABDlgEditor
//==============================================================================
// Component editor for TabfWABAddrDlg
{ TabfWABDlgEditor }

procedure TabfWABDlgEditor.ExecuteVerb(Index: Integer);
begin
  if (Index = GetVerbCount - 2) then
  begin
    if not Assigned((Component as TabfWABAddrDlg).WAB) then
    begin
      MessageBoxEx((Component as TabfWABAddrDlg).ParentHandle,
        PChar(SabfWAB_InvalidWABConnection),
        PChar(SabfError), MB_OK or MB_ICONERROR, LANG_NEUTRAL);
      Exit;
    end;

    if not (Component as TabfWABAddrDlg).WAB.Active then
    begin
      MessageBoxEx((Component as TabfWABAddrDlg).ParentHandle,
        PChar(SabfWAB_NotOpenedError),
        PChar(SabfError), MB_OK or MB_ICONERROR, LANG_NEUTRAL);
      Exit;
    end;

    (Component as TabfWABAddrDlg).Execute;
  end
  else
    inherited ExecuteVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfWABDlgEditor.GetVerb(Index: Integer): string;
begin
  if (Index = GetVerbCount - 2) then
    Result := SabfWABAddrDlg_DesignerMenuItem
  else
    Result := inherited GetVerb(Index);
end;

//------------------------------------------------------------------------------

function TabfWABDlgEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

//------------------------------------------------------------------------------
{$IfDef D5}

procedure TabfWABDlgEditor.PrepareItem(Index: Integer;
  const AItem: IMenuItem);
begin
{$IfDef D5_ONLY}
  if (Index = GetVerbCount - 2) then
    AItem.Bitmap.LoadFromResourceName(hInstance, 'GLYPH_PREVIEW')
  else
{$EndIf D5_ONLY}
    inherited PrepareItem(Index, AItem)
end;

{$EndIf D5}
//------------------------------------------------------------------------------

end{unit abfWABReg}.
