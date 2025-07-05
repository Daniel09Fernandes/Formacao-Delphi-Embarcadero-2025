unit SyntaxHighlighter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, StrUtils;

type
  TTokenType = (ttKeyword, ttString, ttComment, ttNumber, ttIdentifier,
    ttOperator, ttDefault);

  TDelphiSyntaxHighlighter = class
  private
    FRichEdit: TRichEdit;
    FKeywords: TStringList;
    FOperators: TStringList;

    // Cores para cada tipo de token
    FKeywordColor: TColor;
    FStringColor: TColor;
    FCommentColor: TColor;
    FNumberColor: TColor;
    FIdentifierColor: TColor;
    FOperatorColor: TColor;
    FDefaultColor: TColor;

    procedure InitializeKeywords;
    procedure InitializeOperators;
    function IsKeyword(const AToken: string): Boolean;
    function IsOperator(const AToken: string): Boolean;
    function IsNumber(const AToken: string): Boolean;
    function GetTokenType(const AToken: string; InComment: Boolean = False)
      : TTokenType;
    procedure ApplyFormatting(StartPos, Length: Integer; TokenType: TTokenType);

  public
    constructor Create(ARichEdit: TRichEdit);
    destructor Destroy; override;

    procedure HighlightSelection;
    procedure HighlightAll;
    procedure HighlightRange(StartPos, EndPos: Integer);

    // Propriedades para personalizar cores
    property KeywordColor: TColor read FKeywordColor write FKeywordColor;
    property StringColor: TColor read FStringColor write FStringColor;
    property CommentColor: TColor read FCommentColor write FCommentColor;
    property NumberColor: TColor read FNumberColor write FNumberColor;
    property IdentifierColor: TColor read FIdentifierColor
      write FIdentifierColor;
    property OperatorColor: TColor read FOperatorColor write FOperatorColor;
    property DefaultColor: TColor read FDefaultColor write FDefaultColor;
  end;

implementation

{ TDelphiSyntaxHighlighter }

constructor TDelphiSyntaxHighlighter.Create(ARichEdit: TRichEdit);
begin
  inherited Create;
  FRichEdit := ARichEdit;
  FKeywords := TStringList.Create;
  FOperators := TStringList.Create;

  // Configurar cores padrão
  FKeywordColor := clBlue;
  FStringColor := clMaroon;
  FCommentColor := clGreen;
  FNumberColor := clNavy;
  FIdentifierColor := clBlack;
  FOperatorColor := clPurple;
  FDefaultColor := clBlack;

  InitializeKeywords;
  InitializeOperators;
end;

destructor TDelphiSyntaxHighlighter.Destroy;
begin
  FKeywords.Free;
  FOperators.Free;
  inherited Destroy;
end;

procedure TDelphiSyntaxHighlighter.InitializeKeywords;
begin
  FKeywords.Clear;
  FKeywords.Sorted := True;
  FKeywords.Duplicates := dupIgnore;

  // Palavras-chave do Delphi
  FKeywords.AddStrings(['and', 'array', 'as', 'asm', 'begin', 'case', 'class',
    'const', 'constructor', 'destructor', 'div', 'do', 'downto', 'else', 'end',
    'except', 'exports', 'file', 'finalization', 'finally', 'for', 'function',
    'goto', 'if', 'implementation', 'in', 'inherited', 'initialization',
    'inline', 'interface', 'is', 'label', 'library', 'mod', 'nil', 'not',
    'object', 'of', 'on', 'or', 'out', 'packed', 'procedure', 'program',
    'property', 'raise', 'record', 'repeat', 'resourcestring', 'set', 'shl',
    'shr', 'string', 'then', 'threadvar', 'to', 'try', 'type', 'unit', 'until',
    'uses', 'var', 'while', 'with', 'xor', 'private', 'protected', 'public',
    'published', 'automated', 'read', 'write', 'default', 'nodefault', 'stored',
    'override', 'overload', 'virtual', 'dynamic', 'abstract', 'sealed',
    'static', 'reintroduce', 'forward', 'external', 'stdcall', 'cdecl',
    'pascal', 'register', 'safecall', 'winapi', 'true', 'false', 'self',
    'result', 'exit', 'break', 'continue', 'integer', 'string', 'boolean',
    'char', 'byte', 'word', 'cardinal', 'longint', 'longword', 'int64',
    'uint64', 'single', 'double', 'extended', 'currency', 'comp', 'real',
    'pointer', 'pchar', 'pansichar', 'pwidechar', 'variant', 'olevariant',
    'shortint', 'smallint', 'longbool', 'wordBool', 'byteBool', 'ansistring',
    'widestring', 'unicodestring', 'rawbytestring']);
end;

procedure TDelphiSyntaxHighlighter.InitializeOperators;
begin
  FOperators.Clear;
  FOperators.AddStrings([':=', '=', '<>', '<', '>', '<=', '>=', '+', '-', '*',
    '/', '@', '^', '.', ',', ';', ':', '(', ')', '[', ']', '{', '}', '..', '+=',
    '-=', '*=', '/=']);
end;

function TDelphiSyntaxHighlighter.IsKeyword(const AToken: string): Boolean;
begin
  Result := FKeywords.IndexOf(LowerCase(AToken)) >= 0;
end;

function TDelphiSyntaxHighlighter.IsOperator(const AToken: string): Boolean;
begin
  Result := FOperators.IndexOf(AToken) >= 0;
end;

function TDelphiSyntaxHighlighter.IsNumber(const AToken: string): Boolean;
var
  I: Integer;
  HasDot: Boolean;
begin
  Result := False;
  if AToken = '' then
    Exit;

  HasDot := False;
  for I := 1 to Length(AToken) do
  begin
    if AToken[I] = '.' then
    begin
      if HasDot then
        Exit; // Dois pontos não é válido
      HasDot := True;
    end
    else if not CharInSet(AToken[I], ['0' .. '9']) then
      Exit;
  end;

  Result := True;
end;

function TDelphiSyntaxHighlighter.GetTokenType(const AToken: string;
  InComment: Boolean): TTokenType;
begin
  if InComment then
    Result := ttComment
  else if IsKeyword(AToken) then
    Result := ttKeyword
  else if IsNumber(AToken) then
    Result := ttNumber
  else if IsOperator(AToken) then
    Result := ttOperator
  else if (Length(AToken) > 1) and (AToken[1] = '''') and
    (AToken[Length(AToken)] = '''') then
    Result := ttString
  else if (Length(AToken) > 1) and (AToken[1] = '"') and
    (AToken[Length(AToken)] = '"') then
    Result := ttString
  else
    Result := ttIdentifier;
end;

procedure TDelphiSyntaxHighlighter.ApplyFormatting(StartPos, Length: Integer;
  TokenType: TTokenType);
var
  OriginalStart, OriginalLength: Integer;
begin
  // Salvar posição original
  OriginalStart := FRichEdit.SelStart;
  OriginalLength := FRichEdit.SelLength;

  try
    // Selecionar o token
    FRichEdit.SelStart := StartPos;
    FRichEdit.SelLength := Length;

    // Aplicar formatação baseada no tipo
    case TokenType of
      ttKeyword:
        begin
          FRichEdit.SelAttributes.Color := FKeywordColor;
          FRichEdit.SelAttributes.Style := [fsBold];
        end;
      ttString:
        begin
          FRichEdit.SelAttributes.Color := FStringColor;
          FRichEdit.SelAttributes.Style := [];
        end;
      ttComment:
        begin
          FRichEdit.SelAttributes.Color := FCommentColor;
          FRichEdit.SelAttributes.Style := [fsItalic];
        end;
      ttNumber:
        begin
          FRichEdit.SelAttributes.Color := FNumberColor;
          FRichEdit.SelAttributes.Style := [];
        end;
      ttOperator:
        begin
          FRichEdit.SelAttributes.Color := FOperatorColor;
          FRichEdit.SelAttributes.Style := [fsBold];
        end;
      ttIdentifier:
        begin
          FRichEdit.SelAttributes.Color := FIdentifierColor;
          FRichEdit.SelAttributes.Style := [];
        end;
      ttDefault:
        begin
          FRichEdit.SelAttributes.Color := FDefaultColor;
          FRichEdit.SelAttributes.Style := [];
        end;
    end;

  finally
    // Restaurar seleção original
    FRichEdit.SelStart := OriginalStart;
    FRichEdit.SelLength := OriginalLength;
  end;
end;

procedure TDelphiSyntaxHighlighter.HighlightRange(StartPos, EndPos: Integer);
var
  Text: string;
  I, TokenStart, TokenEnd: Integer;
  CurrentToken: string;
  InString: Boolean;
  InComment: Boolean;
  InLineComment: Boolean;
  StringChar: Char;
begin
  if EndPos <= StartPos then
    Exit;

  // Obter o texto da faixa
  FRichEdit.SelStart := StartPos;
  FRichEdit.SelLength := EndPos - StartPos;
  Text := FRichEdit.SelText;

  I := 1;
  InString := False;
  InComment := False;
  InLineComment := False;
  StringChar := #0;

  while I <= Length(Text) do
  begin
    // Verificar comentários de linha
    if not InString and not InComment and (I < Length(Text)) and (Text[I] = '/')
      and (Text[I + 1] = '/') then
    begin
      InLineComment := True;
      TokenStart := I;
      // Encontrar o final da linha
      while (I <= Length(Text)) and (Text[I] <> #13) and (Text[I] <> #10) do
        Inc(I);
      TokenEnd := I;
      ApplyFormatting(StartPos + TokenStart - 1, TokenEnd - TokenStart,
        ttComment);
      InLineComment := False;
      Continue;
    end;

    // Verificar comentários de bloco
    if not InString and not InLineComment and (I < Length(Text)) and
      (Text[I] = '{') then
    begin
      InComment := True;
      TokenStart := I;
      Inc(I);
      // Encontrar o fechamento do comentário
      while (I <= Length(Text)) and (Text[I] <> '}') do
        Inc(I);
      if I <= Length(Text) then
        Inc(I); // Incluir o }
      TokenEnd := I;
      ApplyFormatting(StartPos + TokenStart - 1, TokenEnd - TokenStart,
        ttComment);
      InComment := False;
      Continue;
    end;

    // Verificar strings
    if not InComment and not InLineComment and CharInSet(Text[I], ['''', '"'])
    then
    begin
      if not InString then
      begin
        InString := True;
        StringChar := Text[I];
        TokenStart := I;
      end
      else if Text[I] = StringChar then
      begin
        InString := False;
        TokenEnd := I + 1;
        ApplyFormatting(StartPos + TokenStart - 1, TokenEnd - TokenStart,
          ttString);
      end;
    end;

    // Processar tokens normais
    if not InString and not InComment and not InLineComment then
    begin
      if CharInSet(Text[I], ['a' .. 'z', 'A' .. 'Z', '_', '0' .. '9']) then
      begin
        TokenStart := I;
        while (I <= Length(Text)) and
          CharInSet(Text[I], ['a' .. 'z', 'A' .. 'Z', '_', '0' .. '9']) do
          Inc(I);
        TokenEnd := I;
        CurrentToken := Copy(Text, TokenStart, TokenEnd - TokenStart);
        ApplyFormatting(StartPos + TokenStart - 1, TokenEnd - TokenStart,
          GetTokenType(CurrentToken));
        Continue;
      end
      else if CharInSet(Text[I], [':', '=', '<', '>', '+', '-', '*', '/', '@',
        '^', '.', ',', ';', '(', ')', '[', ']']) then
      begin
        TokenStart := I;
        // Verificar operadores de dois caracteres
        if (I < Length(Text)) and
          CharInSet(Text[I], [':', '<', '>', '+', '-', '*', '/']) then
        begin
          case Text[I] of
            ':':
              if Text[I + 1] = '=' then
                Inc(I);
            '<':
              if CharInSet(Text[I + 1], ['=', '>']) then
                Inc(I);
            '>':
              if Text[I + 1] = '=' then
                Inc(I);
            '+':
              if Text[I + 1] = '=' then
                Inc(I);
            '-':
              if Text[I + 1] = '=' then
                Inc(I);
            '*':
              if Text[I + 1] = '=' then
                Inc(I);
            '/':
              if Text[I + 1] = '=' then
                Inc(I);
          end;
        end;
        Inc(I);
        TokenEnd := I;
        CurrentToken := Copy(Text, TokenStart, TokenEnd - TokenStart);
        ApplyFormatting(StartPos + TokenStart - 1, TokenEnd - TokenStart,
          ttOperator);
        Continue;
      end;
    end;

    Inc(I);
  end;
end;

procedure TDelphiSyntaxHighlighter.HighlightSelection;
var
  StartPos, EndPos: Integer;
begin
  StartPos := FRichEdit.SelStart;
  EndPos := StartPos + FRichEdit.SelLength;

  if EndPos > StartPos then
    HighlightRange(StartPos, EndPos);
end;

procedure TDelphiSyntaxHighlighter.HighlightAll;
begin
  HighlightRange(0, Length(FRichEdit.Text));
end;

end.
