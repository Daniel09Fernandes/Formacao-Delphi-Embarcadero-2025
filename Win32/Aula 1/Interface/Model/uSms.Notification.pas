unit uSms.Notification;

interface

uses
  uNotify.Interfaces,
  Vcl.Dialogs;

type
  TSmsNotification = class(TInterfacedObject, INotificaion {, IExemplo})
    private
      class var FInstance: INotificaion;
      constructor Create;
    public
      function SendNotify(const ANotify: string): INotificaion;
      function ReciveNotify(const AReciveNotify: string): INotificaion;

      class function New: INotificaion;
  end;

implementation

{ tSmsNotification }

constructor TSmsNotification.Create;
begin

end;

class function TSmsNotification.New: INotificaion;
begin
  if not Assigned(FInstance) then
    FInstance := TSmsNotification.Create;

  Result := FInstance;
end;

function TSmsNotification.ReciveNotify(const AReciveNotify: string): INotificaion;
begin
  ShowMessage('Notificação recebida - '+ AReciveNotify);
  Result := Self;
end;

function TSmsNotification.SendNotify(const ANotify: string): INotificaion;
begin
  ShowMessage('Notificação Enviada - '+ ANotify);
  Result := Self;
end;

end.
