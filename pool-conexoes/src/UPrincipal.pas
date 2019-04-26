unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    btnExecucaoThread: TButton;
    btnExecucaoNormal: TButton;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure btnExecucaoThreadClick(Sender: TObject);
    procedure btnExecucaoNormalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AddConfiguracaoManager;
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

const
  SEU_NOME_CONEXAO = 'MINHA_CONEXAO_POOL_FB';

implementation

uses
  UConfig, System.Threading;

{$R *.dfm}

procedure TfrmPrincipal.AddConfiguracaoManager;
var
  oParam: TStringList;
begin
  // criar os parametro e adicionar ao fdmanager somente uma vez
  FDManager.Close;
  oParam := TStringList.Create;
  try
    oParam.Clear;
    oParam.Add('DriverID=FB');
    oParam.Add('Port=3050');
    oParam.Add('CharacterSet=WIN1252');
    oParam.Add('Server=' + ConfigDemo.FBServer.Servidor);
    oParam.Add('Database=' + ConfigDemo.FBServer.Caminho);
    oParam.Add('User_Name=' + ConfigDemo.FBServer.Usuario);
    oParam.Add('Password=' + ConfigDemo.FBServer.Senha);

    if ConfigDemo.FBServer.IsLocal then
      oParam.Add('Protocol=LOCAL')
    else
      oParam.Add('Protocol=TCPIP');

    // adicionar a conexão ao fdmamanger e usar o nome da conexão
    FDManager.AddConnectionDef(SEU_NOME_CONEXAO, 'FB', oParam);
    FDManager.Open;
  finally
    oParam.Free;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  // adicionar uma vez somente antes de qualquer uso de conexão
  AddConfiguracaoManager;
end;

procedure TFrmPrincipal.btnExecucaoNormalClick(Sender: TObject);
var
  FDConn: TFDConnection;
begin
  FDConn := TFDConnection.Create(nil);
  try
    FDConn.ConnectionDefName := SEU_NOME_CONEXAO;
    FDConn.LoginPrompt := False;

    FDConn.ExecSQLScalar('select descricao from POOLCONNECCTION');
    ShowMessage('pronto!');
  finally
    FDConn.Free;
  end;
end;

procedure TFrmPrincipal.btnExecucaoThreadClick(Sender: TObject);
begin
  TParallel.For(1, 1000,
    procedure (I: Integer)
    var
      FDConn: TFDConnection;
    begin
      FDConn := TFDConnection.Create(nil);
      try
        FDConn.ConnectionDefName := SEU_NOME_CONEXAO;
        FDConn.LoginPrompt := False;

        FDConn.ExecSQLScalar('select * from POOLCONNECCTION');
      finally
        FDConn.Free;
      end;
    end
  );

  ShowMessage('pronto');
end;

end.
