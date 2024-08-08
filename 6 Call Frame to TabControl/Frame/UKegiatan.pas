unit UKegiatan;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFKegiatan = class(TFrame)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FKegiatan:TFKegiatan;

implementation

{$R *.fmx}

procedure TFKegiatan.Button1Click(Sender: TObject);
begin
ShowMessage('HALLO INI ADALAH FORM KEGIATAN')
end;

end.
