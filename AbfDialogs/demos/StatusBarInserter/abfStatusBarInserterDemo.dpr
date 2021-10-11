{*******************************************************************************

  abfStatusBarInserterDemo component DEMO.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.

*******************************************************************************}
program abfStatusBarInserterDemo;

uses
  Forms,
  abfStatusBarInserterDemoUnit in 'abfStatusBarInserterDemoUnit.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfStatusBarInserter DEMO';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
