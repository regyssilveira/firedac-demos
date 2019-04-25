unit UConfig;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles;

type
  TDemoFiredacConfig = class(TIniFile)
  const
    SECAO       = 'CONFIG';
    ID_SERVIDOR = 'Servidor';
    ID_PORTA    = 'Porta';
    ID_CAMINHO  = 'Caminho';
  private
    function GetServidor: string;
    procedure SetServidor(const Value: string);
    function GetPorta: string;
    procedure SetPorta(const Value: string);
    function GetCaminho: string;
    procedure SetCaminho(const Value: string);
  public
    function IsLocal: boolean;

    property Servidor: string read GetServidor write SetServidor;
    property Porta: string read GetPorta write SetPorta;
    property Caminho: string read GetCaminho write SetCaminho;
  end;

var
  ConfigDemo: TDemoFiredacConfig;

implementation

{ TDemoFiredacConfig }


function TDemoFiredacConfig.IsLocal: boolean;
begin
  Result :=
    Self.Servidor.ToUpper.Equals('LOCALHOST') or
    Self.Servidor.ToUpper.Equals('127.0.0.1')
end;

function TDemoFiredacConfig.GetCaminho: string;
begin
  Result := Self.ReadString(SECAO, ID_CAMINHO, '');
end;

function TDemoFiredacConfig.GetPorta: string;
begin
  Result := Self.ReadString(SECAO, ID_PORTA, '3050');
end;

function TDemoFiredacConfig.GetServidor: string;
begin
  Result := Self.ReadString(SECAO, ID_SERVIDOR, 'localhost');
end;

procedure TDemoFiredacConfig.SetCaminho(const Value: string);
begin
  Self.WriteString(SECAO, ID_CAMINHO, Value);
end;

procedure TDemoFiredacConfig.SetPorta(const Value: string);
begin
  Self.WriteString(SECAO, ID_PORTA, Value);
end;

procedure TDemoFiredacConfig.SetServidor(const Value: string);
begin
  Self.WriteString(SECAO, ID_SERVIDOR, Value);
end;

initialization
  ConfigDemo := TDemoFiredacConfig.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

finalization
  ConfigDemo.DisposeOf;

end.
