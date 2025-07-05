unit ClassePessoa;

interface

uses
  System.Generics.Collections;

type
  TPessoa = class;
  TListaPessoa = class(TObjectList<TPessoa>);

  TPessoa = class(TObject)
  private
    FId: Integer;
    FNome: string;
    FIdade: Integer;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Idade: Integer read FIdade write FIdade; 
  end;

implementation

end.
