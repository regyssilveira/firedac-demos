program DemoSQLDialectAbstraction;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\..\comuns\UConfig.pas',
  UFBConnection in '..\..\comuns\UFBConnection.pas' {DtmFBConnection: TDataModule},
  UPGConnection in '..\..\comuns\UPGConnection.pas' {DtmPGConnection: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmBasePrincipal1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtmFBConnection, DtmFBConnection);
  Application.CreateForm(TDtmPGConnection, DtmPGConnection);
  Application.CreateForm(TFrmBasePrincipal1, FrmBasePrincipal1);
  Application.Run;
end.
