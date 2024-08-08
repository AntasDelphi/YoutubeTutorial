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
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image4: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MultiView1: TMultiView;
    loMV: TLayout;
    BG: TRectangle;
    RectTop: TRectangle;
    Circle1: TCircle;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    ToolBar1: TToolBar;
    StyleBook1: TStyleBook;
    ImageList1: TImageList;
    btnDashboard: TCornerButton;
    CornerButton4: TCornerButton;
    CornerButton5: TCornerButton;
    ListBoxItem4: TListBoxItem;
    CornerButton8: TCornerButton;
    ListBoxItem5: TListBoxItem;
    CornerButton9: TCornerButton;
    Line1: TLine;
    procedure CornerButton2Click(Sender: TObject);
    procedure btnDashboardClick(Sender: TObject);
    procedure CornerButton4Click(Sender: TObject);
    procedure CornerButton5Click(Sender: TObject);
    procedure CornerButton8Click(Sender: TObject);
    procedure CornerButton9Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

{$R *.fmx}


procedure TFUtama.btnDashboardClick(Sender: TObject);
begin
MultiView1.HideMaster;
TabControl1.GotoVisibleTab(0)
end;

procedure TFUtama.CornerButton2Click(Sender: TObject);
begin
Application.Terminate
end;

procedure TFUtama.CornerButton4Click(Sender: TObject);
begin
MultiView1.HideMaster;
TabControl1.GotoVisibleTab(1);
end;

procedure TFUtama.CornerButton5Click(Sender: TObject);
begin
MultiView1.HideMaster;
TabControl1.GotoVisibleTab(2);
end;

procedure TFUtama.CornerButton8Click(Sender: TObject);
begin
MultiView1.HideMaster;
TabControl1.GotoVisibleTab(3);
Label4.Text:='Email'
end;

procedure TFUtama.CornerButton9Click(Sender: TObject);
begin
MultiView1.HideMaster;
TabControl1.GotoVisibleTab(4);
Label5.Text:='Pesan Tersimpan'
end;

end.
