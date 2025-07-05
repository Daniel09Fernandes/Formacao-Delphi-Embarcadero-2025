object dmBlockChain: TdmBlockChain
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 360
    Top = 192
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 512
    Top = 200
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 320
  end
end
