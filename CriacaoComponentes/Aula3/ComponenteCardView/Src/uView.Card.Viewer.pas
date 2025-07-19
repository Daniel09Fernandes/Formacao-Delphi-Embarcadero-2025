unit uView.Card.Viewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFrmImageViewer = class(TForm)
    ImgViewer: TImage;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
   class procedure VisualizarImagem(APicture: TPicture);
  end;

implementation

{$R *.dfm}

procedure TFrmImageViewer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

class procedure TFrmImageViewer.VisualizarImagem(APicture: TPicture);
var
  lFrm: TFrmImageViewer;
begin
  lFrm := TFrmImageViewer.Create(nil);
  try
    lFrm.ImgViewer.Picture.Assign(APicture);
    lFrm.Height := lFrm.ImgViewer.Height;
    lFrm.Width := lFrm.ImgViewer.Width;
    lFrm.ShowModal;
  finally
    lFrm.Free;
  end;
end;

end.
