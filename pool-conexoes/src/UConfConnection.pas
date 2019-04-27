unit UConfConnection;

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

procedure AddConfiguracaoManager;

const
  SEU_NOME_CONEXAO = 'MINHA_CONEXAO_POOL_FB';

implementation

uses
  UConfig;

procedure AddConfiguracaoManager;
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
    oParam.Add('Server='    + ConfigDemo.FBServer.Servidor);
    oParam.Add('Database='  + ConfigDemo.FBServer.Caminho);
    oParam.Add('User_Name=' + ConfigDemo.FBServer.Usuario);
    oParam.Add('Password='  + ConfigDemo.FBServer.Senha);

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

end.
