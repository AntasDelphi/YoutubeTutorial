unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts,FMX.Devgear.HelperClass,
  System.IOUtils,system.NetEncoding;

type
  TFMenu = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    BitLoadURL: TButton;
    EDURL: TEdit;
    StyleBook1: TStyleBook;
    BitLoadCache: TButton;
    GridPanelLayout1: TGridPanelLayout;
    RectImage_1: TRectangle;
    RectImage_2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    EDCache: TEdit;
    BitClearCache: TButton;
    procedure BitClearCacheClick(Sender: TObject);
    procedure BitLoadCacheClick(Sender: TObject);
    procedure BitLoadURLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.fmx}
//https://cdn-icons-png.flaticon.com/512/6069/6069202.png

// Hapus file cache yang lebih dari n hari
procedure CleanOldCache(const ADays: Integer);
var
  Files: TStringDynArray;
  I: Integer;
  FileDate: TDateTime;
begin
  Files := System.IOUtils.TDirectory.GetFiles(System.IOUtils.TPath.GetCachePath, '*.*');
  for I := 0 to High(Files) do
  begin
    FileDate := TFile.GetLastWriteTime(Files[I]);
    if (Now - FileDate) > ADays then
      TFile.Delete(Files[I]);
  end;
end;

procedure TFMenu.BitLoadCacheClick(Sender: TObject);
var  CacheFileName: string;
  CachePath: string;
begin
  CachePath := System.IOUtils.TPath.GetCachePath;
  CacheFileName := System.IOUtils.TPath.Combine(CachePath,
  TNetEncoding.URL.Encode(EDCache.Text));

  if TFile.Exists(CacheFileName) then
  RectImage_2.Fill.Bitmap.Bitmap.LoadFromFile(CacheFileName)
  else
  RectImage_2.Fill.Bitmap.Bitmap:=nil;

end;

procedure TFMenu.BitLoadURLClick(Sender: TObject);
begin
RectImage_1.Fill.Bitmap.Bitmap.LoadFromCache(EDURL.Text);
end;

procedure TFMenu.BitClearCacheClick(Sender: TObject);
var
  Files: TStringDynArray;
  I: Integer;
begin
  Files := System.IOUtils.TDirectory.GetFiles(System.IOUtils.TPath.GetCachePath, '*.*');
  for I := 0 to High(Files) do
  begin
      TFile.Delete(Files[I]);
  end;

end;

end.
