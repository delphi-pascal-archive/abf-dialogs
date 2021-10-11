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
unit abfWABConsts; { English version }

interface

{$IfNDef D3}
const
{$Else D3}
resourcestring
{$EndIf D3}
  SabfWAB_ErrorLoadingWABAPI = 'Error loading WAB API!';
  SabfWAB_DefaultItemName = 'Unknown';
  SabfWAB_DefaultAddrType = 'SMTP';
  SabfWAB_NotCompatibleCollection = 'This Collection is not compatible with %s';
  SabfWAB_NotOpenedError = 'The Windows Address Book is not opened';
  SabfWAB_InvalidWABConnection = 'Component is not connected to an opened Windows Address Book';
  SabfWAB_ReadOnlyError = 'The Windows Address book is opened in read-only mode';
  SabfWAB_NotImplementedError = 'Currently not implemented in this version';
  SabfWAB_ItemsPropertyName = 'Items';
  SabfWAB_ContactsPropertyName = 'Contacts';
  SabfWAB_GroupsPropertyName = 'Groups';
  SabfWAB_DesignerMenuItem1 = '&Browsing items...';
  SabfWAB_DesignerMenuItem2 = '&Browsing contacts...';
  SabfWAB_DesignerMenuItem3 = '&Browsing groups...';
  SabfWAB_UnknownVersion = 'Unknown version';

  SabfWABAddrDlg_DesignerMenuItem = 'Test dialog...';

{******************************************************************************}
implementation
{******************************************************************************}

end{unit abfWABConsts}.
