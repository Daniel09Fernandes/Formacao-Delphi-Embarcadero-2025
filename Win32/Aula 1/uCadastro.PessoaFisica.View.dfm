inherited FrPessoaFisica: TFrPessoaFisica
  Caption = 'FrPessoaFisica'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Panel1: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Panel3: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Panel5: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 5
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 33
          Height = 15
          Caption = 'Nome'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 21
          Height = 15
          Caption = 'CPF'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 8
          Top = 96
          Width = 49
          Height = 15
          Caption = 'Endereco'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 16
          Width = 500
          Height = 23
          DataField = 'Nome'
          DataSource = DsRegistro
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 64
          Width = 304
          Height = 23
          DataField = 'CPF'
          DataSource = DsRegistro
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 112
          Width = 304
          Height = 23
          DataField = 'Endereco'
          DataSource = DsRegistro
          TabOrder = 2
        end
      end
      inherited DbRegistro: TDBGrid
        DataSource = DsRegistro
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 193
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Endereco'
            Title.Caption = 'Endere'#231'o'
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 184
            Visible = True
          end>
      end
    end
    inherited Panel4: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited MemRegistro: TFDMemTable
    object MemRegistroNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object MemRegistroCPF: TStringField
      FieldName = 'CPF'
    end
    object MemRegistroEndereco: TStringField
      FieldName = 'Endereco'
    end
  end
end
