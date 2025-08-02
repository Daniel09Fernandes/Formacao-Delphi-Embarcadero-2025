program Relatorios;

uses
  Vcl.Forms,
  uView.Main in 'uView.Main.pas' {FrMain},
  Vcl.Themes,
  Vcl.Styles,
  Data.Relatorios in 'Data.Relatorios.pas' {DmRelatorios: TDataModule},
  uView.Relatorios.Listas in 'uView.Relatorios.Listas.pas' {FrmListas},
  uView.Main.Detalhes.Niveis in 'uView.Main.Detalhes.Niveis.pas' {FrMainDetailsNiveis: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TDmRelatorios, DmRelatorios);
  Application.Run;
end.
