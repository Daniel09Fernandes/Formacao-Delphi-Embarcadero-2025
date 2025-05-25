unit uController.Main;

interface

uses
  Classes,
  SysUtils,
  uController.Login;

type
  TControllerMain = class
    private

    public
      class function AbrirLogin(AOwner, AParent: TComponent): Boolean;
  end;

implementation

{ TControllerMain }

class function TControllerMain.AbrirLogin(AOwner, AParent: TComponent): Boolean;
begin
  Result := TControllerLogin.AbrirLogin(AOwner, AParent);
end;

end.
