program ConversorMoedaInterfaceGrafica;

uses
  Vcl.Forms,
  uInterface.Grafica.View in 'uInterface.Grafica.View.pas' {Form1},
  uConversor in 'uConversor.pas',
  uConversor.Generics in 'uConversor.Generics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
