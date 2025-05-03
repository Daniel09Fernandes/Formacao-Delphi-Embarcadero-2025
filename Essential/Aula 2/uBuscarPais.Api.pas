unit uBuscarPais.Api;

interface

uses
  REst.Client, Rest.Json, REST.Types,
  SysUtils, StrUtils, Classes,
  uBuscaPais.Model,
  uHttp.Byte;

type
  TPaisApi = class
  private const
    URL_API = 'https://restcountries.com/v3.1/alpha/';
  public
    class function BuscarPais(ASigla: string):TPais;
    class procedure PegarImagemBandeira(AUrl: string; AImgStream: TStream);
  end;

implementation

{ TPaisApi }

class function TPaisApi.BuscarPais(ASigla: string): TPais;
begin
  var lRestClient := TRESTClient.Create(URL_API + ASigla);
  var lRequest := TRESTRequest.Create(lRestClient);
  try
    lRestClient.Accept := '*/*';
    lRestClient.ContentType := 'application/json';

    lRequest.Client := lRestClient;
    lRequest.Method := rmGET;

    lRequest.Execute;

    Result := TJson.JsonToObject<TPais>('{ "Items": '+ lRequest.Response.JSONValue.ToString + '}');
  finally
    lRequest.Free;
    lRestClient.Free;
  end;
end;

class procedure TPaisApi.PegarImagemBandeira(AUrl: string; AImgStream: TStream);
begin
  THttpNet.GetBytes(AUrl, AImgStream);
end;

end.
