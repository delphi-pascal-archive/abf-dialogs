{*******************************************************************************

  abfComboBoxes Demo.

  Copyright (c) 2000-2002 ABF software, Inc.
  All Rights Reserved.

  e-mail: info@ABFsoftware.com
  web:    http://www.ABFsoftware.com

*******************************************************************************}
program abfComboBoxesDemo;

uses
  Forms,
  abfComboBoxesDemoMain in 'abfComboBoxesDemoMain.pas' {frmComboBoxesDemoMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfComboBoxes Demo';
  Application.CreateForm(TfrmComboBoxesDemoMain, frmComboBoxesDemoMain);
  Application.Run;
end.
