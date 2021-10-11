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
unit abfReg;

{$I abf.inc}
{$WARNINGS OFF}
{$HINTS OFF}

(*******************************************************************************
Use abfvcl.inc file to define which part of ABF VCL should be installed or not.
For example: if you don't want to use abfComboBoxes, simple remove (or comment)
{$Define abfComboBoxes} directive in the abfvcl.inc file.
*******************************************************************************)
{$I abfvcl.inc}

interface

uses
{$IfDef D6}
  DesignIntf,
{$Else D6}
  DsgnIntf,
{$EndIf D6}
  Forms;

//==============================================================================
// Registration
//==============================================================================

procedure Register;

{******************************************************************************}
implementation
{******************************************************************************}

uses
  abfControls, abfControlsReg
{$IfDef abfComboBoxes} , abfComboBoxesReg  {$EndIf abfComboBoxes}
{$IfDef abfComControls}, abfComControlsReg {$EndIf abfComControls}
{$IfDef abfDialogs}    , abfDialogsReg     {$EndIf abfDialogs}
{$IfDef abfEdits}      , abfEditsReg       {$EndIf abfEdits}
{$IfDef abfLabels}     , abfLabelsReg      {$EndIf abfLabels}
{$IfDef abfMenus}      , abfMenusReg       {$EndIf abfMenus}
{$IfDef abfStatusBars} , abfStatusBarsReg  {$EndIf abfStatusBars}
{$IfDef D3}
  {$IfDef abfAPM}      , abfAPMReg         {$EndIf abfAPM}
  {$IfDef abfEffects}  , abfEffectsReg     {$EndIf abfEffects}
  {$IfDef abfWAB}      , abfWABReg         {$EndIf abfWAB}
{$EndIf D3}
  ;{uses}

//==============================================================================
// Registration
//==============================================================================

procedure Register;
begin
  abfControlsReg.Register;
{$IfDef abfComboBoxes}  abfComboBoxesReg .Register; {$EndIf abfComboBoxes}
{$IfDef abfComControls} abfComControlsReg.Register; {$EndIf abfComControls}
{$IfDef abfDialogs}     abfDialogsReg    .Register; {$EndIf abfDialogs}
{$IfDef abfDialogs}     abfEditsReg      .Register; {$EndIf abfDialogs}
{$IfDef abfLabels}      abfLabelsReg     .Register; {$EndIf abfLabels}
{$IfDef abfMenus}       abfMenusReg      .Register; {$EndIf abfMenus}
{$IfDef abfStatusBars}  abfStatusBarsReg .Register; {$EndIf abfStatusBars}
{$IfDef D3}
  {$IfDef abfAPM}       abfAPMReg        .Register; {$EndIf abfAPM}
  {$IfDef abfEffects}   abfEffectsReg    .Register; {$EndIf abfEffects}
  {$IfDef abfWAB}       abfWABReg        .Register; {$EndIf abfWAB}
{$EndIf D3}


{$IfDef abfComboBoxes}
  RegisterComponentEditor(TabfCustomComboBox, TabfComboBoxEditor);
{$EndIf abfComboBoxes}
end;

//------------------------------------------------------------------------------

end{unit abfReg}.
