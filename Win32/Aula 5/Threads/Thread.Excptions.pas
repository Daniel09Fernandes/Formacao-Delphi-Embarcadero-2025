unit Thread.Excptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Generics.Collections;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
   FListaErroThread: TDictionary<string, integer>;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  var str := 'R';
  try
    StrToInt(str);
  Except
    on E: Exception do
    begin
      Memo1.Lines.add('Erro tratado: '+ E.Message);
    end;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  for var I := 0 to 10 do
  begin
   TThread.CreateAnonymousThread(
     procedure
     begin
       TThread.NameThreadForDebugging('Except thread');
       try

        var ALetras := ['A', 'H', 'D', 'E', 'R'];
        VAR Erro :=  ALetras[Random(5)]+
                     ALetras[Random(5)]+
                     ALetras[Random(5)]+
                     ALetras[Random(5)];

         raise Exception.Create(Erro);
       Except
         on E:Exception do
         begin
           TThread.Synchronize(nil,
           procedure
           begin
             if FListaErroThread.ContainsKey(E.Message) then
               FListaErroThread[E.Message] := FListaErroThread[E.Message] + 1
             else
               FListaErroThread.Add(E.Message, 1);
           end);
         end;
       end;
     end
   ).Start;

  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FListaErroThread := TDictionary<string, integer>.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaErroThread);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if Memo1.Lines.Count <> FListaErroThread.Count then
  begin
    Memo1.Lines.Clear;

    for Var lPair in FListaErroThread do
      Memo1.Lines.Add('Erro: '+ lPair.Key + ' -- N: ' +lPair.Value.ToString);
  end;
end;

end.
