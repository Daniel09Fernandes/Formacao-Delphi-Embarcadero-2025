object FormClientPrincipal: TFormClientPrincipal
  Left = 0
  Top = 0
  Caption = 'Client Principal'
  ClientHeight = 574
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 836
    Height = 574
    ActivePage = TabProdutos
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 830
    ExplicitHeight = 557
    object TabDatas: TTabSheet
      Caption = 'Datas'
      object ButtonDataAtual: TButton
        Left = 3
        Top = 24
        Width = 263
        Height = 65
        Caption = 'GetDataAtual + SessionID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonDataAtualClick
      end
      object ButtonConvertDateTime: TButton
        Left = 3
        Top = 95
        Width = 263
        Height = 65
        Caption = 'TryConvertDateTime'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonConvertDateTimeClick
      end
      object ButtonUnixDate: TButton
        Left = 3
        Top = 166
        Width = 263
        Height = 65
        Caption = 'UnixDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = ButtonUnixDateClick
      end
      object ButtonISO8601: TButton
        Left = 3
        Top = 237
        Width = 263
        Height = 65
        Caption = 'ISO8601'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = ButtonISO8601Click
      end
      object EditDatas: TEdit
        Left = 272
        Top = 24
        Width = 361
        Height = 23
        TabOrder = 4
      end
    end
    object TabProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 1
      object LabelQtdExecutando: TLabel
        Left = 680
        Top = 3
        Width = 110
        Height = 28
        Caption = 'Executando'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelQtdErro: TLabel
        Left = 680
        Top = 33
        Width = 39
        Height = 28
        Caption = 'Erro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelQtdConcluidos: TLabel
        Left = 680
        Top = 67
        Width = 103
        Height = 28
        Caption = 'Concluidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ButtonTestarProduto: TButton
        Left = 3
        Top = 3
        Width = 217
        Height = 73
        Caption = 'Testar Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonTestarProdutoClick
      end
      object ButtonGetProduto: TButton
        Left = 3
        Top = 82
        Width = 217
        Height = 73
        Caption = 'GetProduto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonGetProdutoClick
      end
    end
    object TabImagem: TTabSheet
      Caption = 'Imagem'
      ImageIndex = 2
      object ImagemPrincipal: TImage
        Left = 0
        Top = 73
        Width = 828
        Height = 471
        Align = alClient
        ExplicitLeft = 96
        ExplicitTop = 168
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 73
        Align = alTop
        TabOrder = 0
        object ButtonBaixarImagem: TButton
          Left = 0
          Top = 9
          Width = 201
          Height = 56
          Caption = 'Baixar Imagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = ButtonBaixarImagemClick
        end
        object ButtonEnviarImagem: TButton
          Left = 207
          Top = 9
          Width = 201
          Height = 56
          Caption = 'Enviar Imagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonEnviarImagemClick
        end
      end
    end
    object TabBlockChain: TTabSheet
      Caption = 'BlockChain'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 89
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 822
        object ButtonAcessarBlockChain: TButton
          Left = 0
          Top = 16
          Width = 217
          Height = 65
          Caption = 'AcessarBlockChain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = ButtonAcessarBlockChainClick
        end
        object ButtonCriarClasseBlockChain: TButton
          Left = 223
          Top = 16
          Width = 217
          Height = 65
          Caption = 'Criar Classe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonCriarClasseBlockChainClick
        end
      end
      object MemoBlockChain: TMemo
        Left = 0
        Top = 89
        Width = 828
        Height = 455
        Align = alClient
        Lines.Strings = (
          'MemoBlockChain')
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 822
        ExplicitHeight = 438
      end
    end
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 780
    Top = 458
  end
  object TimerThreads: TTimer
    OnTimer = TimerThreadsTimer
    Left = 436
    Top = 210
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 556
    Top = 233
  end
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://blockchain.info/rawblock/0000000000000bae09a7a393a8acded' +
      '75aa67e46cb81f7acaa5ad94f9eacd103'
    Params = <>
    SynchronizedEvents = False
    Left = 244
    Top = 162
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 236
    Top = 242
  end
  object RESTResponse1: TRESTResponse
    Left = 236
    Top = 330
  end
end
