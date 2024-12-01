unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFMenu = class(TForm)
    RectBottom: TRectangle;
    Label7: TLabel;
    RectHeader: TRectangle;
    Label6: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    SQLShow: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
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
uses UDM,System.IOUtils;
{$R *.fmx}

procedure TFMenu.Button1Click(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
DM.Koneksi.Params.Values['Database'] := System.SysUtils.GetCurrentDir+'\CONFIG\antas.db';
{$ELSE}
DM.Koneksi.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'antas.db');
{$ENDIF}

try
DM.Koneksi.Connected:=True;

if DM.Koneksi.Connected=True then
   begin
   ShowMessage('TERHUBUNG KE DATABASE');
   end ELSE
   ShowMessage('TIDAK TERHUBUNG KE DATABASE');

except
 on E:Exception do
 begin
    ShowMessage('pesan error : '+E.Message)
 end;

end;


end;

procedure TFMenu.Button2Click(Sender: TObject);
begin
if DM.Koneksi.Connected then
begin
  SQLShow.Close;
  SQLShow.SQL.Clear;
  SQLShow.SQL.Add('select*from tbsiswa');
  SQLShow.Open;
end;
end;

end.
