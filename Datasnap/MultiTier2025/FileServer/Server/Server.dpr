program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormPrincipalServer in 'FormPrincipalServer.pas' {Form1},
  ServerMethodsGeral in 'ServerMethodsGeral.pas' {SMGeral: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  ServerMethodsProduto in 'ServerMethodsProduto.pas' {SMProduto: TDSServerModule},
  ClasseProduto in 'ClasseProduto.pas',
  ServerMethodsFiles in 'ServerMethodsFiles.pas' {SMFiles: TDSServerModule},
  DataBlockChain in 'DataBlockChain.pas' {dmBlockChain: TDataModule},
  ServerMethodsBlockChain in 'ServerMethodsBlockChain.pas' {SMBlockChain: TDSServerModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmBlockChain, dmBlockChain);
  Application.Run;
end.
