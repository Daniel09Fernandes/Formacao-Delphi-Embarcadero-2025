unit uNotify.Controller;

interface

uses
  uNotify.Interfaces, uSms.Notification, uWhatsapp.Notification;

type
  TTypeNotify = (tnSMS, tnWhatsApp);

  TNotiFyController = class
    class function New (ATypeNotify: TTypeNotify):INotificaion;
  end;

implementation

{ TNotiFyController }

class function TNotiFyController.New(ATypeNotify: TTypeNotify): INotificaion;
begin
  case ATypeNotify of
    tnSMS: Result := TSmsNotification.New;
    tnWhatsApp: Result := TWhatsAppNotification.New;
  end;
end;

end.
