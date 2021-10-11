{*******************************************************************************

  abfLabels Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfLabelsDemo;

uses
  Forms,
  abfLabelsDemoMain in 'abfLabelsDemoMain.pas' {frmLabelsDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfLabels Demo';
  Application.CreateForm(TfrmLabelsDemoMain, frmLabelsDemoMain);
  Application.Run;
end.
