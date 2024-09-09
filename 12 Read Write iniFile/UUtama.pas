unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.ListBox, System.ImageList,
  FMX.ImgList, FMX.Edit;

type
  TFUtama = class(TForm)
    RectHeader: TRectangle;
    Button1: TButton;
    loutama: TLayout;
    RectBottom: TRectangle;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;
  File_Path:string;
implementation
uses System.IniFiles,System.IOUtils;
{$R *.fmx}


procedure TFUtama.Button2Click(Sender: TObject);
var Myini:TIniFile;
begin
Myini:=TIniFile.Create(File_Path);
Myini.WriteString('SETTING','host',Edit1.Text);
Myini.WriteString('SETTING','port',Edit2.Text);
Myini.WriteString('SETTING','user',Edit3.Text);
Myini.WriteString('SETTING','password',Edit4.Text);
Myini.DisposeOf;
end;

procedure TFUtama.FormCreate(Sender: TObject);
begin
{$IF DEFINED (ANDROID)}
  File_Path:=TPath.GetDocumentsPath+PathDelim+'setting.ini';
{$ENDIF}

{$IF DEFINED (MSWINDOWS)}
  File_Path:=ExtractFilePath(ParamStr(0))+'setting.ini';
{$ENDIF}
end;

procedure TFUtama.FormShow(Sender: TObject);
var Myini:TIniFile;
begin
Myini:=TIniFile.Create(File_Path);
Edit1.Text:=Myini.ReadString('SETTING','host','');
Edit2.Text:=IntToStr(Myini.ReadInteger('SETTING','port',0));
Edit3.Text:=Myini.ReadString('SETTING','user','');
Edit4.Text:=Myini.ReadString('SETTING','password','');
Myini.DisposeOf;

end;

end.
