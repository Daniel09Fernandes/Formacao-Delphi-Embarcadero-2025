unit uCadastro.PessoaFisica.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm.Cadastro.Padrao.View, Data.DB, System.Skia, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Skia, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFrPessoaFisica = class(TFdCadPadrao)
    MemRegistroNome: TStringField;
    MemRegistroCPF: TStringField;
    MemRegistroEndereco: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPessoaFisica: TFrPessoaFisica;

implementation

{$R *.dfm}

procedure TFrPessoaFisica.FormCreate(Sender: TObject);
begin
  inherited;
  SetTitulo('Cadastro de pessoa fisica');
end;

end.
