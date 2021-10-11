{*******************************************************************************

  abfEffects Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfEffectsDemo;

uses
  Forms,
  abfEffectsDemoMain in 'abfEffectsDemoMain.pas' {frmEffectsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfEffects Demo';
  Application.CreateForm(TfrmEffectsDemoMain, frmEffectsDemoMain);
  Application.Run;
end.
