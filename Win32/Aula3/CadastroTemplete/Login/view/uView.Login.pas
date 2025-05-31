unit uView.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, System.Skia, FMX.Controls.Presentation, FMX.Edit, FMX.Skia, FMX.StdCtrls, System.ImageList,
  FMX.ImgList;

type
  TFrmLogin = class(TForm)
    MAin: TRectangle;
    Rectangle1: TRectangle;
    SkAnimatedImage1: TSkAnimatedImage;
    EdtUsername: TEdit;
    EdtSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    ImageList1: TImageList;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses
  uController.Login,
  uHelper.Dialogs,
  System.Generics.Collections;

procedure TFrmLogin.Button1Click(Sender: TObject);
var lParam: TParamsWhere;
begin
  var lWhere := TList<TParamsWhere>.Create;
  lParam.Key := 'Username';
  lParam.Operation := '=';
  lParam.Value := EdtUsername.Text;
  lWhere.Add(lParam);

  lParam.Key := 'Senha';
  lParam.Operation := '=';
  lParam.Value := EdtSenha.Text;
  lWhere.Add(lParam);

  var lList := TControllerLogin.GetListLogin(lWhere);
  try
    if Assigned(lList) and (lList.Count > 0) then
    begin
      Close;
      ModalResult := mrOk;
    end
    else
      ShowMessage('Usuário e(ou) senha informado errado!', TypeDlg.tdAlert);
  finally
    lList.Free;
    lWhere.Free;
  end;
end;

procedure TFrmLogin.Button2Click(Sender: TObject);
begin
   Close;
   ModalResult := mrCancel;
end;

end.
