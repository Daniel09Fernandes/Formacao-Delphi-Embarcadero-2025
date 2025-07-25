unit uController.Login;

interface

uses
  SysUtils,
  Classes,
  System.UITypes,
  Generics.Collections,
  uView.Login,
  uDao.Controller,
  uModel.Login;
type
  TParamsWhere = TRecWhere;
  TWhere = TDaoWhere;

  TControllerLogin = class
    class function AbrirLogin(AOwner, AParent: TComponent): boolean;
    class function GetListLogin(AWhere: TWhere = nil): TObjectList<TLogin>;
  end;

implementation

uses
  FMX.Types;

{ TControllerLogin }

class function TControllerLogin.AbrirLogin(AOwner, AParent: TComponent): Boolean;
begin
  var lView := TFrmLogin.Create(AOwner);
  try
    lView.Parent := TFmxObject(AParent);
    Result := (lView.ShowModal = mrOk);
  finally
    lView.Free;
  end;
end;

class function TControllerLogin.GetListLogin(AWhere: TWhere): TObjectList<TLogin>;
begin
   Result := TControllerDao<TLogin>.GetListObject(AWhere);
end;

end.
