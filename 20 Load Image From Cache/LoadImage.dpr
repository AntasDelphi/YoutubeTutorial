program LoadImage;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMenu in 'UMenu.pas' {FMenu},
  AnonThread in 'Utils\AnonThread.pas',
  FMX.Devgear.HelperClass in 'Utils\FMX.Devgear.HelperClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
