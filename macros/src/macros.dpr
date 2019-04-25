program macros;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\..\comuns\UConfig.pas',
  UConnection in '..\..\comuns\UConnection.pas' {DtmConnection: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtmConnection, DtmConnection);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
