unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.TabControl;

type
  TFMenu = class(TForm)
    RTop: TRectangle;
    Label1: TLabel;
    RectNavbar: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    cSeleksi: TCircle;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure PindahTab(img: TImage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.fmx}
procedure TFMenu.FormShow(Sender: TObject);
begin
PindahTab(Image1);
end;

procedure TFMenu.Image1Click(Sender: TObject);
begin
PindahTab(TImage(Sender))
end;

procedure TFMenu.PindahTab(img: TImage);   //ctrl+shif+c
begin
    TAnimator.AnimateFloat(cSeleksi, 'Position.X', img.Position.X, 0.3,
                          TAnimationType.Out, TInterpolationType.Circular);

    TabControl1.GotoVisibleTab(img.Tag);
end;

end.
