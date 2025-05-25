unit uTesteIni.Fim;

interface

uses
  System.SysUtils;

function SomaDoisNumeres(a, b: integer): Integer;

implementation

var
  ContadorUso: integer;

function SomaDoisNumeres(a, b: integer): Integer;
begin
  Inc(ContadorUso);
  Result := a+b;
end;

initialization
begin
  ContadorUso := 0;
  Writeln('Unit iniciada, contador zerado.');
end;

finalization
begin
  Writeln(
    Format('Finanlizando a unit. A função SomaDoisNumeros foi utilizada %d vezes',
      [ContadorUso]));
end;

end.
