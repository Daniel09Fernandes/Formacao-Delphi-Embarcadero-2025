unit uPessoaFisica.Model;

interface

uses
  SysUtils,
  uPessoa.Model;

type
  TPessoaFisica = class(TPessoa)
  private
    FCPF: string;

    procedure SetCpf(const Value: string);
    function GetCpf: string;
    function AplicarMascaraNoIdentificador(AValue: string): string; override;
  public
    property CPF: string read GetCpf write SetCpf;
    property Tipo: string read GetTipo;  //Acessa a TPessoa pelo protected
  end;

implementation
{ TPessoaFisica }

uses
  MaskUtils;

function TPessoaFisica.AplicarMascaraNoIdentificador(AValue: string): string;
begin
  Result := FormatMaskText('000\.000.\000\-00;0;', AValue);
end;

function TPessoaFisica.GetCpf: string;
begin
  Result := AplicarMascaraNoIdentificador(FCPF);
end;

procedure TPessoaFisica.SetCpf(const Value: string);
begin
  if not Value.Trim.IsEmpty then
    FCPF := Value
  else
    FCPF := 'Não informado';
end;
end.
