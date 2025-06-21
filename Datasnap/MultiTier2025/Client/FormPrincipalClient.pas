unit FormPrincipalClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, System.JSON, REST.JSON,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.Buttons, Vcl.DBCtrls, FireDAC.Stan.StorageJSON;

type
  TFormClient = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabPessoa: TTabSheet;
    Button1: TButton;
    MemoPessoa: TMemo;
    TabJson: TTabSheet;
    PanelJson: TPanel;
    MemoJson: TMemo;
    MemoResultado: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    TabRestDebugger: TTabSheet;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    PanelRestDebugger: TPanel;
    Button8: TButton;
    dsRestAPI: TDataSource;
    TabDataSnap: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button9: TButton;
    Button10: TButton;
    MemoNativoRetorna: TMemo;
    Panel6: TPanel;
    Panel7: TPanel;
    Button11: TButton;
    Button12: TButton;
    MemoNaoNativoRetorna: TMemo;
    MemoNativoEnvia: TMemo;
    MemoNaoNativoEnvia: TMemo;
    Button13: TButton;
    MemoLogServer: TMemo;
    TabDataSet: TTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label2: TLabel;
    DBGrid3: TDBGrid;
    Panel12: TPanel;
    Label1: TLabel;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    memPessoa: TFDMemTable;
    memDelta: TFDMemTable;
    memDeletados: TFDMemTable;
    memIncluidos: TFDMemTable;
    memAlterados: TFDMemTable;
    dsPessoa: TDataSource;
    dsDelta: TDataSource;
    dsDeletados: TDataSource;
    dsIncluidos: TDataSource;
    dsAlterados: TDataSource;
    memPessoaId: TIntegerField;
    memPessoaNome: TStringField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
    const
      DB_PESSOA = 'DB_Pessoa.json';
  public
    { Public declarations }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

uses ClientModuleUnit1, ClassePessoa, RootUnit;

procedure TFormClient.Button10Click(Sender: TObject);
begin
  var Pessoa: TPessoa := ClientModule1.ServerMethods1Client.GetPessoaNativo;
  MemoNativoRetorna.Lines.Add(Pessoa.Id.ToString);
  MemoNativoRetorna.Lines.Add(Pessoa.Nome);
  MemoNativoRetorna.Lines.Add(Pessoa.Idade.ToString);

  // O DS que libera
  //Pessoa.Free;
end;

procedure TFormClient.Button11Click(Sender: TObject);
begin
  var Pessoa: TPessoa := Tjson.JsonToObject<TPessoa>(MemoNaoNativoEnvia.Text);
  ClientModule1.ServerMethods1Client.SetPessoaNaoNativo(Tjson.ObjectToJsonString(Pessoa));

  Pessoa.Free;
end;

procedure TFormClient.Button12Click(Sender: TObject);
begin
  var Pessoa: TPessoa := TJson.JsonToObject<TPessoa>(ClientModule1.ServerMethods1Client.GetPessoaNaoNativo);

  MemoNaoNativoRetorna.Lines.Add(Pessoa.Id.ToString);
  MemoNaoNativoRetorna.Lines.Add(Pessoa.Nome);
  MemoNaoNativoRetorna.Lines.Add(Pessoa.Idade.ToString);

  Pessoa.Free;
end;

procedure TFormClient.Button13Click(Sender: TObject);
begin
  MemoLogServer.Text := ClientModule1.ServerMethods1Client.GetLog;
end;

procedure TFormClient.Button14Click(Sender: TObject);
begin
  memDelta.Close;
  memDeletados.Close;
  memAlterados.Close;
  memIncluidos.Close;

  memDelta.Data := memPessoa.Delta;
  memDeletados.Data := memPessoa.Delta;
  memAlterados.Data := memPessoa.Delta;
  memIncluidos.Data := memPessoa.Delta;

  memDelta.StatusFilter :=
    [rtModified, rtInserted, rtDeleted, rtUnmodified, rtHasErrors];

  memDeletados.StatusFilter := [rtDeleted];
  memAlterados.StatusFilter := [rtModified];
  memIncluidos.StatusFilter := [rtInserted];

end;

procedure TFormClient.Button15Click(Sender: TObject);
begin
  memPessoa.SaveToFile(DB_PESSOA, sfJSON);
end;

procedure TFormClient.Button16Click(Sender: TObject);
begin
  memPessoa.EmptyDataSet;
  if FileExists(DB_PESSOA) then
  begin
    memPessoa.LoadFromFile(DB_PESSOA, sfJSON);
  end;
end;

procedure TFormClient.Button17Click(Sender: TObject);
begin
  var strStm: TStringStream := TStringStream.Create(ClientModule1.ServerMethods1Client.GetPessoaDB);
  memPessoa.LoadFromStream(strStm, sfJSON);
  strStm.Free;
end;

procedure TFormClient.Button18Click(Sender: TObject);
begin
  var strStm : TStringStream := TStringStream.Create;
  memPessoa.SaveToStream(strStm, sfJSON);
  ClientModule1.ServerMethods1Client.SetPessoaDB(strStm.DataString);
  strStm.Free;
end;

procedure TFormClient.Button1Click(Sender: TObject);
begin
  //ShowMessage(ClientModule1.ServerMethods1Client.RetornaPessoa.Nome);

  var Pes := ClientModule1.ServerMethods1Client.RetornaPessoa;

  MemoPessoa.Lines.Clear;
  MemoPessoa.Lines.Add(Pes.Id.ToString);
  MemoPessoa.Lines.Add(Pes.Nome);
  MemoPessoa.Lines.Add(Pes.Idade.ToString);

  // Nao precisa, server que libera da memoria
  //Pes.Free;
end;

procedure TFormClient.Button2Click(Sender: TObject);
begin
  var Pessoa: TPessoa := TPessoa.Create;

  Pessoa.Id := 1212;
  Pessoa.Nome := 'Gustavo';
  Pessoa.Idade := 34;

  //System.JSON, REST.JSON

  var JsonStr: string := TJson.ObjectToJsonString(Pessoa);

  MemoJson.Clear;
  MemoJson.Lines.Add(JsonStr);

  Pessoa.Free;
end;

procedure TFormClient.Button3Click(Sender: TObject);
begin
  var Pessoa: TPessoa := TJson.JsonToObject<TPessoa>(MemoJson.Text);

  MemoResultado.Clear;
  MemoResultado.Lines.Add('Pessoa');
  MemoResultado.Lines.Add('Nome-'+Pessoa.Nome);
  MemoResultado.Lines.Add('Idade-'+Pessoa.Idade.ToString);
  MemoResultado.Lines.Add('Id-'+Pessoa.Id.ToString);

  Pessoa.Free;
end;

procedure TFormClient.Button4Click(Sender: TObject);
begin
  // API BLOCKCHAIN
 //https://api.blockcypher.com/v1/btc/main/txs/f854aebae95150b379cc1187d848d58225f3c4157fe992bcd166f58bd5063449

  var ObjetoJson: TJSONObject :=  TJSONObject.ParseJSONValue(MemoJson.Lines.Text) as TJSONObject;

//  ShowMessage(ObjetoJson.Get('block_hash').ToString);
//  ShowMessage(ObjetoJson.GetValue('block_hash').ToString);

  MemoResultado.Clear;
  //Retorna o field e o value
  MemoResultado.Lines.Add(ObjetoJson.Get('block_hash').ToString);
  //Retorna apenas o value
  MemoResultado.Lines.Add(ObjetoJson.GetValue('block_hash').Value);

  var ObjetoJsonArray: TJSONArray := ObjetoJson.Get('inputs').JsonValue as TJSONArray;

  var I: Integer;

  for I := 0 to ObjetoJsonArray.Size - 1 do
  begin
    MemoResultado.Lines.Add(ObjetoJsonArray.Get(I).ToString);
  end;

  // Retorna o primeiro registro de inputs(Lista) Posicao 0
  var ObjetoAux: TJSONObject := TJSONObject.ParseJSONValue(ObjetoJsonArray.Get(0).ToString) as TJSONObject;
  MemoResultado.Lines.Add(ObjetoAux.Get('script').ToString);

  ObjetoJson.Free;
end;

procedure TFormClient.Button5Click(Sender: TObject);
begin
  var ObjetoJson: TJSONObject := TJSONObject.Create;
  var ObjetoJsonArray: TJSONArray := TJSONArray.Create;

  ObjetoJson.AddPair('block_hash', '123456789');
  ObjetoJson.AddPair('inputs',ObjetoJsonArray);

  var ObjetoInputs: TJSONObject := TJSONObject.Create;
  ObjetoInputs.AddPair('prev_hash', '231123');
  ObjetoInputs.AddPair('script', '56436');

  ObjetoJsonArray.Add(ObjetoInputs);

  MemoResultado.Lines.Text := ObjetoJson.ToString;

  ObjetoJson.Free;
end;

procedure TFormClient.Button6Click(Sender: TObject);
begin
  var ClasseJson: TRoot := TJson.JsonToObject<TRoot>(MemoJson.Text);

  MemoResultado.Text := ClasseJson.BlockHash;

  var Inputs: Tinputs;
  var I: Integer;

  for Inputs in ClasseJson.Inputs do
  begin
    MemoResultado.Lines.Add(Inputs.PrevHash);
    MemoResultado.Lines.Add(Inputs.Script);
  end;

  ClasseJson.Free;
end;

procedure TFormClient.Button7Click(Sender: TObject);
begin
  var ClasseJsonEscrita : TRoot := TRoot.Create;
  ClasseJsonEscrita.BlockHash := '123456789';

  var Inputs: TInputs;
  Var I: Integer;

  for I := 0 to 1 do
  begin
    Inputs := TInputs.Create;
    Inputs.Script := 'Teste-' + I.ToString;
    Inputs.Age := 10 +  I;

    ClasseJsonEscrita.Inputs.Add(Inputs);
  end;

//  MemoResultado.Text := ClasseJsonEscrita.PrettyPrintJSON(ClasseJsonEscrita.AsJson);

  //Segundo parametro tem opcoes para melhor serializar o json
  //Ignora Listas em branco
  MemoResultado.Lines.Text := TJson.ObjectToJsonString(ClasseJsonEscrita,[joIgnoreEmptyArrays]);

  ClasseJsonEscrita.Free;
end;

procedure TFormClient.Button8Click(Sender: TObject);
begin
  RESTRequest1.Execute;
  RESTResponseDataSetAdapter1.Active := True;
end;

procedure TFormClient.Button9Click(Sender: TObject);
begin
  var Pessoa: TPessoa := TJson.JsonToObject<TPessoa>(MemoNativoEnvia.Text);
  ClientModule1.ServerMethods1Client.SetPessoaNativo(Pessoa);
end;

procedure TFormClient.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  memPessoa.CachedUpdates := True;
  memPessoa.Open;
end;

end.
