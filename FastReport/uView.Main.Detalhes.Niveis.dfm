object FrMainDetailsNiveis: TFrMainDetailsNiveis
  Left = 0
  Top = 0
  Width = 990
  Height = 727
  TabOrder = 0
  object PnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 984
    Height = 182
    Align = alTop
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 837
    object Label1: TLabel
      Left = 9
      Top = 7
      Width = 42
      Height = 15
      Caption = 'Pedidos'
    end
    object Bevel1: TBevel
      Left = 1
      Top = 1
      Width = 982
      Height = 26
      Align = alTop
      ExplicitLeft = 7
      ExplicitTop = 4
      ExplicitWidth = 772
    end
    object GrdPedidos: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 32
      Width = 976
      Height = 121
      Margins.Top = 5
      Align = alClient
      DataSource = DmRelatorios.DSMainOrdem
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 156
      Width = 982
      Height = 25
      DataSource = DmRelatorios.DSMainOrdem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 88
      ExplicitTop = 160
      ExplicitWidth = 240
    end
  end
  object PnlOrdenamento2: TPanel
    Left = 0
    Top = 362
    Width = 990
    Height = 173
    Align = alTop
    Caption = 'PnlOrdenamento2'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 140
    ExplicitWidth = 798
    object PnlClientes: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 477
      Height = 165
      Align = alLeft
      ShowCaption = False
      TabOrder = 0
      object Label2: TLabel
        Left = 9
        Top = 7
        Width = 42
        Height = 15
        Caption = 'Clientes'
      end
      object Bevel2: TBevel
        Left = 1
        Top = 1
        Width = 475
        Height = 26
        Align = alTop
        ExplicitLeft = 25
        ExplicitTop = 25
        ExplicitWidth = 780
      end
      object GrdClientes: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 32
        Width = 469
        Height = 104
        Margins.Top = 5
        Align = alClient
        DataSource = DmRelatorios.DsNv1Cliente
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator3: TDBNavigator
        Left = 1
        Top = 139
        Width = 475
        Height = 25
        DataSource = DmRelatorios.DsNv1Cliente
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 88
        ExplicitTop = 160
        ExplicitWidth = 240
      end
    end
    object PnlEnderecos: TPanel
      AlignWithMargins = True
      Left = 487
      Top = 4
      Width = 499
      Height = 165
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      ShowCaption = False
      TabOrder = 1
      object Label3: TLabel
        Left = 9
        Top = 7
        Width = 54
        Height = 15
        Caption = 'Endere'#231'os'
      end
      object Bevel3: TBevel
        Left = 1
        Top = 1
        Width = 497
        Height = 26
        Align = alTop
        ExplicitLeft = 0
        ExplicitTop = -1
        ExplicitWidth = 308
      end
      object GrdEnderecos: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 32
        Width = 491
        Height = 104
        Margins.Top = 5
        Align = alClient
        DataSource = DmRelatorios.DSNv2Endereco
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator4: TDBNavigator
        Left = 1
        Top = 139
        Width = 497
        Height = 25
        DataSource = DmRelatorios.DSNv2Endereco
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 140
        ExplicitWidth = 531
      end
    end
  end
  object PnlOrdenamento3: TPanel
    Left = 0
    Top = 535
    Width = 990
    Height = 173
    Align = alTop
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 148
    ExplicitWidth = 798
    object PnlContatos: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 476
      Height = 165
      Align = alLeft
      ShowCaption = False
      TabOrder = 0
      object Label4: TLabel
        Left = 9
        Top = 7
        Width = 48
        Height = 15
        Caption = 'Contatos'
      end
      object Bevel4: TBevel
        Left = 1
        Top = 1
        Width = 474
        Height = 26
        Align = alTop
        ExplicitLeft = 25
        ExplicitTop = 25
        ExplicitWidth = 780
      end
      object GrdContatos: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 32
        Width = 468
        Height = 104
        Margins.Top = 5
        Align = alClient
        DataSource = DmRelatorios.DSNv3Contatos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator5: TDBNavigator
        Left = 1
        Top = 139
        Width = 474
        Height = 25
        DataSource = DmRelatorios.DSNv3Contatos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 140
      end
    end
    object PnlTransp: TPanel
      AlignWithMargins = True
      Left = 486
      Top = 4
      Width = 501
      Height = 165
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      ShowCaption = False
      TabOrder = 1
      object Label5: TLabel
        Left = 9
        Top = 7
        Width = 85
        Height = 15
        Caption = 'Transportadoras'
      end
      object Bevel5: TBevel
        Left = 1
        Top = 1
        Width = 499
        Height = 26
        Align = alTop
        ExplicitLeft = 0
        ExplicitTop = -2
        ExplicitWidth = 554
      end
      object GrdTransp: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 32
        Width = 493
        Height = 104
        Margins.Top = 5
        Align = alClient
        DataSource = DmRelatorios.DSNv5Transportadora
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator6: TDBNavigator
        Left = 1
        Top = 139
        Width = 499
        Height = 25
        DataSource = DmRelatorios.DSNv5Transportadora
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alBottom
        TabOrder = 1
        ExplicitWidth = 469
      end
    end
  end
  object PnlItens: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 191
    Width = 984
    Height = 168
    Align = alTop
    ShowCaption = False
    TabOrder = 3
    ExplicitWidth = 837
    object Label6: TLabel
      Left = 9
      Top = 7
      Width = 42
      Height = 15
      Caption = 'Pedidos'
    end
    object Bevel6: TBevel
      Left = 1
      Top = 1
      Width = 982
      Height = 26
      Align = alTop
      ExplicitLeft = 7
      ExplicitTop = 4
      ExplicitWidth = 772
    end
    object GrdItens: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 32
      Width = 976
      Height = 107
      Margins.Top = 5
      Align = alClient
      DataSource = DmRelatorios.DSNv4ItensOrdem
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 142
      Width = 982
      Height = 25
      DataSource = DmRelatorios.DSNv4ItensOrdem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 88
      ExplicitTop = 160
      ExplicitWidth = 240
    end
  end
end
