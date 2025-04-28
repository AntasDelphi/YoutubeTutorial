program CRUDSqlite;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FMenu},
  UDM in 'UDM.pas' {DM: TDataModule},
  ADC.Permission in 'Units\ADC.Permission.pas',
  FMX.MediaLibrary.Android in 'Units\FMX.MediaLibrary.Android.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
