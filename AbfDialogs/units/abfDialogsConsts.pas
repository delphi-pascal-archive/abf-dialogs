{*******************************************************************************

  ABF Visual Components Library

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
unit abfDialogsConsts; { English version }

{$I abf.inc}

interface

{$IfNDef D3}
const
{$Else D3}
resourcestring
{$EndIf D3}
  SMsgDlgWarning     = 'Warning';
  SMsgDlgError       = 'Error';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm     = 'Confirm';
  SMsgDlgYes         = '&Yes';
  SMsgDlgNo          = '&No';
  SMsgDlgOK          = 'OK';
  SMsgDlgCancel      = 'Cancel';
  SMsgDlgHelp        = '&Help';
  SMsgDlgHelpNone    = 'No help available';
  SMsgDlgHelpHelp    = 'Help';
  SMsgDlgAbort       = '&Abort';
  SMsgDlgRetry       = '&Retry';
  SMsgDlgIgnore      = '&Ignore';
  SMsgDlgAll         = '&All';
  SMsgDlgNoToAll     = 'N&o to All';
  SMsgDlgYesToAll    = 'Yes to &All';

  SabfBrowseFolderDlg_CreateButtonCaption = 'Create...';
  SabfBrowseFolderDlg_DlgFolderNameCaption = 'Create directory';
  SabfBrowseFolderDlg_DlgFolderNamePrompt  = 'Name';
  SabfBrowseFolderDlg_OldShell = 'Shell of current version is not compatible with BrowseForFolder';

  SabfDialogs_DirNamePropertyText = 'Select the folder to be a property value';
  SabfDialogs_DesignerMenuItem    = 'Test dialog...';

{******************************************************************************}
implementation
{******************************************************************************}

end{unit abfDialogsConsts}.
