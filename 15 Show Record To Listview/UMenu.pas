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
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFMenu = class(TForm)
    RectBottom: TRectangle;
    Label7: TLabel;
    RectHeader: TRectangle;
    Label6: TLabel;
    Button2: TButton;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure Button2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
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

procedure TFMenu.Button2Click(Sender: TObject);
begin
if DM.Koneksi.Connected then
begin
  DM.SQLShow.Close;
  DM.SQLShow.SQL.Clear;
  DM.SQLShow.SQL.Add('select*from tbsiswa');
  DM.SQLShow.Open;
end;
end;

procedure TFMenu.FormShow(Sender: TObject);
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
   label6.Text:='TERHUBUNG KE DATABASE';
   end ELSE
   label6.Text:='TIDAK TERHUBUNG KE DATABASE';

except
 on E:Exception do
 begin
    ShowMessage('pesan error : '+E.Message)
 end;

end;
end;

procedure TFMenu.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
ShowMessage('Nama Siswa : '+AItem.Data['Text1'].AsString+sLineBreak+
            'NIS Siswa : '+AItem.Data['Text2'].AsString)
end;

end.
