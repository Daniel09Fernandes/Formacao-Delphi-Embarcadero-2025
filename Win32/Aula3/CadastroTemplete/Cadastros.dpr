program Cadastros;

uses
  System.StartUpCopy,
  FMX.Forms,
  uView.Main in 'Main\view\uView.Main.pas' {FrMain},
  uController.Login in 'Login\controller\uController.Login.pas',
  uView.Login in 'Login\view\uView.Login.pas' {FrmLogin},
  uController.Main in 'Main\Controller\uController.Main.pas',
  uView.Base in 'FormsPadroes\uView.Base.pas' {FrmFormBase},
  uView.Dialogs in 'Dialogs\uView.Dialogs.pas' {FrDialogs},
  uHelper.Dialogs in 'Helpers\uHelper.Dialogs.pas',
  uDao.Connection in 'DAO\uDao.Connection.pas' {DmDAOConn: TDataModule},
  uModel.Login in 'Login\model\uModel.Login.pas',
  uDao.Attributes in 'DAO\RTTI\uDao.Attributes.pas',
  Dao.RTTI in 'DAO\RTTI\Dao.RTTI.pas',
  uDao.Controller in 'DAO\controller\uDao.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TDmDAOConn, DmDAOConn);
  Application.Run;
end.
