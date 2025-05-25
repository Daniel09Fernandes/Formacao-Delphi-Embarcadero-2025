unit uView.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFrmFormBase = class(TForm)
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormBase: TFrmFormBase;

implementation

{$R *.fmx}

procedure TFrmFormBase.Image3Click(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TFrmFormBase.Image4Click(Sender: TObject);
begin
  if WindowState = TWindowState.wsMaximized then
    WindowState := TWindowState.wsNormal
  else
    WindowState := TWindowState.wsMaximized;
end;

procedure TFrmFormBase.Image5Click(Sender: TObject);
begin
  Close;
end;

end.
