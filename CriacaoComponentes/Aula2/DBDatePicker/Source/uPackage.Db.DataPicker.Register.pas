unit uPackage.Db.DataPicker.Register;

interface

procedure register;

implementation

uses
  Classes, uPackage.Db.DataPicker, uPackage.Db.DataPicker.Propertyes.Editor,
  DesignIntf;

procedure register;
begin
  RegisterComponents('Meu Componente', [TDBDateTimePicker]);
  RegisterPropertyEditor(TypeInfo(string), TDBDateTimePicker, 'Sobre', TShowAbout);
  RegisterComponentEditor(TDBDateTimePicker, TIDEPopMenu);
end;

end.
