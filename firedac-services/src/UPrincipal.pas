unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Def, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBWrapper, FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Intf, FireDAC.Phys.Oracle;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    FDFBNBackup1: TFDFBNBackup;
    FDFBOnlineValidate1: TFDFBOnlineValidate;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Panel1: TPanel;
    Memo1: TMemo;
    BtnRestore: TSpeedButton;
    BtnBackup: TSpeedButton;
    BtnValidate: TSpeedButton;
    SaveDialog1: TSaveDialog;
    FDFBNRestore1: TFDFBNRestore;
    procedure BtnBackupClick(Sender: TObject);
    procedure BtnRestoreClick(Sender: TObject);
    procedure BtnValidateClick(Sender: TObject);
    procedure FDFBNBackup1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDFBNBackup1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FDFBOnlineValidate1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDFBOnlineValidate1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FDFBNBackup1BeforeExecute(Sender: TObject);
    procedure FDFBNBackup1AfterExecute(Sender: TObject);
    procedure FDFBOnlineValidate1AfterExecute(Sender: TObject);
    procedure FDFBOnlineValidate1BeforeExecute(Sender: TObject);
    procedure FDFBNRestore1AfterExecute(Sender: TObject);
    procedure FDFBNRestore1BeforeExecute(Sender: TObject);
    procedure FDFBNRestore1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDFBNRestore1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFBConnection, UConfig, System.Zip;

{$R *.dfm}

procedure TFrmPrincipal.BtnBackupClick(Sender: TObject);
//var
//  ZipF: TZipFile;
begin
  Memo1.Clear;

  SaveDialog1.DefaultExt := '*.fbk';
  SaveDialog1.FileName   := 'backup_dados';
  SaveDialog1.Filter     := 'Arquivos de backup banco de dados Firebird|*.fbk';

  if SaveDialog1.Execute then
  begin
    FDFBNBackup1.Host     := 'localhost';
    FDFBNBackup1.Protocol := ipLocal;
    FDFBNBackup1.Database := ConfigDemo.FBServer.Caminho;
    FDFBNBackup1.Port     := ConfigDemo.FBServer.Porta.ToInteger;
    FDFBNBackup1.UserName := ConfigDemo.FBServer.Usuario;
    FDFBNBackup1.Password := ConfigDemo.FBServer.Senha;

    FDFBNBackup1.BackupFile := SaveDialog1.FileName;
    FDFBNBackup1.Backup;

//    ZipF := TZipFile.Create;
//    try
//      ZipF.Open('c:\teste\meuarquivo.zip', zmWrite);
//      ZipF.Add(FDFBNBackup1.BackupFile);
//    finally
//      ZipF.DisposeOf;
//    end;
  end;
end;

procedure TFrmPrincipal.BtnRestoreClick(Sender: TObject);
begin
  Memo1.Clear;

  SaveDialog1.DefaultExt := '*.fdb';
  SaveDialog1.FileName   := 'backup_dados';
  SaveDialog1.Filter     := 'Arquivos de banco de dados Firebird|*.fdb';

  OpenDialog1.DefaultExt := '*.fbk';
  OpenDialog1.FileName   := 'banco_dados';
  OpenDialog1.Filter     := 'Arquivos de backup de banco de dados Firebird|*.fbk';

  if OpenDialog1.Execute and SaveDialog1.Execute then
  begin
    FDFBNRestore1.Host     := 'localhost';
    FDFBNRestore1.Protocol := ipLocal;
    FDFBNRestore1.Port     := ConfigDemo.FBServer.Porta.ToInteger;
    FDFBNRestore1.UserName := ConfigDemo.FBServer.Usuario;
    FDFBNRestore1.Password := ConfigDemo.FBServer.Senha;

    FDFBNRestore1.BackupFiles.Add(OpenDialog1.FileName);
    FDFBNRestore1.Database := SaveDialog1.FileName;

    FDFBNRestore1.Restore;
  end;
end;

procedure TFrmPrincipal.BtnValidateClick(Sender: TObject);
begin
  Memo1.Clear;

  FDFBOnlineValidate1.Host       := ConfigDemo.FBServer.Servidor;
  FDFBOnlineValidate1.Port       := ConfigDemo.FBServer.Porta.ToInteger;
  FDFBOnlineValidate1.UserName   := ConfigDemo.FBServer.Usuario;
  FDFBOnlineValidate1.Password   := ConfigDemo.FBServer.Senha;
  FDFBOnlineValidate1.Database   := ConfigDemo.FBServer.Caminho;

  if ConfigDemo.FBServer.IsLocal then
    FDFBOnlineValidate1.Protocol := ipLocal
  else
    FDFBOnlineValidate1.Protocol := ipTCPIP;

  FDFBOnlineValidate1.Validate;
end;

procedure TFrmPrincipal.FDFBNBackup1AfterExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Backup finalizado');
end;

procedure TFrmPrincipal.FDFBNBackup1BeforeExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Iniciando backup');
end;

procedure TFrmPrincipal.FDFBNBackup1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Memo1.Lines.Add(AException.Message);
end;

procedure TFrmPrincipal.FDFBNBackup1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
end;

procedure TFrmPrincipal.FDFBNRestore1AfterExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Base de dados restaurada');
end;

procedure TFrmPrincipal.FDFBNRestore1BeforeExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Restaurando base de dados');
end;

procedure TFrmPrincipal.FDFBNRestore1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Memo1.Lines.Add(AException.Message);
end;

procedure TFrmPrincipal.FDFBNRestore1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
end;

procedure TFrmPrincipal.FDFBOnlineValidate1AfterExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Validação finalizada');
end;

procedure TFrmPrincipal.FDFBOnlineValidate1BeforeExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Iniciando validação');
end;

procedure TFrmPrincipal.FDFBOnlineValidate1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Memo1.Lines.Add(AException.Message);
end;

procedure TFrmPrincipal.FDFBOnlineValidate1Progress(
  ASender: TFDPhysDriverService; const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
end;

end.
