program Threads;

uses
  Vcl.Forms,
  uThread.Main in 'uThread.Main.pas' {Form1},
  Thread.Excptions in 'Thread.Excptions.pas' {Form2},
  uThread.CriticalSetion in 'uThread.CriticalSetion.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TForm1, Form1);
//  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
