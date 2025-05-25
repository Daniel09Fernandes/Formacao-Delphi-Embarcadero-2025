program prjCalculaValor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uTesteIni.Fim in 'uTesteIni.Fim.pas';

begin
  try
   // Writeln(' 5 + 3 = '+ SomaDoisNumeres(5, 3).ToString);
  //  Writeln(' 10 + 20 = '+ SomaDoisNumeres(10, 20).ToString);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
