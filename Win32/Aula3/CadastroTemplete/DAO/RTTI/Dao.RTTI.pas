unit Dao.RTTI;

interface

uses
  system.Generics.Collections, system.Rtti, System.Types;

type
  TDaoRtti<T: Class, constructor> = class
  public
    function GetListObject: TObjectList<T>;
  end;

implementation

{ TDaoRtti<T> }
uses
  UDao.Attributes, uDao.Connection;

function TDaoRtti<T>.GetListObject: TObjectList<T>;
var
  //RTTI
  lCtx: TRttiContext;
  lRttiType: TRttiType;
  lRttiProp: TRttiProperty;
  lRttiAtrib: TArray<TCustomAttribute>;
  Attributes: TCustomAttribute;
  lValue: TValue;

  //Geral
  lItem: T;
  lField: string;
  lTable: string;
begin
  lRttiType := lCtx.GetType(TypeInfo(T)); // Pega class informada em T
  lField := ' 0';

  for lRttiProp in lRttiType.GetProperties do //Acessa todas as propertys da classe indentificada
  begin
    if Assigned(lRttiProp) then
    begin
      lRttiAtrib := lRttiProp.GetAttributes; // Acessa todos os TAtrributes da classe identificada, mapeada na property
      if Length(lRttiAtrib) > 0 then
      begin
        for Attributes in lRttiAtrib do
        begin
           if Attributes is TDAOMappingTable then //Descobre o tipo do Atributo
             lTable :=  TDAOMappingTable(Attributes).TableName;

           if Attributes is TDaoMappingField then
             lField := lField +', '+ TDaoMappingField(Attributes).FieldName;
        end;
      end;
    end;
  end;

  Result := TObjectList<T>.Create;
  DmDAOConn.Qry.Close;
  DmDAOConn.Qry.SQL.Clear;
  DmDAOConn.Qry.SQL.Add(' Select '+ lField + ' From '+ lTable);
  DmDAOConn.Qry.Open;
  DmDAOConn.Qry.First;

  var lQry := DmDAOConn.Qry;
  while not lQry.EOF do
  begin
    lItem := T.Create;

    for lRttiProp in lRttiType.GetProperties do
    begin
      lRttiAtrib := lRttiProp.GetAttributes;

      if Length(lRttiAtrib) > 0 then
      begin
        for Attributes in lRttiAtrib do
        begin
           if Attributes is TDaoMappingField then
           begin
              case lRttiProp.PropertyType.TypeKind of //Encontra o tipo do valor da property(Int,Float,Boolean)
                tkInteger, tkInt64:
                    lValue := TValue  //Faz o cast de TValue para  um valor Explicito
                      .From<Integer>(
                        lQry
                           .FieldByName(
                              TDaoMappingField(Attributes).FieldName).AsInteger); //Pela field mapeada na class, utiliza para passar o nome na query e buscar o valor
                tkFloat:
                  begin
                    if lRttiProp.PropertyType.Handle = TypeInfo(TDateTime) then
                       lValue := TValue
                         .From<TDateTime>(
                           lQry
                             .FieldByName(
                                TDaoMappingField(Attributes).FieldName).AsDateTime)
                    else
                      lValue := TValue
                         .From<Double>(
                           lQry
                             .FieldByName(
                               TDaoMappingField(Attributes).FieldName).AsFloat)
                  end;
                tkString, tkLString, tkWString, tkUString:
                  lValue := TValue
                         .From<string>(
                           lQry
                             .FieldByName(
                               TDaoMappingField(Attributes).FieldName).AsString);
                else
                     lValue := TValue
                         .From<variant>(
                           lQry
                             .FieldByName(
                               TDaoMappingField(Attributes).FieldName).AsVariant);
              end;
              //Pela property em execu��o no for, passa o valor para uma instancia de
              // classe que tenha a property encontrada e o valor encontrado do tipo correto a cima
              //Ex a property encontrada � ID, lItem, � uma inscancia criada que possui o ID
              // ID � do tipo inteiro, retornou do banco o valor 1 para LValue que foi gravado como inteiro
              // o SetValue, escreve o Value na property identificada pelo for na instancia lItem
              lRttiProp.SetValue(TObject(lItem), lValue);
           end;
        end;
      end;
    end;
    Result.Add(lItem);
    lQry.Next;
  end;
end;

end.
