{*******************************************************************************

  abfEdits Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfEditsDemo;

uses
  Forms,
  abfEditsDemoMain in 'abfEditsDemoMain.pas' {frmEditsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfEdits Demo';
  Application.CreateForm(TfrmEditsDemoMain, frmEditsDemoMain);
  Application.Run;
end.
