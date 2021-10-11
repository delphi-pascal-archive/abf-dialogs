{*******************************************************************************

  abfStatusBar component DEMO.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.

*******************************************************************************}
program abfStatusBarDemo;

uses
  Forms,
  abfStatusBarDemoUnit in 'abfStatusBarDemoUnit.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfStatusBar DEMO';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
