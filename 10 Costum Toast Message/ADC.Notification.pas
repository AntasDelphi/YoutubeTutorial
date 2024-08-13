unit ADC.Notification;

interface

uses System.SysUtils, System.UITypes, FMX.Types, FMX.Controls, FMX.StdCtrls,
     FMX.Objects, FMX.Effects, FMX.Layouts, FMX.Forms, FMX.Graphics, FMX.Ani,
     FMX.VirtualKeyboard, FMX.Platform,System.Classes;

const
  TOAST_SUKSES  = 0;
  TOAST_ERROR   = 1;
  TOAST_INFO    = 2;
  TOAST_WARNING = 3;
  TOAST_TOP = 'Top';
  TOAST_CENTER = 'Center';
  TOAST_BOTTOM = 'Bottom';

type
  TNotificationADC = class
    private
          class var Layout        : TLayout;
          class var FBack         : TRectangle;
          class var FArc          : TArc;
          class var FArcBesar     : TArc;
          class var FPesan        : TLabel;
          class var FAnimasi      : TFloatAnimation;
          class var FAnimasiBesar : TFloatAnimation;

          class var LayoutToast   : TLayout;
          class var reBackToast   : TRectangle;
          class var reSide        : TRectangle;
          class var AnimasiToast  : TFloatAnimation;
          class var MessageToast  : TLabel;
          class var LStatus       : TLabel;

          class var KeyUp         : TKeyEvent;
          class procedure OnNewKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
          class procedure DeleteToast(Sender: TObject);
    public
          class procedure ShowLoading(const Frm : Tform; const msg : string);
          class procedure ChangeMessageLoading(const AMessage : string);
          class procedure CloseLoading;
          class procedure ToastMessage(const Frm : Tform; const msg: string;
                                      FJenis: Integer = 2;
                                      FALign: string = 'Top';
                                      durasi: integer = 4);
          class procedure ToastMessage_2(const Frm : Tform; const msg: string;
                                      FALign: string = 'Top';
                                      BackgroundColor: Cardinal = $FF555555;
                                      FontColor: Cardinal = $FFFFFFFF;
                                      durasi: integer = 4);
  end;

implementation

{ TNotificationADC }

class procedure TNotificationADC.OnNewKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
    Key := 0;
end;

class procedure TNotificationADC.CloseLoading;
begin
        if Assigned(Layout) then
        begin

                try
                        if Assigned(FPesan) then
                                FPesan.DisposeOf;

                        if Assigned(FAnimasi) then
                                FAnimasi.DisposeOf;

                        if Assigned(FAnimasiBesar) then
                                FAnimasiBesar.DisposeOf;

                        if Assigned(FArc) then
                                FArc.DisposeOf;

                        if Assigned(FArcBesar) then
                                FArcBesar.DisposeOf;

                        if Assigned(FBack) then
                                FBack.DisposeOf;

                        if Assigned(Layout) then
                                Layout.DisposeOf;

                except
                end;
        end;

        FPesan := nil;
        FAnimasi := nil;
        FAnimasiBesar := nil;
        FArc := nil;
        FArcBesar := nil;
        Layout := nil;
        FBack := nil;
        if Assigned(Application.MainForm) and Assigned(KeyUp) then
      Application.MainForm.OnKeyUp := KeyUp; // Enxchanging for old event
end;

class procedure TNotificationADC.ChangeMessageLoading(const AMessage: string);
begin
  {
  jika prosedure ShowLoading sudah ada/dijalankan,untuk merubah pesannya tinggal menggunakan ini
  }
  TThread.Synchronize(nil,
  procedure
  begin
    if Assigned(FPesan) then
      FPesan.Text := AMessage;
  end);
end;

class procedure TNotificationADC.ShowLoading(const Frm : Tform; const msg: string);
var
        FService: IFMXVirtualKeyboardService;
begin

  KeyUp                                    := Application.MainForm.OnKeyUp;
  Application.MainForm.OnKeyUp             := OnNewKeyUp;

        FBack := TRectangle.Create(Frm);
        FBack.Opacity := 0;
        FBack.Parent := Frm;
        FBack.Visible := true;
        FBack.Align := TAlignLayout.Contents;
        FBack.Fill.Color := TAlphaColorRec.Black;
        FBack.Fill.Kind := TBrushKind.Solid;
        FBack.Stroke.Kind := TBrushKind.None;
        FBack.Visible := true;

        Layout := TLayout.Create(Frm);
        Layout.Opacity := 0;
        Layout.Parent := Frm;
        Layout.Visible := true;
        Layout.Align := TAlignLayout.Contents;
        Layout.Width := 250;
        Layout.Height := 78;
        Layout.Visible := true;

        FArc := TArc.Create(Frm);
        FArc.Visible := true;
        FArc.Parent := Layout;
        FArc.Align := TAlignLayout.Center;
        FArc.Margins.Bottom := 55;
        FArc.Width := 25;
        FArc.Height := 25;
        FArc.EndAngle := 280;
        FArc.Stroke.Color :=$FFFEFFFF;
        FArc.Stroke.Thickness := 2;
        FArc.Position.X := trunc((Layout.Width - FArc.Width) / 2);
        FArc.Position.Y := 0;

        FAnimasi := TFloatAnimation.Create(Frm);
        FAnimasi.Parent := FArc;
        FAnimasi.StartValue := 0;
        FAnimasi.StopValue := 360;
        FAnimasi.Duration := 0.8;
        FAnimasi.Loop := true;
        FAnimasi.PropertyName := 'RotationAngle';
        FAnimasi.AnimationType := TAnimationType.InOut;
        FAnimasi.Interpolation := TInterpolationType.Linear;
        FAnimasi.Start;

        FArcBesar := TArc.Create(Frm);
        FArcBesar.Visible := true;
        FArcBesar.Parent := Layout;
        FArcBesar.Align := TAlignLayout.Center;
        FArcBesar.Margins.Bottom := 55;
        FArcBesar.Width := 60;
        FArcBesar.Height := 60;
        FArcBesar.EndAngle := 280;
        FArcBesar.Stroke.Color :=$FFFEFFFF;
        FArcBesar.Stroke.Thickness := 3;
        FArcBesar.Position.X := trunc((Layout.Width - FArcBesar.Width) / 2);
        FArcBesar.Position.Y := 0;

        FAnimasiBesar               := TFloatAnimation.Create(FArcBesar);
        FAnimasiBesar.Parent        := FArcBesar;
        FAnimasiBesar.StartValue    := 0;
        FAnimasiBesar.StopValue     := 360;
        FAnimasiBesar.Duration      := 0.8;
        FAnimasiBesar.Loop          := True;
        FAnimasiBesar.PropertyName  := 'RotationAngle';
        FAnimasiBesar.AnimationType := TAnimationType.InOut;
        FAnimasiBesar.Inverse       := True;
        FAnimasiBesar.Interpolation := TInterpolationType.Linear;
        FAnimasiBesar.Start;

        FPesan := TLabel.Create(Frm);
        FPesan.Parent := Layout;
        FPesan.Align := TAlignLayout.Center;
        FPesan.Margins.Top := 100;
        FPesan.Font.Size := 13;
        FPesan.Height := 70;
        FPesan.Width := Frm.Width - 100;
        FPesan.FontColor := $FFFEFFFF;
        FPesan.TextSettings.HorzAlign := TTextAlign.Center;
        FPesan.TextSettings.VertAlign := TTextAlign.Leading;
        FPesan.StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
        FPesan.Text := msg;
        FPesan.VertTextAlign := TTextAlign.Leading;
        FPesan.Trimming := TTextTrimming.None;
        FPesan.TabStop := false;
        FPesan.SetFocus;

        TAnimator.AnimateFloat(FBack,'Opacity',0.3);
        TAnimator.AnimateFloat(Layout,'Opacity',1);
        Layout.BringToFront;

        TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                          IInterface(FService));
        if (FService <> nil) then
        begin
            FService.HideVirtualKeyboard;
        end;
        FService := nil;
end;

class procedure TNotificationADC.DeleteToast(Sender: TObject);
begin
        if Assigned(reBackToast) then
        begin
                reBackToast.Visible := false;

                try

                        if Assigned(MessageToast) then
                                MessageToast.DisposeOf;

                        if Assigned(AnimasiToast) then
                                AnimasiToast.DisposeOf;

                        if Assigned(LStatus) then
                                LStatus.DisposeOf;

                         if Assigned(reSide) then
                                reSide.DisposeOf;

                        if Assigned(reBackToast) then
                                reBackToast.DisposeOf;

                        if Assigned(LayoutToast) then
                                LayoutToast.DisposeOf;

                except
                end;
        end;
        //reBackToast lalu LayoutToast yang harus di freekan
        MessageToast  := nil;
        AnimasiToast  := nil;
        LStatus       := nil;
        reSide        := nil;
        reBackToast   := nil;
        LayoutToast   := nil;

end;

class procedure TNotificationADC.ToastMessage(const Frm : Tform; const msg: string;
                                      FJenis: Integer = 2;
                                      FALign: string = 'Top';
                                      durasi: integer = 4);
var
        FService: IFMXVirtualKeyboardService;
        FStatus : String;
        FColor : Cardinal;
        FAlignRec:TAlignLayout;
begin
  if FJenis = TOAST_SUKSES then begin
    FStatus := 'Success';
    FColor := $FF4BC961;
  end else if FJenis = TOAST_ERROR then begin
    FStatus := 'Error';
    FColor := $FFFF6969;
  end else if FJenis = TOAST_INFO then begin
    FStatus := 'Information';
    FColor := $FF0D84FD;
  end  else if FJenis = TOAST_WARNING then begin
    FStatus := 'Warning';
    FColor := $FFFC9C49;
  end;

  if FALign = TOAST_TOP then begin
    FAlignRec:=TAlignLayout.Top;
  end else if FALign = TOAST_CENTER then begin
    FAlignRec:=TAlignLayout.Center;
  end else if FALign = TOAST_BOTTOM then begin
    FAlignRec:=TAlignLayout.Bottom;
  end;

        LayoutToast := TLayout.Create(Frm);
        LayoutToast.Opacity := 1;
        LayoutToast.Parent := Frm;
        LayoutToast.Visible := true;
        LayoutToast.Align := TAlignLayout.Contents;
        LayoutToast.Visible := true;
        LayoutToast.HitTest := false;
        LayoutToast.BringToFront;

        reBackToast := TRectangle.Create(Frm);
        reBackToast.Opacity := 0;
        reBackToast.Parent := LayoutToast;
        reBackToast.Align := FAlignRec;
        reBackToast.Margins.Left := 10;
        reBackToast.Margins.Right := 10;
        reBackToast.Margins.Bottom := 10;
        reBackToast.Margins.Top := 10;
        reBackToast.Width:=LayoutToast.Width-20;
        reBackToast.Fill.Color := TAlphaColorRec.White;
        reBackToast.Fill.Kind := TBrushKind.Solid;
        reBackToast.Stroke.Kind := TBrushKind.Solid;
        reBackToast.Stroke.Color := $FFBCBFC2;
        reBackToast.XRadius := 8;
        reBackToast.YRadius := 8;

        reSide := TRectangle.Create(Frm);
        reSide.Parent := reBackToast;
        reSide.Align:=TAlignLayout.Left;
        reSide.Fill.Color := FColor;
        reSide.Stroke.Kind := TBrushKind.None;
        reSide.Width := 8;
        reSide.XRadius := 4;
        reSide.YRadius := 4;
        reSide.Margins.Top:=5;
        reSide.Margins.Bottom:=5;
        reSide.Margins.Left:=5;
        reSide.Margins.Right:=5;

        LStatus := TLabel.Create(Frm);
        LStatus.Parent := reBackToast;
        LStatus.Font.Size := 14;
        LStatus.TextSettings.Font.Style:=[TFontStyle.fsBold];
        LStatus.Text := FStatus;
        LStatus.Height := 20;
        LStatus.Width := reBackToast.Width - (reSide.Width + 16);
        LStatus.FontColor := FColor;
        LStatus.Position.X := reSide.Position.X + reSide.Width + 5;
        LStatus.Position.Y := 8;
        LStatus.StyledSettings := [];

        AnimasiToast := TFloatAnimation.Create(Frm);
        AnimasiToast.Parent := reBackToast;
        AnimasiToast.StartValue := 0;
        AnimasiToast.StopValue := 3;
        AnimasiToast.Duration := durasi / 2;
        AnimasiToast.Delay := 0;
        AnimasiToast.AutoReverse := true;
        AnimasiToast.PropertyName := 'Opacity';
        AnimasiToast.AnimationType := TAnimationType.&In;
        AnimasiToast.Interpolation := TInterpolationType.Linear;
        AnimasiToast.OnFinish := TNotificationADC.DeleteToast;

        MessageToast := TLabel.Create(Frm);
        MessageToast.Parent := reBackToast;
        MessageToast.Font.Size := 12.5;
        MessageToast.Text := msg;
        MessageToast.StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
        MessageToast.Trimming := TTextTrimming.None;
        MessageToast.TabStop := false;
        MessageToast.AutoSize := True;
        MessageToast.WordWrap := True;
        MessageToast.Width := reBackToast.Width - (reSide.Width + 16);
        MessageToast.TextSettings.FontColor := $FF36414A;
        MessageToast.Position.X := reSide.Position.X + reSide.Width + 5;
        MessageToast.Position.Y := LStatus.Position.Y + LStatus.Height + 4;
        MessageToast.TextSettings.HorzAlign := TTextAlign.Leading;

        reBackToast.Height :=LStatus.Height+MessageToast.Height+20;

        TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                          IInterface(FService));
        if (FService <> nil) then
        begin
            FService.HideVirtualKeyboard;
        end;
        FService := nil;


        AnimasiToast.Enabled := true;
end;


class procedure TNotificationADC.ToastMessage_2(const Frm : Tform; const msg: string;
                                      FALign: string = 'Top';
                                      BackgroundColor: Cardinal = $FF555555;
                                      FontColor: Cardinal = $FFFFFFFF;
                                      durasi: integer = 4);
var
        FService: IFMXVirtualKeyboardService;
        FAlignRec:TAlignLayout;
begin

  if FALign = TOAST_TOP then begin
    FAlignRec:=TAlignLayout.Top;
  end else if FALign = TOAST_CENTER then begin
    FAlignRec:=TAlignLayout.Center;
  end else if FALign = TOAST_BOTTOM then begin
    FAlignRec:=TAlignLayout.Bottom;
  end;

        LayoutToast := TLayout.Create(Frm);
        LayoutToast.Opacity := 1;
        LayoutToast.Parent := Frm;
        LayoutToast.Visible := true;
        LayoutToast.Align := TAlignLayout.Contents;
        LayoutToast.Visible := true;
        LayoutToast.HitTest := false;
        LayoutToast.BringToFront;

        reBackToast := TRectangle.Create(Frm);
        reBackToast.Opacity := 0;
        reBackToast.Parent := LayoutToast;
        reBackToast.Align := FAlignRec;
        reBackToast.Margins.Left := 10;
        reBackToast.Margins.Right := 10;
        reBackToast.Margins.Bottom := 10;
        reBackToast.Margins.Top := 10;
        reBackToast.Width:=LayoutToast.Width-20;
        reBackToast.Fill.Color := BackgroundColor;
        reBackToast.Fill.Kind := TBrushKind.Solid;
        reBackToast.Stroke.Kind := TBrushKind.None;
        reBackToast.XRadius := 8;
        reBackToast.YRadius := 8;


        AnimasiToast := TFloatAnimation.Create(Frm);
        AnimasiToast.Parent := reBackToast;
        AnimasiToast.StartValue := 0;
        AnimasiToast.StopValue := 3;
        AnimasiToast.Duration := durasi / 2;
        AnimasiToast.Delay := 0;
        AnimasiToast.AutoReverse := true;
        AnimasiToast.PropertyName := 'Opacity';
        AnimasiToast.AnimationType := TAnimationType.&In;
        AnimasiToast.Interpolation := TInterpolationType.Linear;
        AnimasiToast.OnFinish := TNotificationADC.DeleteToast;

        MessageToast := TLabel.Create(Frm);
        MessageToast.Parent := reBackToast;
        MessageToast.Font.Size := 12.5;
        MessageToast.FontColor:=FontColor;
        MessageToast.Text := msg;
        MessageToast.Trimming := TTextTrimming.None;
        MessageToast.TextSettings.HorzAlign := TTextAlign.Center;
        MessageToast.TextSettings.VertAlign := TTextAlign.Center;
        MessageToast.StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
        MessageToast.TabStop := false;
        MessageToast.AutoSize := True;
        MessageToast.WordWrap := True;
        MessageToast.Width := reBackToast.Width;
        MessageToast.Align:=TAlignLayout.Center;

        reBackToast.Height :=MessageToast.Height+20;



        TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                          IInterface(FService));
        if (FService <> nil) then
        begin
            FService.HideVirtualKeyboard;
        end;
        FService := nil;


        AnimasiToast.Enabled := true;
end;


end.
