{*******************************************************************************

  abfDialogs Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfDialogsDemo;

uses
  Forms,
  abfDialogsDemoSecond in 'abfDialogsDemoSecond.pas' {frmDialogsDemoSecond},
  abfDialogsDemoMain in 'abfDialogsDemoMain.pas' {frmDialogsDemoMain},
  abfDialogsDemoThird in 'abfDialogsDemoThird.pas' {frmDialogsDemoThird};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfDialogs Demo';
  Application.CreateForm(TfrmDialogsDemoMain, frmDialogsDemoMain);
  Application.CreateForm(TfrmDialogsDemoSecond, frmDialogsDemoSecond);
  Application.CreateForm(TfrmDialogsDemoThird, frmDialogsDemoThird);
// Send form to back
  with frmDialogsDemoThird do
  begin
    SendToBack;
    SetBounds(Left - 50, Top - 50, Width, Height);
  end;
// Bring form to front
  with frmDialogsDemoMain do
  begin
    BringToFront;
    SetBounds(Left + 50, Top + 50, Width, Height);
  end;
  Application.Run;
end.
