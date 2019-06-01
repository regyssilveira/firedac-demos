program DemoTransactions;

uses
  Vcl.Forms,
  UBasePrincipal in '..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\comuns\UConfig.pas',
  UFBConnection in '..\comuns\UFBConnection.pas' {DtmFBConnection: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDtmFBConnection, DtmFBConnection);
  Application.Run;
end.
