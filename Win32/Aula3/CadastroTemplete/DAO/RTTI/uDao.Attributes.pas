unit uDao.Attributes;

interface

type
  TDAOMappingTable = class(TCustomAttribute)
  private
    FTableName: string;

  public
    property TableName: string read FTableName write FTableName;
    constructor Create(ATableName: string);
  end;

  TDaoMappingField = class(TCustomAttribute)
  private
    FFieldName: string;

  public
    property FieldName: string read FFieldName write FFieldName;
    constructor Create(AFieldName: string);
  end;

implementation

{ TDAOMappingTable }

constructor TDAOMappingTable.Create(ATableName: string);
begin
  FTableName := ATableName;
end;

{ TDaoMappingField }

constructor TDaoMappingField.Create(AFieldName: string);
begin
  FFieldName := AFieldName;
end;

end.
