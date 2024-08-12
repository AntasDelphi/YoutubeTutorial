unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.ListBox, System.ImageList,
  {$IFDEF  ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.Widget,
  Androidapi.JNIBridge,
  fmx.Helpers.Android,
  {$ENDIF}

  FMX.ImgList;

type
  TFUtama = class(TForm)
    RectHeader: TRectangle;
    Button1: TButton;
    loutama: TLayout;
    RectBottom: TRectangle;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    procedure CornerButton1Click(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
  private

    { Private declarations }
    procedure Toast(const Msg:string;Duration:Integer);
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation
{$R *.fmx}


{ TFUtama }

procedure TFUtama.CornerButton1Click(Sender: TObject);
begin
Toast('Ini Adalah Toast Message',TJToast.JavaClass.LENGTH_SHORT)
end;

procedure TFUtama.CornerButton2Click(Sender: TObject);
begin
 ShowMessage('Ini Adalah Pesan ShowMessage')
end;

procedure TFUtama.Toast(const Msg: string; Duration: Integer);
begin
{$IF DEFINED (ANDROID)}
CallInUIThread(
  procedure
  BEGIN
  TJToast.JavaClass.makeText(
      TAndroidHelper.Context,
      StrToJCharSequence(Msg),
      Duration).show;
  END
  );
{$ENDIF}
end;

end.
