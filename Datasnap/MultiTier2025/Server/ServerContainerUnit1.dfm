object ServerContainer1: TServerContainer1
  Height = 407
  Width = 623
  PixelsPerInch = 144
  object DSServer1: TDSServer
    Left = 144
    Top = 17
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 300
    Top = 17
  end
end
