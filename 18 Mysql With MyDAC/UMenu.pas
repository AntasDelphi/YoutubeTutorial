unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit;

type
  TFMenu = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDHost: TEdit;
    EDUser: TEdit;
    EDpass: TEdit;
    EDDatabase: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    EDPort: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation
uses UDM;
{$R *.fmx}

procedure TFMenu.Button1Click(Sender: TObject);
begin
dm.Koneksi.Server:=EDHost.Text;
dm.Koneksi.Username:=EDUser.Text;
dm.Koneksi.Password:=EDpass.Text;
dm.Koneksi.Port:=EDPort.Text.ToInteger;
dm.Koneksi.Database:=EDDatabase.Text;
DM.Koneksi.Open;


if DM.Koneksi.Connected then
ShowMessage('TERHUBUNG KE DATABASE MYSQL')
ELSE
ShowMessage('TIDAK TERHUBUNG KE DATABASE MYSQL')

end;

procedure TFMenu.Button2Click(Sender: TObject);
begin
Application.Terminate
end;

end.
