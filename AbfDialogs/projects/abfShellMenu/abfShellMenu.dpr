{*******************************************************************************

  ABF Shell Menu DLL.

  ABF software, Inc.
  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

  Copyright (c) 2000, 2001 ABF software, Inc.
  All Rights Reserved.

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

  DISCLAIMER

  THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS WITHOUT WARRANTY OF ANY KIND,
EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE PERSON USING THE
SOFTWARE BEARS ALL RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE.
THE AUTHOR WILL NOT BE LIABLE FOR ANY SPECIAL, INCIDENTAL, CONSEQUENTIAL,
INDIRECT OR SIMILAR DAMAGES DUE TO LOSS OF DATA OR ANY OTHER REASON, EVEN IF
THE AUTHOR OR AN AGENT OF THE AUTHOR HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES. IN NO EVENT SHALL THE AUTHOR'S LIABILITY FOR ANY DAMAGES EVER
EXCEED THE PRICE PAID FOR THE LICENSE TO USE THE SOFTWARE, REGARDLESS OF THE
FORM OF THE CLAIM.

*******************************************************************************}
library abfShellMenu;

{$I abfShellMenu.inc} // Compiler options and definition file.
{$R abfShellMenu.res} // Bitmaps resource

(*******************************************************************************

Description
===========
This library is an implementation of shell context menu. Using this sources
you'll be able to create own context menus very easily. Just copy all files of
this project to own directory, change some constants and follow TO-DO notes.
Edit "abfShellMenu.res" file to change or add own bitmaps. Source code is well
commented, so spend some time to read all of them.

Notes
=====
This library adds 3 (5 with separators) menu items to context menu of each
folder by default. Use {$Define DEBUG} compiler directive to receive debug
messages in the log file. The log file will be placed in the Windows root dir
(C:\Windows for example) with "explorer.log" name.

Requirements
============
* Borland Delphi 4 (or higher)
* OS: Windows 95/98/Me/NT4/2000.
 
How to use?
===========
To register this library use:
  Regsvr32.exe abfShellMenu.dll

To unregister this library use:
  Regsvr32.exe -u abfShellMenu.dll

If you have any questions contact our support team:
  support@ABFsoftware.com

History
=======
July 19, 2001. (Version 1.0):
First public release.

*******************************************************************************)

uses
  ComServ,
  abfShellMenuConsts in 'abfShellMenuConsts.pas',
  abfShellMenuUtils in 'abfShellMenuUtils.pas',
  abfShellMenuClasses in 'abfShellMenuClasses.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

begin
end.
