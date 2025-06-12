program ClienteDLL;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows;

type
  ICalculadora = Interface
    ['{7840D671-447E-46E4-838B-DBFB29559620}']
    function Multiplicacao(A, B: Double): Double;
  End;

var
  Soma: function(A, B: Double): Double; stdcall;
  Calculadora: function(): ICalculadora; stdcall;

  hdll: THandle;
begin
  try
    hdll := LoadLibrary('DllCalculo.dll');
    @Soma := GetProcAddress(hdll, 'Soma');
    @Calculadora := GetProcAddress(hdll, 'Calculadora');

    while true do
    begin
      var lNum1, lNum2: Double;
      Readln(lNum1);
      Readln(lNum2);
      Writeln('');

      Writeln('Resultado Soma: '+ Soma(lNum1, lNum2).ToString);
      Writeln('Resultado Multiplicacao: '
        + Calculadora.Multiplicacao(lNum1, lNum2).ToString);
    end;
    readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
