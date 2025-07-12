program Mensagens;

uses
  Vcl.Forms,
  uView.Mensagens.Main in 'uView.Mensagens.Main.pas' {Form2},
  uView.Destino in 'uView.Destino.pas' {FrmDestino};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
