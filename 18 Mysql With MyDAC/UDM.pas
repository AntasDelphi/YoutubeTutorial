unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, MyAccess;

type
  TDM = class(TDataModule)
    Koneksi: TMyConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
