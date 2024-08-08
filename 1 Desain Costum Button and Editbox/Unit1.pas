unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.DateTimeCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    CornerButton1: TCornerButton;
    StyleBook1: TStyleBook;
    CornerButton2: TCornerButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    Edit3: TEdit;
    Memo1: TMemo;
    DateEdit1: TDateEdit;
    procedure Button2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button2Click(Sender: TObject);
begin
ShowMessage('Button Red')
end;

procedure TForm1.CornerButton1Click(Sender: TObject);
begin
ShowMessage('Button Hijau')
end;

end.
