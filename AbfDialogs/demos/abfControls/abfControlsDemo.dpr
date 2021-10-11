{*******************************************************************************

  abfControls Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfControlsDemo;

uses
  Forms,
  abfControlsDemoMain in 'abfControlsDemoMain.pas' {frmControlsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfControls Demo';
  Application.CreateForm(TfrmControlsDemoMain, frmControlsDemoMain);
  Application.Run;
end.
