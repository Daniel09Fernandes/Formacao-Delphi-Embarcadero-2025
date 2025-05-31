unit uModel.Clientes;

interface

{$M+}

uses
  uDao.Attributes,
  system.Generics.Collections;

type
  TClientes = class
  private
    FID: Integer;
    FNome: string;
    FIdade: Integer;
    FCPF_CNPJ: string;
    FFISJUR: string;
    FEndereco: string;
    FBairro: string;
    FCidade: string;
    procedure SetFisJur(const Value: string);
  public
    [TDAOMappingTable('tab_cliente')]

    [TDaoMappingDisplayGrid('Cód')]
    [TDaoMappingField('ID', 5)]
    property ID: Integer read FID write FID;
     [TDaoMappingDisplayGrid('Nome Cliente')]
     [TDaoMappingField('Nome')]
    property Nome: string read FNome write FNome;
     [TDaoMappingField('Idade', 5)]
    property Idade: Integer read FIdade write FIdade;
     [TDaoMappingDisplayGrid('CPF ou CPNJ')]
     [TDaoMappingField('CPF_CNPJ')]
    property CnpjCpf: string read FCPF_CNPJ write FCPF_CNPJ;
     [TDaoMappingDisplayGrid('Pessoa Fisica ou Juridica')]
     [TDaoMappingField('FISJUR')]
    property FisJuri: string read FFISJUR write SetFisJur;
     [TDaoMappingDisplayGrid('Endereço')]
     [TDaoMappingField('Endereco')]
    property Endereco: string read FEndereco write FEndereco;
     [TDaoMappingField('Bairro')]
    property Bairro: string read FBairro write FBairro;
     [TDaoMappingField('Cidade')]
    property Cidade: string read FCidade write FCidade;
  end;

  TListClientes = TObjectList<TClientes>;

implementation

{ TClientes }

procedure TClientes.SetFisJur(const Value: string);
begin
  if Value = 'F' then
    FFISJUR := 'Fisica'
  else
    FFISJUR := 'Juridica';
end;

end.
