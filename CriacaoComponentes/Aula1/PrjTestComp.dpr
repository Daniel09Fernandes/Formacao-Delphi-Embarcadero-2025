program PrjTestComp;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uFramePromocoes in 'uFramePromocoes.pas' {FrPopUp: TFrame},
  Componente.Panel.Validador in '..\Componentes\Aula1\Componente.Panel.Validador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
