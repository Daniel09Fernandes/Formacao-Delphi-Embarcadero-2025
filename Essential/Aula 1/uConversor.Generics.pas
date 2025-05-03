unit uConversor.Generics;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Rtti,
  uConversor;

type
  TConversorMoedaGenerico<T> = class
  private
    function GetType(AValue: T): TTypeKind;
    function ParsTToString(AValue: T): string;
    function ParsTToDouble(AValue: T): Double;

  public
    function ConverterDolarParaReal(ADolar: T): T;
    function ConverterRealParaDolar(AReal: T): T;
  end;

implementation


{ TConversorMoedaGenerico<T> }

function TConversorMoedaGenerico<T>.ConverterDolarParaReal(ADolar: T): T;
begin
  var lConversor := TConversorMoedas.Create;
  try
    if GetType(ADolar) = tkUString  then
    begin
      Result := TValue.From<string>(
                  lConversor.ConverterDolarParaReal(ParsTToString(ADolar)
                  ).ToString).AsType<T>;
    end
    else
    if GetType(ADolar) = tkFloat  then
    begin
      Result := TValue.From<Double>(
                  lConversor.ConverterDolarParaReal(ParsTToDouble(ADolar)
                  )).AsType<T>;
    end
    else
      raise Exception.Create('Tipo nao implementado!');
  finally
    lConversor.Free;
  end;
end;

function TConversorMoedaGenerico<T>.ParsTToString(AValue: T): string;
begin
  Result := TValue.From<T>(AValue).AsType<string>;
end;

function TConversorMoedaGenerico<T>.ParsTToDouble(AValue: T): Double;
begin
  Result := TValue.From<T>(AValue).AsType<Double>;
end;

function TConversorMoedaGenerico<T>.GetType(AValue: T): TTypeKind;
begin
  Result := GetTypeKind(AValue);
end;

function TConversorMoedaGenerico<T>.ConverterRealParaDolar(AReal: T): T;
begin
  var lConversor := TConversorMoedas.Create;
  try
    if GetType(AReal) = tkUString  then
    begin
      Result := TValue.From<string>(
                  lConversor.ConverterRealParaDolar(ParsTToString(AReal)
                  ).ToString).AsType<T>;
    end
    else
    if GetType(AReal) = tkFloat  then
    begin
      Result := TValue.From<Double>(
                  lConversor.ConverterRealParaDolar(ParsTToDouble(AReal)
                  )).AsType<T>;
    end
    else
      raise Exception.Create('Tipo nao implementado!');
  finally
    lConversor.Free;
  end;
end;

end.
