{*******************************************************************************

  abfComponents Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfComponentsDemo;

uses
  Forms,
  abfComponentsDemoMain in 'abfComponentsDemoMain.pas' {frmComponentsDemoMain},
  abfComponentsDemoSecond in 'abfComponentsDemoSecond.pas' {frmComponentsDemoSecond};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfComponents Demo';
  Application.CreateForm(TfrmComponentsDemoMain, frmComponentsDemoMain);
  Application.CreateForm(TfrmComponentsDemoSecond, frmComponentsDemoSecond);
  with frmComponentsDemoMain do
  begin
    BringToFront;
    SetBounds(Left + 50, Top + 50, Width, Height);
  end;
  Application.Run;
end.


