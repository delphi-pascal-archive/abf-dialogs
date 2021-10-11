{*******************************************************************************

  abfMenus Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfMenusDemo;

uses
  Forms,
  abfMenusDemoMain in 'abfMenusDemoMain.pas' {frmMenusDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfMenus Demo';
  Application.CreateForm(TfrmMenusDemoMain, frmMenusDemoMain);
  Application.Run;
end.
