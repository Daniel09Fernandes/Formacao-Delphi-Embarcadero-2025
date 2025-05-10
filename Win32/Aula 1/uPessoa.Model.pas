unit uPessoa.Model;

interface

uses
  SysUtils;

type
  TPessoa = class
  strict private
    FNome: string;
  private
    FEndereco: string;
    FTelefone: string;
  strict protected
    function GetTipo: string;
    property Tipo: string read GetTipo;
  public
    property Nome: string read FNome write FNome;
    property Endereco: string read FEndereco write FEndereco;
    property Telefone: string read FTelefone write FTelefone;
    function AplicarMascaraNoIdentificador(AValue: string): string; virtual;  //abstract; // Abstract sinaliza que a classe pai vai apenas guardar o metodo e a classe filha implementar

  end;

  TClasseAmiga = class // Sem strict viola o POO
  private
    FQuemSouEU: string;
    function GetQuemSouEu: string;

  public
    property QuemSouEu: string read GetQuemSouEu write FQuemSouEU;
  end;

implementation

{ TPessoa }
uses
  MaskUtils;

{ TPessoa }

function TPessoa.AplicarMascaraNoIdentificador(AValue: string): string;
begin
  Result := 'Não aplicavel';
end;

function TPessoa.GetTipo: string;
begin
  Result := self.ClassName;
end;

{ TClasseAmiga }

function TClasseAmiga.GetQuemSouEu: string;
begin
  var
  lPessoa := TPessoa.Create;
  // Isso viola o POO  lPessoa.FNome, ssó
  Result := 'Oi eu sou a classe ' + FQuemSouEU + lPessoa.Nome +
    ' sua amiguinha';
end;

end.
