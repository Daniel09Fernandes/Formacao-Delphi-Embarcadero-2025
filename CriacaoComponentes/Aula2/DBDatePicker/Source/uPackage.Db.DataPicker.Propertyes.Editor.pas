unit uPackage.Db.DataPicker.Propertyes.Editor;

interface

uses
  DesignEditors, Vcl.Dialogs, DesignIntf, uView.About;

Type
  // ... No Object Inspector
  TShowAbout = class(TStringProperty)
     function GetAttributes: TPropertyAttributes; override;
     procedure Edit; override;
  end;

  TIDEPopMenu = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;


  end;


implementation

{ TShowAbout }

procedure TShowAbout.Edit;
begin
  inherited;
  FrSobre := TFrSobre.Create(nil);
  try
    FrSobre.ShowModal;
  finally
    FrSobre.Free;
  end;
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog]
end;

{ TIDEPopMenu }

procedure TIDEPopMenu.ExecuteVerb(Index: Integer);
begin
  inherited;
  case index of
    0:
    begin
      FrSobre := TFrSobre.Create(nil);
      try
        FrSobre.ShowModal;
      finally
        FrSobre.Free;
      end;
    end;
  end;
end;

function TIDEPopMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o TDBDateTimePicker';
  end;
end;

function TIDEPopMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
