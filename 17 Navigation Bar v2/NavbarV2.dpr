program NavbarV2;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
