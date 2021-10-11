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
unit abfEffectsConsts; { English version }

{$I abf.inc}

interface

{$IfNDef D3}
const
{$Else D3}
resourcestring
{$EndIf D3}
  SabfEffects_WrongOwner = 'Wrong owner';
  SabfFormEffect_AlreadyExists = 'The %:0s component or its descendant is already present on the form. Only one %:0s component or its descendant is allowed on the form at the same time';
  SabfFormEffect_WrongOwner    = 'The owner of the %s component is not a TForm descendant';

{******************************************************************************}
implementation
{******************************************************************************}

end{unit abfEffectsConsts}.
