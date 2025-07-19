unit uView.Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrAbout = class(TForm)
    Panel1: TPanel;
    RichEdit1: TRichEdit;
  private
    { Private declarations }
  public
   class procedure ShowForm;
  end;

var
  FrAbout: TFrAbout;

implementation

{$R *.dfm}

{ TForm2 }

class procedure TFrAbout.ShowForm;
begin
  var lfrm := TFrAbout.Create(nil);
  lfrm.ShowModal;
  lfrm.free;
end;

end.
