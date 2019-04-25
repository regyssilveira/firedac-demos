unit UBasePrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmBasePrincipal = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    EdtBancoCaminho: TEdit;
    EdtBancoServidor: TEdit;
    EdtBancoPorta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnSalvarConfiguracoes: TSpeedButton;
    BtnProcurarBancoLocal: TSpeedButton;
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
  UConnection, UConfig;

{$R *.dfm}

procedure TFrmBasePrincipal.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmBasePrincipal.BtnProcurarBancoLocalClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EdtBancoCaminho.Text := OpenDialog1.FileName;
end;

procedure TFrmBasePrincipal.BtnSalvarConfiguracoesClick(Sender: TObject);
begin
  if Trim(EdtBancoServidor.Text) = '' then
  begin
    EdtBancoServidor.SetFocus;
    raise Exception.Create('Servidor de banco de dados não foi informado!');
  end;

  if Trim(EdtBancoCaminho.Text) = '' then
  begin
    EdtBancoCaminho.SetFocus;
    raise Exception.Create('Caminho ou Alias do banco de dados não foi informado!');
  end;

  ConfigDemo.Servidor := EdtBancoServidor.Text;
  ConfigDemo.Porta    := EdtBancoPorta.Text;
  ConfigDemo.Caminho  := EdtBancoCaminho.Text;

  ShowMessage('Configurações salvas!');
end;

end.
