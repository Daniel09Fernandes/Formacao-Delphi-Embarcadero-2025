unit uNotify.Interfaces;

interface

type
  INotificaion = interface
    ['{EE87CA6B-BB0E-4A37-8766-86EB747852FA}']

    function SendNotify(const ANotify: string): INotificaion;
    function ReciveNotify(const AReciveNotify: string): INotificaion;
  end;

  IExemplo = interface(INotificaion)
    ['{EE87CA6B-BB0E-4A37-8766-86EB747852FA}']

    function Exemplo1(const AValue: string): Double;
    function Exemplo2(const AValue: string): String;
  end;

implementation

end.
