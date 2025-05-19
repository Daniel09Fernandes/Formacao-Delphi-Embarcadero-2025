object FdCadPadrao: TFdCadPadrao
  Left = 0
  Top = 0
  Caption = 'FdCadPadrao'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    Color = 2562860
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = 3
    ExplicitWidth = 618
    ExplicitHeight = 62
    DesignSize = (
      624
      441)
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 392
      Width = 616
      Height = 45
      Align = alBottom
      Color = 13245642
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 383
      object Button1: TButton
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Tag = 1
        Left = 172
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Tag = 1
        Left = 253
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 528
        Top = 8
        Width = 37
        Height = 25
        Caption = '<'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 571
        Top = 8
        Width = 38
        Height = 25
        Caption = '>'
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object Panel3: TPanel
      Left = 12
      Top = 47
      Width = 599
      Height = 330
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 591
        Height = 155
        Margins.Top = 5
        Align = alTop
        Color = 15193063
        ParentBackground = False
        TabOrder = 0
      end
      object DbRegistro: TDBGrid
        Left = 1
        Top = 164
        Width = 597
        Height = 165
        Align = alClient
        DataSource = DsRegistro
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 616
      Height = 37
      Align = alTop
      Color = 13245642
      ParentBackground = False
      TabOrder = 2
      object SkLabel1: TSkLabel
        Left = 8
        Top = 2
        Width = 35
        Height = 19
        TextSettings.FontColor = claWhite
        Words = <
          item
            Caption = 'Titulo'
          end>
      end
    end
  end
  object DsRegistro: TDataSource
    DataSet = MemRegistro
    Left = 360
    Top = 189
  end
  object MemRegistro: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 192
  end
end
