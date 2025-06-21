unit Classe.Regra.Pessoa;

interface

uses
  ClassePessoa;

type
  Tregra = class end;

  //Opcao 1: classe herdada
  TPessoaRegra = class(TPessoa)
  public
    function ValidaCamposObrigatorios: string;
  end;

  //Opcao 2: Wrapper
  TPessoaRegra2 = class(Tregra)
  private
    FPessoa: TPessoa;
  public
    function ValidaCamposObrigatorios: string;
    property Pessoa: TPessoa read FPessoa write FPessoa;
  end;

implementation

{ TPessoaRegra }

function TPessoaRegra.ValidaCamposObrigatorios: string;
begin
  Result := '';

  if Id <= 0 then
  begin
    Result := Result + slineBreak + 'Informe o "ID"';
  end;

  if Nome = '' then
  begin
    Result := Result + slineBreak + 'Informe o "Nome"';
  end;

  if Idade <= 0 then
  begin
    Result := Result + slineBreak + 'Informe a "Idade"';
  end;
end;

{ TPessoaRegra2 }

function TPessoaRegra2.ValidaCamposObrigatorios: string;
begin
  Result := '';

  if FPessoa.Id <= 0 then
  begin
    Result := Result + slineBreak + 'Informe o "ID"';
  end;

  if FPessoa.Nome = '' then
  begin
    Result := Result + slineBreak + 'Informe o "Nome"';
  end;

  if FPessoa.Idade <= 0 then
  begin
    Result := Result + slineBreak + 'Informe a "Idade"';
  end;

end;

end.
