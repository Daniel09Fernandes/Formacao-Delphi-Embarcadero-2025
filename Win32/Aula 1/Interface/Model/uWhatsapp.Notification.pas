unit uWhatsapp.Notification;

interface

uses
  uNotify.Interfaces,
  VCL.Dialogs;

type
  TWhatsAppNotification = class(TInterfacedObject, INotificaion)
   private
   public
     function SendNotify(const ANotify: string): INotificaion;
     function ReciveNotify(const AReciveNotify: string): INotificaion;

     class function New: INotificaion;
  end;

implementation

{ TWhatsAppNotification }

class function TWhatsAppNotification.New: INotificaion;
begin
  Result := TWhatsAppNotification.Create;
end;

function TWhatsAppNotification.ReciveNotify(const AReciveNotify: string): INotificaion;
begin
  ShowMessage('Notificação recebida - '+ AReciveNotify);
  Result := Self;
end;

function TWhatsAppNotification.SendNotify(const ANotify: string): INotificaion;
begin
   ShowMessage('Notificação Enviada - '+ ANotify);
  Result := Self;
end;

end.
