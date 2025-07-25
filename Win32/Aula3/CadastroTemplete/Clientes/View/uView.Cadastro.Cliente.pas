unit uView.Cadastro.Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uView.Base.Cadastro, System.Skia, System.Rtti, FMX.Grid.Style,
  Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
  Datasnap.DBClient, System.ImageList, FMX.ImgList,
  FMX.ScrollBox, FMX.Grid, FMX.Controls.Presentation, FMX.Edit,
  FMX.TabControl, FMX.Skia, FMX.Objects,
  uModel.Clientes,
  uController.Clientes,
  uHelper.ClientDataSet;

type
  TFrmClientes = class(TFrmFormBase)
    EdtId: TEdit;
    EdtNome: TEdit;
    EdtBairro: TEdit;
    EdtEndero: TEdit;
    EdtIdade: TEdit;
    EdtCpf: TEdit;
    EdtFisJur: TEdit;
    EdtCidade: TEdit;
    SkLabel3: TSkLabel;
    SkLabel4: TSkLabel;
    SkLabel5: TSkLabel;
    SkLabel6: TSkLabel;
    SkLabel7: TSkLabel;
    SkLabel8: TSkLabel;
    SkLabel9: TSkLabel;
    SkLabel10: TSkLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    FListClientes: TListClientes;
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.fmx}


procedure TFrmClientes.BtnDeletarClick(Sender: TObject);
begin
  Deleted := True;
  TControllerClientes.Persistir(GerarParams);
  inherited;
end;

procedure TFrmClientes.BtnPesquisarClick(Sender: TObject);
begin
  inherited;
  var Where := TWhere.Create;
  try
   var AWhereParam: TParamsWhere;
    AWhereParam.Key := 'Nome';
    AWhereParam.Operation := 'LIKE';
    AWhereParam.Value := EdtPesquisa.Text + '%';
    Where.Add(AWhereParam);

    if Assigned(FListClientes) then
      FreeAndNil(FListClientes);

    CdsDados.EmptyDataSet;

    FListClientes := TControllerClientes.GetListClientes(Where);
    TCdsObject<TClientes>(CdsDados).FromObject(FListClientes);
  finally
    Where.Free;
  end;
end;

procedure TFrmClientes.BtnSalvarClick(Sender: TObject);
begin
  TControllerClientes.Persistir(GerarParams);
  inherited;
end;

procedure TFrmClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  CdsDados.ClearAllBindings;
  FreeAndNil(FListClientes);
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  FListClientes := TControllerClientes.GetListClientes();
  TCdsObject<TClientes>(CdsDados).FromObject(FListClientes);

  CdsDados.BindToEdit(EdtId, 'C�d');
  CdsDados.BindToEdit(EdtNome, 'Nome Cliente');
  CdsDados.BindToEdit(EdtIdade, 'Idade');
  CdsDados.BindToEdit(EdtCpf, 'CPF ou CPNJ');
  CdsDados.BindToEdit(EdtFisJur, 'Pessoa Fisica ou Juridica');
  CdsDados.BindToEdit(EdtEndero, 'Endere�o');
  CdsDados.BindToEdit(EdtBairro, 'Bairro');
  CdsDados.BindToEdit(EdtCidade, 'Cidade');
end;

end.
