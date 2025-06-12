object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 289
    Top = 41
    Height = 400
    ExplicitLeft = 296
    ExplicitTop = 120
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitTop = -5
    object Button1: TButton
      Left = 487
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Opera'#231#227'o'
      TabOrder = 0
      OnClick = Button1Click
    end
    object NumberBox1: TNumberBox
      Left = 344
      Top = 13
      Width = 57
      Height = 23
      TabOrder = 1
    end
    object NumberBox2: TNumberBox
      Left = 421
      Top = 13
      Width = 57
      Height = 23
      TabOrder = 2
    end
    object Button2: TButton
      Left = 13
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Exec'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 289
    Height = 400
    Align = alLeft
    TabOrder = 1
    object Gauge1: TGauge
      Left = 1
      Top = 257
      Width = 287
      Height = 64
      Align = alTop
      Color = clLime
      ForeColor = 56576
      ParentColor = False
      Progress = 0
      ExplicitTop = 1
    end
    object Gauge2: TGauge
      Left = 1
      Top = 193
      Width = 287
      Height = 64
      Align = alTop
      Color = clLime
      ForeColor = 56576
      ParentColor = False
      Progress = 0
      ExplicitLeft = 2
      ExplicitTop = 9
    end
    object Gauge3: TGauge
      Left = 1
      Top = 129
      Width = 287
      Height = 64
      Align = alTop
      Color = clLime
      ForeColor = 56576
      ParentColor = False
      Progress = 0
      ExplicitLeft = 2
      ExplicitTop = 9
    end
    object Gauge4: TGauge
      Left = 1
      Top = 65
      Width = 287
      Height = 64
      Align = alTop
      Color = clLime
      ForeColor = 56576
      ParentColor = False
      Progress = 0
      ExplicitLeft = 2
      ExplicitTop = 9
    end
    object Gauge5: TGauge
      Left = 1
      Top = 1
      Width = 287
      Height = 64
      Align = alTop
      Color = clLime
      ForeColor = 56576
      ParentColor = False
      Progress = 0
      ExplicitLeft = 2
      ExplicitTop = 9
    end
  end
  object Panel3: TPanel
    Left = 292
    Top = 41
    Width = 332
    Height = 400
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitWidth = 249
    object mmo: TMemo
      Left = 1
      Top = 1
      Width = 330
      Height = 398
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 72
      ExplicitTop = 48
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
end
