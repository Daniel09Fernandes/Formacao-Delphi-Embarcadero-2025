unit Data.Relatorios;

interface

uses
  System.SysUtils, System.Classes, frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin, frxDBSet;

type
  TDmRelatorios = class(TDataModule)
    frxReportPrimeiroRelatorio: TfrxReport;
    MemCountrys: TFDMemTable;
    frxReportListaSimplesCountrys: TfrxReport;
    frxDBDatasetCountry: TfrxDBDataset;
    MemCustumer: TFDMemTable;
    DsMainContry: TDataSource;
    frxReportClientPorPais: TfrxReport;
    frxDBDatasetCustumer: TfrxDBDataset;
    MemOrderIndexado: TFDMemTable;
    frxDBDatasetOrderIndexado: TfrxDBDataset;
    frxReportGrupoSimples: TfrxReport;
    MemClientesIMG: TFDMemTable;
    frxDBDatasetClientesIMG: TfrxDBDataset;
    frxReportClienteImages: TfrxReport;
    frxReportBioLife: TfrxReport;
    MemBioLife: TFDMemTable;
    frxDBDatasetBioLife: TfrxDBDataset;
    frxReportBioLifeColunas: TfrxReport;
    MemPerson: TFDMemTable;
    frxDBDatasetPerson: TfrxDBDataset;
    frxReportPagesSubReport: TfrxReport;
    MemMainOrdem: TFDMemTable;
    MemNivel1: TFDMemTable;
    MemNivel2: TFDMemTable;
    MemNivel3: TFDMemTable;
    MemNivel4: TFDMemTable;
    MemNivel5: TFDMemTable;
    MemMainOrdemOrdem: TIntegerField;
    MemMainOrdemValorTotal: TCurrencyField;
    MemMainOrdemObservacao: TStringField;
    MemMainOrdemClientID: TIntegerField;
    MemNivel1ClienteID: TIntegerField;
    MemNivel1Nome: TStringField;
    MemNivel1EnderecoID: TIntegerField;
    MemNivel1ContatosID: TIntegerField;
    MemNivel2EnderecoID: TIntegerField;
    MemNivel2Rua: TStringField;
    MemNivel2Numero: TIntegerField;
    MemNivel2Complemento: TStringField;
    MemNivel2Bairro: TStringField;
    MemNivel2Cidade: TStringField;
    MemNivel3ContatosID: TIntegerField;
    MemNivel3Telefone: TStringField;
    MemNivel3Celular: TStringField;
    MemNivel3Email: TStringField;
    MemNivel3TelefoneRecado: TStringField;
    MemNivel4Ordem: TIntegerField;
    MemNivel4ItemId: TIntegerField;
    MemNivel4Descricao: TStringField;
    MemNivel4Qtd: TIntegerField;
    MemNivel4ValorUnt: TCurrencyField;
    MemMainOrdemTransportadoraID: TIntegerField;
    MemNivel5TransportadoraID: TIntegerField;
    MemNivel5Descricao: TStringField;
    MemNivel5ValorDoFrete: TCurrencyField;
    DSMainOrdem: TDataSource;
    DsNv1Cliente: TDataSource;
    DSNv2Endereco: TDataSource;
    DSNv3Contatos: TDataSource;
    DSNv4ItensOrdem: TDataSource;
    DSNv5Transportadora: TDataSource;
    frxDatasetMain: TfrxDBDataset;
    frxDatasetNv2Cliente: TfrxDBDataset;
    frxDatasetEnderecos: TfrxDBDataset;
    frxDatasetContatos: TfrxDBDataset;
    frxDatasetItensOrdens: TfrxDBDataset;
    frxDatasetTransportadora: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxReportFilho: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatorios: TDmRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
