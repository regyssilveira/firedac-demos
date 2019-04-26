unit UConfig;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles;

type
  TConfigServer = class
  const
    ID_SERVIDOR = 'Servidor';
    ID_PORTA    = 'Porta';
    ID_CAMINHO  = 'Caminho';
    ID_USUARIO  = 'Usuario';
    ID_SENHA    = 'Senha';
  private
    FOwner: TIniFile;
    FSecao: string;

    function GetServidor: string;
    procedure SetServidor(const Value: string);
    function GetPorta: string;
    procedure SetPorta(const Value: string);
    function GetCaminho: string;
    procedure SetCaminho(const Value: string);
    function GetUsuario: string;
    procedure SetUsuario(const Value: string);
    function GetSenha: string;
    procedure SetSenha(const Value: string);
  public
    constructor Create(const ASecao: string; const AOwner: TIniFile);

    function IsLocal: boolean;

    property Servidor: string read GetServidor write SetServidor;
    property Porta: string read GetPorta write SetPorta;
    property Caminho: string read GetCaminho write SetCaminho;
    property Usuario: string read GetUsuario write SetUsuario;
    property Senha: string read GetSenha write SetSenha;
  end;

  TDemoFiredacConfig = class(TIniFile)
  private
    FFBServer: TConfigServer;
    FPGServer: TConfigServer;
  public
    constructor Create(const FileName: string);
    destructor Destroy; override;

    property FBServer: TConfigServer read FFBServer write FFBServer;
    property PGServer: TConfigServer read FPGServer write FPGServer;
  end;

var
  ConfigDemo: TDemoFiredacConfig;

implementation

{ TConfigServer }

function TConfigServer.IsLocal: boolean;
begin
  Result :=
    Self.Servidor.ToUpper.Equals('LOCALHOST') or
    Self.Servidor.ToUpper.Equals('127.0.0.1')
end;

constructor TConfigServer.Create(const ASecao: string; const AOwner: TIniFile);
begin
  FOwner := AOwner;
  FSecao := ASecao;
end;

function TConfigServer.GetCaminho: string;
begin
  Result := FOwner.ReadString(FSECAO, ID_CAMINHO, '');
end;

function TConfigServer.GetPorta: string;
begin
  Result := FOwner.ReadString(FSECAO, ID_PORTA, '');
end;

function TConfigServer.GetSenha: string;
begin
  Result := FOwner.ReadString(FSECAO, ID_SENHA, '');
end;

function TConfigServer.GetServidor: string;
begin
  Result := FOwner.ReadString(FSECAO, ID_SERVIDOR, 'localhost');
end;

function TConfigServer.GetUsuario: string;
begin
  Result := FOwner.ReadString(FSECAO, ID_USUARIO, '');
end;

procedure TConfigServer.SetCaminho(const Value: string);
begin
  FOwner.WriteString(FSECAO, ID_CAMINHO, Value);
end;

procedure TConfigServer.SetPorta(const Value: string);
begin
  FOwner.WriteString(FSECAO, ID_PORTA, Value);
end;

procedure TConfigServer.SetSenha(const Value: string);
begin
  FOwner.WriteString(FSECAO, ID_SENHA, Value);
end;

procedure TConfigServer.SetServidor(const Value: string);
begin
  FOwner.WriteString(FSECAO, ID_SERVIDOR, Value);
end;

procedure TConfigServer.SetUsuario(const Value: string);
begin
  FOwner.WriteString(FSECAO, ID_USUARIO, Value);
end;

{ TDemoFiredacConfig }

constructor TDemoFiredacConfig.Create(const FileName: string);
begin
  inherited;

  FFBServer := TConfigServer.Create('FIREBIRD', Self);
  FPGServer := TConfigServer.Create('POSTGRESQL', Self);
end;

destructor TDemoFiredacConfig.Destroy;
begin
  FFBServer.DisposeOf;
  FPGServer.DisposeOf;

  inherited;
end;

initialization
  ConfigDemo := TDemoFiredacConfig.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

finalization
  ConfigDemo.DisposeOf;

end.
