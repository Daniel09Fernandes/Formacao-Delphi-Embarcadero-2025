unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  uOpenOffice, uOpenOffice_calc, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, uFramePromocoes, Vcl.ExtCtrls, uOpenOffice_writer, Vcl.Mask, Vcl.DBCtrls, Componente.Panel.Validador, Vcl.Buttons;

type
  TForm1 = class(TForm)
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    LblBuscar: TLabel;
    EdtBuscar: TEdit;
    BtnBuscar: TButton;
    ILPesquisa: TImageList;
    Frame1: TFrPopUp;
    Timer1: TTimer;
    PanelValidador2: TPanelValidador;
    FDMemTable1ID: TIntegerField;
    FDMemTable1Nome: TStringField;
    FDMemTable1CPF: TStringField;
    FDMemTable1Email: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelValidador2MeuEvento(Sender: TObject);
  published
    procedure OnCliqueHide(Sender: TObject);

  private
    /// <summary>
    ///  TESTE função criar para mostrar como é a
    ///  documentação de rotinas dentro do
    ///  Delphi, basta ir adicionando o que o metodo faz
    ///  dentro da tag summary
    /// </summary>
    function TesteMetodo: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  Frame1.Label1.OnClick := OnCliqueHide;
  Frame1.visible := False;
  FDMemtable1.Open;
  self.TesteMetodo; //Parar o mouse em cima para ver a documentação
end;

procedure TForm1.OnCliqueHide(Sender: TObject);
begin
   Frame1.visible := False;
end;

procedure TForm1.PanelValidador2MeuEvento(Sender: TObject);
begin
//  ShowMessage('Teste meu evento');
end;

function TForm1.TesteMetodo: string;
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Frame1.visible := True;
end;

end.
