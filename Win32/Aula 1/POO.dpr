program POO;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uPessoa.Model in 'uPessoa.Model.pas',
  uPessoaJuridica.Model in 'uPessoaJuridica.Model.pas',
  uPessoaFisica.Model in 'uPessoaFisica.Model.pas',
  uForm.Cadastro.Padrao.View in 'FormPadrao\uForm.Cadastro.Padrao.View.pas' {FdCadPadrao},
  uCadastro.PessoaFisica.View in 'uCadastro.PessoaFisica.View.pas' {FrPessoaFisica},
  uCadastro.PessoaJuridica.View in 'uCadastro.PessoaJuridica.View.pas' {FrPessoaJuridica},
  uNotify.Interfaces in 'Interface\Model\Interface\uNotify.Interfaces.pas',
  uSms.Notification in 'Interface\Model\uSms.Notification.pas',
  uWhatsapp.Notification in 'Interface\Model\uWhatsapp.Notification.pas',
  uNotify.Controller in 'Interface\Controller\uNotify.Controller.pas',
  uNotify.View in 'Interface\View\uNotify.View.pas' {Form2},
  Warper.ShowMessage in 'Warper.ShowMessage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
