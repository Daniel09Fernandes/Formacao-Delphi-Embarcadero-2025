unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
   uOpenOffice, uOpenOffice_calc;

type

  TRec = Record
    FNome: string;
    FIdade: Integer;
  End;

  TForm1 = class(TForm)
    Button1: TButton;
    MLog: TMemo;
//    OpenOffice_calc1: TOpenOffice_calc;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  uPessoa.Model,
  uPessoaFisica.Model,
  uPessoaJuridica.Model,
  uCadastro.PessoaFisica.View,
  uCadastro.PessoaJuridica.View,
  uOpenOfficeHelper,
  uNotify.View,
  Warper.ShowMessage;

procedure TForm1.Button1Click(Sender: TObject);
begin
   var //Objeto     //Classe    //Create gera a instancia
     lPessoa :=     TPessoa.Create;
   try
      lPessoa.Nome := 'Daniel';
    //  lPessoa.CPF  := '11111111111'; //Mudamos para pessoa fisica

      MLog.Lines.Add('lPessoa - Classe'+ lPessoa.ClassName);
      MLog.Lines.Add('lPessoa - Valor no Objeto - propriedade NOME '+ lPessoa.Nome);
     // MLog.Lines.Add('lPessoa - Valor no Objeto - propriedade CPF '+ lPessoa.CPF);
      MLog.Lines.Add('lPessoa - Instancia'+ Format('$%p',[@lPessoa.Nome]));
   finally
    // lPessoa.Free;
     FreeAndNil(lPessoa);
     //var lResult := lPessoa.Nome;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
// para rodar essa parte, tem que instalar o DinosOffice
//  OpenOffice_calc1.URlFile := 'C:/teste/Aula.ODS';
//  OpenOffice_calc1.StartSheet;
//
//  ClientDataSet1.Data :=  OpenOffice_calc1.SheetToDataSet('').Data;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  var lPessoa := TPessoa.Create;
  var lPessoaFisica := TPessoaFisica.Create;
  var lPessoaJuridica := TPessoaJuridica.Create;
  try
     var lTipo := '';
    lPessoa.Nome := 'Daniel';
    lPessoa.Endereco := 'Rua 1';
    lPessoa.Telefone := '11 999999';
//  lTipo := lPessoa.Tipo; //Se tornou privado

    var CPF := lPessoaFisica.CPF;
    lPessoaFisica.Nome := 'Daniel Fernandes';
    lPessoaFisica.Endereco := 'Rua 2';
    lPessoaFisica.Telefone := '334432443';
    lTipo := lPessoaFisica.Tipo;

    lPessoaJuridica.Nome := 'DinosDev';
    lPessoaJuridica.Endereco := 'Rua 3';
    lPessoaJuridica.Telefone := '1290389';
    var lCpnj := lPessoaJuridica.CPNJ;
    lTipo :=  lPessoaJuridica.Tipo;



    lPessoaFisica := TPessoaFisica(lPessoa); //Exemplo de cast

    //
  finally
    lPessoa.Free;
    lPessoaFisica.Free;
    lPessoaJuridica.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   var lViewPessoa := TFrPessoaFisica.Create(Self);
   var lViewJuridica := TFrPessoaJuridica.Create(Self);
   try
     lViewPessoa.Left := 2;
     lViewPessoa.Show;

     lViewJuridica.Left := 20;
     lViewJuridica.Show;
   finally
//     lViewPessoa.Free;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  var lForm := TForm2.Create(Self);
  try
    lForm.ShowModal;
  finally
    lForm.Free;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  TMessage.ShowMessage('Deseja encerrar?');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  var lRec : TRec;

  lRec.FNome := 'Daniel';
  lRec.FIdade := 10;


end;

end.
