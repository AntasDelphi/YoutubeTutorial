unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.ListBox, System.ImageList,
  FMX.ImgList, FMX.Effects;

type
  TFUtama = class(TForm)
    RectHeader: TRectangle;
    Button1: TButton;
    loutama: TLayout;
    Label6: TLabel;
    lobottom: TLayout;
    BG: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    btnDashboard: TCornerButton;
    btnKegiatan: TCornerButton;
    btnAbsen: TCornerButton;
    btnRiwayat: TCornerButton;
    btnAkun: TCornerButton;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    Image1: TImage;
    ActionList1: TActionList;
    KeTab1: TChangeTabAction;
    loMenu: TLayout;
    procedure btnDashboardClick(Sender: TObject);
    procedure btnKegiatanClick(Sender: TObject);
    procedure btnAbsenClick(Sender: TObject);
    procedure btnRiwayatClick(Sender: TObject);
    procedure btnAkunClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure KLikMenu(BTN:TCornerButton);
    procedure HideAllFrame;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

USES UKegiatan, UAbsensi, URiwayat,UDashboard;
{$R *.fmx}

procedure TFUtama.HideAllFrame;
var i:Integer;
comp:TComponent;
begin
for I := 0 to loMenu.ComponentCount-1 do
  begin
    comp:=loMenu.Components[i];
    if comp is TFrame then
    begin
      (comp as TFrame).Visible:=False;
    end;
  end;

end;

procedure TFUtama.btnKegiatanClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
HideAllFrame;
if not Assigned(FKegiatan) then
begin
  FKegiatan:=TFKegiatan.Create(loMenu);
  FKegiatan.Parent:=loMenu;
  FKegiatan.Align:=TAlignLayout.Client;
end  else
FKegiatan.Visible:=True;
end;

procedure TFUtama.btnRiwayatClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
FRiwayat.Show;

end;

procedure TFUtama.FormShow(Sender: TObject);
begin
btnDashboardClick(Sender);
btnDashboard.FontColor:=TAlphaColorRec.Crimson;
btnDashboard.ImageIndex:=0;
end;

procedure TFUtama.KLikMenu(BTN:TCornerButton);
var i:Integer;
begin
for I := 0 to GridPanelLayout1.ControlsCount-1 do
  begin
    if TControl(GridPanelLayout1.Controls[i]) is TCornerButton  then
    begin
      TCornerButton(GridPanelLayout1.Controls[i]).ImageIndex:=TCornerButton(GridPanelLayout1.Controls[i]).Tag;
      TCornerButton(GridPanelLayout1.Controls[i]).FontColor:=TAlphaColorRec.Gray;
    end;

  end;

  if BTN.Parent=GridPanelLayout1 then
  begin
    BTN.ImageIndex:=BTN.Tag-1;
    BTN.FontColor:=TAlphaColorRec.Crimson;
  end;

end;

procedure TFUtama.btnAbsenClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
HideAllFrame;
if not Assigned(FAbsensi) then
begin
  FAbsensi:=TFAbsensi.Create(loMenu);
  FAbsensi.Parent:=loMenu;
  FAbsensi.Align:=TAlignLayout.Client;
end  else
FAbsensi.Visible:=True;

btnAbsen.FontColor:=TAlphaColorRec.Crimson;
end;

procedure TFUtama.btnAkunClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));

end;

procedure TFUtama.btnDashboardClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
HideAllFrame;
if not Assigned(FDashboard) then
begin
  FDashboard:=TFDashboard.Create(loMenu);
  FDashboard.Parent:=loMenu;
  FDashboard.Align:=TAlignLayout.Client;
end else
FDashboard.Visible:=True;
end;

end.
