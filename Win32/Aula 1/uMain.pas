unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  uOpenOffice, uOpenOffice_calc;

type

  TRec = Record
    FNome: string;
    FIdade: Integer;
  End;

  TForm1 = class(TForm)
  published
    Button1: TButton;
    MLog: TMemo;
    //OpenOffice_calc1: TOpenOffice_calc;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    ComboBox1: TComboBox;
    Button8: TButton;
    Button9: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure MeuEventoClique(Sender: TObject);
  private

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
  var // Objeto     //Classe    //Create gera a instancia
  lPessoa := TPessoa.Create;
  try
    lPessoa.Nome := 'Daniel';
    // lPessoa.CPF  := '11111111111'; //Mudamos para pessoa fisica

    MLog.Lines.Add('lPessoa - Classe' + lPessoa.ClassName);
    MLog.Lines.Add('lPessoa - Valor no Objeto - propriedade NOME ' +
      lPessoa.Nome);
    // MLog.Lines.Add('lPessoa - Valor no Objeto - propriedade CPF '+ lPessoa.CPF);
    MLog.Lines.Add('lPessoa - Instancia' + Format('$%p', [@lPessoa.Nome]));
  finally
    // lPessoa.Free;
    FreeAndNil(lPessoa);
    // var lResult := lPessoa.Nome;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // para rodar essa parte, tem que instalar o DinosOffice
  // OpenOffice_calc1.URlFile := 'C:/teste/Aula.ODS';
  // OpenOffice_calc1.StartSheet;
  //
  // ClientDataSet1.Data :=  OpenOffice_calc1.SheetToDataSet('').Data;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  var
  lPessoa := TPessoa.Create;
  var
  lPessoaFisica := TPessoaFisica.Create;
  var
  lPessoaJuridica := TPessoaJuridica.Create;
  try
    var
    lTipo := '';
    lPessoa.Nome := 'Daniel';
    lPessoa.Endereco := 'Rua 1';
    lPessoa.Telefone := '11 999999';
    // lTipo := lPessoa.Tipo; //Se tornou privado

    var
    CPF := lPessoaFisica.CPF;
    lPessoaFisica.Nome := 'Daniel Fernandes';
    lPessoaFisica.Endereco := 'Rua 2';
    lPessoaFisica.Telefone := '334432443';
    lTipo := lPessoaFisica.Tipo;

    lPessoaJuridica.Nome := 'DinosDev';
    lPessoaJuridica.Endereco := 'Rua 3';
    lPessoaJuridica.Telefone := '1290389';
    var
    lCpnj := lPessoaJuridica.CPNJ;
    lTipo := lPessoaJuridica.Tipo;

    lPessoaFisica := TPessoaFisica(lPessoa); // Exemplo de cast

    //
  finally
    lPessoa.Free;
    lPessoaFisica.Free;
    lPessoaJuridica.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  var
  lViewPessoa := TFrPessoaFisica.Create(Self);
  var
  lViewJuridica := TFrPessoaJuridica.Create(Self);
  try
    lViewPessoa.Left := 2;
    lViewPessoa.Show;

    lViewJuridica.Left := 20;
    lViewJuridica.Show;
  finally
    // lViewPessoa.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  var
  lForm := TForm2.Create(Self);
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

procedure TForm1.Button7Click(Sender: TObject);
const
  lPaises = 'Br, Arg, Urg, Chl, Py';
begin
{$REGION 'Stringlist - Basico'}
  var
  lStList := TStringList.Create;
  try
    lStList.Add('Banana');
    lStList.Add('Ma�a');
    lStList.Add('Pera');

    lStList.SaveToFile('ListaDeFrutas.txt');
    ComboBox1.Items := lStList;
  finally
    lStList.Free;
  end;
{$ENDREGION}

{$REGION 'Stringlist - Altera��o de arquivos'}
  var
  lStArquivo := TStringList.Create;
  try
    var lPath := 'D:\Fontes\Formacao-Delphi-Embarcadero-2025\Win32\Aula 1\Warper.ShowMessage.pas';
    lStArquivo.LoadFromFile(lPath);

    {$define SayMyName} //Apagar essa linha para executar o codigo abaixo

    {$ifndef SayMyName}
    lStArquivo[12] :=  lStArquivo[12] + #13 + '      class procedure SayMyName; ';

    lStArquivo[26] :=  lStArquivo[26] + #13+ '''
    class procedure TMessage.SayMyName;
    begin
      Showmessage('Daniel');
    end;
    ''';


    var lStMain := TStringList.Create;
    try
      var lPath2 := 'D:\Fontes\Formacao-Delphi-Embarcadero-2025\Win32\Aula 1\uMain.pas';
     lStMain.LoadFromFile(lPath2);
     lStMain[188] := '    {$define SayMyName}';
     lStMain.SaveToFile(lPath2);
    finally
      lStMain.Free;
    end;
    {$endif}

    {$ifdef SayMyName}
      TMessage.SayMyName;
    {$endif}

    lStArquivo.SaveToFile(lPath);
  finally
    lStArquivo.Free;
  end;
{$ENDREGION}

{$REGION 'Stringlist - Delimiter'}
  var
  lStListDelimiter := TStringList.Create;
  try
    lStListDelimiter.Delimiter := ',';
    lStListDelimiter.DelimitedText := lPaises;
    lStListDelimiter.StrictDelimiter := True;

    for var I := 0 to lStListDelimiter.Count -1 do
      var lLinha := lStListDelimiter[i];
  finally
    lStListDelimiter.Free;
  end;
{$ENDREGION}

end;

procedure TForm1.Button8Click(Sender: TObject);
var
  lArray: array[0..2] of string; //Array com tamanho expl�cito
  lArrayComp: array of TComponent; //Array com tamanho Implicito
begin
  SetLength(lArrayComp, 3);
  lArrayComp[0] := self;
  lArrayComp[1] := Button1;
  lArrayComp[2] := Button3;

  var lLita := TList<TComponent>.Create;
  lLita.Add(Button2);
  lLita.AddRange(lArrayComp);

  lLita.Remove(Button3);

  for var i := 0 to lLita.Count-1 do
  begin
    if lLita[i] is TButton then
      var lCaption := TButton(lLita[i]).Caption;
  end;

  SetLength(lArrayComp, 0);
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  lPar: TPair<string, integer>;
begin
//   var lDicionario := TDictionary<string, integer>.Create;
   var lDicionario := TDictionary<string, integer>.Create(100);// For�a o tamanho.
   try
     lDicionario.Add('Ma��', 10);
     lDicionario.Add('Banana', 5);
     lDicionario.Add('Pera', 17);

     lDicionario.AddOrSetValue('Ma��', 20);

     var lDebug := '';

     for var Par in lDicionario  do
       lDebug := 'Key: ' + par.Key + ' value: '+ par.Value.ToString;

     for var lKey in lDicionario.Keys do
     begin
       lDebug := lKey;
       var Output: Integer;

       if lDicionario.TryGetValue(lKey, Output) then
         lDebug := Output.ToString;

       lDebug := lDicionario.Items[lKey].ToString;
     end;

     for var lValue in lDicionario.Values do
     begin
       lDebug := lValue.ToString;
     end;

     if lDicionario.ContainsKey('Pera') then
        lDicionario.Remove('Pera')
     else
       lDebug := 'n�o existe';

     lDebug := 'Capacidade atual: ' + lDicionario.Capacity.ToString;
     lDicionario.TrimExcess;
     lDebug := 'Capacidade depos do TrimExcess: ' + lDicionario.Capacity.ToString;
   finally
     lDicionario.Free;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  var
    lRec: TRec;

  lRec.FNome := 'Daniel';
  lRec.FIdade := 10;

end;

procedure TForm1.MeuEventoClique(Sender: TObject);
begin
  Button9Click(sender);
end;

end.
