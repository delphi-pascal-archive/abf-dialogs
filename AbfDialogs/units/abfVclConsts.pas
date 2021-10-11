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
unit abfVclConsts; { English version }

{$I abf.inc}

interface

uses
  abfConsts;

{$IfNDef D3}
const
{$Else D3}
resourcestring
{$EndIf D3}

//==============================================================================
// Messages, captions, errors, etc.
//==============================================================================

  SabfAbout       = 'About';
  SabfDesigner    = 'Designer';
  SabfWarning     = 'Warning';
  SabfError       = 'Error';
  SabfInformation = 'Information';
  SabfImportant   = 'Important';
  SabfRegister    = 'Register';

  SabfAboutApplicationCaption    = 'About application';
  SabfAboutApplicationBy         = 'created by';
  SabfAboutApplicationVersionFmt = 'Version: %s (build %s)';

  SabfAboutComponentCaption      = 'About component';
  SabfAboutComponentBy           = 'created by';
  SabfAboutComponentVersionFmt   = 'Version: %s';

{$IfNDef D3}
  SNoTimers = 'Not enough timers available';
  SWin32Error = 'Win32 Error.  Code: %d.'#10'%s';
  SUnkWin32Error = 'A Win32 API function failed';
  SDefaultFilter = 'All files (*.*)|*.*';
{$EndIf D3}

{$IfNDef D4}
  SCannotOpenClipboard = 'Cannot open clipboard';
{$EndIf D4}

  SabfNoFile = 'File "%s" does not exist';

  SabfProperty_ReadOnlyMode = 'Cannot change the property in Read-Only mode.';
  SabfRegistry_UnableToOpenKey = 'Unable to open the %s key';
  SabfRegistry_CannotWrite = 'Cannot write to registry.';
  SabfChannel_CreationFailed = 'Channel creation is failed';
  SabfChannel_MappingFailed = 'Channel mapping is failed';
  SabfFileVersionInfo_NoInfo = 'File contains no version information';
  SabfFileVersionInfo_WrongLngIndex = 'Illegal language index';

  SabfTreadComponent_Exception = 'Thread %s raised exception class %s with message "%s".';
  SabfFileOperation_DesignerMenuItem = 'Edit file list...';
  SabfOneInstance_AppAlreadyRun = 'Application "%s" is already running.';
  SabfTrayIcon_ErrInsertTo   = '%s.InsertToTray failed';
  SabfTrayIcon_ErrDeleteFrom = '%s.DeleteFromTray failed';
  SabfTrayIcon_DesignerMenuItem1 = 'Show balloon info';
  SabfFileStorage_AutoSaveWhenNoSaveName = 'AutoSave can not be set because the SaveName property contains a wrong file name';
  SabfFileStorage_CannotLoad = 'Can not load data from the "%s" file';
  SabfFileStorage_CannotSave = 'Can not save data to the "%s" file';
  SabfFileStorage_DesignerMenuItem1 = 'Load file into DFM...';
  SabfFileStorage_DesignerMenuItem2 = 'Remove file from DFM';
  SabfWav_DesignerMenuItem1 = 'Play sound';
  SabfWav_DesignerMenuItem2 = 'Stop playing';
  SabfWave_PlayInDesignerWarning = 'Playing is canceled. Synchronous playing of the looped sound can freeze the IDE';


{******************************************************************************}
implementation
{******************************************************************************}

end{unit abfVclConsts}.

