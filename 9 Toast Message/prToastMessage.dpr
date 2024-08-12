program prToastMessage;

uses
  System.StartUpCopy,
  FMX.Forms,
  UUtama in 'UUtama.pas' {FUtama};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFUtama, FUtama);
  Application.Run;
end.
