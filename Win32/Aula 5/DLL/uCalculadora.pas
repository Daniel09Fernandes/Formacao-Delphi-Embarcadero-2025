unit uCalculadora;

interface

type
  ICalculadora = Interface
  ['{7840D671-447E-46E4-838B-DBFB29559620}']
    function Multiplicacao(A, B: Double): Double;
  End;

  TCalculadora = class(TInterfacedObject, ICalculadora)
    function Multiplicacao(A, B: Double): Double;
  end;

implementation

{ TCalculadora }

function TCalculadora.Multiplicacao(A, B: Double): Double;
begin
  Result := A* B;
end;

end.
