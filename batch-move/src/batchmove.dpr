program batchmove;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\..\comuns\UConfig.pas',
  UFBConnection in '..\..\comuns\UFBConnection.pas' {DtmFBConnection: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UExportaArquivo in 'UExportaArquivo.pas' {DtmExportaArquivo: TDataModule},
  UImportaArquivo in 'UImportaArquivo.pas' {DtmImportaArquivo: TDataModule},
  UMoverDados in 'UMoverDados.pas' {DtmMoverDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDtmFBConnection, DtmFBConnection);
  Application.CreateForm(TDtmExportaArquivo, DtmExportaArquivo);
  Application.CreateForm(TDtmImportaArquivo, DtmImportaArquivo);
  Application.Run;
end.
