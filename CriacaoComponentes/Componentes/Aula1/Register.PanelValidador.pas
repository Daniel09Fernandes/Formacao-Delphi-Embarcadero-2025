unit Register.PanelValidador;

interface

procedure Register;

implementation

uses Classes, Componente.Panel.Validador;

procedure register;
begin
  RegisterComponents('Meu Componente', [TPanelValidador]);
end;


end.
