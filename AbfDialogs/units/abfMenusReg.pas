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
unit abfMenusReg;

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
  Classes, SysUtils, Forms;

//==============================================================================
// Registration
//==============================================================================

procedure Register;

{******************************************************************************}
implementation
{******************************************************************************}
{$R *.res}

uses
  abfComponentsReg, abfControlsReg, // don't remove this line !!!
  abfConsts, abfComponents, abfAboutComponent, abfMenus;

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;

  RegisterComponents(SabfComponentPaletteNonVisual,
    [TabfSystemMenuItem, TabfSystemMenuInserter, TabfPopupMenu]);

// Assign component editors
//  RegisterComponentEditor(TabfPopupMenu, TabfComponentEditor);

// Assign property editors
  RegisterPropertyEditor(TypeInfo(string), TabfPopupMenu, SabfAboutProperty,
    TabfAboutProperty);
end;

//------------------------------------------------------------------------------

end{unit abfMenusReg}.

