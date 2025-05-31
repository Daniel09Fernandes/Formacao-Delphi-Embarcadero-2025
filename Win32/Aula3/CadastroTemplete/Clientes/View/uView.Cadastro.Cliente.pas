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
  private
    FListClientes: TListClientes;
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.fmx}

uses
  uController.Clientes;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  FListClientes := TControllerClientes.GetListClientes();
  TCdsObject<TClientes>(CdsDados).FromObject(FListClientes);

  CdsDados.BindToEdit(EdtId, 'Cód');
  CdsDados.BindToEdit(EdtNome, 'Nome Cliente');
  CdsDados.BindToEdit(EdtIdade, 'Idade');
  CdsDados.BindToEdit(EdtCpf, 'CPF ou CPNJ');
  CdsDados.BindToEdit(EdtFisJur, 'Pessoa Fisica ou Juridica');
  CdsDados.BindToEdit(EdtEndero, 'Endereço');
  CdsDados.BindToEdit(EdtBairro, 'Bairro');
  CdsDados.BindToEdit(EdtCidade, 'Cidade');
end;

end.
