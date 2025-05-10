object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 8
    Width = 170
    Height = 33
    Caption = 'Classe, Instancia e Objeto'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MLog: TMemo
    Left = 0
    Top = 224
    Width = 987
    Height = 209
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 131
    Width = 979
    Height = 87
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 176
    Top = 8
    Width = 209
    Height = 33
    Caption = 'Exemplo de encapsulamento'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 391
    Top = 8
    Width = 122
    Height = 33
    Caption = 'Heran'#231'a'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 0
    Top = 56
    Width = 289
    Height = 33
    Caption = 'Heran'#231'a - Form -Cadastro de  Pessoa Fisica'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 295
    Top = 56
    Width = 122
    Height = 33
    Caption = 'Interface'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 7
    OnClick = Button6Click
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 672
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 16
  end
end
