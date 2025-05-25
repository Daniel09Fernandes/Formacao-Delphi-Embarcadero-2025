unit uHelper.Dialogs;

interface

uses
  uView.Dialogs, FMX.Forms;

type
  TypeDlg = TTypeDialog;
  TFormHelper = class helper for TForm
    function ShowMessage(AMsg: string; ATypeDlg: TypeDlg = tdInformation): Boolean;
  end;

implementation

{ TFormHelper }

function TFormHelper.ShowMessage(AMsg: string; ATypeDlg: TypeDlg): Boolean;
begin
  Result := TFrDialogs.ShowMessage(AMsg, ATypeDlg);
end;

end.
