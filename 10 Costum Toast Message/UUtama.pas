unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.ListBox, System.ImageList,
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
    BitSukses: TCornerButton;
    BitError: TCornerButton;
    BitWarning: TCornerButton;
    BitInformasi: TCornerButton;
    BitToast_2: TCornerButton;
    Label2: TLabel;
    BitLoading: TCornerButton;
    procedure BitSuksesClick(Sender: TObject);
    procedure BitErrorClick(Sender: TObject);
    procedure BitWarningClick(Sender: TObject);
    procedure BitInformasiClick(Sender: TObject);
    procedure BitToast_2Click(Sender: TObject);
    procedure BitLoadingClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

uses
  ADC.Notification;
{$R *.fmx}

{ TFUtama }

procedure TFUtama.BitErrorClick(Sender: TObject);
begin
TNotificationADC.ToastMessage(FUtama,
'Change a few thing up and try submitting again',
TOAST_ERROR,TOAST_CENTER)
end;

procedure TFUtama.BitInformasiClick(Sender: TObject);
begin
TNotificationADC.ToastMessage(FUtama,
'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
TOAST_INFO,TOAST_TOP)
end;

procedure TFUtama.BitLoadingClick(Sender: TObject);
begin
BitLoading.Text:='Sedang Proses...';
TNotificationADC.ShowLoading(FUtama,'Loading...');
TThread.CreateAnonymousThread(
  procedure
  begin
  Sleep(2000);
  TNotificationADC.ChangeMessageLoading('Pesanan sedang diproses...');
  Sleep(2000);
  TNotificationADC.ChangeMessageLoading('Proses selesai...');
  Sleep(2000);
  TThread.Synchronize(nil,
  procedure
  begin
     TNotificationADC.CloseLoading;
     BitLoading.Text:='Proses';
  end);
  end
).Start
end;

procedure TFUtama.BitSuksesClick(Sender: TObject);
begin
TNotificationADC.ToastMessage(FUtama,
'Your message has been sent Successfully',
TOAST_SUKSES)
end;

procedure TFUtama.BitToast_2Click(Sender: TObject);
begin
TNotificationADC.ToastMessage_2(FUtama,
'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ' +
'Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s,',
TOAST_BOTTOM,
TAlphaColorRec.Green,
TAlphaColorRec.Yellow
)

end;

procedure TFUtama.BitWarningClick(Sender: TObject);
begin
TNotificationADC.ToastMessage(FUtama,
'Sorry,there was a problem with your request',
TOAST_WARNING)
end;

end.
