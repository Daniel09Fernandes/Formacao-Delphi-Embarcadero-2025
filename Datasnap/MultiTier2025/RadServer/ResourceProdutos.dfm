object ProdutosResource1: TProdutosResource1
  Height = 450
  Width = 900
  PixelsPerInch = 144
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 45
    Top = 24
  end
  object qryProducts: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Products'
      '{if !SORT}order by !SORT{fi}')
    Left = 195
    Top = 24
    MacroData = <
      item
        Value = Null
        Name = 'SORT'
      end>
  end
  object dsrProducts: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryProducts
    Left = 195
    Top = 96
  end
end
