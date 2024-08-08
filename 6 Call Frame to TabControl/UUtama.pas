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
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Label1: TLabel;
    Image4: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ActionList1: TActionList;
    KeTab1: TChangeTabAction;
    procedure btnDashboardClick(Sender: TObject);
    procedure btnKegiatanClick(Sender: TObject);
    procedure btnAbsenClick(Sender: TObject);
    procedure btnRiwayatClick(Sender: TObject);
    procedure btnAkunClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure KLikMenu(BTN:TCornerButton);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

USES UKegiatan, UAbsensi, URiwayat;
{$R *.fmx}

procedure TFUtama.btnKegiatanClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));

if not Assigned(FKegiatan) then
begin
  FKegiatan:=TFKegiatan.Create(TabItem2);
  FKegiatan.Parent:=TabItem2;
  FKegiatan.Align:=TAlignLayout.Client;
end;
//Label2.Text:='FORM KEGIATAN';
TabControl1.GotoVisibleTab(1);

end;

procedure TFUtama.btnRiwayatClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
FRiwayat.Show;
//Label4.Text:='FORM RIWAYAT';
//TabControl1.GotoVisibleTab(3);
end;

procedure TFUtama.FormShow(Sender: TObject);
begin
TabControl1.ActiveTab:=TabItem1;
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

if not Assigned(FAbsensi) then
begin
  FAbsensi:=TFAbsensi.Create(TabItem3);
  FAbsensi.Parent:=TabItem3;
  FAbsensi.Align:=TAlignLayout.Client;
end;

Label3.Text:='FORM ABSENSI';
TabControl1.GotoVisibleTab(2);
btnAbsen.FontColor:=TAlphaColorRec.Crimson;
end;

procedure TFUtama.btnAkunClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
Label5.Text:='FORM AKUN';
TabControl1.GotoVisibleTab(4);
end;

procedure TFUtama.btnDashboardClick(Sender: TObject);
begin
KLikMenu(TCornerButton(Sender));
//TabControl1.GotoVisibleTab(0)
KeTab1.Execute
end;

end.
