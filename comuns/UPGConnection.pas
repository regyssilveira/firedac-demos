unit UPGConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error,
  FireDAC.VCLUI.Login, FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client;

type
  TDtmPGConnection = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmPGConnection: TDtmPGConnection;

implementation

uses
  UConfig;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDtmPGConnection.FDConnection1BeforeConnect(Sender: TObject);
begin
  if ConfigDemo.PGServer.Servidor.Trim.IsEmpty then
    raise EDatabaseError.Create('Servidor da base de dados ainda não foi configurado!');

  if ConfigDemo.PGServer.Caminho.Trim.IsEmpty then
    raise EDatabaseError.Create('Caminho da base de dados ou alias ainda não foi configurado!');

  if ConfigDemo.PGServer.Usuario.Trim.IsEmpty then
    raise EDatabaseError.Create('Usuário ainda não foi configurado!');

  if ConfigDemo.PGServer.Senha.Trim.IsEmpty then
    raise EDatabaseError.Create('Senha de acesso ainda não foi configurado!');

  FDConnection1.Params.Values['Server']    := ConfigDemo.PGServer.Servidor;
  FDConnection1.Params.Values['Port']      := ConfigDemo.PGServer.Porta;
  FDConnection1.Params.Values['Database']  := ConfigDemo.PGServer.Caminho;
  FDConnection1.Params.Values['User_Name'] := ConfigDemo.PGServer.Usuario;
  FDConnection1.Params.Values['Password']  := ConfigDemo.PGServer.Senha;
end;

end.
