unit uView.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.ImageList, FMX.ImgList, FMX.Menus, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrMain = class(TForm)
    MenuBar1: TMenuBar;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem5: TMenuItem;
    ImageList1: TImageList;
    Rectangle1: TRectangle;
    RWait: TRectangle;
    OnAfterLoad: TTimer;
    Rectangle2: TRectangle;
    Z: TImage;
    Image1: TImage;
    Image2: TImage;
    procedure OnAfterLoadTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ZClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;

implementation

{$R *.fmx}

uses
  uController.Main,
  uHelper.Dialogs;

procedure TFrMain.FormShow(Sender: TObject);
begin
  OnAfterLoad.Enabled := True;
end;

procedure TFrMain.Image1Click(Sender: TObject);
begin
  if WindowState = TWindowState.wsMaximized then
    WindowState := TWindowState.wsNormal
  else
    WindowState := TWindowState.wsMaximized;
end;

procedure TFrMain.Image2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrMain.OnAfterLoadTimer(Sender: TObject);
begin
  OnAfterLoad.Enabled := False;
  RWait.Visible := True;

  try
    if not TControllerMain.AbrirLogin(Self, RWait) then
    begin
      ShowMessage('Aplicação encerrada pelo usuário!', TypeDlg.tdAlert);
      Application.Terminate;
    end;

  finally
    RWait.Visible := False;
  end;
end;

procedure TFrMain.ZClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

end.
