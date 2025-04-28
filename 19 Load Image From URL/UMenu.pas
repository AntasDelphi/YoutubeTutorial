unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts,FMX.Devgear.HelperClass;

type
  TFMenu = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Button1: TButton;
    EDURL: TEdit;
    StyleBook1: TStyleBook;
    Button2: TButton;
    GridPanelLayout1: TGridPanelLayout;
    RectImage_1: TRectangle;
    RectImage_2: TRectangle;
    RectImage_3: TRectangle;
    RectImage_4: TRectangle;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.fmx}

procedure TFMenu.Button1Click(Sender: TObject);
begin
RectImage_1.Fill.Bitmap.Bitmap.LoadFromUrl(EDURL.Text);
end;

procedure TFMenu.Button2Click(Sender: TObject);
begin
//https://cdn-icons-png.flaticon.com/512/6069/6069202.png
//https://images.pexels.com/photos/39284/macbook-apple-imac-computer-39284.jpeg
//https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg
//https://images.pexels.com/photos/1006293/pexels-photo-1006293.jpeg
RectImage_1.Fill.Bitmap.Bitmap.LoadFromUrl('https://cdn-icons-png.flaticon.com/512/6069/6069202.png');
RectImage_2.Fill.Bitmap.Bitmap.LoadFromUrl('https://images.pexels.com/photos/39284/macbook-apple-imac-computer-39284.jpeg');
RectImage_3.Fill.Bitmap.Bitmap.LoadFromUrl('https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg');
RectImage_4.Fill.Bitmap.Bitmap.LoadFromUrl('https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg');

end;

end.
