{*******************************************************************************

  abfWAB Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfWABDemo;

uses
  Forms,
  abfWABDemoMain in 'abfWABDemoMain.pas' {frmWabDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfWAB Demo';
  Application.CreateForm(TfrmWabDemoMain, frmWabDemoMain);
  Application.Run;
end.
