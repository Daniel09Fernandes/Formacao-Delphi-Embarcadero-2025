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
    FFieldLength: Integer;

  public
    property FieldLength: Integer read FFieldLength write FFieldLength;
    property FieldName: string read FFieldName write FFieldName;
    constructor Create(AFieldName: string; AFieldLength: Integer = 20);
  end;

  TDaoMappingDisplayGrid = class(TCustomAttribute)
  private
    FFieldDisplay: string;
  public
    property FieldDisplay: string read FFieldDisplay write FFieldDisplay;
    constructor Create(AFieldDisplay: string);
  end;

implementation

{ TDAOMappingTable }

constructor TDAOMappingTable.Create(ATableName: string);
begin
  FTableName := ATableName;
end;

{ TDaoMappingField }

constructor TDaoMappingField.Create(AFieldName: string; AFieldLength: Integer);
begin
  FFieldName := AFieldName;
  FFieldLength := AFieldLength;
end;

{ TDaoMappingWhere }

constructor TDaoMappingDisplayGrid.Create(AFieldDisplay: string);
begin
  FFieldDisplay := AFieldDisplay;
end;

end.
