unit uWizardMenu;

interface

uses
  VCL.Menus, ToolsAPI, uMain.View;

type
  TOTAMenuWizar = class(TNotifierObject, IOTAWizard)
  published
  private
   FMenuItem: TMenuItem;
   FMenuTextInteraction: TMenuItem;
   procedure OnMenuItemClick(Sender: TObject);
    procedure AttachFormToIDE;
  public
    constructor Create;
    destructor Destroy; override;

    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
  end;

implementation

{ TOTAMenuWizar }

uses
  SysUtils, VCL.Dialogs, Vcl.Forms;

constructor TOTAMenuWizar.Create;
const
  MENU_PERSONALIZADO = 'DinosTools';
var
  MenuDelphi: TMainMenu;
  ToolsMenuDelphi: TMenuItem;
  IndexMenuPersonalizado: Integer;
begin
  inherited Create;

  MenuDelphi := (BorlandIDEServices as INTAServices).MainMenu;

  if not Assigned(MenuDelphi) then
    Exit;
//
  FMenuItem := TMenuItem.Create(nil);
  IndexMenuPersonalizado := -1;

  if Assigned(MenuDelphi.Items.Find(MENU_PERSONALIZADO)) then
    IndexMenuPersonalizado := MenuDelphi.Items.Find(MENU_PERSONALIZADO).MenuIndex;

  if IndexMenuPersonalizado < 0 then // Adiciona o novo menu, no menu principal
  begin
    FMenuItem.Caption := MENU_PERSONALIZADO;
//    FMenuItem.OnClick := OnMenuItemClick;
    MenuDelphi.Items.Add(FMenuItem);
   //MenuDelphi.Items.Delete(IndexMenuPersonalizado);
  end;

  ToolsMenuDelphi := MenuDelphi.Items.Find(MENU_PERSONALIZADO);

  if Assigned(ToolsMenuDelphi) then
  begin
    FMenuTextInteraction := TMenuItem.Create(nil);
    FMenuTextInteraction.Caption := 'Text Me';
    FMenuTextInteraction.OnClick := OnMenuItemClick;
    ToolsMenuDelphi.Add(FMenuTextInteraction);
  end;
end;

destructor TOTAMenuWizar.Destroy;
begin
  FreeAndNil(FMenuTextInteraction);
  FreeAndNil(FMenuItem);
  TFrTextInteraction.FreeMemory;
  inherited Destroy;
end;

procedure TOTAMenuWizar.Execute;
begin
   //ShowMessage('Olá Mundo');
   TFrTextInteraction.New(Nil);
end;

function TOTAMenuWizar.GetIDString: string;
begin
  Result := 'Aquasoft.WizardMenu';
end;

function TOTAMenuWizar.GetName: string;
begin
   Result := 'OTA Menu Wizard';
end;

function TOTAMenuWizar.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TOTAMenuWizar.OnMenuItemClick(Sender: TObject);
begin
  Execute;
end;

procedure TOTAMenuWizar.AttachFormToIDE;
var
  NTAServices: INTAServices;
  Module: IOTAModule;
  FormEditor: IOTAFormEditor;
begin
//  NTAServices := BorlandIDEServices as INTAServices;
//  if Assigned(NTAServices) then
//  begin
//    Module := (BorlandIDEServices as IOTAModuleServices)
//	                  .CreateModule(nil, 'Form1', 'Form', 0);
//    if Assigned(Module) then
//    begin
//      FormEditor := (BorlandIDEServices as IOTAFormEditor)
//	                         .GetFormEditorForModule(Module, False);
//      if Assigned(FormEditor) then
//      begin
//        (BorlandIDEServices as IOTAFormEditor).ShowFormEditor(FormEditor);
//      end;
//    end;
//  end;
end;

initialization
  RegisterPackageWizard(TOTAMenuWizar.Create);

end.
