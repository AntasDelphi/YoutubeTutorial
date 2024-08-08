unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Objects;

type
  TForm1 = class(TForm)
    Text1: TText;
    StyleBook1: TStyleBook;
    RectTop: TRectangle;
    RectBottom: TRectangle;
    Text2: TText;
    Button1: TButton;
    CornerButton1: TCornerButton;
    Button2: TButton;
    btnLogin: TRectangle;
    AnimasiLogin: TGradientAnimation;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
