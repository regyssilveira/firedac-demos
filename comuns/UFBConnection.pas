unit UFBConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error,
  FireDAC.VCLUI.Login, FireDAC.Comp.UI, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client;

type
  TDtmFBConnection = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmFBConnection: TDtmFBConnection;

implementation

uses
  UConfig;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDtmFBConnection.DataModuleDestroy(Sender: TObject);
begin
  FDConnection1.Close;
end;

procedure TDtmFBConnection.FDConnection1BeforeConnect(Sender: TObject);
begin
  if ConfigDemo.FBServer.Servidor.Trim.IsEmpty then
    raise EDatabaseError.Create('Servidor da base de dados ainda não foi configurado!');

  if ConfigDemo.FBServer.Caminho.Trim.IsEmpty then
    raise EDatabaseError.Create('Caminho da base de dados ou alias ainda não foi configurado!');

  if ConfigDemo.FBServer.Usuario.Trim.IsEmpty then
    raise EDatabaseError.Create('Usuário ainda não foi configurado!');

  if ConfigDemo.FBServer.Senha.Trim.IsEmpty then
    raise EDatabaseError.Create('Senha de acesso ainda não foi configurado!');

  if ConfigDemo.FBServer.IsLocal then
    FDConnection1.Params.Values['Protocol'] := 'LOCAL'
  else
    FDConnection1.Params.Values['Protocol'] := 'TCP';

  FDConnection1.Params.Values['Server']    := ConfigDemo.FBServer.Servidor;
  FDConnection1.Params.Values['Port']      := ConfigDemo.FBServer.Porta;
  FDConnection1.Params.Values['Database']  := ConfigDemo.FBServer.Caminho;
  FDConnection1.Params.Values['User_Name'] := ConfigDemo.FBServer.Usuario;
  FDConnection1.Params.Values['Password']  := ConfigDemo.FBServer.Senha;
end;

end.
