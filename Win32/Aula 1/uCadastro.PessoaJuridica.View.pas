unit uCadastro.PessoaJuridica.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm.Cadastro.Padrao.View, Data.DB, System.Skia, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Skia, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFrPessoaJuridica = class(TFdCadPadrao)
    MemRegistroNome: TStringField;
    MemRegistroCNPJ: TStringField;
    MemRegistroEndereco: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPessoaJuridica: TFrPessoaJuridica;

implementation

{$R *.dfm}

procedure TFrPessoaJuridica.FormShow(Sender: TObject);
begin
  inherited;
  SetTitulo('Cadastro de Pessoa Juridica');
end;

end.
