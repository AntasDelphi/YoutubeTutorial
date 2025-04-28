unit FMX.Devgear.HelperClass;
interface
uses
  System.Classes, FMX.Graphics;
type
  TBitmapHelper = class helper for TBitmap
  public
    procedure LoadFromUrl(AUrl: string);
    procedure LoadThumbnailFromUrl(AUrl: string; const AFitWidth, AFitHeight: Integer);
  end;
implementation
uses
  System.SysUtils, System.Types, IdHttp, IdTCPClient, AnonThread,
  System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

procedure TBitmapHelper.LoadFromUrl(AUrl: string);
var
  _Thread: TAnonymousThread<TMemoryStream>;
begin
  _Thread := TAnonymousThread<TMemoryStream>.Create(
    function: TMemoryStream
    var
      Http: TNetHTTPClient;
    begin
      Result := TMemoryStream.Create;
      Http := TNetHTTPClient.Create(nil);
      try
      try
        try
          if (Pos('https', LowerCase(AUrl)) > 0) then
            HTTP.SecureProtocols  := [THTTPSecureProtocol.SSL2,
                                      THTTPSecureProtocol.SSL3,
                                      THTTPSecureProtocol.TLS1,
                                      THTTPSecureProtocol.TLS11,
                                      THTTPSecureProtocol.TLS12,
                                      THTTPSecureProtocol.TLS13];
          Http.Get(AUrl, Result);
          Result.Position  :=  0;
        except
          Result.Free;
        end;
      finally
        Http.Free;
      end;
      except
      end;
    end,
    procedure(AResult: TMemoryStream)
    begin
      try
      if AResult.Size > 0 then
        LoadFromStream(AResult);
      AResult.Free;
      except
      end;
    end,
    procedure(AException: Exception)
    begin
    end
  );
end;

procedure TBitmapHelper.LoadThumbnailFromUrl(AUrl: string; const AFitWidth,
  AFitHeight: Integer);
var
  Bitmap: TBitmap;
  scale: Single;
begin
  LoadFromUrl(AUrl);
  scale := RectF(0, 0, Width, Height).Fit(RectF(0, 0, AFitWidth, AFitHeight));
  Bitmap := CreateThumbnail(Round(Width / scale), Round(Height / scale));
  try
    Assign(Bitmap);
  finally
    Bitmap.Free;
  end;
end;
end.
