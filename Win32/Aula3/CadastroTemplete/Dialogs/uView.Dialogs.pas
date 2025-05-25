unit uView.Dialogs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Objects, System.Skia,
  FMX.Skia,
  System.ImageList, FMX.ImgList, FMX.StdCtrls;

type
  TTypeDialog = (tdInformation, tdAlert, tdError, dtQuest);

  TFrDialogs = class(TForm)
    Rectangle1: TRectangle;
    RHeader: TRectangle;
    S: TRectangle;
    MMsg: TMemo;
    LbTitulo: TSkLabel;
    ImageList1: TImageList;
    BtnOK: TButton;
    BtnNao: TButton;
    SkAnimatedImage1: TSkAnimatedImage;
    procedure BtnOKClick(Sender: TObject);
    procedure BtnNaoClick(Sender: TObject);
  private
    class var FDlg: TFrDialogs;
  public
    class function ShowMessage(AMsg: string; ATypeDlg: TTypeDialog): Boolean;
  end;

implementation

{$R *.fmx}

procedure TFrDialogs.BtnOKClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOK;
end;

procedure TFrDialogs.BtnNaoClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

class function TFrDialogs.ShowMessage(AMsg: string;
  ATypeDlg: TTypeDialog): Boolean;
begin
  FDlg := TFrDialogs.Create(nil);
  try
    FDlg.MMsg.Lines.Add(AMsg);

    case ATypeDlg of
      tdInformation:
        begin
          FDlg.RHeader.Fill.Color := $FF1BD46B;
          FDlg.LbTitulo.Text := 'O Sistema está informando!';
        end;
      tdAlert:
        begin
          FDlg.RHeader.Fill.Color := $FFd4c71b;
          FDlg.LbTitulo.Text := 'O Sistema está alertando!';
        end;
      tdError:
        begin
          FDlg.RHeader.Fill.Color := $FFD72C24;
          FDlg.LbTitulo.Text := 'O Sistema está informando um erro!';
        end;
      dtQuest:
        begin
          FDlg.RHeader.Fill.Color := $FF2899C2;
          FDlg.LbTitulo.Text := 'O Sistema está perguntando!';
          FDlg.BtnNao.Visible := True;
          FDlg.BtnOK.Text := 'Sim';
        end;
    end;
    Result := FDlg.ShowModal = mrOk;
  finally
    FDlg.Free;
  end;
end;

end.
