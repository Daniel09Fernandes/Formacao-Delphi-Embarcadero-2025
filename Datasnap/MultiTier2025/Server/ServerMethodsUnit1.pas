unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json, REST.JSON,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, ClassePessoa, System.SyncObjs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageJSON;

type
  TServerMethods1 = class(TDSServerModule)
    memPessoa: TFDMemTable;
    memPessoaId: TIntegerField;
    memPessoaNome: TStringField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    const
      DB_PESSOA = 'DB_Pessoa.json';
    class var
      FLogStr: string;
      FCriticalSection: TCriticalSection;
      class procedure GravaLog(ATexto: string);

  public
    { Public declarations }
    //Sample Methods
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    //Pessoa
    function RetornaPessoa: TPessoa;  //primeiro metodo de exemplo
    function GetPessoaNativo: TPessoa;
    function SetPessoaNativo(APesssoa: TPessoa): Boolean;
    function GetPessoaNaoNativo: string;
    function SetPessoaNaoNativo(APessoa: string): Boolean;
    function GetPessoaDB: string;
    function SetPessoaDB(dbPessoas: string): Boolean;

    //Log
    function GetLog: string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils, Classe.Regra.Pessoa;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  FCriticalSection := TCriticalSection.Create;
end;

procedure TServerMethods1.DSServerModuleDestroy(Sender: TObject);
begin
  FCriticalSection.Free;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetLog: string;
begin
  Result := FLogStr;
end;

function TServerMethods1.GetPessoaDB: string;
begin
  if FileExists(DB_PESSOA) then
  begin
    memPessoa.LoadFromFile(DB_PESSOA, sfJSON);
  end;

  var strStm: TStringStream := TStringStream.Create;
  memPessoa.SaveToStream(strStm, sfJSON);
  Result := strStm.DataString;
  strStm.Free;
end;

function TServerMethods1.GetPessoaNaoNativo: string;
begin
  var Pessoa: TPessoa := TPessoa.Create;

  Pessoa.Id := 1234;
  Pessoa.Nome := 'Juliano';
  Pessoa.Idade := 45;

  Result := TJson.ObjectToJsonString(Pessoa);

  Pessoa.Free;
end;

function TServerMethods1.GetPessoaNativo: TPessoa;
begin
  Result := TPessoa.Create;
  Result.Id := 32312;
  Result.Nome := 'Daniel';
  Result.Idade := 30;
end;

class procedure TServerMethods1.GravaLog(ATexto: string);
begin
  FCriticalSection.Acquire;
  try
    //GetCurrentThreadID adicionar
    FLogStr := FLogStr + TimeToStr(Now) + ' - '+ATexto + sLineBreak;
  finally
    FCriticalSection.Leave;
  end;
end;

function TServerMethods1.RetornaPessoa: TPessoa;
begin
  Result := TPessoa.Create;
  Result.Id := 1;
  Result.Nome := 'Gustavo';
  Result.Idade := 34;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetPessoaDB(dbPessoas: string): Boolean;
begin
  var strStm: TStringStream := TStringStream.Create(dbPessoas);
  memPessoa.LoadFromStream(strStm, sfJSON);

  memPessoa.SaveToFile(DB_PESSOA, sfJSON);
  memPessoa.Close;
  strStm.Free;

  Result := True;
end;

function TServerMethods1.SetPessoaNaoNativo(APessoa: string): Boolean;
begin
  GravaLog('Metodo SetPessoaNaoNativo');
  var Pessoa: TPessoa := Tjson.JsonToObject<TPessoa>(APessoa);

  //Validacoes
  //opcao 1: classe herdada
  var PesRegra1: TPessoaRegra := TJson.JsonToObject<TPessoaRegra>(APessoa);
  var ValidacaoPessoa: string := PesRegra1.ValidaCamposObrigatorios;

  if ValidacaoPessoa <> '' then
  begin
    Result := False;
    //Evitar raise no server
    //raise Exception.Create('Erro ao salvar pessoa-'+ValidacaPessoa);
    GravaLog(ValidacaoPessoa);
  end;

  //opcao 2: Wrapper
  var PesRegra2: TPessoaRegra2 := TPessoaRegra2.Create;
  PesRegra2.Pessoa := TJson.JsonToObject<TPessoa>(APessoa);

  var ValidacaoPessoa2: string := PesRegra2.ValidaCamposObrigatorios;

  if ValidacaoPessoa2 <> '' then
  begin
    Result := False;

    //evitar raise direto
    //pode usar metodo que retorna erro especifico em uma variavel global

    GravaLog(ValidacaoPessoa2);
  end;

  var JsonObjt: string := TJson.ObjectToJsonString(Pessoa);

  var sl: TStringList := TStringList.Create;
  sl.Add(JsonObjt);
  sl.SaveToFile('log_pessoa.json');
  sl.Free;

  Result := True;

  Pessoa.Free;
  PesRegra1.Free;
  PesRegra2.Pessoa.Free;
  PesRegra2.Free;
end;

function TServerMethods1.SetPessoaNativo(APesssoa: TPessoa): Boolean;
begin
  var JsonObjStr: string := TJson.ObjectToJsonString(APesssoa);

  var sl: TStringList := TStringList.Create;
  sl.Add(JsonObjStr);
  sl.SaveToFile('log_pessoa.json');
  sl.Free;

  Result:= True;
end;

end.

