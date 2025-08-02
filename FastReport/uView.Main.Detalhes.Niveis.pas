unit uView.Main.Detalhes.Niveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Data.Relatorios;

type
  TFrMainDetailsNiveis = class(TFrame)
    PnlMain: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    GrdPedidos: TDBGrid;
    PnlClientes: TPanel;
    Label2: TLabel;
    Bevel2: TBevel;
    GrdClientes: TDBGrid;
    PnlOrdenamento2: TPanel;
    PnlEnderecos: TPanel;
    Label3: TLabel;
    Bevel3: TBevel;
    GrdEnderecos: TDBGrid;
    PnlOrdenamento3: TPanel;
    PnlContatos: TPanel;
    Label4: TLabel;
    Bevel4: TBevel;
    GrdContatos: TDBGrid;
    PnlTransp: TPanel;
    Label5: TLabel;
    Bevel5: TBevel;
    GrdTransp: TDBGrid;
    PnlItens: TPanel;
    Label6: TLabel;
    Bevel6: TBevel;
    GrdItens: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    DBNavigator5: TDBNavigator;
    DBNavigator6: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
