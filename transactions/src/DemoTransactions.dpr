program DemoTransactions;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UFBConnection in '..\..\comuns\UFBConnection.pas' {DtmFBConnection: TDataModule},
  UConfig in '..\..\comuns\UConfig.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtmFBConnection, DtmFBConnection);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
