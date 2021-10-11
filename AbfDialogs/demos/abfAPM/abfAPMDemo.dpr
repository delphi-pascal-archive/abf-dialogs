{*******************************************************************************

  abfAPM Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All rights reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfAPMDemo;

uses
  Forms,
  abfAPMDemoMain in 'abfAPMDemoMain.pas' {frmAPMDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfAPM Demo';
  Application.CreateForm(TfrmAPMDemoMain, frmAPMDemoMain);
  Application.Run;
end.

