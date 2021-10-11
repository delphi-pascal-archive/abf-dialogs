{*******************************************************************************

  abfComControls Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfComControlsDemo;

uses
  Forms,
  abfComControlsDemoMain in 'abfComControlsDemoMain.pas' {frmComControlsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfComControls Demo';
  Application.CreateForm(TfrmComControlsDemoMain, frmComControlsDemoMain);
  Application.Run;
end.
