{*******************************************************************************

  abfStatusBars DEMO.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfStatusBarsDemo;

uses
  Forms,
  abfStatusBarsDemoMain in 'abfStatusBarsDemoMain.pas' {frmStatusBarsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfStatusBars Demo';
  Application.CreateForm(TfrmStatusBarsDemoMain, frmStatusBarsDemoMain);
  Application.Run;
end.
