program AppDOS;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  uProcedural in 'uProcedural.pas';

var
  lValorReal: string;
  lVlReal: Double;

begin
  try
    while True do
    begin
      Writeln('Informe o valor em real:');
      Readln(lValorReal);

      if TryStrToFloat(lValorReal, lVlReal) then
        Writeln('O Valor em dolar é: ' + FloatToStr(ConverterDolarParaReal(lVlReal)))
      else
        raise Exception.Create('Erro na conversão!');
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
