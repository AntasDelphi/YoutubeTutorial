unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList;

type
  TFUtama = class(TForm)
    RectHeader: TRectangle;
    Button1: TButton;
    loutama: TLayout;
    RectBottom: TRectangle;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image4: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Circle1: TCircle;
    lbplus: TLabel;
    lomenu: TLayout;
    RectBG: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    AniMenu: TFloatAnimation;
    ActionList1: TActionList;
    KeTab1: TChangeTabAction;
    KeTAb2: TChangeTabAction;
    KeTAb3: TChangeTabAction;
    procedure Circle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    procedure TutupMenu;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

{$R *.fmx}
procedure TFUtama.TutupMenu;
begin
  AniMenu.Inverse:=True;
  AniMenu.Start;

  Circle1.Tag:=0;
  Circle1.RotationAngle:=180;
  TAnimator.AnimateFloatWait(Circle1,
                             'RotationAngle',0,0.5,
                             TAnimationType.InOut,
                             TInterpolationType.Circular);
  lbplus.Text:='+';
  lomenu.Visible:=False;
end;

procedure TFUtama.Circle1Click(Sender: TObject);
begin
if Circle1.Tag=0 then
begin
  lomenu.Position.Y:=FUtama.Height+20;
  lomenu.Visible:=True;

  AniMenu.Inverse:=False;
  AniMenu.StartValue:=FUtama.Height+20;
  AniMenu.StopValue:=0;
  AniMenu.Start;

  Circle1.Tag:=1;
  Circle1.RotationAngle:=0;
  TAnimator.AnimateFloatWait(Circle1,
                             'RotationAngle',180,0.5,
                             TAnimationType.InOut,
                             TInterpolationType.Circular);
  lbplus.Text:='-';
end else
begin
  TutupMenu
end;
end;

procedure TFUtama.FormCreate(Sender: TObject);
begin
lomenu.Visible:=False;
end;

procedure TFUtama.Image1Click(Sender: TObject);
begin
KeTab1.Execute;
TutupMenu;

end;

procedure TFUtama.Image2Click(Sender: TObject);
begin
KeTAb2.Execute;
TutupMenu;

end;

procedure TFUtama.Image3Click(Sender: TObject);
begin
KeTAb3.Execute;
TutupMenu;

end;

end.
