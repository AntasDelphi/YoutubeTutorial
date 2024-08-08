program AnimaCloseApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  UUtama in 'UUtama.pas' {FUtama},
  UKegiatan in 'Frame\UKegiatan.pas' {FKegiatan: TFrame},
  UAbsensi in 'Frame\UAbsensi.pas' {FAbsensi: TFrame},
  URiwayat in 'URiwayat.pas' {FRiwayat},
  UDashboard in 'Frame\UDashboard.pas' {FDashboard: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFUtama, FUtama);
  Application.CreateForm(TFRiwayat, FRiwayat);
  Application.Run;
end.
