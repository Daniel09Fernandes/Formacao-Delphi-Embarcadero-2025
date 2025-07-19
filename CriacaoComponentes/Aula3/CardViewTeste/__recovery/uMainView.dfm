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
  TextHeight = 15
  object CardImageViwer1: TCardImageViwer
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 618
    Height = 384
    Margins.Bottom = 10
    Align = alClient
    Stretch = False
    MargemHorizontal = 0
    MargemVertical = 0
    ExplicitLeft = 104
    ExplicitTop = 64
    ExplicitWidth = 345
    ExplicitHeight = 113
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 624
    Height = 44
    Align = alTop
    Alignment = taCenter
    Caption = 'Lan'#231'amentos de 2026'
    Color = 7628848
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = 40
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 304
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 544
    Top = 72
  end
end
