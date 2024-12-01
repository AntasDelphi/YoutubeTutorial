program ConnectionSQLite;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FMenu},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
