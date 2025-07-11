unit uMain.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Controls, Vcl.ExtCtrls, SyntaxHighlighter,
  Dinos.Bridge.GPT.Open.IA, Vcl.ComCtrls;

type
  TFrTextInteraction = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    TextMe: TRichEdit;
    Label2: TLabel;
    MmoGPT: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TextMeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FDinosGPT: TDinosChatGPT;
    FSyntaxHighlighter: TDelphiSyntaxHighlighter;
    FHistorico: string;
  public

    class procedure New(AOwner: TComponent);
    class procedure FreeMemory;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrTextInteraction: TFrTextInteraction;

implementation

{$R *.dfm}

procedure TFrTextInteraction.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrTextInteraction.Button2Click(Sender: TObject);
begin
  MmoGPT.Lines.Clear;
  FHistorico := '';
end;

procedure TFrTextInteraction.Button3Click(Sender: TObject);
begin
  TextMe.Lines.Clear;
end;

constructor TFrTextInteraction.Create(AOwner: TComponent);
begin
  inherited;
  FDinosGPT := TDinosChatGPT.Create;
  FSyntaxHighlighter := TDelphiSyntaxHighlighter.Create(MmoGPT);

  // Personalizar as cores antes de usar
  FSyntaxHighlighter.KeywordColor := clBlue; // Palavras-chave
  FSyntaxHighlighter.StringColor := clMaroon; // Strings
  FSyntaxHighlighter.CommentColor := clGreen; // Coment�rios
  FSyntaxHighlighter.NumberColor := clNavy; // N�meros
  FSyntaxHighlighter.OperatorColor := clPurple; // Operadores
  FSyntaxHighlighter.IdentifierColor := clBlack; // Identificadores
end;

destructor TFrTextInteraction.Destroy;
begin
  FreeAndNil(FDinosGPT);
  FreeAndNil(FSyntaxHighlighter);
  inherited;
end;

procedure TFrTextInteraction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

class procedure TFrTextInteraction.FreeMemory;
begin
  if Assigned(FrTextInteraction) then
    FreeAndNil(FrTextInteraction);
end;

class procedure TFrTextInteraction.New(AOwner: TComponent);
begin
  FrTextInteraction := TFrTextInteraction.Create(AOwner);
  FrTextInteraction.Parent := TWinControl(AOwner);
  FrTextInteraction.Show;
end;

procedure TFrTextInteraction.TextMeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    MmoGPT.Lines.add('');
    FHistorico := FHistorico + TextMe.Lines.text;

    MmoGPT.text := (FDinosGPT.SendMessage(FHistorico + TextMe.Lines.text));

    FSyntaxHighlighter.HighlightAll;
    TextMe.Lines.Clear;
  end;
end;

end.
