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
unit abfUSF;

{$I abf.inc}

interface

uses
  Windows, Classes, SysUtils, Forms, IniFiles,
// ABF VCL
  abfClasses, abfIniFiles, abfInternet;

const

  SabfExt_Usf = '.usf';
  SusfExt = SabfExt_Usf;

//==============================================================================
// [FileInfo] section
//==============================================================================
// The section must present in each USF. This is a main section. Contains main
// information, file/product description and file/product oriented data.
// Supported fields: "FormatVersion", "Version", "Date", "Description",
// "Author", "Copyright", "Redirect". Custom fields are not allowed.
  Susf_Sect_FileInfo       = 'FileInfo';     // File Info section
  Susf_Field_FormatVersion = 'FormatVersion';// Version of file format. Current version is 1.1
  Susf_Field_Project       = 'Project';      // A program exe name or other specifier of traget.
  Susf_Field_Version       = 'Version';      // Version of release. Greater value is newer.
  Susf_Field_Date          = 'Date';         // * Date of the release in the MM/DD/YYYY format.
  Susf_Field_Description   = 'Description';  // * Description of the file or other keyword.
  Susf_Field_Author        = 'Author';       // * Author of the scenario: Name, Nickname, etc.
  Susf_Field_Copyright     = 'Copyright';    // * Legal copyright
  Susf_Field_Redirect      = 'Redirect';     // * Use to redirect to other scenario file.

//==============================================================================
// [Text] section
//==============================================================================
// Optional section, contains brief description or other text information. No
// fields are allowed in this section.
  Susf_Sect_Text = 'Text';

//==============================================================================
// [Files] section
//==============================================================================
// Optional section, contains a list of files that should be copied, deleted,
// moved, etc. Format is: SrcName[=DstName][,Operation]. Now supported "copy",
// "move", "delete" and "create" operations. Custom operation specifiers are
// allowed, but be ware, it is possible that specifiers equal to yours will
// appear in the new version of the USF format with other meaning.
// If there is no operation specifier, the "copy" operation will be proceed.
// Example:
// [FILES]
// http://www.abfsoftware.com/Data/abfssgl.scr = abfssgl.scr
// ftp://www.abfsoftware.com/Data/ABF.url      = ABF.url          , copy
// ftp://www.abfsoftware.com/Data/ABF.url      = SubFolder\ABF.url, move
// \\KARPOLAN\C$\ABF\abfScreenSaver.log                           , delete
// \\KARPOLAN\C$\ABF\abfScreenSaver.log                           , create
  Susf_Sect_Files    = 'Files';
  Susf_Oper_Copy     = 'copy';
  Susf_Oper_Move     = 'move';
  Susf_Oper_Delete   = 'delete';
  Susf_Oper_Create   = 'create';
  Susf_Oper_Run      = 'run';
  Susf_Oper_Extract  = 'extract'; // Extracts archive
  Susf_Oper_Default  = Susf_Oper_Copy;

//==============================================================================
// [Custom] section
//==============================================================================
// Optional section, contains any information in any format. You can use
// this section to create own extensions for USF format.
  Susf_Sect_Custom   = 'Custom';


type

//==============================================================================
// TabfUsfFile
//==============================================================================
// Wrapper class for *.USF (Universal Scenario File) files. Windows styled INI
// file. Has wrappers for all supported sections and fieds.

  TabfUsfFile = class(TabfIniFile)
  protected
    FText: TStrings;
    FFiles: TabfStringList;
    FCustom: TStrings;
    function  GetFormatVersion: string;
    procedure SetFormatVersion(const Value: string);
    function  GetProject: string; virtual;
    procedure SetProject(const Value: string); virtual;
    function  GetVersion: string; virtual;
    procedure SetVersion(const Value: string); virtual;
    function  GetDate: string; virtual;
    procedure SetDate(const Value: string); virtual;
    function  GetDescription: string; virtual;
    procedure SetDescription(const Value: string); virtual;
    function  GetAuthor: string; virtual;
    procedure SetAuthor(const Value: string); virtual;
    function  GetCopyright: string; virtual;
    procedure SetCopyright(const Value: string); virtual;
    function  GetRedirect: string; virtual;
    procedure SetRedirect(const Value: string); virtual;
    function  GetText: TStrings; virtual;
    procedure SetText(const Value: TStrings); virtual;
    function  GetFiles: TabfStringList; virtual;
    procedure SetFiles(const Value: TabfStringList); virtual;
    function  GetCustom: TStrings; virtual;
    procedure SetCustom(const Value: TStrings); virtual;
  public
    constructor Create(const FileName: string);
    destructor Destroy; override;
  // [FileInfo] section
    property FormatVersion: string read GetFormatVersion write SetFormatVersion;
    property Project: string read GetProject write SetProject;
    property Version: string read GetVersion write SetVersion;
    property Date: string read GetDate write SetDate;
    property Description: string read GetDescription write SetDescription;
    property Author: string read GetAuthor write SetAuthor;
    property Copyright: string read GetCopyright write SetCopyright;
    property Redirect: string read GetRedirect write SetRedirect;
  // [Text] section
    property Text: TStrings read GetText write SetText;
  // [Files] section
    property Files: TabfStringList read GetFiles write SetFiles;
  // [Custom] section
    property Custom: TStrings read GetCustom write SetCustom;
  end;{TabfUsfFile = class(TIniFile)}



//==============================================================================
// USF utilities
//==============================================================================

//------------------------------------------------------------------------------
// Determines is opereation request copying.
function usfIsCopyOperation(const Operation: string): Boolean;


{******************************************************************************}
implementation
{******************************************************************************}

uses
  abfSysUtils;

//==============================================================================
// USF utilities
//==============================================================================

//------------------------------------------------------------------------------
// Determines is opereation request copying.

function usfIsCopyOperation(const Operation: string): Boolean;
begin
  Result := (Operation = '') or
    (abfPosIgnoreCase(Susf_Oper_Copy, Operation) > 0) or
    (abfPosIgnoreCase(Susf_Oper_Move, Operation) > 0) or
    (abfPosIgnoreCase(Susf_Oper_Extract, Operation) > 0);
end;


//==============================================================================
// TabfUsfFile
//==============================================================================
// Wrapper class for *.USF (Universal Scenario File) files. Windows styled INI
// file. Has wrappers for all supported sections and fieds.
// Date: 07/01/2003
{ TabfUsfFile }

constructor TabfUsfFile.Create(const FileName: string);
begin
  FText := TStringList.Create;
  FFiles := TabfStringList.Create;
  FCustom := TStringList.Create;
  inherited Create(FileName);
end;

//------------------------------------------------------------------------------

destructor TabfUsfFile.Destroy;
begin
  inherited Destroy;
  FCustom.Free;
  FFiles.Free;
  FText.Free;
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetFormatVersion: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_FormatVersion, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetFormatVersion(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_FormatVersion, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetProject: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Project, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetProject(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Project, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetVersion: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Version, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetVersion(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Version, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetDate: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Date, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetDate(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Date, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetDescription: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Description, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetDescription(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Description, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetAuthor: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Author, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetAuthor(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Author, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetCopyright: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Copyright, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetCopyright(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Copyright, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetRedirect: string;
begin
  Result := ReadString(Susf_Sect_FileInfo, Susf_Field_Redirect, '');
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetRedirect(const Value: string);
begin
  WriteString(Susf_Sect_FileInfo, Susf_Field_Redirect, Value);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetText: TStrings;
begin
  ReadSectionText(Susf_Sect_Text, FText);
  Result := FText;
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetText(const Value: TStrings);
begin
  FText.Assign(Value);
  WriteSectionText(Susf_Sect_Text, FText);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetFiles: TabfStringList;
begin
  ReadSectionText(Susf_Sect_Files, FFiles);
  Result := FFiles;
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetFiles(const Value: TabfStringList);
begin
  FFiles.Assign(Value);
  WriteSectionText(Susf_Sect_Files, FFiles);
end;

//------------------------------------------------------------------------------

function TabfUsfFile.GetCustom: TStrings;
begin
  ReadSectionText(Susf_Sect_Custom, FCustom);
  Result := FCustom;
end;

//------------------------------------------------------------------------------

procedure TabfUsfFile.SetCustom(const Value: TStrings);
begin
  FCustom.Assign(Value);
  WriteSectionText(Susf_Sect_Custom, FCustom);
end;

//------------------------------------------------------------------------------


end{unit abfUSF}.
