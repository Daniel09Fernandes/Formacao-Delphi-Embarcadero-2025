unit uView.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, frxClass,
  frxExportBaseDialog, frxExportImage, uView.Main.Detalhes.Niveis;

type
  TFrMain = class(TForm)
    SV: TSplitView;
    ImagePreview: TImage;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActAbrirRelatorioSimples: TAction;
    frxPNGExport1: TfrxPNGExport;
    ActPreview: TAction;
    ActAbrirFormListas: TAction;
    FrMainDetailsNiveis1: TFrMainDetailsNiveis;
    procedure ActAbrirRelatorioSimplesExecute(Sender: TObject);
    procedure ActPreviewExecute(Sender: TObject);
    procedure ActAbrirFormListasExecute(Sender: TObject);
    procedure CategoryButtons1SelectedItemChange(Sender: TObject; const Button: TButtonItem);
    procedure CategoryButtons1Categories0Items3Click(Sender: TObject);
  private
    procedure SetCapaRelatorioImg(AReport: TfrxReport);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;

implementation

{$R *.dfm}
uses
   Data.Relatorios, uView.Relatorios.Listas;

procedure TFrMain.ActAbrirFormListasExecute(Sender: TObject);
begin
  var lView := TFrmListas.Create(self);
  try
    lView.ShowModal;
  finally
    lView.Free;
  end;
end;

procedure TFrMain.ActAbrirRelatorioSimplesExecute(Sender: TObject);
begin
  DmRelatorios.frxReportPrimeiroRelatorio.ShowReport();
end;

procedure TFrMain.ActPreviewExecute(Sender: TObject);
begin
  SetCapaRelatorioImg(DmRelatorios.frxReportPrimeiroRelatorio);
end;

procedure TFrMain.CategoryButtons1Categories0Items3Click(Sender: TObject);
begin
  FrMainDetailsNiveis1.Visible := not FrMainDetailsNiveis1.Visible;
end;

procedure TFrMain.CategoryButtons1SelectedItemChange(Sender: TObject; const Button: TButtonItem);
  const
  FIRST_REPORT = 0;
  LIST_REPO = 2;
begin
  var lIndex := Button.Index;

  case lIndex of
    FIRST_REPORT: SetCapaRelatorioImg(DmRelatorios.frxReportPrimeiroRelatorio);
    LIST_REPO:  SetCapaRelatorioImg(DmRelatorios.frxReportListaSimplesCountrys);
  end;
end;

procedure TFrMain.SetCapaRelatorioImg(AReport: TfrxReport);
begin
  AReport.PrepareReport();

  frxPNGExport1.Monochrome := False;
  frxPNGExport1.CropImages := False;
  frxPNGExport1.Resolution := 96;
  frxPNGExport1.OpenAfterExport := False;
  frxPNGExport1.ShowProgress := False;
  frxPNGExport1.ShowDialog := False;
  frxPNGExport1.PageNumbers := '1';

  var lPath := GetCurrentDir()+ '\Preview\'+
   AReport.Name+'.png';

  frxPNGExport1.FileName := lPath;

  AReport.Export(frxPNGExport1);

  lPath := ExtractFilePath(lPath) +
    AReport.Name+'.1.png'; // Ponto 1 incluido pelo proprio fast

  ImagePreview.Picture.LoadFromFile(lPath);
end;


end.
