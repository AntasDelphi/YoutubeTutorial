program CostumToastMessage;

uses
  System.StartUpCopy,
  FMX.Forms,
  UUtama in 'UUtama.pas' {FUtama},
  ADC.Notification in 'ADC.Notification.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFUtama, FUtama);
  Application.Run;
end.
