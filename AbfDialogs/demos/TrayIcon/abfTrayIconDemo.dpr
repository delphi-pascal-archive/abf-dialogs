{*******************************************************************************

  abfTrayIcon component DEMO.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.


*******************************************************************************}
program abfTrayIconDemo;

uses
  Forms,
  abfTrayIconDemoMain in 'abfTrayIconDemoMain.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfTrayIcon component DEMO';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
