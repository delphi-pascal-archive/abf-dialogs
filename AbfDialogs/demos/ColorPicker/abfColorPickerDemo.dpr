{*******************************************************************************

  abfColorPicker component DEMO.

  Copyright (c) 2000 ABF software, Inc.
  All rights reserved.

*******************************************************************************}
program abfColorPickerDemo;

uses
  Forms,
  abfColorPickerDemoMain in 'abfColorPickerDemoMain.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'abfColorPicker component DEMO';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
