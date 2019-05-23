program TesteMestreDetalhe;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\..\comuns\UConfig.pas',
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UFBConnection in '..\..\comuns\UFBConnection.pas' {DtmFBConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtmFBConnection, DtmFBConnection);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
