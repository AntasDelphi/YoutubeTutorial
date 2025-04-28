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
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FMX.Edit, FMX.TabControl, FMX.Layouts,
  {$IFDEF ANDROID}
  Androidapi.IOUtils,
  Androidapi.Jni.Os,
  Androidapi.Helpers,
  Androidapi.Jni.Widget,
  FMX.Helpers.Android,
  Androidapi.JNI.Media,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Telephony,
  Androidapi.JNI.GraphicsContentViewText,
  FMX.Platform.Android,
  Androidapi.JNI.App,
  fmx.MediaLibrary.Android,
  {$ENDIF}
  ADC.Permission,
  FMX.Effects, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions;

type
  TFMenu = class(TForm)
    RectBottom: TRectangle;
    Label7: TLabel;
    RectHeader: TRectangle;
    Label6: TLabel;
    BitRefresh: TButton;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDNIS: TEdit;
    EDNAMA: TEdit;
    EDAngkatan: TEdit;
    BitTambah: TCornerButton;
    BItEdit: TCornerButton;
    BitHapus: TCornerButton;
    SQLSimpan: TFDQuery;
    SQLCari: TFDQuery;
    Label8: TLabel;
    EDWALI: TEdit;
    StyleBook1: TStyleBook;
    CBKelamin: TComboBox;
    CBKelas: TComboBox;
    LBNIS: TLabel;
    VertScrollBox1: TVertScrollBox;
    Label9: TLabel;
    imgFoto: TImage;
    RectFoto: TRectangle;
    BitImage: TCornerButton;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    BitData: TCornerButton;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    actLibrary: TTakePhotoFromLibraryAction;
    procedure BitRefreshClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
    procedure BitTambahClick(Sender: TObject);
    procedure BItEditClick(Sender: TObject);
    procedure BitHapusClick(Sender: TObject);
    procedure BitImageClick(Sender: TObject);
    procedure BitDataClick(Sender: TObject);
    procedure actLibraryDidFinishTaking(Image: TBitmap);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure Bersih;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  IsSImpan:Boolean;
implementation
uses UDM,System.IOUtils;
{$R *.fmx}

procedure TFMenu.actLibraryDidFinishTaking(Image: TBitmap);
begin
imgFoto.Bitmap:=Image;
end;

procedure TFMenu.Bersih;
begin
 EDNIS.Text:='';
 EDNAMA.Text:='';
 EDAngkatan.Text:='';
 EDWALI.Text:='';
 CBKelamin.ItemIndex:=-1;
 CBKelas.ItemIndex:=-1;
 LBNIS.Text:='';
end;

procedure TFMenu.BitDataClick(Sender: TObject);
begin
TabControl1.ActiveTab:=TabItem2;
end;

procedure TFMenu.BItEditClick(Sender: TObject);
begin
if BItEdit.Text='Batal' then
begin
 IsSImpan:=False;
 Bersih;
 BitTambah.Text:='Tambah';
 BItEdit.Text:='Edit';
 BitHapus.Enabled:=True;
end else
begin //Posisi caption=EDIT
 if LBNIS.Text<>'' then
 begin
   IsSImpan:=False;
   BitTambah.Text:='Simpan';
   BItEdit.Text:='Batal';
   BitHapus.Enabled:=False;
   EDNIS.SetFocus
 end;
end;
end;

procedure TFMenu.BitHapusClick(Sender: TObject);
begin
if LBNIS.Text<>'' then
begin
  SQLCari.Close;
  SQLCari.SQL.Clear;
  SQLCari.SQL.Add('delete from tbsiswa where NIS="'+LBNIS.Text+'"');
  SQLCari.ExecSQL;
  ShowMessage('DATA SISWA TELAH DIHAPUS');
  Bersih;
end;
end;

procedure TFMenu.BitImageClick(Sender: TObject);
begin
{$IF DEFINED(IOS) or DEFINED(ANDROID)}
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
  var OSVersion := StrToIntDef(JStringToString(TJBuild_VERSION.JavaClass.RELEASE), 10);
  {$ELSE}
  var OSVersion := 10;
  {$ENDIF}
  if OSVersion >= 13 then begin
    HelperPermission.setPermission([
      getPermission.READ_MEDIA_IMAGES
    ],
    procedure begin
      {$IF DEFINED(IOS) or DEFINED(ANDROID)}
        actLibrary.Execute;
      {$ENDIF}
    end);
  end else begin
    HelperPermission.setPermission([
      getPermission.READ_EXTERNAL_STORAGE,
      getPermission.WRITE_EXTERNAL_STORAGE
    ],
    procedure begin
      {$IF DEFINED(IOS) or DEFINED(ANDROID)}
        actLibrary.Execute;
      {$ENDIF}
    end);
  end;
{$ELSE}  //untuk windows
    if OpenDialog1.Execute then
    begin
       imgFoto.Bitmap.LoadFromFile(OpenDialog1.FileName);
    end;
{$ENDIF}
end;

procedure TFMenu.BitTambahClick(Sender: TObject);
var Stream:TMemoryStream;
begin
if BitTambah.Text='Tambah' then
begin
  IsSImpan:=True;
  Bersih;
  BitTambah.Text:='Simpan';
  BItEdit.Text:='Batal';
  BitHapus.Enabled:=False;
  EDNIS.SetFocus;
end else
begin
  if IsSImpan=True then   //input data baru
     begin
       if EDNIS.Text='' then
       begin
         ShowMessage('NIS TIDAK BOLEH KOSONG');
         Exit
       end;

       SQLCari.Close;
       SQLCari.SQL.Clear;
       SQLCari.SQL.Add('select NIS from tbsiswa where NIS="'+EDNIS.Text+'"');
       SQLCari.Open;
       if not SQLCari.Eof then
          begin
            ShowMessage('NIS Sudah Terdaftar');
            Exit
          end;

       SQLSimpan.Close;
       SQLSimpan.SQL.Clear;
       SQLSimpan.SQL.Add('insert into tbsiswa (NIS,NAMA,KELAMIN,KELAS,ANGKATAN,WALI,FOTO) Values ');
       SQLSimpan.SQL.Add('(:P1,:P2,:P3,:P4,:P5,:P6,:Foto)');
       SQLSimpan.ParamByName('P1').AsString:=EDNIS.Text;
       SQLSimpan.ParamByName('P2').AsString:=EDNAMA.Text;
       SQLSimpan.ParamByName('P3').AsString:=CBKelamin.Selected.Text;
       SQLSimpan.ParamByName('P4').AsString:=CBKelas.Selected.Text;
       SQLSimpan.ParamByName('P5').AsString:=EDAngkatan.Text;
       SQLSimpan.ParamByName('P6').AsString:=EDWALI.Text;

       if (imgFoto.Bitmap<>nil) and (not imgFoto.Bitmap.IsEmpty) then
       begin
         Stream:=TMemoryStream.Create;
         try
            imgFoto.Bitmap.SaveToStream(Stream);
            Stream.Position:=0;
            SQLSimpan.ParamByName('Foto').LoadFromStream(Stream,ftBlob);
         finally
           Stream.DisposeOf;
         end;
       end else
       SQLSimpan.ParamByName('Foto').Clear;

       SQLSimpan.ExecSQL;

       LBNIS.Text:=EDNIS.Text;

       BitTambah.Text:='Tambah';
       BItEdit.Text:='Edit';
       BitHapus.Enabled:=True;

       BitRefreshClick(Sender);
       ShowMessage('Data Siswa Disimpan') ;
     end;

    if IsSImpan=False then  //proses edit
    begin
      if EDNIS.Text='' then
       begin
         ShowMessage('NIS TIDAK BOLEH KOSONG');
         Exit
       end;

       SQLSimpan.Close;
       SQLSimpan.SQL.Clear;
       SQLSimpan.SQL.Add('update tbsiswa set NIS=:P1,NAMA=:P2,KELAMIN=:P3,KELAS=:P4,');
       SQLSimpan.SQL.Add('ANGKATAN=:P5,WALI=:P6,FOTO=:Foto where NIS="'+LBNIS.Text+'"');
       SQLSimpan.ParamByName('P1').AsString:=EDNIS.Text;
       SQLSimpan.ParamByName('P2').AsString:=EDNAMA.Text;
       SQLSimpan.ParamByName('P3').AsString:=CBKelamin.Selected.Text;
       SQLSimpan.ParamByName('P4').AsString:=CBKelas.Selected.Text;
       SQLSimpan.ParamByName('P5').AsString:=EDAngkatan.Text;
       SQLSimpan.ParamByName('P6').AsString:=EDWALI.Text;

       if (imgFoto.Bitmap<>nil) and (not imgFoto.Bitmap.IsEmpty) then
       begin
         Stream:=TMemoryStream.Create;
         try
            imgFoto.Bitmap.SaveToStream(Stream);
            Stream.Position:=0;
            SQLSimpan.ParamByName('Foto').LoadFromStream(Stream,ftBlob);
         finally
           Stream.DisposeOf;
         end;
       end else
       SQLSimpan.ParamByName('Foto').Clear;

       SQLSimpan.ExecSQL;

       BitTambah.Text:='Tambah';
       BItEdit.Text:='Edit';
       BitHapus.Enabled:=True;

       BitRefreshClick(Sender);
       ShowMessage('Data Siswa Telah Di Edit') ;
    end;
end;

end;

procedure TFMenu.BitRefreshClick(Sender: TObject);
begin
if DM.Koneksi.Connected then
begin
  DM.SQLShow.Close;
  DM.SQLShow.SQL.Clear;
  DM.SQLShow.SQL.Add('select*from tbsiswa');
  DM.SQLShow.Open;
end;
end;

procedure TFMenu.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
if key=vkHardwareBack then
begin
  if TabControl1.ActiveTab=TabItem2 then
  begin
  TabControl1.ActiveTab:=TabItem1;
  exit
  end;
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


   Bersih;
except
 on E:Exception do
 begin
    ShowMessage('pesan error : '+E.Message)
 end;

end;
end;

procedure TFMenu.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var stream:TMemoryStream;
begin
SQLCari.Close;
SQLCari.SQL.Clear;
SQLCari.SQL.Add('select*from tbsiswa where NIS="'+AItem.Data['Text2'].AsString+'"');
SQLCari.Open;
if not SQLCari.Eof then
begin
 LBNIS.Text:=SQLCari.FieldByName('NIS').AsString;
 EDNIS.Text:=SQLCari.FieldByName('NIS').AsString;
 EDNAMA.Text:=SQLCari.FieldByName('NAMA').AsString;
 CBKelamin.ItemIndex:=CBKelamin.Items.IndexOf(SQLCari.FieldByName('KELAMIN').AsString);
 CBKelas.ItemIndex:=CBKelas.Items.IndexOf(SQLCari.FieldByName('KELAS').AsString);
 EDAngkatan.Text:=SQLCari.FieldByName('ANGKATAN').AsString;
 EDWALI.Text:=SQLCari.FieldByName('WALI').AsString;

  if not SQLCari.FieldByName('Foto').IsNull then
  begin
    stream:=TMemoryStream.Create;
    try
      TBlobField(SQLCari.FieldByName('Foto')).SaveToStream(stream);
      stream.Position:=0;
      imgFoto.Bitmap.LoadFromStream(stream);
    finally
      stream.DisposeOf;
    end;
  end else
  imgFoto.Bitmap:=nil;

 TabControl1.ActiveTab:=TabItem1;

end;

end;

end.
