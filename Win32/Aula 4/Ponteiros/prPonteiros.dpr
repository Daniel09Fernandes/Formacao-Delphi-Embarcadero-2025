program prPonteiros;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  uParams in 'uParams.pas';

function GerarRec: TMeuRec;
begin
  Result.ID := 999;
end;

begin
  try
    var
    obj := TMeuObj.Create; // Heap
    try
      if obj.ID > 1000 then
        Writeln('Maior do que Mil');
    finally
      obj.Free;
    end;

    var
      mr: TMeuRec; // Stak
    if mr.ID > 1000 then
      Writeln('Maior do que Mil');

    var
      num: Integer;
    var
      b: Byte;
    var
      c: Cardinal;
    var
      Bool: Boolean;
    var
      str: string;
    var
      ch: char; // CHar é um tipo texto que aceita apenas um caracter
    var
      Fl: Double;
    var
      dt: TDateTime;
    var
      sVariant: Variant;
    var
      p: Pointer;
    var
      meuObj: TMeuObj;
      // sVariant := '    ';
      // sVariant := 0;
      // sVariant := 0.0;
      // sVariant := True;
      // sVariant := Now;

      // str := '123';
      //
      // for var I := 0  to Length(str) do
      // begin
      // var lChar: Char;
      // lChar := str[i];
      // end;

      // $1234 ----->  //$4321
      // meuObj := obj; //Ponteiro de memoria implicito
      //
      // var lREc: TMeuRec;
      //
      // var pRec: pMeuRec; // Ponteiro Explicito
      // var PointerRec := @GerarRec; // Ponteiro Implicito
      // TMeuRec(PointerRec).ID := 0;
      //
      // p := TMeuObj($00000000);
      //
      // p := @meuObj;
      // TMeuObj(p).ID := 11;

//    var
//      pRec: pMeuRec;
//    Writeln('pRec: ' + format('$%p ', [pRec]));
//
//    pRec := @mr;
//    Writeln('pRec: ' + format('$%p ', [pRec]));
//
//    New(pRec);
//    Writeln('pRec: ' + format('$%p ', [pRec]));
//    Dispose(pRec);

    num := 123;
    b := 0;
    c := 1;
    Bool := True;
    str := 'ola mundo';
    ch := 'C'; // CHar é um tipo texto que aceita apenas um caracter
    Fl := 12.2;
    dt := Now;
    sVariant := 0;
    p := @mr;
    meuObj := obj;


    Writeln('Valores Antes do metodo: ');
    Writeln(format('  $%p  pNum: %d      ', [@num, num]));
    Writeln(format('  $%p  pByte: %s     ', [@b, b.ToString]));
    Writeln(format('  $%p  pCardinal: %u ', [@c, c]));
    Writeln(format('  $%p  pBool: %s     ', [@Bool, Bool.ToString]));
    Writeln(format('  $%p  pStr: %s      ', [@str, str]));
    Writeln(format('  $%p  pCh: %s       ', [@ch, ch]));
    Writeln(format('  $%p  pFloat: %n    ', [@Fl, Fl]));
    Writeln(format('  $%p  pDt: %n       ', [@dt, dt]));
    Writeln(format('  $%p  sVariant: %s  ', [@sVariant, sVariant]));
    Writeln(format('  $%p  pPointer: %p  ', [@p, p]));
    Writeln(format('  $%p  pObject: %d   ', [@meuObj, meuObj.ID]));
    Writeln('');

//    TParametros.ExecutarAlgo(num, b, c, Bool, str, ch, Fl, dt, sVariant,
//      p, meuObj);

    TParametros.ExecutarAlgoOut(num, b, c, Bool, str, ch, Fl, dt, sVariant,
      p, meuObj);

    Writeln('');
    Writeln('Valores fora do metodo(Depois de executar): ');
    Writeln(format('  $%p  pNum: %d      ', [@num, num]));
    Writeln(format('  $%p  pByte: %s     ', [@b, b.ToString]));
    Writeln(format('  $%p  pCardinal: %u ', [@c, c]));
    Writeln(format('  $%p  pBool: %s     ', [@Bool, Bool.ToString]));
    Writeln(format('  $%p  pStr: %s      ', [@str, str]));
    Writeln(format('  $%p  pCh: %s       ', [@ch, ch]));
    Writeln(format('  $%p  pFloat: %n    ', [@Fl, Fl]));
    Writeln(format('  $%p  pDt: %n       ', [@dt, dt]));
    Writeln(format('  $%p  sVariant: %s  ', [@sVariant, sVariant]));
    Writeln(format('  $%p  pPointer: %p  ', [@p, p]));
    Writeln(format('  $%p  pObject: %d   ', [@meuObj, meuObj.ID]));

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
