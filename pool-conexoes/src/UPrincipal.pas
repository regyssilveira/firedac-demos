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

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UConfig, System.Threading, UConfConnection;

{$R *.dfm}

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
