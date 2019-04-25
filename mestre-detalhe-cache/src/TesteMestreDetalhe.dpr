program TesteMestreDetalhe;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConnection in '..\..\comuns\UConnection.pas' {DtmConnection: TDataModule},
  UConfig in '..\..\comuns\UConfig.pas',
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtmConnection, DtmConnection);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
