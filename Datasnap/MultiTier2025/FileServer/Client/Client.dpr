program Client;

uses
  Vcl.Forms,
  ClasseProduto in '..\Server\ClasseProduto.pas',
  Classe.BlockChain in 'Classe.BlockChain.pas',
  ClientClasses in 'ClientClasses.pas',
  ClientModuleUnit3 in 'ClientModuleUnit3.pas' {ClientModule3: TDataModule},
  FormPrincipalClient in 'FormPrincipalClient.pas' {FormClientPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientModule3, ClientModule3);
  Application.CreateForm(TFormClientPrincipal, FormClientPrincipal);
  Application.Run;
end.
