unit ServerMethodsFiles;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, 
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, System.SyncObjs, System.Generics.Collections;

type
  TSMFiles = class(TDSServerModule)
  private
    { Private declarations }
    class var
      FCriticalSection: TCriticalSection;
      FListaImagens: TObjectDictionary<string, TStream>;
  public
    { Public declarations }
    class constructor Create;
    class destructor Destroy;

    class function GetListaImagens: TDictionary<string, TStream>;
    class procedure AddImagemLista(arq: string; stm: TStream);

    function GetFile(arq: string; out Size: Cardinal): TStream;
    function SetFile(arq: string; arquivo: TStream): Int64;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMFiles }

class procedure TSMFiles.AddImagemLista(arq: string; stm: TStream);
begin
  FCriticalSection.Enter;
  try
    GetListaImagens.Add(arq,stm);
  finally
    FCriticalSection.Leave;
  end;
end;

class constructor TSMFiles.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

class destructor TSMFiles.Destroy;
begin
  FCriticalSection.Free;
end;

function TSMFiles.GetFile(arq: string; out Size: Cardinal): TStream;
begin
  Result := nil;

  var sl: TStringList;

  if arq = 'ARQUIVO_TESTE' then
  begin
    if not GetListaImagens.ContainsKey(arq) then
    begin
      var stm: TStringStream := TStringStream.Create;
      (stm as TStringStream).LoadFromFile('Breaking_Bad_logo.svg.png');

      AddImagemLista(arq, stm);
    end;

    Result := TStringStream.Create;
    Result.CopyFrom(GetListaImagens[arq]);
    Size := Result.Size;

  end
  else
  begin
    Size := 0;
  end;
end;

class function TSMFiles.GetListaImagens: TDictionary<string, TStream>;
begin
  if not(Assigned(FListaImagens)) then
  begin
    FListaImagens := TObjectDictionary<string, TStream>.Create([doOwnsValues]);
  end;

  Result := FListaImagens;
end;

function TSMFiles.SetFile(arq: string; arquivo: TStream): Int64;
begin
  Result := 0;

  if arq = 'ARQUIVO_TESTE' then
  begin
    var strStm: TStringStream := TStringStream.Create;
    strStm.LoadFromStream(arquivo);
    Result := strStm.Size;

    if Result > 0 then
    begin
      strStm.SaveToFile('IMG_'+TThread.GetTickCount.ToString+'.png');
    end;
    strStm.Free;
  end;
end;

end.

