unit uPessoaJuridica.Model;

interface

uses
  uPessoa.Model;

type
  TPessoaJuridica = class(TPessoa)
  private
    FCnpj: string;
    function AplicarMascaraNoIdentificador(AValue: string): string; override;
    function GetCNPJ: string;
    function GetTipo: string;
  protected

  public
    property CPNJ: string read GetCNPJ write FCnpj;
    property Tipo: string read GetTipo; // TPessoa pelo protected

    function CalcularBonusSalario(ASalario, ABonus: Double): Double; overload;
    function CalcularBonusSalario(ASalario, ABonus: Extended): Extended; overload;
  end;

implementation

uses
  MaskUtils;

function TPessoaJuridica.AplicarMascaraNoIdentificador(AValue: string): string;
begin
  Result := FormatMaskText('00\.000.\000\/0000-00;0;', AValue);
end;

function TPessoaJuridica.CalcularBonusSalario(ASalario, ABonus: Double): double;
begin
  Result :=  ASalario * ABonus;
end;

function TPessoaJuridica.CalcularBonusSalario(ASalario, ABonus: Extended): Extended;
begin
   Result :=  ASalario * ABonus;
end;

function TPessoaJuridica.GetCNPJ: string;
begin
  Result := AplicarMascaraNoIdentificador(FCnpj);
end;


function TPessoaJuridica.GetTipo: string;
begin

end;

end.
