unit UUtama;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Ani,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.ListBox, System.ImageList,
  FMX.ImgList, FMX.Edit,system.Permissions, FMX.MediaLibrary.Actions,
  FMX.StdActns;

type
  TFUtama = class(TForm)
    RectHeader: TRectangle;
    Button1: TButton;
    RectBottom: TRectangle;
    Label6: TLabel;
    Label7: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Circle_Foto: TCircle;
    Label1: TLabel;
    Label2: TLabel;
    Layout1: TLayout;
    img_camera: TImage;
    img_fotos: TImage;
    ActionList1: TActionList;
    ActPhotoLibrary: TTakePhotoFromLibraryAction;
    ActPhotoCamera: TTakePhotoFromCameraAction;
    procedure FormCreate(Sender: TObject);
    procedure img_cameraClick(Sender: TObject);
    procedure img_fotosClick(Sender: TObject);
    procedure ActPhotoLibraryDidFinishTaking(Image: TBitmap);
    procedure ActPhotoCameraDidFinishTaking(Image: TBitmap);

  private
    { Private declarations }
    {$IFDEF ANDROID}
    PermisiCamera, PermisiReadStorage, PermisiWriteStorage : string;
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    {$ENDIF}
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation
{$R *.fmx}
uses FMX.DialogService,Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os;


procedure TFUtama.TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
begin
        // 3 Permisi: CAMERA, READ_EXTERNAL_STORAGE dan WRITE_EXTERNAL_STORAGE

        if (Length(AGrantResults) = 3) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) and
           (AGrantResults[2] = TPermissionStatus.Granted) then
                ActPhotoCamera.Execute
        else
                TDialogService.ShowMessage('Anda tidak diperbolehkan mengambil foto');
end;

procedure TFUtama.LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
begin
        // 2 Permisi: READ_EXTERNAL_STORAGE dan WRITE_EXTERNAL_STORAGE

        if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
                ActPhotoLibrary.Execute
        else
                TDialogService.ShowMessage('Anda tidak memiliki izin untuk mengakses foto');
end;

procedure TFUtama.ActPhotoCameraDidFinishTaking(Image: TBitmap);
begin
Circle_Foto.Fill.Bitmap.Bitmap:=Image;
end;

procedure TFUtama.ActPhotoLibraryDidFinishTaking(Image: TBitmap);
begin
Circle_Foto.Fill.Bitmap.Bitmap:=Image;
end;

procedure TFUtama.DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
begin
        TDialogService.ShowMessage('Aplikasi ini perlu mengakses kamera dan foto pada perangkat Anda',
                procedure(const AResult: TModalResult)
                begin
                        APostProc;
                end);
end;

procedure TFUtama.DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
begin
        TDialogService.ShowMessage('Aplikasi perlu mengakses foto di perangkat Anda',
                procedure(const AResult: TModalResult)
                begin
                        APostProc;
                end);
end;

procedure TFUtama.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
PermisiCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
PermisiReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
PermisiWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
end;

procedure TFUtama.img_cameraClick(Sender: TObject);
begin
{$IFDEF ANDROID}
PermissionsService.RequestPermissions([PermisiCamera,
                                       PermisiReadStorage,
                                       PermisiWriteStorage],
                                       TakePicturePermissionRequestResult,
                                       DisplayMessageCamera
                                       );
{$ENDIF}
end;

procedure TFUtama.img_fotosClick(Sender: TObject);
begin
{$IFDEF ANDROID}
PermissionsService.RequestPermissions([PermisiReadStorage,
                                       PermisiWriteStorage],
                                       LibraryPermissionRequestResult,
                                       DisplayMessageLibrary
                                       );
{$ENDIF}
end;

end.
