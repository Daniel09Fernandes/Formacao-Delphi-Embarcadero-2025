unit ClientModuleUnit3;

interface

uses
  System.SysUtils, System.Classes, ClientClasses, Datasnap.DSClientRest;

type
  TClientModule3 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMGeralClient: TSMGeralClient;
    FSMProdutoClient: TSMProdutoClient;
    FSMFilesClient: TSMFilesClient;
    FSMBlockChainClient: TSMBlockChainClient;
    function GetSMGeralClient: TSMGeralClient;
    function GetSMProdutoClient: TSMProdutoClient;
    function GetSMFilesClient: TSMFilesClient;
    function GetSMBlockChainCLient: TSMBlockChainClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMGeralClient: TSMGeralClient read GetSMGeralClient write FSMGeralClient;
    property SMProdutoCLient: TSMProdutoClient read FSMProdutoCLient write FSMProdutoCLient;
    property SMFilesCLient: TSMFilesClient read GetSMFilesClient write FSMFilesCLient;
    property SMBlockChainClient: TSMBlockChainClient read GetSMBlockChainCLient write FSMBlockChainClient;
end;

var
  ClientModule3: TClientModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule3.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule3.Destroy;
begin
  FSMGeralClient.Free;
  FSMProdutoClient.Free;
  FSMFilesClient.Free;
  inherited;
end;

function TClientModule3.GetSMBlockChainCLient: TSMBlockChainClient;
begin
  if FSMBlockChainClient = nil then
    FSMBlockChainClient:= TSMBlockChainClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMBlockChainClient;
end;

function TClientModule3.GetSMFilesClient: TSMFilesClient;
begin
  if FSMFilesClient = nil then
    FSMFilesClient:= TSMFilesClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMFilesClient;
end;

function TClientModule3.GetSMGeralClient: TSMGeralClient;
begin
  if FSMGeralClient = nil then
    FSMGeralClient:= TSMGeralClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMGeralClient;
end;

function TClientModule3.GetSMProdutoClient: TSMProdutoClient;
begin
   if FSMProdutoClient = nil then
    FSMProdutoClient:= TSMProdutoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMProdutoClient;
end;

end.
