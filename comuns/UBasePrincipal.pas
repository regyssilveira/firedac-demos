unit UBasePrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmBasePrincipal = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GbxPostgreSQL: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    EdtPGCaminho: TEdit;
    EdtPGServidor: TEdit;
    EdtPGPorta: TEdit;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    EdtPGUsuario: TEdit;
    Label8: TLabel;
    EdtPGSenha: TEdit;
    Label5: TLabel;
    GbxFirebird: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnProcurarBancoLocal: TSpeedButton;
    EdtFBCaminho: TEdit;
    EdtFBServidor: TEdit;
    EdtFBPorta: TEdit;
    Label9: TLabel;
    EdtFBUsuario: TEdit;
    Label10: TLabel;
    EdtFBSenha: TEdit;
    PnlBotton: TPanel;
    BtnSalvarConfiguracoes: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnSalvarConfiguracoesClick(Sender: TObject);
    procedure BtnProcurarBancoLocalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBasePrincipal: TFrmBasePrincipal;

implementation

uses
  UConfig;

{$R *.dfm}

procedure TFrmBasePrincipal.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  EdtFBServidor.Text := ConfigDemo.FBServer.Servidor;
  EdtFBPorta.Text    := ConfigDemo.FBServer.Porta;
  EdtFBCaminho.Text  := ConfigDemo.FBServer.Caminho;
  EdtFBUsuario.Text  := ConfigDemo.FBServer.Usuario;
  EdtFBSenha.Text    := ConfigDemo.FBServer.Senha;

  EdtPGServidor.Text := ConfigDemo.PGServer.Servidor;
  EdtPGPorta.Text    := ConfigDemo.PGServer.Porta;
  EdtPGCaminho.Text  := ConfigDemo.PGServer.Caminho;
  EdtPGUsuario.Text  := ConfigDemo.PGServer.Usuario;
  EdtPGSenha.Text    := ConfigDemo.PGServer.Senha;
end;

procedure TFrmBasePrincipal.BtnProcurarBancoLocalClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EdtFBCaminho.Text := OpenDialog1.FileName;
end;

procedure TFrmBasePrincipal.BtnSalvarConfiguracoesClick(Sender: TObject);
begin
  ConfigDemo.FBServer.Servidor := EdtFBServidor.Text;
  ConfigDemo.FBServer.Porta    := EdtFBPorta.Text;
  ConfigDemo.FBServer.Caminho  := EdtFBCaminho.Text;
  ConfigDemo.FBServer.Usuario  := EdtFBUsuario.Text;
  ConfigDemo.FBServer.Senha    := EdtFBSenha.Text;

  ConfigDemo.PGServer.Servidor := EdtPGServidor.Text;
  ConfigDemo.PGServer.Porta    := EdtPGPorta.Text;
  ConfigDemo.PGServer.Caminho  := EdtPGCaminho.Text;
  ConfigDemo.PGServer.Usuario  := EdtPGUsuario.Text;
  ConfigDemo.PGServer.Senha    := EdtPGSenha.Text;

  ShowMessage('Configurações salvas!');
end;

end.
