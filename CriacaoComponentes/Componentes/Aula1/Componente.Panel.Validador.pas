unit Componente.Panel.Validador;

interface

uses
  Classes, SysUtils, Vcl.Controls, Vcl.Graphics, Data.DB, Vcl.DBCtrls,
  Vcl.ExtCtrls, system.Generics.Collections;

type
  //Evento
  TMeuEvento = procedure(Sender: TObject) of object;

  TEditConfig = class(TComponent)
  private
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor: TColor;
    FFontColor: TColor;
  protected
    procedure PreencheProps(AWOwner: TDBEdit);
  public
    constructor Create(AWOwner: TDBEdit); reintroduce; overload;
  published
    property BevelInner: TBevelCut read FBevelInner write FBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write FBevelOuter;
    property BevelKind: TBevelKind read FBevelKind write FBevelKind;
    property BevelWidth: TBevelWidth read FBevelWidth write FBevelWidth;
    property Color: TColor read FColor write FColor;
    property FontColor: TColor read FFontColor write FFontColor;
  end;

  TCustomPanelValidador = class(TCustomPanel)
  const
    MSG_CAMPO_OBRIGATORIO = 'O campo %s que não foi informado, é de preenchimento obrigatorio!!'+ #13#13;
  strict private
    FMeuEvento: TMeuEvento;
    FListaComponentes: TDictionary<TControl, TEditConfig>;
    FOnBeforePost: TDataSetNotifyEvent;
  protected
    FActive: Boolean;
    FDataSource: TDataSource;
    FEditConfig: TEditConfig;
    FMessage: string;

    procedure SetDataSource(const value: TDataSource);
    procedure CreateParams(var Params: TCreateParams); override;
    function GetMenssagem: string;
    procedure OnBeforePostCDS(ADataset: TDataSet);
  public
    property OnMeuEvento: TMeuEvento read FMeuEvento write FMeuEvento;

    function ValidaCamposObrigatorios: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

  TPanelValidador = class(TCustomPanelValidador)
  published
    property Caption;
    property Align;
    property Active: Boolean read FActive write FActive default True;
    property EditConfig: TEditConfig read FEditConfig write FEditConfig;
    property Mensagem: String read FMessage write FMessage;
    property DataSource: TDataSource read FDataSource write FDataSource;
    property OnMeuEvento;
  end;

implementation

{ TEditConfig }

constructor TEditConfig.Create(AWOwner: TDBEdit);
begin
  inherited Create(AWOwner);
  PreencheProps(AWOwner);
end;

procedure TEditConfig.PreencheProps(AWOwner: TDBEdit);
begin
  FBevelInner := AWOwner.BevelInner;
  FBevelOuter := AWOwner.BevelOuter;
  FBevelKind := AWOwner.BevelKind;
  FBevelWidth := AWOwner.BevelWidth;
  FColor := AWOwner.Color;
  FFontColor := AWOwner.Font.Color;
end;

{ TCustomPanelValidador }

constructor TCustomPanelValidador.Create(AOwner: TComponent);
begin
  inherited;

  FListaComponentes := TDictionary<TControl, TEditConfig>.create;
  FActive := True;

  FEditConfig := TEditConfig.Create(self);
  FEditConfig.FBevelInner := bvSpace;
  FEditConfig.FBevelOuter := bvRaised;
  FEditConfig.FBevelKind := bkTile;
  FEditConfig.FBevelWidth := 2;
  FEditConfig.Color := clRed;
  FEditConfig.FontColor := clWhite;
end;

//Parecido com o OnShow, coisas visuais devem ser iniciadas aqui
procedure TCustomPanelValidador.CreateParams(var Params: TCreateParams);
begin
  inherited;

  ShowCaption := false;
  caption := '';
  BevelOuter := bvNone;
  AlignWithMargins := true;
  SetDatasource(FDataSource);
  Color := clWhite;

  if Assigned(FMeuEvento) then
    FMeuEvento(self);
end;

destructor TCustomPanelValidador.Destroy;
begin
  FreeAndNil(FListaComponentes);
  inherited;
end;

function TCustomPanelValidador.GetMenssagem: string;
begin
  Result := FMessage;
  if Result.Trim.IsEmpty then
  begin
    Result := MSG_CAMPO_OBRIGATORIO;
  end;
end;

procedure TCustomPanelValidador.OnBeforePostCDS(ADataset: TDataSet);
begin
  if not FActive then
  begin
    if Assigned(FOnBeforePost) then
      FOnBeforePost(ADataset);
  end
  else
  begin
    var MsgAlerta := ValidaCamposObrigatorios;

    if not MsgAlerta.Trim.IsEmpty  then
      raise Exception.Create(MsgAlerta)
//    else
//      if Assigned(FOnBeforePost) then
//        FOnBeforePost(ADataset);
  end;
end;

procedure TCustomPanelValidador.SetDataSource(const value: TDataSource);
begin
//  if FDataSource = value then
//    exit;

  FDataSource := value;

  if not Assigned(FOnBeforePost) then
    FOnBeforePost := OnBeforePostCDS;

  FDataSource.DataSet.BeforePost := FOnBeforePost
end;

function TCustomPanelValidador.ValidaCamposObrigatorios: string;
begin
  Result := '';

  if not Assigned(FDataSource) then
    Exit('Datasource não informado');

  if not Assigned(FDataSource.DataSet) then
    Exit('Dataset não informado');

  if FDataSource.DataSet.FieldCount <= 0 then
    Exit('O Dataset informado, não possui Fields');

  if FDataSource.DataSet.ControlsDisabled then
    Exit('Os controles visuais (DisabledControls) estão desativados');

  for var i := 0 to self.ControlCount -1 do
  begin
    if
      (not Assigned(Controls[i])) or
      (not (Controls[i] is TDBEdit)) or
      (not Assigned(TDBEdit(Controls[i]).Field )) then
      continue;

    var DbEdit := Controls[i] as TDBEdit;

    if DbEdit.Field.Required and (string(DbEdit.Text).Trim.IsEmpty ) then
    begin
      if not FListaComponentes.ContainsKey(DbEdit) then
        FListaComponentes.AddOrSetValue(DbEdit, TEditConfig.Create(DbEdit));

      DbEdit.BevelInner := FEditConfig.BevelInner;
      DbEdit.BevelOuter := FEditConfig.BevelOuter;
      DbEdit.BevelKind := FEditConfig.BevelKind;
      DbEdit.BevelWidth := FEditConfig.BevelWidth;
      DbEdit.Color := FEditConfig.Color;
      DbEdit.Font.Color := FEditConfig.FontColor;

      Result := Result + sLineBreak + Format(GetMenssagem, [DbEdit.Field.DisplayName])
    end
    else
    begin
      if not (FListaComponentes.ContainsKey(DbEdit)) then
        continue;

      DbEdit.BevelInner := FListaComponentes[DbEdit].BevelInner;
      DbEdit.BevelOuter := FListaComponentes[DbEdit].BevelOuter;
      DbEdit.BevelKind := FListaComponentes[DbEdit].BevelKind;
      DbEdit.BevelWidth := FListaComponentes[DbEdit].BevelWidth;
      DbEdit.Color := FListaComponentes[DbEdit].Color;
      DbEdit.Font.Color := FListaComponentes[DbEdit].FontColor;
    end;
  end;
end;

end.
