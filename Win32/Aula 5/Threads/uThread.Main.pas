unit uThread.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.NumberBox, Vcl.Samples.Gauges;

type
  TOperacao = reference to function( A, B: Double): Double;

  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    mmo: TMemo;
    Button1: TButton;
    NumberBox1: TNumberBox;
    NumberBox2: TNumberBox;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    var
     FProc: TProc;
    procedure ExecutarAlgoComoParametro(AProc: TProc);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  function ExecutarOpercacao(X, Y: Double; AFunc: TOperacao): Double;
  begin
    Result :=  AFunc(X, Y);
  end;
begin
//  FProc;
  var Num1: Double := NumberBox1.Value;
  var Num2: Double := NumberBox2.Value;
  mmo.Lines.Clear;
  var Retorno :Double := 0;

  Retorno := ExecutarOpercacao(Num1, Num2,
                                           function (X, Y: Double): Double
                                           begin
                                             Result := X + Y;
                                           end);

  mmo.Lines.Add(' A Adição é: '+ Retorno.ToString);

  Retorno := ExecutarOpercacao(Num1, Num2,
                                           function (X, Y: Double): Double
                                           begin
                                             Result := X * Y;
                                           end);

  mmo.Lines.Add(' A Multiplicação é: '+ Retorno.ToString);

  Retorno := ExecutarOpercacao(Num1, Num2,
                                           function (X, Y: Double): Double
                                           begin
                                             Result := X / Y;
                                           end);

  mmo.Lines.Add(' A Divisão é: '+ Retorno.ToString);

  Retorno := ExecutarOpercacao(Num1, Num2,
                                           function (X, Y: Double): Double
                                           begin
                                             Result := X - Y;
                                           end);

  mmo.Lines.Add(' A Subtração é: '+ Retorno.ToString);
end;

procedure TForm1.ExecutarAlgoComoParametro(AProc: TProc);
begin
  AProc;
end;

procedure TForm1.Button2Click(Sender: TObject);
const
  VAL_MAX = 500;

function GetProc(AGauge: TGauge; AProc: TProc): TProc;
begin
  AGauge.MaxValue := VAL_MAX;
  Result :=
    procedure
    begin
      for var I := 0 to VAL_MAX do
      begin
        ExecutarAlgoComoParametro(AProc);
        TThread.Synchronize(nil ,
        procedure
        begin
          AGauge.Progress := i;
        end)
      end;
    end
end;

var
  proc: TProc;
begin
  proc := procedure
         begin
           Sleep(100);
         end;

  TThread.CreateAnonymousThread(GetProc(Gauge1, proc)).Start;
  TThread.CreateAnonymousThread(GetProc(Gauge2, proc)).Start;
  TThread.CreateAnonymousThread(GetProc(Gauge3, proc)).Start;
  TThread.CreateAnonymousThread(GetProc(Gauge4, proc)).Start;
  TThread.CreateAnonymousThread(GetProc(Gauge5, proc)).Start;

//  TThread.NameThreadForDebugging('Gauge Threads');
//  TThread.CreateAnonymousThread(
//   procedure
//   begin
//     for var I := 0 to VAL_MAX do
//     begin
//       TThread.Synchronize(nil,
//       procedure
//       begin
//         Gauge1.Progress := i;
//         ExecutarAlgoComoParametro(proc);
//       end);
//     end;
//   end).Start;
//
//  var ProcThread : TProc :=
//  procedure
//  begin
//     for var I := 0 to VAL_MAX do
//     begin
//       TThread.Synchronize(nil,
//       procedure
//       begin
//         Gauge2.Progress := i;
//         ExecutarAlgoComoParametro(proc);
//       end);
//     end;
//  end;
//  TThread.CreateAnonymousThread(ProcThread).Start;
//
//
//  TThread.CreateAnonymousThread(
//   procedure
//   begin
//     for var I := 0 to VAL_MAX do
//     begin
//       TThread.Synchronize(nil,
//       procedure
//       begin
//         Gauge3.Progress := i;
//         ExecutarAlgoComoParametro(proc);
//       end);
//     end;
//   end).Start;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 FProc := procedure
            begin
              ShowMessage('Ola mundo');
            end;
end;

end.
