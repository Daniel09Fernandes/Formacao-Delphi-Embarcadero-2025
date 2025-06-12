unit uDao.Produtos;

interface

uses
  System.SysUtils, System.Classes, uDao.Connection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
   Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
   Datasnap.Provider;

type
 TOperation = TypeOperation;
 TAction = TParamAction;

  TDaoProdutos = class(TDmDAOConn)
    dspProdutos: TDataSetProvider;
    CdsProdutos: TClientDataSet;
  private
    { Private declarations }
  public
    procedure Executar(AParam: TParamAction); override;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDmProdutos }

procedure TDaoProdutos.Executar(AParam: TParamAction);
begin
  AParam.QryBase := Qry;
  AParam.CdsPersistencia := CdsProdutos;
  AParam.Table := 'tab_produtos';
  AParam.FieldID := 'ID';

  inherited Executar(AParam);
end;

end.
