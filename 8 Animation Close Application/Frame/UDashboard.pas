unit UDashboard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFDashboard = class(TFrame)
    Label1: TLabel;
    Image4: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
FDashboard:TFDashboard;
implementation

{$R *.fmx}

end.
