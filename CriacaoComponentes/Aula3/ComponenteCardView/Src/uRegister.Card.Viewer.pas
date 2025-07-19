unit uRegister.Card.Viewer;

interface

procedure register;

implementation

uses
  System.Classes, uCard.Image.Viewer, uRegister.Editor.Menu, DesignIntf;

procedure register;
begin
  RegisterComponents('Meu Componente', [TCardImageViwer]);
  RegisterComponentEditor(TCardImageViwer, TEditorMenu);
end;

end.
