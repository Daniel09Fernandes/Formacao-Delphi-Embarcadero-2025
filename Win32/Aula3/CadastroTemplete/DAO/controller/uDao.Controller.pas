unit uDao.Controller;

interface

uses
 Dao.RTTI, System.Generics.Collections;

type
  TRecWhere = TParamsWhere;
  TDaoWhere = TWhere;

  TControllerDao<T: class, constructor> = class
    public
      class function GetListObject(AWhere: TWhere = nil): TObjectList<T>;
  end;
implementation

{ TControllerDao<T> }

class function TControllerDao<T>.GetListObject(AWhere: TWhere = nil): TObjectList<T>;
var
  lRtti: TDaoRtti<T>;
begin
  lRtti := TDaoRtti<T>.Create;
  try
    Result := lRtti.GetListObject(AWhere);
  finally
    lRtti.Free;
  end;
end;

end.
