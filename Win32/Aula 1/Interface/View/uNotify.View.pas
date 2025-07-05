unit uNotify.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uNotify.Controller,
  uNotify.Interfaces;

type
  TFormHelper = class helper for TForm
    function GetNotification: INotificaion;
  end;


  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
     INotify: INotificaion;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  //INotify := TNotiFyController.New(tnSMS);
  TNotiFyController
     .New(tnSMS)
       .SendNotify('Estou enviando esse SMS pra voce!')
       .ReciveNotify('SMS Recebido');

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  INotify := TNotiFyController.New(tnWhatsApp);

  INotify
     .SendNotify('Estou enviando esse WhatsApp pra voce!')
     .ReciveNotify('WhatsApp Recebido');
end;

{ TFormHelper }

function TFormHelper.GetNotification: INotificaion;
begin
  Result := TNotiFyController
              .New(tnSMS)
                 .SendNotify('Estou enviando esse SMS pra voce!')
                 .ReciveNotify('SMS Recebido');
end;

end.
