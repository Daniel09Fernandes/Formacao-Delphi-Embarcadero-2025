unit uProcedural;

interface

const
  COTACAO_DOLAR = 5.69;

function ConverterRealParaDolar (AReal: Currency): Currency;
function ConverterDolarParaReal(ADolar: Currency): Currency;

implementation

function ConverterRealParaDolar(AReal: Currency): Currency;
begin
  Result := AReal * COTACAO_DOLAR;
end;

function ConverterDolarParaReal(ADolar: Currency): Currency;
begin
  Result := ADolar / COTACAO_DOLAR;
end;

end.
