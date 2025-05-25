unit uModel.Login;

interface
{$M+}
uses
  uDao.Attributes;

Type
  TLogin = class
  private
    FId: integer;
    FUsername: string;
    FSenha: string;
  public
    [TDAOMappingTable('tab_login')]

    [TDaoMappingField('ID')]
    property Id: integer read FId write FId;
    [TDaoMappingField('Username')]
    property Username: string read FUsername write FUsername;
    [TDaoMappingField('Senha')]
    property Senha: string read FSenha write FSenha;
  end;

implementation

end.
