unit uTema.Controle;

interface

uses
  SysUtils, IniFiles, vcl.Forms;

type
  TTemaApp = class
  private const
    FILE_THEMA = 'TemaPadrao.ini';
    SECTION = 'TEMA';
    IDENT = 'padrao';
  public
    class procedure GravarTemaPadrao(AValue: string);
    class function BuscarTemaPadrao: string;
  end;

implementation

{ TTemaApp }

class function TTemaApp.BuscarTemaPadrao: string;
begin
  var
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + FILE_THEMA);
  try
    Result := Ini.ReadString(SECTION, IDENT, 'Obsidian');
  finally
    Ini.Free;
  end;
end;

class procedure TTemaApp.GravarTemaPadrao(AValue: string);
begin
  var
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + FILE_THEMA);
  try
    Ini.WriteString(SECTION, IDENT, AValue);
  finally
    Ini.Free;
  end;
end;

end.
