inherited FrPessoaJuridica: TFrPessoaJuridica
  Caption = 'FrPessoaJuridica'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
    inherited Panel1: TPanel
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 392
    end
    inherited Panel3: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Panel5: TPanel
        StyleElements = [seFont, seClient, seBorder]
        object Label1: TLabel
          Left = 5
          Top = 5
          Width = 33
          Height = 15
          Caption = 'Nome'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 5
          Top = 58
          Width = 27
          Height = 15
          Caption = 'CNPJ'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 5
          Top = 106
          Width = 49
          Height = 15
          Caption = 'Endereco'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 5
          Top = 26
          Width = 500
          Height = 23
          DataField = 'Nome'
          DataSource = DsRegistro
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 5
          Top = 74
          Width = 304
          Height = 23
          DataField = 'CNPJ'
          DataSource = DsRegistro
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 5
          Top = 122
          Width = 304
          Height = 23
          DataField = 'Endereco'
          DataSource = DsRegistro
          TabOrder = 2
        end
      end
    end
    inherited Panel4: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited MemRegistro: TFDMemTable
    object MemRegistroNome: TStringField
      FieldName = 'Nome'
      Size = 80
    end
    object MemRegistroCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object MemRegistroEndereco: TStringField
      FieldName = 'Endereco'
    end
  end
end
