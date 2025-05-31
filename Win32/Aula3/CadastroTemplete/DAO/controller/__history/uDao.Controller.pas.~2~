unit uDao.Controller;

interface

uses
 Dao.RTTI, System.Generics.Collections;

type
  TControllerDao<T: class, constructor> = class
    public
      class function GetListObject: TObjectList<T>;
  end;
implementation

{ TControllerDao<T> }

class function TControllerDao<T>.GetListObject: TObjectList<T>;
var
  lRtti: TDaoRtti<T>;
begin
  lRtti := TDaoRtti<T>.Create;
  try
    Result := lRtti.GetListObject;
  finally
    lRtti.Free;
  end;
end;

end.
