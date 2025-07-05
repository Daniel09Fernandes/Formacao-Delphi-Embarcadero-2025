object SMProduto: TSMProduto
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Gustavo Mena Barreto\OneDrive\'#193'rea de Trabalho' +
        '\MultiTier2025\db\cadastroTemplate.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 456
    Top = 208
  end
  object qryProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '    ID,'
      '    NOME,'
      '    DESCRICAO,'
      '    PRECO,'
      '    ESTOQUE,'
      '    CATEGORIA '
      'from PRODUTO'
      'order by NOME'
      'LIMIT 3')
    Left = 544
    Top = 368
  end
end
