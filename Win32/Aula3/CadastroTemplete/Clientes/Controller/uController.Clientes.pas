unit uController.Clientes;

interface

uses
  SysUtils,
  Classes,
  System.UITypes,
  Generics.Collections,
  uModel.clientes,
  uView.Cadastro.Cliente,
  uDao.Controller, FMX.Types;

type
  TParamsWhere = TRecWhere;
  TWhere = TDaoWhere;

  TControllerClientes = class
    class function AbrirClientes(AOwner, AParent: TComponent): boolean;
    class function GetListClientes(AWhere: TWhere = nil): TObjectList<TClientes>;
  end;

implementation

{ TControllerClientes }

class function TControllerClientes.AbrirClientes(AOwner, AParent: TComponent): boolean;
begin
  var lView := TFrmClientes.Create(AOwner);
  try
    lView.Parent := TFmxObject(AParent);
    Result := (lView.ShowModal = mrOk);
  finally
    lView.Free;
  end;
end;

class function TControllerClientes.GetListClientes(AWhere: TWhere): TObjectList<TClientes>;
begin
  Result := TControllerDao<TClientes>.GetListObject(AWhere);
end;

end.
