unit uHelper.ClientDataSet;

interface

uses
  Datasnap.DBClient,
  Data.DB,
  uDao.Controller,
  System.Generics.Collections, FireDAC.Comp.Client,
  System.Bindings.Helper, FMX.Bind.DBEngExt, FMX.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.EngExt, FMX.Controls, FMX.Edit, FMX.StdCtrls,
  Winapi.Windows, FMX.ListBox, System.SysUtils;

type
  TCdsObject<T: class, CONSTRUCTOR> = class(TClientDataSet)
  public
    procedure FromObject(AList: TObjectList<T>);
  end;

  TClientDataSetHelper = class helper for TClientDataSet
  private
    procedure ConectarEditAoCDS(CDS: TClientDataSet; AEdit: TEdit;
      const ACampo: string);
    function CreateBindSource(Owner: TControl): TBindSourceDB;
  public
    procedure BindToCheckBox(ACheckBox: TCheckBox; const AFieldName: string);
    procedure BindToComboBox(ACombo: TComboBox;
      const AFieldName, AListField: string);
    procedure BindToEdit(AControl: TControl; const AFieldName: string);

    procedure ClearAllBindings;
  end;

implementation

{ TCds<T> }

procedure TCdsObject<T>.FromObject(AList: TObjectList<T>);
begin
  Self.Data := TControllerDao<T>.ObjectListToCds(AList).Data;
end;

{ TClientDataSetHelper }

procedure TClientDataSetHelper.BindToCheckBox(ACheckBox: TCheckBox; const AFieldName: string);
var
  BindSource: TBindSourceDB;
  Link: TLinkControlToField;
begin
  if Self.FindField(AFieldName) = nil then
    raise EDatabaseError.CreateFmt('Campo "%s" não encontrado no DataSet', [AFieldName]);

  BindSource := CreateBindSource(ACheckBox);

  Link := TLinkControlToField.Create(ACheckBox);
  Link.Name := 'linkCheck' + ACheckBox.Name + AFieldName;
  Link.Control := ACheckBox;
  Link.DataSource := BindSource;
  Link.FieldName := AFieldName;
  Link.AutoActivate := True;
end;

procedure TClientDataSetHelper.BindToComboBox(ACombo: TComboBox; const AFieldName, AListField: string);
var
  BindSource: TBindSourceDB;
  Link: TLinkListControlToField;
begin
  if Self.FindField(AFieldName) = nil then
    raise EDatabaseError.CreateFmt('Campo "%s" não encontrado no DataSet', [AFieldName]);

  BindSource := CreateBindSource(ACombo);

  Link := TLinkListControlToField.Create(ACombo);
  Link.Name := 'linkList' + ACombo.Name + AFieldName;
  Link.Control := ACombo;
  Link.DataSource := BindSource;
  Link.FieldName := AFieldName;
  Link.AutoActivate := True;
end;

procedure TClientDataSetHelper.BindToEdit(AControl: TControl; const AFieldName: string);
begin
  if AControl is TEdit then
    ConectarEditAoCDS(Self, TEdit(AControl), AFieldName);
end;

procedure TClientDataSetHelper.ClearAllBindings;
var
  i: Integer;
begin
  for i := Self.ComponentCount - 1 downto 0 do
    if Self.Components[i] is TBindSourceDB then
      Self.Components[i].Free;
end;

procedure TClientDataSetHelper.ConectarEditAoCDS(CDS: TClientDataSet; AEdit: TEdit; const ACampo: string);
var
  BindSource: TBindSourceDB;
  BindingsList: TBindingsList;
  LinkControlToField: TLinkControlToField;
begin
  // 1. Criar o BindSourceDB para o CDS
  BindSource := CreateBindSource(AEdit);

  // 2. Criar a lista de bindings (se não existir)
  BindingsList := TBindingsList.Create(Self);

  // 3. Criar o link entre o Edit e o campo
  LinkControlToField := TLinkControlToField.Create(BindingsList);
  LinkControlToField.Name := 'link' + AEdit.Name;
  LinkControlToField.Control := AEdit;
  LinkControlToField.DataSource := BindSource;
  LinkControlToField.FieldName := ACampo;
  LinkControlToField.Track := True; // Atualiza automaticamente

  // 4. Ativar os bindings
//  BindSource.Enabled := True;
  BindingsList.Notify(AEdit, '');
end;

function TClientDataSetHelper.CreateBindSource(Owner: TControl): TBindSourceDB;
begin
  Result := TBindSourceDB.Create(Owner);
  Result.Name := 'bind' + Self.Name;
  Result.DataSet := Self;
end;

end.
